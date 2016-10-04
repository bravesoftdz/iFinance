program iFinance;

uses
  Vcl.Forms,
  AppUtil,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas' {frmLogin},
  ConfBox in 'ConfBox.pas' {frmConfBox},
  ErrorBox in 'ErrorBox.pas' {frmErrorBox},
  BasePopup in '..\Base\BasePopup.pas' {frmBasePopup};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfrmLogin.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfBox, frmConfBox);
  Application.CreateForm(TfrmErrorBox, frmErrorBox);
  Application.Run;
    end;
  end;
end.
