unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus;

type
  TfrmMain = class(TForm)
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
    RzURLLabel1: TRzURLLabel;
    RzURLLabel2: TRzURLLabel;
    imlToolbar: TJvImageList;
    spMain: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    nppInventory: TJvNavPanelPage;
    nppReports: TJvNavPanelPage;
    procedure tbAddClientClick(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockForm(const fm: TForms);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  ClientMain, Client, SaveIntf;

procedure TfrmMain.tbAddClientClick(Sender: TObject);
begin
  DockForm(fmClientMain);
  cln := TClient.Create;
  cln.Add;
end;

procedure TfrmMain.tbSaveClick(Sender: TObject);
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ISave,intf) then
      begin
        intf.Save;
        spMain.Font.Color := clGreen;
        spMain.Caption := 'Record saved successfully.'
      end;
  except
    on e:Exception do
    begin
      spMain.Font.Color := clRed;
      spMain.Caption := e.Message;
    end;

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
end;

end.
