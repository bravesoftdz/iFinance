unit IFinanceGlobal;

interface

uses
  SysUtils, User;

type
  TIFinance = class(TObject)
  private
    FLocationCode: string;
    FLocationPrefix: string;
    FUser: TUser;
  public
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationPrefix: string read FLocationPrefix write FLocationPrefix;
    property User: TUser read FUser write FUser;
    constructor Create;
    destructor Destroy; override;
  end;

var
  ifn: TIFinance;

implementation

{ TIFinance }

constructor TIFinance.Create;
begin
  if ifn <> nil then
    Abort
  else
  begin
    FUser := TUser.Create;
    ifn := self;
  end;
end;

destructor TIFinance.Destroy;
begin
  if ifn = self then
    ifn := nil;
  inherited Destroy;
end;

end.
