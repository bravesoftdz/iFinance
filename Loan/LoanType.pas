unit LoanType;

interface

type
  TLoanType = class(TObject)
  private
    FId: integer;
    FName: string;
    FMaxConcurrent: integer;
    FMaxTotalAmount: real;

    function GetHasConcurrent: boolean;

  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
    property MaxConcurrent: integer read FMaxConcurrent write FMaxConcurrent;
    property MaxTotalAmount: real read FMaxTotalAmount write FMaxTotalAmount;
    property HasConcurrent: boolean read GetHasConcurrent;

    constructor Create; overload;
    constructor Create(const id: integer; const name: string; const concurrent: integer;
        const total: real); overload;
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
        const total: real);
begin
  FId := id;
  FName := name;
  FMaxConcurrent := concurrent;
  FMaxTotalAmount := total;
end;

function TLoanType.GetHasConcurrent: boolean;
begin
  Result := FMaxConcurrent > 0;
end;

end.
