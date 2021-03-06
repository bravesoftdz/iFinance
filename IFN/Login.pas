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
    Label1: TLabel;
    Label2: TLabel;
    edUsername: TRzEdit;
    edPassword: TRzEdit;
    lbErrorMessage: TLabel;
    imgLogo: TImage;
    prbStatus: TRzProgressBar;
    lblStatus: TLabel;
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    pnlLogin: TRzPanel;
    btnLogin: TRzShapeButton;
    lblVersion: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure LoadModules;
    procedure LoadSettings;
    procedure SettingAccessRights;
    procedure PauseWindow(timer: integer);
    procedure GetLocations;
    function UserExists: boolean;
    function PasswordIsValid: boolean;
  public
    { Public declarations }
    class function LoggedIn: boolean;
  end;

const
  LIMITGLOBAL = 6;
  TICK = 80;
  INCREMENT = 16;

implementation

{$R *.dfm}

uses
  AppData, AppUtil, IFinanceGlobal, IFinanceDialogs, Location;

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

    if not Result then lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

procedure TfrmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then btnLogin.Click;
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

  lblVersion.Caption := 'Version ' + GetAppVersionStr(ParamStr(0));;
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

procedure TfrmLogin.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
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
        btnClose.Enabled := false;

        lblVersion.Visible := false;

        lblStatus.Visible := true;
        prbStatus.Visible := true;
        lbErrorMessage.Visible := false;

        self.Update;

        ifn := TIFinance.Create;

        LoadModules;
        SettingAccessRights;
        LoadSettings;

        {$ifdef TESTMODE}
        LoadTestInfo;
        {$endif}


        ModalResult := 1;
      except
        on e: Exception do
        begin
          ShowErrorBox('An exception has been detected and the application needs to close. ' +
            'Please contact the administrator with the message below.' + #13#10 + #13#10 +
            e.Message);
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

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
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
    if Locate('sysconfig_code','LOCATION_CODE',[]) then
      ifn.LocationCode := FieldbyName('sysconfig_value').AsString;

    // location prefix
    if Locate('sysconfig_code','LOCATION_PREFIX',[]) then
      ifn.LocationPrefix := FieldbyName('sysconfig_value').AsString;

    // backlog entry
    if Locate('sysconfig_code','BACKLOG_ENTRY_ENABLED',[]) then
      ifn.BacklogEntryEnabled := FieldByName('sysconfig_value').AsInteger = 1;

    if Locate('sysconfig_code','CUT_OFF_DATE',[]) then
      ifn.CutoffDate := FieldByName('sysconfig_value').AsDateTime;

    Close;

    // photo path
    ifn.PhotoPath := ExtractFilePath(Application.ExeName) + 'photos\';
    if not DirectoryExists(ifn.PhotoPath) then
      CreateDir(ifn.PhotoPath);

    // application images path
    ifn.AppImagesPath := ExtractFilePath(Application.ExeName) + '_images\';

    // version
    ifn.Version := GetAppVersionStr(ParamStr(0));

    // get all locations
    GetLocations;

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

  with dmApplication.dstUser, ifn.User do
  begin
    Passkey := edPassword.Text;
    UserId := FieldByName('id_num').AsString;
    FirstName := FieldByName('employee_firstname').AsString;
    LastName := FieldByName('employee_lastname').AsString;
    CreditLimit := FieldByName('credit_limit').AsCurrency;

    while not Eof do
    begin
      right := FieldbyName('privilege_code').AsString;
      SetRight(right);
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

procedure TfrmLogin.GetLocations;
var
  loc: TLocation;
begin
  with dmApplication.dstLocation do
  begin
    DisableControls;
    Open;

    while not Eof do
    begin
      loc := TLocation.Create;

      loc.LocationCode := FieldByName('location_code').AsString;
      loc.LocationName := FieldByName('location_name').AsString;
      loc.LocationType := FieldByName('locationtype_code').AsString;

      ifn.AddLocation(loc);

      Next;
    end;

    Close;
  end;
end;

end.
