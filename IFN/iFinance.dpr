program iFinance;

uses
  Vcl.Forms,
  SysUtils,
  AppUtil,
  IFinanceDialogs,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas' {frmLogin};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if FileExists('ifn.ini') then
    begin
      if TfrmLogin.LoggedIn then
      begin
        Application.Initialize;
        Application.MainFormOnTaskbar := True;
        Application.CreateForm(TfrmMain, frmMain);
        Application.Run;
      end;
    end
    else ShowErrorBox('Configuration file not found.');
  end;
end.
