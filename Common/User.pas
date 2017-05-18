unit User;

interface

uses
  SysUtils;

type
  TUser = class
  private
    FUserId: string;
    FUserName: string;
    FUserRights: array of string;
    FFirstName: string;
    FLastName: string;
    function GetName: string;
  public
    property UserId: string read FUserId write FUserId;
    property UserName: string read FUserName write FUserName;
    property FirstName: string write FFirstName;
    property LastName: string write FLastName;
    property Name: string read GetName;

    procedure SetRight(const right: string);
    function HasRights(const rights: array of string;
      const warn: boolean = false): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

var
  usr: TUser;


implementation

{ TUser }

constructor TUser.Create;
begin
  if usr <> nil then
    Abort
  else
    usr := self;
end;

destructor TUser.Destroy;
begin
  if usr = self then
    usr := nil;
  inherited Destroy;
end;

function TUser.GetName: string;
begin
  Result := FLastName + ', ' + FFirstName;
end;

function TUser.HasRights(const rights: array of string;
  const warn: boolean = false): boolean;
begin
  Result := true;
end;

procedure TUser.SetRight(const right: string);
var
  len: integer;
begin
  len := Length(FUserRights);

  SetLength(FUserRights, len + 1);
  FUserRights[len] := right;
end;

end.
