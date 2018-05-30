unit ChangePassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzButton, StrUtils, SaveIntf;

type
  TfrmChangePassword = class(TfrmBaseDocked,ISave)
    Label1: TLabel;
    edPassword: TRzEdit;
    Label2: TLabel;
    edNewPassword: TRzEdit;
    Label3: TLabel;
    edConfirm: TRzEdit;
    pnlSave: TRzPanel;
    btnSave: TRzShapeButton;
    lblErrorMessage: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ClearPasswords;
    function PasskeyIsValid: boolean;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

implementation

{$R *.dfm}

uses
  IFinanceGlobal, IFinanceDialogs, SecurityUtil;

procedure TfrmChangePassword.btnSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TfrmChangePassword.Cancel;
begin

end;

procedure TfrmChangePassword.ClearPasswords;
begin
  edPassword.Clear;
  edNewPassword.Clear;
  edConfirm.Clear;
end;

procedure TfrmChangePassword.FormCreate(Sender: TObject);
begin
  inherited;
  lblErrorMessage.Caption := '';
end;

function TfrmChangePassword.PasskeyIsValid: boolean;
var
  oldPassKey, newPassKey, confirm: string;
  error: string;
begin
  error := '';

  oldPassKey := Trim(edPassword.Text);
  newPassKey := Trim(edNewPassword.Text);
  confirm := Trim(edConfirm.Text);

  if not MatchStr(ifn.User.Passkey,oldPassKey) then error := 'Current password does not match the saved password.'
  else if newPasskey = '' then error := 'Password cannot be empty.'
  else if not MatchStr(newPassKey,confirm) then error := 'Passwords do not match.';

  lblErrorMessage.Font.Color := clRed;
  lblErrorMessage.Caption := error;

  Result := error = '';
end;

function TfrmChangePassword.Save: boolean;
var
  newPassKey: AnsiString;
begin
  Result := false;
  if PasskeyIsValid then
  begin
    newPassKey := Encrypt(Trim(edNewPassword.Text));
    if ifn.User.ChangePassword(newPassKey) then
    begin
      ShowConfirmationBox('Password changed successfully.');
      ClearPasswords;
      Result := true;
    end;
  end;
end;

end.
