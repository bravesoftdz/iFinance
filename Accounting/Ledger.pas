unit Ledger;

interface

uses
  Loan, Payment, SysUtils;

type
  TLedger = class
  private
    procedure PostEntry(const refPostingId: integer;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string); overload;
  public
     procedure Post(const ln: TLoan); overload;
     procedure Post(const pmt: TPayment); overload;
  end;

implementation

{ TPosting }

uses
  AccountingData, IFinanceGlobal, IFinanceDialogs;

procedure TLedger.PostEntry(const refPostingId: integer;
      const debit, credit: real; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string);
begin
  with dmAccounting.dstLedger do
  begin
    Append;

    if refPostingId > 0 then FieldByName('ref_posting_id').AsInteger := refPostingId;

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

procedure TLedger.Post(const ln: TLoan);
var
  refPostingId: integer;
  principal, interest, balance, credit: real;
  eventObject, primaryKey, status, caseType: string;
  postDate, valueDate: TDateTime;
  i, cnt: integer;
begin
  refPostingId := 0;

  credit := 0;
  eventObject := 'LON';
  primaryKey := ln.Id;
  status := 'OPN';
  caseType := '';
  postDate := ifn.AppDate;

  balance := ln.ReleaseAmount;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      with dmAccounting.dstLedger do
      begin
        Open;

        cnt := ln.ApprovedTerm;

        for i := 1 to cnt do
        begin
          valueDate := IncMonth(ifn.AppDate,i);

          // interest
          caseType := 'INT';
          interest := balance * ln.LoanClass.InterestInDecimal;
          PostEntry(refPostingId, interest, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          // principal
          caseType := 'PRN';
          principal := ln.Amortisation - interest;
          PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status, postDate, valueDate, caseType);

          balance := balance - principal;
        end;

        UpdateBatch;
        Close;
      end;
    except
      on E: Exception do ShowErrorBox(E.Message);
    end;
  finally
    dmAccounting.Free;
  end;
end;

procedure TLedger.Post(const pmt: TPayment);
begin

end;

end.
