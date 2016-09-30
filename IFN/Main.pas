unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, StatusIntf, DockIntf, RzLstBox, Client, Vcl.AppEvnts,
  ClientFilterIntf;

type
  TfrmMain = class(TForm,IStatus,IDock)
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
    lblActiveClients: TRzURLLabel;
    imlToolbar: TJvImageList;
    spMain: TRzStatusPane;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    nppInventory: TJvNavPanelPage;
    nppReports: TJvNavPanelPage;
    lblAllClients: TRzURLLabel;
    RzLabel1: TRzLabel;
    lbxRecent: TRzListBox;
    ToolButton1: TToolButton;
    tbGroups: TToolButton;
    tbEmployer: TToolButton;
    tbCancel: TToolButton;
    tbBanks: TToolButton;
    tbDesignationList: TToolButton;
    ToolButton4: TToolButton;
    ools1: TMenuItem;
    Settings1: TMenuItem;
    procedure tbAddClientClick(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure lblRecentlyAddedClick(Sender: TObject);
    procedure lbxRecentDblClick(Sender: TObject);
    procedure tbGroupsClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbEmployerClick(Sender: TObject);
    procedure tbBanksClick(Sender: TObject);
    procedure tbDesignationListClick(Sender: TObject);
    procedure lblActiveClientsClick(Sender: TObject);
    procedure lblAllClientsClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenClientList(const filterType: TClientFilterType = cftAll);
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
    procedure AddRecentClient(ct: TClient);
    procedure ShowError(const error: string);
    procedure ShowConfirmation(const conf: string = 'Record saved successfully.');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  ClientMain, SaveIntf, ClientList, DockedFormIntf, GroupList, EmployerList,
  BanksList, DesignationList;

procedure TfrmMain.OpenClientList(const filterType: TClientFilterType = cftAll);
var
  title: string;
  intf: IClientFilter;
begin
  case filterType of
    cftAll: title := 'All clients';
    cftActive: title := 'Active clients';
    cftRecent: title := 'Recently added clients';
  end;

  DockForm(fmClientList,title);

  if Supports(pnlDockMain.Controls[0] as TForm,IClientFilter,intf) then
    intf.FilterList(filterType);
end;

procedure TfrmMain.lblActiveClientsClick(Sender: TObject);
begin
  OpenClientList(cftActive);
end;

procedure TfrmMain.lblAllClientsClick(Sender: TObject);
begin
  OpenClientList;
end;

procedure TfrmMain.lblRecentlyAddedClick(Sender: TObject);
begin
  OpenClientList(cftRecent);
end;

procedure TfrmMain.lbxRecentDblClick(Sender: TObject);
begin
  cln := lbxRecent.Items.Objects[lbxRecent.IndexOf(lbxRecent.SelectedItem)] as TClient;

  DockForm(fmClientMain);
end;

procedure TfrmMain.tbAddClientClick(Sender: TObject);
begin
  DockForm(fmClientMain);
end;

procedure TfrmMain.tbBanksClick(Sender: TObject);
begin
  DockForm(fmBanksList);
end;

procedure TfrmMain.tbCancelClick(Sender: TObject);
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ISave,intf) then
      begin
        intf.Cancel;
        ShowConfirmation('Changes have been cancelled.');
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.tbDesignationListClick(Sender: TObject);
begin
  DockForm(fmDesignationList);
end;

procedure TfrmMain.tbEmployerClick(Sender: TObject);
begin
  DockForm(fmEmployerList);
end;

procedure TfrmMain.tbGroupsClick(Sender: TObject);
begin
  DockForm(fmGroupList);
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

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
  intf: IDockedForm;
begin


  // if (pnlDockMain.ControlCount = 0) or ((pnlDockMain.ControlCount > 0) and
  //  ((pnlDockMain.Controls[0].ClassType <> frm.ClassType))) then
  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
      begin
        (pnlDockMain.Controls[control] as TForm).Close;
        (pnlDockMain.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case fm of
      fmClientMain: frm := TfrmClientMain.Create(Application);
      fmClientList: frm := TfrmClientList.Create(Application);
      fmGroupList : frm := TfrmGroupList.Create(Application);
      fmEmployerList: frm := TfrmEmployerList.Create(Application);
      fmBanksList: frm := TfrmBanksList.Create(Application);
      fmDesignationList: frm := TfrmDesignationList.Create(Application);
      else
        frm := TForm.Create(Application);
    end;

    frm.ManualDock(pnlDockMain);
    frm.Show;

    if Supports(frm,IDockedForm,intf) then
      intf.SetTitle(title);
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

procedure TfrmMain.AddRecentClient(ct: TClient);
begin
  if not lbxRecent.FindItem(ct.Name) then
    lbxRecent.Items.AddObject(ct.Name,ct);
end;

end.
