unit Posting;

interface

uses
  Loan, Payment, SysUtils, DateUtils, System.Rtti, Math, PaymentMethod;

type
  TPosting = class
  private
    // interest-related methods
    function PostInterest(const interest: currency; const loanId: string;
      const ADate: TDateTime; const source, status: string): string; overload;

    function PostEntry(const refPostingId: string;
      const debit, credit: currency; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
    function GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;
    function GetFirstDayOfValueDate(const ADate: TDateTime): TDateTime;

    procedure PostAdvancePayment(ALoan: TLoan);

  public
     procedure Post(const ALoan: TLoan); overload;
     procedure Post(const APayment: TPayment); overload;
     procedure PostInterest(const ADate: TDate; const ALoanId: string = '';
      const isAdvancePayment: boolean = false); overload;

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

procedure TPosting.PostInterest(const ADate: TDate; const ALoanId: string;
  const isAdvancePayment: boolean);
var
  refPostingId: string;
  interest, credit: currency;
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
          interest := dstScheduledInterest.FieldByName('interest_amt').AsCurrency;

          if isAdvancePayment then valueDate := ifn.AppDate
          else valuedate := dstScheduledInterest.FieldByName('interest_date').AsDateTime;

          PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // change the status of the interest in the Interest table
          dstScheduledInterest.Edit;
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

procedure TPosting.Post(const ALoan: TLoan);
var
  refPostingId: string;
  principal, interest, balance, credit: currency;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
  interestSource: string;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  primaryKey := ALoan.Id;
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
  valuedate := ifn.AppDate;
  postDate := ifn.AppDate;

  balance := ALoan.ReleaseAmount;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstLedger do
      begin
        Open;

        dmAccounting.dstInterest.Parameters.ParamByName('@loan_id').Value := ALoan.Id;
        dmAccounting.dstInterest.Open;

        cnt := ALoan.ApprovedTerm;

        for i := 1 to cnt do
        begin
          if (ALoan.HasAdvancePayment) and (i <= ifn.Rules.AdvancePayment) then
            valueDate := ifn.AppDate
          else
            valueDate := GetValueDate(valueDate,IncMonth(ifn.AppDate,i));

          // interest
          // post in the Interest table instead of in the Ledger
          // interest will be posted when the interest date arrives
          if ALoan.LoanClass.IsDiminishing then interest := balance * ALoan.LoanClass.InterestInDecimal
          else interest := ALoan.ReleaseAmount * ALoan.LoanClass.InterestInDecimal;

          interestSource := TRttiEnumerationType.GetName<TInterestSource>(TInterestSource.SYS);
          status := TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.P);

          // for FIXED accounts.. use the first day of the month
          if (ALoan.LoanClass.IsDiminishing) and (not ALoan.LoanClass.IsScheduled) then
            PostInterest(interest,ALoan.Id,valueDate,interestSource,status)
          else PostInterest(interest,ALoan.Id,GetFirstDayOfValueDate(valueDate),interestSource,status);

          // principal
          if ALoan.LoanClass.IsDiminishing then
          begin
            if ALoan.LoanClass.IsScheduled then principal := ALoan.Amortisation - interest
            else
            begin
              // use the balance for the last amount to be posted..
              // this ensures sum of principal is equal to the loan amount released
              if i = cnt then principal := balance
              else principal := ALoan.ReleaseAmount / ALoan.ApprovedTerm;
            end;
          end
          else principal := ALoan.ReleaseAmount / ALoan.ApprovedTerm;

          status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

          // for principal entries.. use the first day of the month
          // if load has advance payment.. use the application date
          if ALoan.HasAdvancePayment then
            PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status,
              postDate, valueDate, caseType)
          else
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
  end;

  // post advance payment
  if ALoan.HasAdvancePayment then
  begin
    PostInterest(ifn.AppDate,ALoan.Id,true);
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

function TPosting.GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;
var
  month1, day1, year1: word;
  month2, day2, year2: word;
begin
  DecodeDate(ADate1,year1,month1,day1);
  DecodeDate(ADate2,year2,month2,day2);

  // check for leap year
  if (not IsLeapYear(year1)) and (month2 = MonthFebruary) and (day1 = 29) then
    Result := ADate2
  else Result := EncodeDate(year2,month2,day1);
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
  i, j, k: integer;
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
      for i:= 0 to ifn.Rules.AdvancePayment - 1 do
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
                  balance := 0;
                end;

              PEN: Continue;
            end;

            Append;
            FieldByName('payment_id').AsString := id;
            FieldByName('loan_id').AsString := ALoan.id;
            FieldByName('payment_amt').AsCurrency := payment;
            FieldByName('payment_type').AsString := TRttiEnumerationType.GetName<TPaymentTypes>(paymentType);
            FieldByName('balance').AsCurrency := balance;
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

end.
