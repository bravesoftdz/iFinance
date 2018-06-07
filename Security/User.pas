unit User;

interface

uses
  StrUtils, SysUtils, System.Rtti, Classes, Right;

type
  TSuperUser = class
  strict private
    FName: string;
    FPasskey: string;
  public
    property Name: string read FName write FName;
    property Passkey: string read FPasskey write FPasskey;
  end;

  TUser = class
  private
    FPasskey: string;
    FRoleCode: string;
    FRights: array of string;
    FSuperUser: TSuperUser;
    FLastName: string;
    FFirstName: string;
    FUserId: string;

    function GetHasName: boolean;
    function GetHasPasskey: boolean;
    function GetHasRole: boolean;
    function GetIsSuperUser: boolean;
    function GetName: string;

  public
    property Passkey: string read FPasskey write FPasskey;
    property RoleCode: string read FRoleCode write FRoleCode;
    property HasName: boolean read GetHasName;
    property HasPasskey: boolean read GetHasPasskey;
    property HasRole: boolean read GetHasRole;
    property SuperUser: TSuperUser read FSuperUser write FSuperUser;
    property IsSuperUser: boolean read GetIsSuperUser;
    property UserId: string read FUserId write FUserId;
    property FirstName: string write FFirstName;
    property LastName: string write FLastName;
    property Name: string read GetName;

    procedure SetRight(const right: string);
    procedure AddRight(const code: string);
    procedure ClearSuperUser;

    function HasRight(const right: TRights; const showWarning: boolean = true): boolean;
    function ChangePassword(ANewPasskey: AnsiString): Boolean;

    constructor Create; overload;
    constructor Create(const AName: string); overload;

    destructor Destroy; override;
  end;

implementation

{ TUser }

uses
  AppData, IFinanceDialogs;

procedure TUser.AddRight(const code: string);
begin
  SetLength(FRights, Length(FRights) + 1);
  FRights[Length(FRights) - 1] := code;
end;

function TUser.ChangePassword(ANewPasskey: AnsiString): Boolean;
var
  sqlStr: string;
begin
  Result := false;
  try
    with dmApplication.acCore do
    begin
      sqlStr := 'UPDATE SYSUSER SET PASSKEY = ' + QuotedStr(Trim(ANewPasskey)) +
                ' WHERE USERNAME = ' + QuotedStr(FUserId);

      Execute(sqlStr);
      Result := true;
    end;
  except

  end;
end;

procedure TUser.ClearSuperUser;
begin
  FreeAndNil(FSuperUser);
end;

constructor TUser.Create(const AName: string);
begin
  FUserId := AName;
end;

destructor TUser.Destroy;
begin

  inherited;
end;

function TUser.GetHasName: boolean;
begin
  Result := FUserId <> '';
end;

function TUser.GetHasPasskey: boolean;
begin
  Result := FPasskey <> '';
end;

function TUser.GetHasRole: boolean;
begin
  Result := RoleCode <> '';
end;

function TUser.GetIsSuperUser: boolean;
begin
  Result := Assigned(FSuperUser);
end;

function TUser.GetName: string;
begin
  Result := FLastName + ', ' + FFirstName;
end;

constructor TUser.Create;
begin
  inherited Create;
end;

function TUser.HasRight(const right: TRights; const showWarning: boolean = true): boolean;
var
  rightCode: string;
  sl: TStringList;
begin
  Result := Assigned(FSuperUser);

  if not Result then
  begin
    sl := TStringList.Create;
    sl.Delimiter := '9';
    sl.DelimitedText := TRttiEnumerationType.GetName<TRights>(right);

    // Note: Index 0 is for sorting purposes used when displaying the rights
    //       Index 1 is the actual right code
    //       Index 2 is the right description

    rightCode := sl[1];

    sl.Free;

    Result := MatchStr(rightCode,FRights);
  end;

  if not Result then
    if showWarning then ShowErrorBox('Access is denied. Please contact the system administrator.');
end;

procedure TUser.SetRight(const right: string);
var
  len: integer;
begin
  len := Length(FRights);

  SetLength(FRights, len + 1);
  FRights[len] := right;
end;

end.
