unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, StatusIntf;

type
  TfrmMain = class(TForm,IStatus)
    mmMain: TMainMenu;
    pnlNavbar: TPanel;
    File1: TMenuItem;
    About1: TMenuItem;
    pnlDockMain: TPanel;
    npMain: TJvNavigationPane;
    nppClient: TJvNavPanelPage;
    nppLoans: TJvNavPanelPage;
    nppExpense: TJvNavPanelPage;
    sbMain: TRzStatusBar;
    ToolBar1: TToolBar;
    tbAddClient: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    tbSave: TToolButton;
    lblRecentlyAdded: TRzURLLabel;
    RzURLLabel2: TRzURLLabel;
    imlToolbar: TJvImageList;
    spMain: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    nppInventory: TJvNavPanelPage;
    nppReports: TJvNavPanelPage;
    procedure tbAddClientClick(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure lblRecentlyAddedClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockForm(const fm: TForms);
  public
    { Public declarations }
    procedure ShowError(const error: string);
    procedure ShowConfirmation(const conf: string = 'Record saved successfully.');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  ClientMain, SaveIntf, ClientList;

procedure TfrmMain.lblRecentlyAddedClick(Sender: TObject);
begin
  DockForm(fmClientList);
end;

procedure TfrmMain.tbAddClientClick(Sender: TObject);
begin
  DockForm(fmClientMain);
end;

procedure TfrmMain.tbSaveClick(Sender: TObject);
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ISave,intf) then
      begin
        if intf.Save then
          ShowConfirmation;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.DockForm(const fm: TForms);
var
  frm: TForm;
  control: integer;
begin
  // instantiate form
  case fm of
    fmClientMain: frm := TfrmClientMain.Create(Application);
    fmClientList: frm := TfrmClientList.Create(Application);
    else
      frm := TForm.Create(Application);
  end;

  if (pnlDockMain.ControlCount = 0) or ((pnlDockMain.ControlCount > 0) and
    ((pnlDockMain.Controls[0].ClassType <> frm.ClassType))) then
  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
        (pnlDockMain.Controls[control] as TForm).Close;

      Inc(control);
    end;

    frm.ManualDock(pnlDockMain);
    frm.Show;
  end;

  // clear the status bar message
  spMain.Caption := '';
end;

procedure TfrmMain.ShowError(const error: string);
begin
  spMain.Font.Color := clRed;
  spMain.Caption := error;
end;

procedure TfrmMain.ShowConfirmation(const conf: string);
begin
  spMain.Font.Color := clGreen;
  spMain.Caption := conf;
end;

end.
