unit Posting;

interface

uses
  Loan, Payment, SysUtils, DateUtils, System.Rtti, Math, PaymentMethod, LoanClassification;

type
  TPrincipalDebit = class
  strict private
    FId: string;
    FTerm: smallint;
    FAmortization: currency;
    FInterestRate: currency;
    FReleaseAmount: currency;
    FIsDiminishing: boolean;
    FDiminishingType: TDiminishingType;
    FReleaseDate: TDateTime;
    FBalance: currency;
  public
    property Id: string read FId write FId;
    property ReleaseAmount: currency read FReleaseAmount write FReleaseAmount;
    property Term: smallint read FTerm write FTerm;
    property InterestRate: currency read FInterestRate write FInterestRate;
    property IsDiminishing: boolean read FIsDiminishing write FIsDiminishing;
    property Amortization: currency read FAmortization write FAmortization;
    property DiminishingType: TDiminishingType read FDiminishingType write FDiminishingType;
    property ReleaseDate: TDateTime read FReleaseDate write FReleaseDate;
    property Balance: currency read FBalance write FBalance;
  end;

  TInterestDebit = class
  strict private
    FIsDiminishing: boolean;
    FId: string;
    FInterestRate: currency;
    FLastTransactionDate: TDateTime;
    FBalance: currency;
    FReleaseAmount: currency;
    FDiminishingType: TDiminishingType;
    FAdvancePayments: integer;

    function GetNextScheduledPosting: TDateTime;
    function GetHasAdvancePayments: boolean;
  public
    property Id: string read FId write FId;
    property Balance: currency read FBalance write FBalance;
    property IsDiminishing: boolean read FIsDiminishing write FIsDiminishing;
    property InterestRate: currency read FInterestRate write FInterestRate;
    property DiminishingType: TDiminishingType read FDiminishingType write FDiminishingType;
    property ReleaseAmount: currency read FReleaseAmount write FReleaseAmount;
    property LastTransactionDate: TDateTime read FLastTransactionDate write FLastTransactionDate;
    property NextScheduledPosting: TDateTime read GetNextScheduledPosting;
    property AdvancePayments: integer read FAdvancePayments write FAdvancePayments;
    property HasAdvancePayments: boolean read GetHasAdvancePayments;
  end;

  TPosting = class
  private
    // interest-related methods
    function PostInterest(const interest: currency; const loanId: string;
      const ADate: TDateTime; const source, status: string): string; overload;

    function PostEntry(const refPostingId: string;
      const debit, credit: currency; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
    function GetValueDate(const ACurrentDate, ANextDate: TDateTime): TDateTime;  overload;
    function GetValueDate(const ADate: TDateTime): TDateTime; overload;
    function GetFirstDayOfValueDate(const ADate: TDateTime): TDateTime;
    function MonthsBetweenEx(const ADate1, ADate2: TDateTime): integer;

    procedure PostAdvancePayment(ALoan: TLoan);

  public
     procedure Post(const ALoan: TLoan); overload;
     procedure Post(const APayment: TPayment); overload;
     procedure PostInterest(const ADate: TDate; const ALoanId: string = ''); overload;
     procedure PostInterest2(const ADate: TDate);
     procedure PostPrincipal(const ADate: TDate);

     constructor Create;
     destructor Destroy; override;
  end;

implementation

{ TPosting }

uses
  AccountingData, IFinanceGlobal, IFinanceDialogs, AppConstants, DBUtil, Ledger;

function TPosting.PostEntry(const refPostingId: string;
      const debit, credit: currency; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
var
  postingId: string;
begin
  try
    with dmAccounting.dstLedger do
    begin
      Append;

      postingId := GetLedgerId;

      FieldByName('posting_id').AsString := postingId;

      if refPostingId <> '' then FieldByName('ref_posting_id').AsString := refPostingId;

      FieldByName('loc_prefix').AsString := ifn.LocationPrefix;

      if debit > 0 then FieldByName('debit_amt').AsCurrency := debit;

      if credit > 0 then FieldByName('credit_amt').AsCurrency := credit;

      FieldByName('pk_event_object').AsString := primaryKey;
      FieldByName('event_object').AsString := eventObject;
      FieldByName('status_code').AsString := status;
      FieldByName('post_date').AsDateTime := postDate;
      FieldByName('value_date').AsDateTime := valueDate;

      if caseType <> '' then FieldByName('case_type').AsString := caseType;

      Post;
    end;

    Result := postingId;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;
end;

function TPosting.PostInterest(const interest: currency; const loanId: string;
  const ADate: TDateTime; const source, status: string): string;
var
  interestId: string;
begin
  interestId := GetInterestId;

  with dmAccounting.dstInterest do
  begin
    Append;
    FieldByName('interest_id').AsString := interestId;
    FieldByName('loan_id').AsString := loanId;
    FieldByName('interest_amt').AsCurrency := interest;
    FieldByName('interest_date').AsDateTime := ADate;
    FieldByName('interest_src').AsString := source;
    FieldByName('interest_status_id').AsString := status;
    Post;
  end;

  Result := interestId;
end;

procedure TPosting.PostInterest(const ADate: TDate; const ALoanId: string);
var
  refPostingId: string;
  interest, credit, balance, interestRate : currency;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR);
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
  postDate := ifn.AppDate;
  status :=  TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

  // method for posting scheduled interest
  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting do
      begin
        dstLedger.Open;

        dstScheduledInterest.Parameters.ParamByName('@date').Value := ADate;
        dstScheduledInterest.Parameters.ParamByName('@loan_id').Value := ALoanId;
        dstScheduledInterest.Open;

        while not dstScheduledInterest.Eof do
        begin
          // post the interest in the ledger
          primaryKey := dstScheduledInterest.FieldByName('interest_id').AsString;
          interestRate := dstScheduledInterest.FieldByName('int_rate').AsCurrency;
          balance := dstScheduledInterest.FieldByName('balance').AsCurrency;

          interest := RoundTo(balance * (interestRate / 100),-2);

          valuedate := dstScheduledInterest.FieldByName('interest_date').AsDateTime;

          PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // change the status and amount of the interest in the Interest table
          dstScheduledInterest.Edit;
          dstScheduledInterest.FieldByName('interest_amt').AsCurrency := interest;
          dstScheduledInterest.FieldByName('interest_status_id').AsString :=
              TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.T);
          dstScheduledInterest.Post;

          dstScheduledInterest.Next;
        end;

        dstLedger.UpdateBatch;
        dstScheduledInterest.UpdateBatch;
      end;
    except
      on E: Exception do
      begin
        dmAccounting.dstScheduledInterest.CancelBatch;
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
      end;
    end;
  finally
    dmAccounting.dstLedger.Close;
    dmAccounting.dstScheduledInterest.Close;
    dmAccounting.Free;
  end;
end;

procedure TPosting.PostInterest2(const ADate: TDate);
var
  refPostingId: string;
  interest, credit: currency;
  eventObject, primaryKey, caseType, status: string;
  interestStatus, interestSource: string;
  postDate, valueDate, runningDate: TDateTime;
  LLoan: TInterestDebit;
  ay, am, ad, ny, nm, nd: word;
  days: integer;
begin
  // This method is different from the other interest posting method
  // Interest is posted on an on-demand basis, when the date arrives .. usually a month from last transaction date
  // Previous posting was based from a "schedule" determined during loan release and payment
  // This alternate method was developed to fix the February issue
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR);
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
  postDate := ifn.AppDate;
  status :=  TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

  interestStatus := TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.T);
  interestSource := TRttiEnumerationType.GetName<TInterestSource>(TInterestSource.SYS);

  valueDate := ADate;

  LLoan := TInterestDebit.Create;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      dmAccounting.dstInterest.Open;
      dmAccounting.dstLedger.Open;

      with dmAccounting.dstInterestDebit  do
      begin
        Parameters.ParamByName('@post_date').Value := ADate;

        Open;

        while not Eof do
        begin
          LLoan.Id := FieldByName('loan_id').AsString;
          LLoan.InterestRate := FieldByName('int_rate').AsCurrency / 100;
          LLoan.ReleaseAmount := FieldByName('rel_amt').AsCurrency;
          LLoan.IsDiminishing := FieldByName('int_comp_method').AsString = 'D';
          LLoan.DiminishingType := TDiminishingType(FieldByName('dim_type').AsInteger);
          LLoan.Balance := FieldByName('balance').AsCurrency;
          LLoan.LastTransactionDate := FieldByName('last_trans_date').AsDateTime;
          LLoan.AdvancePayments := FieldByName('payments_advance').AsInteger;

          if LLoan.NextScheduledPosting = ADate then
          begin
            if LLoan.IsDiminishing then
            begin
              // note: 1 month is defined is the same day as the previous month..
              // ex. 1 month from March 31 is May 1 since April only has 30 days
              // although April 30 is 1 month from March 31.. interest is computed on a per day basis as day component is not the same from previous
              // in this case.. previous is 31 but following day is 30
              // same day means if previous month is 16 then succeeding should be 16 as well

              // DecodeDate(LLoan.LastTransactionDate,ay,am,ad);
              // DecodeDate(LLoan.NextScheduledPosting,ny,nm,nd);

              interest := LLoan.Balance * LLoan.InterestRate

              // if ad = nd then  interest := LLoan.Balance * LLoan.InterestRate
              {else
              begin
                days := DaysBetween(ADate,LLoan.LastTransactionDate);

                interest := (LLoan.Balance * LLoan.InterestRate) / ifn.DaysInAMonth;

                // round off to 2 decimal places before multiplying agains DAYS
                interest := RoundTo(interest,-2) * days;
              end;  }
            end
            else interest := LLoan.ReleaseAmount *  LLoan.InterestRate;

            interest := RoundTo(interest,-2);

            // for DIMINISHING SCHEDULED accounts.. use the first day of the month..
            if (LLoan.IsDiminishing) and (LLoan.DiminishingType = dtScheduled) then
              primaryKey := PostInterest(interest,LLoan.Id,GetFirstDayOfValueDate(valueDate),interestSource,interestStatus)
            else primaryKey := PostInterest(interest,LLoan.Id,valueDate,interestSource,interestStatus);

            PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);
          end;

          Next;
        end;

        Close;
      end;

      dmAccounting.dstInterest.UpdateBatch;
      dmAccounting.dstLedger.UpdateBatch;
    except
      on E: Exception do
      begin
        dmAccounting.dstInterest.CancelBatch;
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
        Abort;
      end;
    end;
  finally
    dmAccounting.dstInterest.Close;
    dmAccounting.dstLedger.Close;
    LLoan.Free;
    dmAccounting.Free;
  end;
end;

procedure TPosting.PostPrincipal(const ADate: TDate);
var
  refPostingId: string;
  principal, interest, balance, credit: currency;
  eventObject, primaryKey, caseType, status: string;
  postDate, valueDate, runningDate: TDateTime;
  i, cnt: integer;
  LLoan: TPrincipalDebit;
  vy, vm, vd, yy, mm, dd: word;
  posted: boolean;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
  valuedate := GetFirstDayOfValueDate(ADate);
  postDate := ifn.AppDate;
  status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

  DecodeDate(ADate,yy,mm,dd);

  LLoan := TPrincipalDebit.Create;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      dmAccounting.dstLedger.Open;

      with dmAccounting.dstPrincipalDebit  do
      begin
        Parameters.ParamByName('@post_date').Value := ADate;

        Open;

        LLoan.Id := FieldByName('loan_id').AsString;
        LLoan.Term := FieldByName('terms').AsInteger;
        LLoan.Amortization := FieldByName('amort').AsCurrency;
        LLoan.InterestRate := FieldByName('int_rate').AsCurrency / 100;
        LLoan.ReleaseAmount := FieldByName('rel_amt').AsCurrency;
        LLoan.IsDiminishing := FieldByName('int_comp_method').AsString = 'D';
        LLoan.DiminishingType := TDiminishingType(FieldByName('dim_type').AsInteger);
        LLoan.ReleaseDate := FieldByName('date_rel').AsDateTime;

        primaryKey := LLoan.Id;
        balance := LLoan.ReleaseAmount;

        while not Eof do
        begin
          posted := false;

          cnt := LLoan.Term;
          i := 1;

          // last condition is a hack
          while (i <= cnt) and (not posted) do
          begin
            runningDate := IncMonth(LLoan.ReleaseDate,i);

            // interest
            if LLoan.isDiminishing then interest := balance * LLoan.InterestRate
            else interest := LLoan.ReleaseAmount *  LLoan.InterestRate;

            // round off to 2 decimal places
            interest := RoundTo(interest,-2);

            // principal
            // use the balance for the last amount to be posted..
            // this ensures sum of principal is equal to the loan amount released
            if i < cnt then principal := LLoan.Amortization - interest
            else principal := balance;

            DecodeDate(runningDate,vy,vm,vd);

            // for principal entries.. use the first day of the month
            if (mm = vm) and (yy = vy) then
            begin
              PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status,
                  postDate, valueDate, caseType);
              posted := true;
            end;

            // get balance
            balance := balance - principal;

            Inc(i);
          end;

          Next;
        end;

        Close;
      end;

      dmAccounting.dstLedger.UpdateBatch;
    except
      on E: Exception do
      begin
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
        Abort;
      end;
    end;
  finally
    dmAccounting.dstLedger.Close;
    LLoan.Free;
    dmAccounting.Free;
  end;
end;

procedure TPosting.Post(const ALoan: TLoan);
{ var
  refPostingId: string;
  principal, interest, balance, credit: currency;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
  interestSource: string; }
begin
  // Note: This has been discontinued as of 25 June 2018
  // Posting of debit will be done on an "on-demand" basis
  // That is, will happen on the 1st month for PRINCIPAL and based on last transaction date for INTEREST
  // Currently only used by advanced payment.. check below

  {
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  primaryKey := ALoan.Id;
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);

  // initialise value date depending on computation method
  // check if this is a backlog entry.. use the last transaction day instead
  if ALoan.IsBacklog then valueDate := IncDay(ln.LastTransactionDate)
  else if ALoan.LoanClass.IsFixed then valueDate := IncDay(ifn.AppDate)
  else valuedate := ifn.AppDate;

  postDate := ifn.AppDate;

  if ln.IsBacklog then balance := ALoan.Balance
  else balance := ALoan.ReleaseAmount;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstLedger do
      begin
        Open;

        dmAccounting.dstInterest.Parameters.ParamByName('@loan_id').Value := ALoan.Id;
        dmAccounting.dstInterest.Open;

        // for backlog.. use number of months remaining
        if ALoan.IsBacklog then cnt := ALoan.ApprovedTerm - MonthsBetween(ALoan.LastTransactionDate,ALoan.DateApplied)
        else cnt := ALoan.ApprovedTerm;

        for i := 1 to cnt do
        begin
          valueDate := GetValueDate(valueDate,IncMonth(ifn.AppDate,i));

          // interest
          // post in the Interest table instead of in the Ledger
          // interest will be posted when the interest date arrives
          if ALoan.LoanClass.IsDiminishing then interest := balance * ALoan.LoanClass.InterestInDecimal
          else interest := ALoan.ReleaseAmount * ALoan.LoanClass.InterestInDecimal;

          // round off to 2 decimal places
          interest := RoundTo(interest,-2);

          interestSource := TRttiEnumerationType.GetName<TInterestSource>(TInterestSource.SYS);
          status := TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.P);

          // for DIMINISHING SCHEDULED accounts.. use the first day of the month..
          if (ALoan.LoanClass.IsDiminishing) and (ALoan.LoanClass.DiminishingType = dtScheduled) then
            PostInterest(interest,ALoan.Id,GetFirstDayOfValueDate(valueDate),interestSource,status)
          else PostInterest(interest,ALoan.Id,valueDate,interestSource,status);

          // principal
          // use the balance for the last amount to be posted..
          // this ensures sum of principal is equal to the loan amount released
          if i < cnt then principal := ALoan.Amortisation - interest
          else principal := balance;

          status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

          // for principal entries.. use the first day of the month
          PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status,
              postDate, GetFirstDayOfValueDate(valueDate), caseType);

          // get balance
          balance := balance - principal;
        end;

        UpdateBatch;

        // commit the interest
        dmAccounting.dstInterest.UpdateBatch;

      end;
    except
      on E: Exception do
      begin
        dmAccounting.dstLedger.CancelBatch;
        dmAccounting.dstInterest.CancelBatch;
        ShowErrorBox(E.Message);
        Abort;
      end;
    end;
  finally
    dmAccounting.dstLedger.Close;
    dmAccounting.dstInterest.Close;
    dmAccounting.Free;
  end;  }

  // post advance payment
  if ALoan.LoanClass.HasAdvancePayment then
  begin
    // increment the date parameter with the number of months
    // this ensures interests scheduled for future posting will be posted
    PostInterest(IncMonth(ifn.AppDate,ALoan.LoanClass.AdvancePayment.NumberOfMonths),ALoan.Id);
    PostAdvancePayment(ALoan);
  end;
end;

constructor TPosting.Create;
begin

end;

destructor TPosting.Destroy;
begin

  inherited;
end;

function TPosting.GetFirstDayOfValueDate(const ADate: TDateTime): TDateTime;
var
  month, day, year: word;
begin
  DecodeDate(ADate,year,month,day);

  Result := EncodeDate(year,month,1);
end;

function TPosting.GetValueDate(const ADate: TDateTime): TDateTime;
begin
  Result := ADate;
end;

function TPosting.GetValueDate(const ACurrentDate, ANextDate: TDateTime): TDateTime;
var
  month1, day1, year1: word;
  month2, day2, year2: word;
  LNextDate: TDateTime;
begin
  LNextDate := ANextDate;

  DecodeDate(ACurrentDate,year1,month1,day1);
  DecodeDate(LNextDate,year2,month2,day2);

  // if dates are of the same month.. increment to the next month
  if month2 = month1 then
  begin
    LNextDate := IncMonth(LNextDate);
    DecodeDate(LNextDate,year2,month2,day2);
  end;

  if (month2 = MonthFebruary) and (DaysBetween(LNextDate,ACurrentDate) < ifn.DaysInAMonth)then
    Result := IncDay(ACurrentDate,ifn.DaysInAMonth)
  // check for leap year
  // if (not IsLeapYear(year1)) and (month2 = MonthFebruary) and (day1 = 29) then
  //  Result := ANextDate
  // when day falls on a 31st.. use 30 instead
  else if (day1 = 31) and (month2 <> MonthFebruary) then
    Result := EncodeDate(year2,month2,30)
  else Result := EncodeDate(year2,month2,day1);
end;

function TPosting.MonthsBetweenEx(const ADate1, ADate2: TDateTime): integer;
var
  y1, m1, d1, y2, m2, d2: word;
begin
  Result := 0;

  if ADate1 > ADate2 then Exit;

  DecodeDate(ADate1, y1, m1, d1);
  DecodeDate(ADate2, y2, m2, d2);

  if d1 < d2 then Inc(Result);

  Inc(Result, m2 - m1);

  if (y2 - y1) > 0 then Inc(Result);

  Inc(Result, (y2 - y1) * 12);

  Dec(Result);
end;

procedure TPosting.Post(const APayment: TPayment);
var
  detail: TPaymentDetail;
  i, iCnt, l, lCnt: integer;
  LLedger: TLedger;
  postingId, refPostingId, status: string;
begin

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstSchedule do
      begin
        dmAccounting.dstLedger.Open;

        dmAccounting.dstSchedule.Parameters.ParamByName('@entity_id').Value := APayment.Client.Id;
        dmAccounting.dstSchedule.Open;

        iCnt := APayment.DetailCount - 1;

        for i := 0 to iCnt do
        begin
          detail := APayment.Details[i];

          lCnt := detail.Loan.LedgerCount - 1;

          for l := 0 to lCnt do
          begin
            LLedger := detail.Loan.Ledger[l];
            if LLedger.Posted then
            begin
              if LLedger.StatusChanged then
                if Locate('posting_id',LLedger.PostingId,[]) then
                begin
                  Edit;
                  FieldByName('status_code').AsString := LLedger.NewStatus;
                  Post;
                end;
            end
            else
            begin
              if (not LLedger.FullPayment) or ((LLedger.FullPayment) and (detail.IsFullPayment)) then
              begin
                // set the refposting id
                // this is only called for unscheduled posting
                if LLedger.UnreferencedPayment then LLedger.RefPostingId := refPostingId;

                if LLedger.StatusChanged then status := LLedger.NewStatus
                else status := LLedger.CurrentStatus;

                postingId := PostEntry(LLedger.RefPostingId,LLedger.Debit,LLedger.Credit,
                    LLedger.EventObject,LLedger.PrimaryKey,status,
                    ifn.AppDate,LLedger.ValueDate,LLedger.CaseType);

                if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR))
                  and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS))then
                  refPostingId := postingId;
              end;
            end;
          end;

        end;

        UpdateBatch;
        dmAccounting.dstLedger.UpdateBatch;
      end;

    except
      on E: Exception do
      begin
        dmAccounting.dstSchedule.CancelBatch;
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
      end;
    end;
  finally
    dmAccounting.dstSchedule.Close;
    dmAccounting.dstLedger.Close;
    dmAccounting.Free;
  end;
end;

procedure TPosting.PostAdvancePayment(ALoan: TLoan);
var
  id, refNo: string;
  adv: TAdvancePayment;
  i, k: integer;
  LLedger: array of TLedger;
  debitLedger, creditLedger: TLedger;
  caseType: string;
  paymentType: TPaymentTypes;
  payment, balance: currency;

  procedure RetrieveLedger;
  var
    ldg: TLedger;
    l: integer;
  begin
    try
      // loop thru the dataset
      with dmAccounting.dstScheduleAdvance do
      begin
        try
          Parameters.ParamByName('@loan_id').Value := ALoan.Id;
          Open;

          SetLength(LLedger,RecordCount);
          l := 0;

          while not Eof do
          begin
            ldg := TLedger.Create;
            ldg.PostingId := FieldByName('posting_id').AsString;
            ldg.EventObject := FieldByName('event_object').AsString;
            ldg.PrimaryKey := FieldByName('pk_event_object').AsString;
            ldg.ValueDate := FieldByName('value_date').AsDateTime;
            ldg.Debit := FieldByName('payment_due').AsSingle;
            ldg.CaseType := FieldByName('case_type').AsString;
            ldg.CurrentStatus := FieldByName('status_code').AsString;
            ldg.HasPartial := FieldByName('has_partial').AsInteger = 1;

            LLedger[l] := ldg;

            Inc(l);

            Next;
          end;
        except
          on E: Exception do ShowErrorBox(E.Message);
        end;
    end;
    finally
      dmAccounting.dstScheduleAdvance.Close;
    end;
  end;

begin
  // this method is only called for advance payment
  // advance payment can only happen during loan release
  dmAccounting := TdmAccounting.Create(nil);

  dmAccounting.dstPayment.Open;
  dmAccounting.dstPaymentDetail.Open;
  dmAccounting.dstLedger.Open;

  RetrieveLedger;

  creditLedger := TLedger.Create;
  try
    try
      for i:= 0 to ALoan.LoanClass.AdvancePayment.NumberOfMonths - 1 do
      begin
        adv := ALoan.AdvancePayment[i];

        // master
        with dmAccounting.dstPayment do
        begin
          Open;

          id := GetPaymentId;
          refNo := FormatDateTime('mmddyyyyhhmmsszzz',Now);

          Append;
          FieldByName('payment_id').AsString := id;
          FieldByName('payment_date').AsDateTime := ifn.AppDate;
          FieldByName('entity_id').AsString := ALoan.Client.Id;
          FieldByName('loc_code').AsString := ifn.LocationCode;
          FieldByName('ref_no').AsString := refNo;
          FieldByName('pmt_method').AsInteger := Integer(mdCash);
          FieldByName('post_date').AsDateTime := Now;
          FieldByName('is_advance').AsBoolean := true;

          SetCreatedFields(dmAccounting.dstPayment);
        end;

        // detail
        with dmAccounting.dstPaymentDetail do
        begin
          for paymentType := TPaymentTypes.PRN to TPaymentTypes.PEN do
          begin
            // get the amount and casetype to be posted
            case paymentType of
              PRN:
                begin
                  caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
                  payment := adv.Principal;
                  balance := adv.Balance;
                end;

              INT:
                begin
                  caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
                  payment := adv.Interest;
                  balance := adv.Interest;
                end;

              PEN: Continue;
            end;

            // some loan class only require interest for advance payment
            // check the amount prior to posting.. ignore when ZERO
            if payment = 0 then Continue;

            Append;
            FieldByName('payment_id').AsString := id;
            FieldByName('loan_id').AsString := ALoan.id;
            FieldByName('payment_amt').AsCurrency := payment;
            FieldByName('payment_type').AsString := TRttiEnumerationType.GetName<TPaymentTypes>(paymentType);

            if paymentType = INT then FieldByName('balance').AsCurrency := 0 - balance
            else FieldByName('balance').AsCurrency := balance;

            Post;

            // increment "k" variable until case type is found
            k := 0;
            debitLedger := LLedger[k];
            while (debitLedger.CaseType <> caseType) or (debitLedger.StatusChanged) do
            begin
              Inc(k);
              debitLedger := LLedger[k];
            end;

            creditLedger.Credit := debitLedger.Debit;
            debitLedger.NewStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.CLS);
            creditLedger.RefPostingId := debitLedger.PostingId;
            creditLedger.EventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.PAY);
            creditLedger.PrimaryKey := id;
            creditLedger.CaseType := caseType;
            creditLedger.ValueDate := ifn.AppDate;
            creditLedger.CurrentStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
            creditLedger.Debit := 0;

            // post the entry
            with creditLedger do
              PostEntry(RefPostingId,0,Credit,EventObject,PrimaryKey,CurrentStatus,ValueDate,ValueDate,CaseType);

            // update the status of the debit entry
          end;
        end;

      end;

      dmAccounting.dstPayment.UpdateBatch;
      dmAccounting.dstPaymentDetail.UpdateBatch;
      dmAccounting.dstLedger.UpdateBatch;
    except
      on E: Exception do
      begin
        dmAccounting.dstPayment.CancelBatch;
        dmAccounting.dstPaymentDetail.CancelBatch;
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
      end;
    end;
  finally
    dmAccounting.dstPayment.Close;
    dmAccounting.dstPaymentDetail.Close;
    dmAccounting.dstLedger.Close;
    dmAccounting.Free;

    if Assigned(adv) then adv.Free;
    if Assigned(debitLedger) then debitLedger.Free;
    if Assigned(creditLedger) then creditLedger.Free;
  end;
end;

{ TInterestDebit }

function TInterestDebit.GetHasAdvancePayments: boolean;
begin
  Result := FAdvancePayments > 0;
end;

function TInterestDebit.GetNextScheduledPosting: TDateTime;
var
  LNextSchedule: TDateTime;
  mm, dd, yy, cm, cd, cy: word;
begin
  if HasAdvancePayments then
    LNextSchedule := IncMonth(FLastTransactionDate,FAdvancepayments)
  else
  begin
    LNextSchedule := IncMonth(FLastTransactionDate);

    DecodeDate(FLastTransactionDate,cy,cm,cd);
    DecodeDate(LNextSchedule,yy,mm,dd);

    if cd <> dd then
      if DaysBetween(LNextSchedule,FLastTransactionDate) < ifn.DaysInAMonth then
        LNextSchedule := IncDay(LNextSchedule); //  IncDay(FLastTransactionDate,ifn.DaysInAMonth);
    // else if (cd = 31) and (mm <> MonthFebruary) then
    //  LNextSchedule := EncodeDate(yy,mm,30)
    // else LNextSchedule := EncodeDate(yy,mm,cd);
  end;

  Result := LNextSchedule;
end;

end.
