unit AccountType;

interface

type
  TAccountType = class(TObject)
  private
    FTypeCode: string;
    FName: string;
    FMaxConcurrent: integer;
    FMaxTotalAmount: real;
  public
    property TypeCode: string read FTypeCode write FTypeCode;
    property Name: string read FName write FName;
    property MaxConcurrent: integer read FMaxConcurrent write FMaxConcurrent;
    property MaxTotalAmount: real read FMaxTotalAmount write FMaxTotalAmount;

    constructor Create; overload;
    constructor Create(const code, name: string; const concurrent: integer;
        const total: real); overload;
  end;

var
  atype: TAccountType;

implementation

constructor TAccountType.Create;
begin
  inherited;
end;

constructor TAccountType.Create(const code: string; const name: string; const concurrent: Integer; const total: Real);
begin
  FTypeCode := code;
  FName := name;
  FMaxConcurrent := concurrent;
  FMaxTotalAmount := total;
end;

end.
