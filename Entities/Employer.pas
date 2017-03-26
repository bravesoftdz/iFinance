unit Employer;

interface

uses
  SysUtils, Group;

type
  TEmployer = class(TObject)
  protected
    FId: string;
    FName: string;
    FGroup: TGroup;
    FAddress: string;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property Group: TGroup read FGroup write FGroup;
    property Address: string read FAddress write FAddress;

    constructor Create; overload;
    constructor Create(const id, name, addr: string; const gp: TGroup); overload;
    destructor Destroy; override;
  end;

var
  emp: TEmployer;

implementation

constructor TEmployer.Create;
begin
  if emp = nil then
    emp := self;
end;

constructor TEmployer.Create(const id, name, addr: string; const gp: TGroup);
begin
  FId := id;
  FName := name;
  FGroup := gp;
  FAddress := addr;
end;

destructor TEmployer.Destroy;
begin
  if emp = self then
    emp := nil;
  inherited;
end;

end.
