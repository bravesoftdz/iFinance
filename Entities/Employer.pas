unit Employer;

interface

uses
  SysUtils;

type
  TEmployer = class(TObject)
  protected
    FId: string;
    FName: string;
    FGroupId: integer;
    FAddress: string;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property GroupId: integer read FGroupId write FGroupId;
    property Address: string read FAddress write FAddress;

    constructor Create; overload;
    constructor Create(const id, name: string; const grpId: integer; const addr: string); overload;
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

constructor TEmployer.Create(const id: string; const name: string; const grpId: Integer; const addr: string);
begin
  FId := id;
  FName := name;
  FGroupId := grpId;
  FAddress := addr;
end;

destructor TEmployer.Destroy;
begin
  if emp = self then
    emp := nil;
  inherited;
end;

end.
