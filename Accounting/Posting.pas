unit Posting;

interface

uses
  Loan, Payment, SysUtils, DateUtils, System.Rtti, Math;

type
  TPosting = class
  private
    // loan-related posting
    procedure PostLoanDiminishing(const ALoan: TLoan);
    procedure PostLoanFixed(const ALoan: TLoan);

    // payment-related posting
    procedure PostPaymentDiminishing(const APayment: TPayment; const detailIndex: integer);
    procedure PostPaymentFixed(const APayment: TPayment; const detailIndex: integer);

    // interest-related methods
    function PostInterest(const interest: real; const loanId: string;
      const ADate: TDateTime; const source, status: string): string; overload;

    function PostEntry(const refPostingId: string;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
    function GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;

  public
     procedure Post(const ALoan: TLoan); overload;
     procedure Post(const APayment: TPayment); overload;
     procedure PostInterest; overload;

     constructor Create;
     destructor Destroy; override;
  end;

implementation

{ TPosting }

uses
  AccountingData, IFinanceGlobal, IFinanceDialogs, AppConstants, DBUtil, Ledger;

function TPosting.PostEntry(const refPostingId: string;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
var
  postingId: string;
begin
  with dmAccounting.dstLedger do
  begin
    Append;

    postingId := GetLedgerId;

    FieldByName('posting_id').AsString := postingId;

    if refPostingId <> '' then FieldByName('ref_posting_id').AsString := refPostingId;

    FieldByName('loc_prefix').AsString := ifn.LocationPrefix;

    if debit > 0 then FieldByName('debit_amt').AsFloat := debit;

    if credit > 0 then FieldByName('credit_amt').AsFloat := credit;

    FieldByName('pk_event_object').AsString := primaryKey;
    FieldByName('event_object').AsString := eventObject;
    FieldByName('status_code').AsString := status;
    FieldByName('post_date').AsDateTime := postDate;
    FieldByName('value_date').AsDateTime := valueDate;

    if caseType <> '' then FieldByName('case_type').AsString := caseType;

    Post;
  end;

  Result := postingId;
end;

function TPosting.PostInterest(const interest: real; const loanId: string;
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

procedure TPosting.PostInterest;
var
  refPostingId: string;
  interest, credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR);
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
  valuedate := ifn.AppDate;
  postDate := ifn.AppDate;
  status :=  TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

  // method for posting scheduled interest
  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting do
      begin
        dstLedger.Open;

        dstScheduledInterest.Parameters.ParamByName('@date').Value := ifn.AppDate;
        dstScheduledInterest.Open;

        while not dstScheduledInterest.Eof do
        begin
          // post the interest in the ledger
          primaryKey := dstScheduledInterest.FieldByName('interest_id').AsString;
          interest := dstScheduledInterest.FieldByName('interest_amt').AsFloat;
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

procedure TPosting.PostLoanDiminishing(const ALoan: TLoan);
var
  refPostingId: string;
  principal, interest, balance, credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
  interestSource: string;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  primaryKey := ALoan.Id;
  caseType := '';
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
          valueDate := GetValueDate(valueDate,IncMonth(ifn.AppDate,i));

          // interest
          // post in the Interest tables instead of in the Ledger
          // interest will be posted when the interest date arrives
          interest := balance * ALoan.LoanClass.InterestInDecimal;

          if ALoan.LoanClass.UseFactorRate then
          begin
            caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
            status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
            PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);
          end
          else
          begin
            interestSource := TRttiEnumerationType.GetName<TInterestSource>(TInterestSource.SYS);
            status := TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.P);
            PostInterest(interest,ALoan.Id,valueDate,interestSource,status);
          end;

          caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);

          // principal
          if ALoan.LoanClass.UseFactorRate then principal := ALoan.Amortisation - interest
          else
          begin
            // use the balance for the last amount to be posted..
            // this ensures sum of principal is equal to the loan amount released
            if i = cnt then principal := balance
            else principal := ALoan.ReleaseAmount / ALoan.ApprovedTerm;
          end;

          status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

          PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

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
      end;
    end;
  finally
    dmAccounting.dstLedger.Close;
    dmAccounting.dstInterest.Close;
    dmAccounting.Free;
  end;
end;

procedure TPosting.PostLoanFixed(const ALoan: TLoan);
var
  refPostingId: string;
  principal, interest, credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  primaryKey := ALoan.Id;
  status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
  caseType := '';
  valuedate := ifn.AppDate;
  postDate := ifn.AppDate;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstLedger do
      begin
        Open;

        cnt := ALoan.ApprovedTerm;

        interest := ALoan.ReleaseAmount * ALoan.LoanClass.InterestInDecimal;

        principal := ALoan.ReleaseAmount / ALoan.ApprovedTerm;

        for i := 1 to cnt do
        begin
          valueDate := GetValueDate(valueDate,IncMonth(ifn.AppDate,i));

          // interest
          caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
          PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // principal
          caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
          PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);
        end;

        UpdateBatch;
        Close;
      end;
    except
      on E: Exception do
      begin
        dmAccounting.dstLedger.CancelBatch;
        ShowErrorBox(E.Message);
      end;
    end;
  finally
    dmAccounting.dstLedger.Close;
    dmAccounting.Free;
  end;
end;

procedure TPosting.PostPaymentDiminishing(const APayment: TPayment; const detailIndex: integer);
var
  postingId, refPostingId: string;
  paymentAmount, amountDue, debit,credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  detail: TPaymentDetail;
  paymentType: TPaymentTypes;
begin
  detail := APayment.Details[detailIndex];


end;

procedure TPosting.PostPaymentFixed(const APayment: TPayment; const detailIndex: integer);
var
  refPostingId: string;
  paymentAmount, amountDue, debit,credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  detail: TPaymentDetail;
  paymentType: TPaymentTypes;
begin
  detail := APayment.Details[detailIndex];

  debit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.PAY);
  primaryKey := APayment.PaymentId;
  valuedate := APayment.Date;
  postDate := ifn.AppDate;


end;

procedure TPosting.Post(const ALoan: TLoan);
begin
  if ALoan.LoanClass.IsDiminishing then PostLoanDiminishing(ALoan)
  else if ALoan.LoanClass.IsFixed then PostLoanFixed(ALoan);
end;

constructor TPosting.Create;
begin

end;

destructor TPosting.Destroy;
begin

  inherited;
end;

function TPosting.GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;
var
  month1, day1, year1: word;
  month2, day2, year2: word;
begin
  DecodeDate(ADate1,year1,month1,day1);
  DecodeDate(ADate2,year2,month2,day2);

  Result := EncodeDate(year2,month2,day1);
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
              // set the refposting id
              // this is only called for unschedule posting
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

end.
