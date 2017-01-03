unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, BasePopup, BaseForm, Vcl.StdCtrls, RzLabel, System.UITypes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzPrgres,
  RzButton;

type
  TfrmLogin = class(TfrmBasePopup)
    Label4: TLabel;
    Label5: TLabel;
    lblVersion: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edUsername: TRzEdit;
    edPassword: TRzEdit;
    lbErrorMessage: TLabel;
    imgLogo: TImage;
    prbStatus: TRzProgressBar;
    btnLogin: TRzButton;
    btnCancel: TRzButton;
    lblStatus: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LoadModules;
    procedure LoadSettings;
    procedure SettingAccessRights;
    procedure PauseWindow(timer: integer);
    function UserExists: boolean;
    function PasswordIsValid: boolean;
  public
    { Public declarations }
    class function LoggedIn: boolean;
  end;

var
  frmLogin: TfrmLogin;

const
  LIMITGLOBAL = 6;
  TICK = 400;
  INCREMENT = 16;

implementation

{$R *.dfm}

uses
  AppData, AppUtil, IFinanceGlobal;

class function TfrmLogin.LoggedIn: boolean;
begin
  with TfrmLogin.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

function TfrmLogin.UserExists: boolean;
var
  username: string;
begin
  with dmApplication.dstUser do
  begin
    username := Trim(edUsername.Text);

    Close;
    Parameters.ParamByName('@username').Value := username;
    Open;

    Result := RecordCount > 0;

    if not Result then
      lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if (UserExists) and (PasswordIsValid) then
  begin
    try
      try
        edUsername.Enabled := false;
        edPassword.Enabled := false;
        btnLogin.Enabled := false;
        btnCancel.Enabled := false;

        lblStatus.Visible := true;
        prbStatus.Visible := true;
        lbErrorMessage.Visible := false;

        self.Update;

        ifn := TIFinance.Create;

        LoadModules;
        SettingAccessRights;
        LoadSettings;

        ModalResult := 1;
      except
        on e: Exception do
        begin
          MessageDlg('An exception has been detected and the application needs to close. ' +
            'Please contact the administrator with the message below.' + #13#10 + #13#10 +
            e.Message,
            mtError,[mbOK],0);
          Application.Terminate;
        end;
      end;
    finally

    end;
  end
  else
  begin
    lbErrorMessage.Visible := true;
    edUsername.SetFocus;
  end;
end;

procedure TfrmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnLogin.Click;
end;

procedure TfrmLogin.edUsernameChange(Sender: TObject);
begin
  inherited;
  lbErrorMessage.Visible := false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  dmApplication := TdmApplication.Create(Application);

  // get version
  lblVersion.Caption := 'Version ' + GetAppVersionStr(ParamStr(0));
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  prbStatus.Visible := false;
end;

procedure TfrmLogin.PauseWindow(timer: integer);
var
  StartTimer: integer;
  EndTimer: Integer;
begin
  // wait a few miliseconds
  StartTimer := GetTickCount;
  EndTimer   := StartTimer + timer;

  while StartTimer < EndTimer do
    StartTimer := GetTickCount;
end;

procedure TfrmLogin.LoadSettings;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Loading settings.';
  self.Update;

  with dmApplication.dstConfig do
  begin
    Open;

    ifn.AppDate := Date;

    // location code
    Locate('sysconfig_code','LOCATION_CODE',[]);
    ifn.LocationCode := FieldbyName('sysconfig_value').AsString;

    // location prefix
    Locate('sysconfig_code','LOCATION_PREFIX',[]);
    ifn.LocationPrefix := FieldbyName('sysconfig_value').AsString;

    // photo path
    ifn.PhotoPath := ExtractFilePath(Application.ExeName) + 'photos\';
    if not DirectoryExists(ifn.PhotoPath) then
      CreateDir(ifn.PhotoPath);

    // application images path
    ifn.AppImagesPath := ExtractFilePath(Application.ExeName) + '_images\';

    Close;
  end;

  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.LoadModules;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  lblStatus.Caption := 'Loading modules.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.SettingAccessRights;
var
  limit, i, timer: integer;
  right: string;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Setting user rights.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;

  with dmApplication.dstUser do
  begin
    ifn.User.UserId := FieldByName('id_num').AsString;
    while not Eof do
    begin
      right := FieldbyName('privilege_code').AsString;
      ifn.User.SetRight(right);
      Next;
    end;
  end;
end;

function TfrmLogin.PasswordIsValid: boolean;
var
  password: string;
begin
  with dmApplication.dstUser do
  begin
    password := FieldByName('password').AsString;

    Result := SameText(password, Trim(edPassword.Text));

    if not Result then
      lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

end.
