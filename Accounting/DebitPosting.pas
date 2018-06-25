unit DebitPosting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, System.Rtti, DateUtils, Math;

type
  TDiminishingType = (dtNone, dtScheduled, dtFixed);

  TActiveLoan = class
  strict private
    FId: string;
    FTerm: smallint;
    FAmortization: currency;
    FInterestRate: currency;
    FReleaseAmount: currency;
    FIsDiminishing: boolean;
    FDiminishingType: TDiminishingType;
  private
    FReleaseDate: TDateTime;
  public
    property Id: string read FId write FId;
    property ReleaseAmount: currency read FReleaseAmount write FReleaseAmount;
    property Term: smallint read FTerm write FTerm;
    property InterestRate: currency read FInterestRate write FInterestRate;
    property IsDiminishing: boolean read FIsDiminishing write FIsDiminishing;
    property Amortization: currency read FAmortization write FAmortization;
    property DiminishingType: TDiminishingType read FDiminishingType write FDiminishingType;
    property ReleaseDate: TDateTime read FReleaseDate write FReleaseDate;
  end;

  TfrmDebitPosting = class(TfrmBasePopup)
  private
    { Private declarations }
    procedure PostPrincipalDebit;
    procedure PostInterestDebit;

    function PostEntry(const refPostingId: string;
      const debit, credit: currency; const eventObject, primaryKey, status: string;
      const postDate, valueDate: TDateTime; const caseType: string): string;
    function PostInterest(const interest: currency; const loanId: string;
      const ADate: TDateTime; const source, status: string): string; overload;
    function GetFirstDayOfValueDate(const ADate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  AccountingData, IFinanceGlobal, AppConstants, IFinanceDialogs, DBUtil,
  LoanClassification;

{ TfrmDebitPosting }

function TfrmDebitPosting.GetFirstDayOfValueDate(
  const ADate: TDateTime): TDateTime;
var
  month, day, year: word;
begin
  DecodeDate(ADate,year,month,day);

  Result := EncodeDate(year,month,1);
end;

function TfrmDebitPosting.PostEntry(const refPostingId: string; const debit,
  credit: currency; const eventObject, primaryKey, status: string;
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

function TfrmDebitPosting.PostInterest(const interest: currency;
  const loanId: string; const ADate: TDateTime; const source,
  status: string): string;
begin

end;

procedure TfrmDebitPosting.PostInterestDebit;
begin

end;

procedure TfrmDebitPosting.PostPrincipalDebit;
var
  refPostingId: string;
  principal, interest, balance, credit: currency;
  eventObject, primaryKey, caseType, status: string;
  postDate, valueDate, runningDate: TDateTime;
  i, cnt: integer;
  LLoan: TActiveLoan;
  vy, vm, vd, yy, mm, dd: word;
begin
  refPostingId := '';

  credit := 0;
  eventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON);
  caseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
  valuedate := GetFirstDayOfValueDate(ifn.AppDate);
  postDate := ifn.AppDate;
  status := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);

  DecodeDate(ifn.AppDate,yy,mm,dd);

  LLoan := TActiveLoan.Create;

  dmAccounting := TdmAccounting.Create(nil);
  try
    try
      dmAccounting.dstLedger.Open;

      with dmAccounting.dstPrincipalDebit  do
      begin
        Open;

        LLoan.Id := FieldByName('loan_id').AsString;
        LLoan.Term := FieldByName('terms').AsInteger;
        LLoan.Amortization := FieldByName('amort').AsCurrency;
        LLoan.InterestRate := FieldByName('int_rate').AsCurrency / 100;
        LLoan.ReleaseAmount := FieldByName('rel_amt').AsCurrency;
        LLoan.IsDiminishing := FieldByName('int_comp_method').AsString = 'D';
        LLoan.DiminishingType := TDiminishingType(FieldByName('dim_type').AsInteger);
        LLoan.ReleaseDate := FieldByName('date_rel').AsDateTime;

        while not Eof do
        begin

          primaryKey := LLoan.Id;
          balance := LLoan.ReleaseAmount;

          cnt := LLoan.Term;
          i := 1;

          while (i <= cnt) and (mm <> vm) and (yy <> vy) do
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
              PostEntry(refPostingId, principal, credit, eventObject, primaryKey, status,
                  postDate, valueDate, caseType);

            // get balance
            balance := balance - principal;

            Inc(i);
          end;

          Next;
        end;

        UpdateBatch;

      end;
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

end.
