unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, User;

type
  TLocalUser = class
  private
    FName: string;
    FPasskey: string;
    FRoleCode: string;

    function GetHasName: boolean;
    function GetHasPasskey: boolean;
    function GetHasRole: boolean;

  public
    property Name: string read FName write FName;
    property Passkey: string read FPasskey write FPasskey;
    property RoleCode: string read FRoleCode write FRoleCode;
    property HasName: boolean read GetHasName;
    property HasPasskey: boolean read GetHasPasskey;
    property HasRole: boolean read GetHasRole;
  end;

  TfrmUsers = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edUsername: TRzDBEdit;
    Label3: TLabel;
    edPassword: TRzDBEdit;
    urlRoles: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LUser: TLocalUser;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;

    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  SecurityData, IFinanceDialogs, IFinanceGlobal;

{ TfrmUsers }

procedure TfrmUsers.BindToObject;
begin
  inherited;
  LUser.Name := edUsername.Text;
  LUser.Passkey := edPassword.Text;
end;

function TfrmUsers.EditIsAllowed: boolean;
begin
  Result := ifn.User.HasRight(S9MODIFY_USER9Change_user_login_credentials,false);
end;

function TfrmUsers.EntryIsValid: boolean;
var
  error: string;
begin
  if not LUser.HasName then error := 'Please enter username.'
  else if not LUser.HasPasskey then error := 'Please enter password.'
  else if not LUser.HasRole then error := 'Please select a role.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LUser.Free;
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  LUser := TLocalUser.Create;
  inherited;
end;

function TfrmUsers.NewIsAllowed: boolean;
begin
  Result := ifn.User.HasRight(S9ADD_USER9Add_new_user_login);
end;

procedure TfrmUsers.SearchList;
var
  filterStr: string;
begin
  filterStr := 'USERNAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

{ TLocalUser }

function TLocalUser.GetHasName: boolean;
begin
  Result := FName <> '';
end;

function TLocalUser.GetHasPasskey: boolean;
begin
  Result := FPasskey <> '';
end;

function TLocalUser.GetHasRole: boolean;
begin
  Result := FRoleCode <> '';
end;

end.
