unit Ledger;

interface

uses
  Loan, Payment, SysUtils, DateUtils, System.Rtti, Math;

type
  TLedger = class
  private
    IdToClose: array of string;

    procedure PostEntry(const refPostingId: string;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string);

    // loan-related posting
    procedure PostLoanDiminishing(const ALoan: TLoan);
    procedure PostLoanFixed(const ALoan: TLoan);

    // payment-related posting
    procedure PostPaymentDiminishing(const APayment: TPayment; const detailIndex: integer);
    procedure PostPaymentFixed(const APayment: TPayment; const detailIndex: integer);

    // ledger-related methods
    procedure CloseLedgerRecord(const postingId: string);
    procedure AddIdToClose(const postingId: string);
    procedure CloseIds;

    function GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;

  public
     procedure Post(const ALoan: TLoan); overload;
     procedure Post(const APayment: TPayment); overload;
  end;

implementation

{ TPosting }

uses
  AccountingData, IFinanceGlobal, IFinanceDialogs, AppConstants, DBUtil;

procedure TLedger.PostEntry(const refPostingId: string;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string);
var
  postingId: string;
begin
  with dmAccounting.dstLedger do
  begin
    Append;

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
end;

procedure TLedger.PostLoanDiminishing(const ALoan: TLoan);
var
  refPostingId: string;
  principal, interest, balance, credit: real;
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

  balance := ALoan.ReleaseAmount;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstLedger do
      begin
        Open;

        cnt := ALoan.ApprovedTerm;

        for i := 1 to cnt do
        begin
          valueDate := GetValueDate(valueDate,IncMonth(ifn.AppDate,i));

          // interest
          caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);

          interest := balance * ALoan.LoanClass.InterestInDecimal;
          PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // principal
          caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);

          if ALoan.LoanClass.UseFactorRate then principal := ALoan.Amortisation - interest
          else principal := ALoan.ReleaseAmount / ALoan.ApprovedTerm;

          PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // get balance
          balance := balance - principal;
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

procedure TLedger.PostLoanFixed(const ALoan: TLoan);
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

procedure TLedger.PostPaymentDiminishing(const APayment: TPayment; const detailIndex: integer);
var
  refPostingId: string;
  paymentAmount, amountDue, debit,credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
  detail: TPaymentDetail;
  paymentType: TPaymentTypes;
begin
  detail := APayment.Details[detailIndex];

  debit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.PAY);
  primaryKey := APayment.PaymentId;
  valuedate := APayment.Date;
  postDate := ifn.AppDate;

  // loop thru each payment type
  for paymentType := TPaymentTypes.PRN to TPaymentTypes.PEN do
  begin

    // get the amount and casetype to be posted
    case paymentType of
      PRN:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
          paymentAmount := detail.Principal;
        end;

      INT:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
          paymentAmount := detail.Interest;
        end;

      PEN:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PNT);
          paymentAmount := detail.Penalty;
        end;

    end;

    with dmAccounting.dstSchedule do
      begin
      // filter the dataset depending on case type
      Filter :=
        '(pk_event_object = ' + QuotedStr(detail.Loan.Id) + ') AND ' +
        '(case_type = ' + QuotedStr(caseType) + ')';

      // loop thru the amount until balance is 0
      while paymentAmount > 0 do
      begin
        // get the debit amount
        amountDue := FieldByName('payment_due').AsFloat;

        // set the credit amount
        if amountDue >= paymentAmount then credit := paymentAmount
        else if amountDue < paymentAmount then credit := amountDue;

        // get the reference posting ID of the debit
        refPostingId := FieldByName('posting_id').AsString;

        PostEntry(refPostingId, debit, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

        // if credit is equal to payment due close the debit
        // add to the IDs for closing
        if credit = amountDue then AddIdToClose(refPostingId);

        // get remainder of payment
        paymentAmount := paymentAmount - credit;

        // move to the next payment schedule
        Next;
      end; // end while
    end; // end with
  end;  // end for
end;

procedure TLedger.PostPaymentFixed(const APayment: TPayment; const detailIndex: integer);
begin

end;

procedure TLedger.Post(const ALoan: TLoan);
begin
  if ALoan.LoanClass.IsDiminishing then PostLoanDiminishing(ALoan)
  else if ALoan.LoanClass.IsFixed then PostLoanFixed(ALoan);
end;

procedure TLedger.AddIdToClose(const postingId: string);
begin
  SetLength(IdToClose,Length(IdToClose)+1);
  IdToClose[Length(IdToClose)-1] := postingId;
end;

procedure TLedger.CloseIds;
var
  id: string;
begin
  for id in IdToClose do CloseLedgerRecord(id);
end;

procedure TLedger.CloseLedgerRecord(const postingId: string);
var
  sql: string;
begin
  sql := 'UPDATE ledger SET status_code = ''CLS'' WHERE posting_id = ' + QuotedStr(postingId);
  ExecuteSQL(sql);
end;

function TLedger.GetValueDate(const ADate1, ADate2: TDateTime): TDateTime;
var
  month1, day1, year1: word;
  month2, day2, year2: word;
begin
  DecodeDate(ADate1,year1,month1,day1);
  DecodeDate(ADate2,year2,month2,day2);

  Result := EncodeDate(year2,month2,day1);
end;

procedure TLedger.Post(const APayment: TPayment);
var
  detail: TPaymentDetail;
  i, cnt: integer;
begin
  // clear the ID to close array
  IdToClose := [];

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      // open the schedule
      dmAccounting.dstSchedule.Parameters.ParamByName('@entity_id').Value := APayment.Client.Id;
      dmAccounting.dstSchedule.Open;

      dmAccounting.dstLedger.Open;

      cnt := APayment.DetailCount - 1;

      for i := 0 to cnt do
      begin
        detail := APayment.Details[i];
        if detail.Loan.IsDiminishing then PostPaymentDiminishing(APayment,i)
        else if detail.Loan.IsFixed then PostPaymentFixed(APayment,i);
      end;

      dmAccounting.dstLedger.UpdateBatch;

      CloseIds;
    except
      on E: Exception do
      begin
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
