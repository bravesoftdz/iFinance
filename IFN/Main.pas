unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, StatusIntf, DockIntf, RzLstBox, Client, Vcl.AppEvnts,
  ClientListIntf, Generics.Collections, LoanListIntf, Loan, LoanClient, RzTabs,
  Vcl.Imaging.pngimage;

type
  TRecentClient = class
  strict private
    FId: string;
    FDisplayId: string;
    FName: string;
  public
    property Id: string read FId write FId;
    property DisplayId: string read FDisplayId write FDisplayId;
    property Name: string read FName write FName;

    constructor Create(const id, displayId, name: string);
  end;

type
  TRecentLoan = class
  strict private
    FId: string;
    FClient: TLoanClient;
    FStatus: string;
  public
    property Id: string read FId write FId;
    property Client: TLoanClient read FClient write FClient;
    property Status: string read FStatus write FStatus;

    constructor Create(const id, status: string; cl: TLoanClient);
  end;

type
  TfrmMain = class(TForm,IStatus,IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlNavBar: TRzPanel;
    npMain: TJvNavigationPane;
    nppClient: TJvNavPanelPage;
    lblRecentlyAdded: TRzURLLabel;
    lblActiveClients: TRzURLLabel;
    lblAllClients: TRzURLLabel;
    RzLabel1: TRzLabel;
    lbxRecent: TRzListBox;
    nppLoans: TJvNavPanelPage;
    urlCancelled: TRzURLLabel;
    urlPendingLoans: TRzURLLabel;
    urlApprovedLoans: TRzURLLabel;
    RzLabel2: TRzLabel;
    urlActiveLoans: TRzURLLabel;
    urlDenied: TRzURLLabel;
    urlAssessedLoans: TRzURLLabel;
    lbxRecentLoans: TRzListBox;
    nppExpense: TJvNavPanelPage;
    nppInventory: TJvNavPanelPage;
    nppReports: TJvNavPanelPage;
    pnlDockMain: TRzPanel;
    pnlAddClient: TRzPanel;
    imgAddClient: TImage;
    lblWelcome: TRzLabel;
    pnlSave: TRzPanel;
    imgSave: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    pnlNewLoan: TRzPanel;
    imgNewLoan: TImage;
    pnlGroups: TRzPanel;
    imgGroups: TImage;
    pnlEmployer: TRzPanel;
    imgEmployer: TImage;
    pnlBank: TRzPanel;
    imgBanks: TImage;
    pnlDesignationList: TRzPanel;
    imgDesignationList: TImage;
    pnlCompetitor: TRzPanel;
    imgCompetitor: TImage;
    RzPanel12: TRzPanel;
    imgLoanClass: TImage;
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
    procedure tbLoanClassClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNewLoanClick(Sender: TObject);
    procedure urlCancelledClick(Sender: TObject);
    procedure urlPendingLoansClick(Sender: TObject);
    procedure urlActiveLoansClick(Sender: TObject);
    procedure urlApprovedLoansClick(Sender: TObject);
    procedure lbxRecentLoansDblClick(Sender: TObject);
    procedure urlDeniedClick(Sender: TObject);
    procedure npMainChange(Sender: TObject);
    procedure tbCompetitorClick(Sender: TObject);
    procedure tbApproveLoanClick(Sender: TObject);
    procedure tbAssessLoanClick(Sender: TObject);
    procedure tbCancelLoanClick(Sender: TObject);
    procedure tbRejectLoanClick(Sender: TObject);
    procedure urlAssessedLoansClick(Sender: TObject);
    procedure tbReleaseLoanClick(Sender: TObject);
    procedure tbAlertsClick(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgAddClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddClientMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    RecentClients: TObjectList<TRecentClient>;
    RecentLoans: TObjectList<TRecentLoan>;
    procedure OpenClientList(const filterType: TClientFilterType = cftAll);
    procedure OpenLoanList(const filterType: TLoanFilterType = lftAll);
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
    procedure AddRecentClient(ct: TClient);
    procedure AddRecentLoan(lln: TLoan);
    procedure ShowError(const error: string);
    procedure ShowConfirmation(const conf: string = 'Record saved successfully.');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  ClientMain, SaveIntf, ClientList, DockedFormIntf, GroupList, EmployerList,
  BanksList, DesignationList, LoanClassificationList, ConfBox, ErrorBox, ClientIntf,
  LoanMain, LoanList, LoanIntf, CompetitorList, AlertIntf, FormsUtil, IFinanceGlobal;

constructor TRecentClient.Create(const id, displayId, name: string);
begin
  FId := id;
  FDisplayId := displayId;
  FName := name;
end;

constructor TRecentLoan.Create(const id, status: string; cl: TLoanClient);
begin
  FId := id;
  FStatus := status;
  FClient := cl;
end;

procedure TfrmMain.OpenClientList(const filterType: TClientFilterType = cftAll);
var
  title: string;
  intf: IClientFilter;
  intd: IDockedForm;
begin
  case filterType of
    cftAll: title := 'All clients';
    cftActive: title := 'Active clients';
    cftRecent: title := 'Newly-added clients';
  end;

  if (pnlDockMain.ControlCount = 0)
    or (not Supports(pnlDockMain.Controls[0] as TForm,IClientFilter,intf)) then
    DockForm(fmClientList,title);

  if Supports(pnlDockMain.Controls[0] as TForm,IDockedForm,intd) then
    intd.SetTitle(title);

  if Supports(pnlDockMain.Controls[0] as TForm,IClientFilter,intf) then
    intf.FilterList(filterType);
end;

procedure TfrmMain.OpenLoanList(const filterType: TLoanFilterType = lftAll);
var
  title: string;
  intf: ILoanListFilter;
  intd: IDockedForm;
begin
  case filterType of
    lftAll: title := 'All loans';
    lftPending: title := 'Pending loans';
    lftAssessed: title := 'Assessed loans';
    lftApproved: title := 'Approved loans';
    lftActive: title := 'Active loans';
    lftCancelled: title := 'Cancelled loans';
    lftDenied: title := 'Denied loans';
  end;

  if (pnlDockMain.ControlCount = 0)
    or (not Supports(pnlDockMain.Controls[0] as TForm,ILoanListFilter,intf)) then
    DockForm(fmLoanList,title);

  if Supports(pnlDockMain.Controls[0] as TForm,IDockedForm,intd) then
    intd.SetTitle(title);

  if Supports(pnlDockMain.Controls[0] as TForm,ILoanListFilter,intf) then
    intf.FilterList(filterType);
end;

procedure TfrmMain.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
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
var
  obj: TObject;
  intf: IClient;
begin
  obj := lbxRecent.Items.Objects[lbxRecent.IndexOf(lbxRecent.SelectedItem)];

  if obj is TRecentClient then
  begin
    if Assigned(cln) then
    begin
      AddRecentClient(cln);

      cln.Destroy;

      cln := TClient.Create;

      cln.Id := TRecentClient(obj).Id;
      cln.DisplayId := TRecentClient(obj).DisplayId;
      cln.Name := TRecentClient(obj).Name;
      cln.Retrieve(true);

      if Supports(pnlDockMain.Controls[0] as TForm,IClient,intf) then
      begin
        intf.SetClientName;
        intf.SetUnboundControls;
        intf.LoadPhoto;
      end;
    end
    else
    begin
      cln := TClient.Create;
      cln.Id := TRecentClient(obj).Id;
      cln.DisplayId := TRecentClient(obj).DisplayId;
      DockForm(fmClientMain);
    end;
  end;
end;

procedure TfrmMain.lbxRecentLoansDblClick(Sender: TObject);
var
  obj: TObject;
  intf: ILoan;
begin
  obj := lbxRecentLoans.Items.Objects[lbxRecentLoans.IndexOf(lbxRecentLoans.SelectedItem)];

  if obj is TRecentLoan then
  begin
    if Assigned(ln) then
    begin
      AddRecentLoan(ln);

      ln.Destroy;

      ln := TLoan.Create;

      ln.Id := TRecentLoan(obj).Id;
      ln.Client := TRecentLoan(obj).Client;
      ln.Status := TRecentLoan(obj).Status;
      ln.Action := laNone;
      ln.Retrieve(true);

      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.SetLoanId;
        intf.RefreshDropDownSources;
        intf.SetUnboundControls;
        intf.DisplayLoanStateDetails;
      end;
    end
    else
    begin
      ln := TLoan.Create;
      ln.Id := TRecentLoan(obj).Id;
      ln.Client := TRecentLoan(obj).Client;
      ln.Status := TRecentLoan(obj).Status;
      ln.Action := laNone;
      DockForm(fmLoanMain);
    end;
  end;
end;

procedure TfrmMain.npMainChange(Sender: TObject);
const
  CLIENTS = 0;
  LOANS   = 1;
  EXPENSE = 2;
  INVENTORY = 3;
  REPORTS = 4;
begin
  case npMain.ActivePageIndex of
    CLIENTS: OpenClientList(cftRecent);
    LOANS: OpenLoanList(lftPending);
  end;
end;

procedure TfrmMain.tbAddClientClick(Sender: TObject);
begin
  DockForm(fmClientMain);
end;

procedure TfrmMain.tbApproveLoanClick(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.ApproveLoan;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.tbAssessLoanClick(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.AssessLoan;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
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
        // ShowConfirmation('Changes have been cancelled.');
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.tbCancelLoanClick(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.CancelLoan;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.tbCompetitorClick(Sender: TObject);
begin
  DockForm(fmCompetitorList);
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

procedure TfrmMain.tbLoanClassClick(Sender: TObject);
begin
  DockForm(fmLoanClassList);
end;

procedure TfrmMain.tbNewLoanClick(Sender: TObject);
begin
  DockForm(fmLoanMain);
end;

procedure TfrmMain.tbRejectLoanClick(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.RejectLoan;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

procedure TfrmMain.tbReleaseLoanClick(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
      begin
        intf.ReleaseLoan;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
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

procedure TfrmMain.urlActiveLoansClick(Sender: TObject);
begin
  OpenLoanList(lftActive);
end;

procedure TfrmMain.urlApprovedLoansClick(Sender: TObject);
begin
  OpenLoanList(lftApproved);
end;

procedure TfrmMain.urlAssessedLoansClick(Sender: TObject);
begin
  OpenLoanList(lftAssessed);
end;

procedure TfrmMain.urlCancelledClick(Sender: TObject);
begin
  OpenLoanList(lftCancelled);
end;

procedure TfrmMain.urlDeniedClick(Sender: TObject);
begin
  OpenLoanList(lftDenied);
end;

procedure TfrmMain.urlPendingLoansClick(Sender: TObject);
begin
  OpenLoanList(lftPending);
end;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
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
      fmLoanClassList: frm := TfrmLoanClassificationList.Create(Application);
      fmLoanMain: frm := TfrmLoanMain.Create(Application);
      fmLoanList: frm := TfrmLoanList.Create(Application);
      fmCompetitorList: frm := TfrmCompetitorList.Create(Application);
      else
        frm := TForm.Create(Application);
    end;

    frm.ManualDock(pnlDockMain);
    frm.Show;
  end;

  // clear the status bar message
  // spMain.Caption := '';
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  RecentClients := TObjectList<TRecentClient>.Create;
  RecentLoans := TObjectList<TRecentLoan>.Create;

  npMain.ActivePage := nppClient;

  lblWelcome.Caption := 'Welcome back ' + ifn.User.Name + '.';
end;

procedure TfrmMain.imgAddClientMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonDown(Sender);
end;

procedure TfrmMain.imgAddClientMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonUp(Sender);
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.ShowError(const error: string);
begin
  // spMain.Font.Color := clRed;
  // spMain.Caption := error;
  with TfrmErrorBox.Create(self,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmMain.ShowConfirmation(const conf: string);
begin
  // spMain.Font.Color := clGreen;
  // spMain.Caption := conf;
  with TfrmConfBox.Create(self,conf) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmMain.AddRecentClient(ct: TClient);
var
  rc: TRecentClient;
begin
  if ct.HasId then
  begin
    for rc in RecentClients do
    begin
      if rc.Id = ct.Id then
        Exit;
    end;

    rc := TRecentClient.Create(ct.Id, ct.DisplayId, ct.Name);

    RecentClients.Add(rc);
    lbxRecent.Items.AddObject(rc.Name,rc);
  end;
end;

procedure TfrmMain.AddRecentLoan(lln: TLoan);
var
  ll: TRecentLoan;
begin
  if lln.Action <> laCreating then
  begin
    for ll in RecentLoans do
    begin
      if ll.Id = lln.Id then // update when found
        Exit;
    end;

    ll := TRecentLoan.Create(lln.Id,lln.Status,lln.Client);

    RecentLoans.Add(ll);
    lbxRecentLoans.Items.AddObject(ll.Id,ll);
  end;
end;

procedure TfrmMain.tbAlertsClick(Sender: TObject);
var
  intf: IAlert;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,IAlert,intf) then
      begin
        intf.ShowAlerts;
      end;
  except
    on e:Exception do
      ShowError(e.Message);
  end;
end;

end.
