unit LoanType;

interface

type
  TLoanType = class(TObject)
  private
    FId: integer;
    FName: string;
    FMaxConcurrent: integer;
    FMaxTotalAmount: real;
    FIdentityDocs: integer;

    function GetHasConcurrent: boolean;

  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
    property MaxConcurrent: integer read FMaxConcurrent write FMaxConcurrent;
    property MaxTotalAmount: real read FMaxTotalAmount write FMaxTotalAmount;
    property HasConcurrent: boolean read GetHasConcurrent;
    property IdentityDocs: integer read FIdentityDocs write FIdentityDocs;

    constructor Create; overload;
    constructor Create(const id: integer; const name: string; const concurrent: integer;
        const total: real; const identDocs: integer = 0); overload;
  end;

var
  ltype: TLoanType;

implementation

constructor TLoanType.Create;
begin
  if ltype <> nil then
    Exit
  else
    ltype := self;
end;

constructor TLoanType.Create(const id: integer; const name: string; const concurrent: integer;
        const total: real; const identDocs: integer);
begin
  FId := id;
  FName := name;
  FMaxConcurrent := concurrent;
  FMaxTotalAmount := total;
  FIdentityDocs := identDocs;
end;

function TLoanType.GetHasConcurrent: boolean;
begin
  Result := FMaxConcurrent > 0;
end;

end.
