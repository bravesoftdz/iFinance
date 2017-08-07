unit Posting;

interface

type
  TPosting<T> = class
  private
    class procedure Post(const postingId, refPostingId: integer;
      const locPrefix: string; const dr, cr: real; const eventObj, pk, st: string;
      const postDate, valueDate: TDateTime; const caseType: string); overload;
  public
    class procedure Post(const p: TObject); overload;
  end;

implementation

{ TPosting }

uses
  AccountingData, Loan, Payment;

class procedure TPosting<T>.Post(const p: TObject);
var
  postingId, refPostingId: integer;
  locPrefix, eventObj, pk, st, caseType: string;
  dr, cr: real;
  postDate, valueDate: TDateTime;
begin
  if p is TLoan then
    Post(postingId, refPostingId, locPrefix, dr, cr, eventObj, pk, st,
         postDate, valueDate, caseType);
end;

class procedure TPosting<T>.Post(const postingId, refPostingId: integer;
  const locPrefix: string; const dr, cr: real; const eventObj, pk, st: string;
  const postDate, valueDate: TDateTime; const caseType: string);
begin
  with dmAccounting.dstLedger do
  begin
    Open;

    Append;
    FieldByName('posting_id').AsInteger := postingId;
    FieldByName('ref_posting_id').AsInteger := refPostingId;
    FieldByName('loc_prefix').AsString := locPrefix;
    FieldByName('debit_amt').AsFloat := dr;
    FieldByName('credit_amt').AsFloat := cr;
    FieldByName('pk_event_object').AsString := pk;
    FieldByName('event_object').AsString := eventObj;
    FieldByName('status_code').AsString := st;
    FieldByName('posting_date').AsDateTime := postDate;
    FieldByName('value_date').AsDateTime := valueDate;
    FieldByName('case_type').AsString := caseType;
    Post;

    Close;
  end;
end;

end.
