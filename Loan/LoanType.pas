unit LoanType;

interface

type
  TLoanType = class(TObject)
  private
    FId: integer;
    FName: string;
  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;

    constructor Create; overload;
    constructor Create(const id: integer; const name: string); overload;
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

constructor TLoanType.Create(const id: integer; const name: string);
begin
  FId := id;
  FName := name;
end;

end.
