unit LoanClient;

interface

uses
  Employer, ClientLoan;

type
  TLoanClient = class(TObject)
  private
    FId: string;
    FName: string;
    FEmployer: TEmployer;
    FAddress: string;
    FAge: integer;
    FNetPay: currency;
    FLoans: array of TClientLoan;
    FValidIdentityDocs: integer;
    FAvailablePromissoryNotes: array of string;

    procedure AddLoan(const loan: TClientLoan);
    procedure AddPromissoryNote(const AValue: string);

    function GetLoan(const i: integer): TClientLoan;
    function GetPromissoryNote(const i: integer): string;
    function GetPromissoryNoteCount: integer;
  public
    procedure GetLoans;
    procedure GetAvailablePromissoryNotes;

    function GetLoanClassCount(const classId: integer): integer;
    function GetLoanClassBalance(const classId: integer): real;

    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property Employer: TEmployer read FEmployer write FEmployer;
    property Address: string read FAddress write FAddress;
    property Age: integer read FAge write FAge;
    property NetPay: currency read FNetPay write FNetPay;
    property Loans[const i: integer]: TClientLoan read GetLoan;
    property ValidIdentityDocs: integer read FValidIdentityDocs write FValidIdentityDocs;
    property PromissoryNotes[const i: integer]: string read GetPromissoryNote;
    property PromissoryNotesCount: integer read GetPromissoryNoteCount;

    constructor Create; overload;
    constructor Create(const id, name: string; emp: TEmployer; const addr: string); overload;
    constructor Create(const id, name: string; emp: TEmployer; const addr: string;
        const age: integer; const netPay: real; const idDocs: integer = 0); overload;
    destructor Destroy; override;
  end;

var
  lnc: TLoanClient;

implementation

uses
  LoanData;

constructor TLoanClient.Create;
begin
  if lnc = nil then
    lnc := self;
end;

constructor TLoanClient.Create(const id, name: string; emp: TEmployer; const addr: string);
begin
  inherited Create;

  FId := id;
  FName := name;
  FEmployer := emp;
  FAddress := addr;
end;

procedure TLoanClient.AddPromissoryNote(const AValue: string);
begin
  SetLength(FAvailablePromissoryNotes,Length(FAvailablePromissoryNotes) + 1);
  FAvailablePromissoryNotes[Length(FAvailablePromissoryNotes) - 1] := AValue;
end;

constructor TLoanClient.Create(const id, name: string; emp: TEmployer; const addr: string;
        const age: integer; const netPay: real; const idDocs: integer);
begin
  inherited Create;

  FId := id;
  FName := name;
  FEmployer := emp;
  FAddress := addr;
  FAge := age;
  FNetPay := netPay;
  FValidIdentityDocs := idDocs;
end;

destructor TLoanClient.Destroy;
begin
  if lnc = self then
    lnc := nil;
  inherited;
end;

procedure TLoanClient.AddLoan(const loan: TClientLoan);
begin
  SetLength(FLoans,Length(FLoans) + 1);
  FLoans[Length(FLoans) - 1] := loan;
end;

procedure TLoanClient.GetLoans;
begin
  // clear the loans
  FLoans := [];

  with dmLoan.dstClientLoans do
  begin
    try
      Open;
      while not Eof do
      begin
        AddLoan(TClientLoan.Create(FieldByName('loan_id').AsString,
                        FieldByName('class_id').AsInteger,
                        FieldByName('balance').AsCurrency));
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

function TLoanClient.GetPromissoryNote(const i: integer): string;
begin
  Result := FAvailablePromissoryNotes[i];
end;

function TLoanClient.GetPromissoryNoteCount: integer;
begin
  Result := Length(FAvailablePromissoryNotes);
end;

procedure TLoanClient.GetAvailablePromissoryNotes;
begin
  // clear the promissory notes
  FAvailablePromissoryNotes := [];

  with dmLoan.dstPromissoryNotes do
  begin
    try
      Open;
      while not Eof do
      begin
        AddPromissoryNote(FieldByName('pn_no').AsString);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

function TLoanClient.GetLoan(const i: Integer): TClientLoan;
begin
  Result := FLoans[i];
end;

function TLoanClient.GetLoanClassCount(const classId: Integer): integer;
var
  cnt: integer;
  loan: TClientLoan;
begin
  cnt := 0;
  for loan in FLoans do
    if loan.LoanClassId = classId then Inc(cnt);

  Result := cnt;
end;

function TLoanClient.GetLoanClassBalance(const classId: integer): real;
var
  balance: real;
  loan: TClientLoan;
begin
  balance := 0;
  for loan in FLoans do
    if loan.LoanClassId = classId then balance := balance + loan.Balance;

  Result := balance;
end;

end.
