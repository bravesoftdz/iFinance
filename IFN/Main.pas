unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, StatusIntf, DockIntf, RzLstBox, Client, Vcl.AppEvnts,
  ClientListIntf, Generics.Collections, LoanListIntf, Loan, LoanClient, RzTabs,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Buttons;

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
  TfrmMain = class(TForm,IDock)
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
    urlActiveLoans: TRzURLLabel;
    urlDenied: TRzURLLabel;
    urlAssessedLoans: TRzURLLabel;
    lbxRecentLoans: TRzListBox;
    nppExpense: TJvNavPanelPage;
    nppInventory: TJvNavPanelPage;
    nppReports: TJvNavPanelPage;
    pnlDockMain: TRzPanel;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    alMain: TActionList;
    acSave: TAction;
    acAddClient: TAction;
    Newclient1: TMenuItem;
    acNewLoan: TAction;
    Newloan1: TMenuItem;
    acGenericNew: TAction;
    New1: TMenuItem;
    lblDate: TLabel;
    lblVersion: TLabel;
    Client1: TMenuItem;
    Loan1: TMenuItem;
    Selectclient1: TMenuItem;
    acSelectClient: TAction;
    lblLocation: TLabel;
    Newpayment1: TMenuItem;
    acNewPayment: TAction;
    Payment1: TMenuItem;
    Selectclient2: TMenuItem;
    acAddActiveLoan: TAction;
    urlPayments: TRzURLLabel;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    urlWithdrawals: TRzURLLabel;
    urlClosed: TRzURLLabel;
    imgMinimize: TImage;
    pcMenu: TRzPageControl;
    tsHome: TRzTabSheet;
    tsAdministration: TRzTabSheet;
    tsTools: TRzTabSheet;
    pnlAddClient: TRzPanel;
    imgAddClient: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    pnlNewLoan: TRzPanel;
    imgNewLoan: TImage;
    pnlPayment: TRzPanel;
    imgNewPayment: TImage;
    pnlSave: TRzPanel;
    imgSave: TImage;
    lblWelcome: TRzLabel;
    pnlBank: TRzPanel;
    imgBanks: TImage;
    pnlCompetitor: TRzPanel;
    imgCompetitor: TImage;
    pnlDesignationList: TRzPanel;
    imgDesignationList: TImage;
    pnlEmployer: TRzPanel;
    imgEmployer: TImage;
    pnlGroups: TRzPanel;
    imgGroups: TImage;
    pnlLoanCancellationReasonList: TRzPanel;
    imgLoanCancellationReasonList: TImage;
    pnlLoanClass: TRzPanel;
    imgLoanClass: TImage;
    pnlLoanType: TRzPanel;
    imgLoanType: TImage;
    pnlPurpose: TRzPanel;
    imgPurpose: TImage;
    pnlRejectionReasonList: TRzPanel;
    imgRejectionReasonList: TImage;
    pnlSettings: TRzPanel;
    imgSettings: TImage;
    pnlAcctType: TRzPanel;
    imgAcctType: TImage;
    urlChangeDate: TRzURLLabel;
    pnlChargeTypes: TRzPanel;
    imgChargeTypes: TImage;
    pnlInfoSources: TRzPanel;
    imgInfoSources: TImage;
    pnlLoanClosureReasonsList: TRzPanel;
    imgLoanClosureReasonsList: TImage;
    procedure tbAddClientClick(Sender: TObject);
    procedure lblRecentlyAddedClick(Sender: TObject);
    procedure lbxRecentDblClick(Sender: TObject);
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
    procedure urlAssessedLoansClick(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgAddClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddClientMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPurposeClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure imgSaveClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure acGenericNewExecute(Sender: TObject);
    procedure imgGroupsClick(Sender: TObject);
    procedure imgLoanTypeClick(Sender: TObject);
    procedure imgAcctTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgLoanCancellationReasonListClick(Sender: TObject);
    procedure imgRejectionReasonListClick(Sender: TObject);
    procedure acSelectClientExecute(Sender: TObject);
    procedure imgSettingsClick(Sender: TObject);
    procedure imgNewPaymentClick(Sender: TObject);
    procedure acAddActiveLoanExecute(Sender: TObject);
    procedure urlPaymentsClick(Sender: TObject);
    procedure urlWithdrawalsClick(Sender: TObject);
    procedure urlClosedClick(Sender: TObject);
    procedure urlChangeDateClick(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgChargeTypesClick(Sender: TObject);
    procedure imgInfoSourcesClick(Sender: TObject);
    procedure imgLoanClosureReasonsListClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TForms;
    RecentClients: TObjectList<TRecentClient>;
    RecentLoans: TObjectList<TRecentLoan>;
    procedure OpenClientList(const filterType: TClientFilterType = cftAll);
    procedure OpenLoanList(const filterType: TLoanFilterType = lftAll);
    procedure ShowDevParams;
    procedure SetCaptions;
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
    procedure AddRecentClient(ct: TClient);
    procedure AddRecentLoan(lln: TLoan);
  end;

var
  frmMain: TfrmMain;

const
  MAX_RECENT_ITEMS = 10;

implementation

{$R *.dfm}

uses
  ClientMain, SaveIntf, ClientList, DockedFormIntf, GroupList, EmployerList,
  BanksList, DesignationList, LoanClassificationList, ConfBox, ErrorBox, ClientIntf,
  LoanMain, LoanList, LoanIntf, CompetitorList, FormsUtil, IFinanceGlobal,
  PurposeList, IFinanceDialogs, NewIntf, LoanTypeList, AccountTypeList,
  LoanCancellationReasonList, LoanRejectionReasonList, AppSettings,
  PaymentMain, PaymentIntf, PaymentList, AccountingData, WithdrawalList, DevParams,
  LoanClassChargeTypeList, InfoSourceList, LoanClosureReasonList;

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
    lftRejected: title := 'Rejected loans';
    lftClosed: title := 'Closed loans';
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

procedure TfrmMain.urlClosedClick(Sender: TObject);
begin
  OpenLoanList(lftClosed);
end;

procedure TfrmMain.Save1Click(Sender: TObject);
begin
  imgSave.OnClick(Sender);
end;

procedure TfrmMain.ShowDevParams;
begin
  with TfrmDevParams.Create(Application) do
  begin
    ShowModal;
    Free;
    SetCaptions;
    DockForm(fmNone);
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
  index: integer;
begin
  index := lbxRecent.IndexOf(lbxRecent.SelectedItem);

  if index > -1 then
  begin
    obj := lbxRecent.Items.Objects[index];
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
          intf.SetLandLordControlsPres;
          intf.SetLandLordControlsProv;
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
end;

procedure TfrmMain.lbxRecentLoansDblClick(Sender: TObject);
var
  obj: TObject;
  intf: ILoan;
  index: integer;
begin
  index := lbxRecentLoans.ItemIndex;

  if index > -1 then
  begin
    obj := lbxRecentLoans.Items.Objects[index];
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
          intf.SetLoanHeaderCaption;
          intf.RefreshDropDownSources;
          intf.SetUnboundControls;
          intf.InitForm;
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

procedure TfrmMain.tbBanksClick(Sender: TObject);
begin
  DockForm(fmBanksList);
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

procedure TfrmMain.tbLoanClassClick(Sender: TObject);
begin
  DockForm(fmLoanClassList);
end;

procedure TfrmMain.tbNewLoanClick(Sender: TObject);
begin
  DockForm(fmLoanMain);
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

procedure TfrmMain.urlChangeDateClick(Sender: TObject);
begin
  ShowDevParams;
end;

procedure TfrmMain.urlDeniedClick(Sender: TObject);
begin
  OpenLoanList(lftRejected);
end;

procedure TfrmMain.urlPaymentsClick(Sender: TObject);
begin
  DockForm(fmPaymentList);
end;

procedure TfrmMain.urlPendingLoansClick(Sender: TObject);
begin
  OpenLoanList(lftPending);
end;

procedure TfrmMain.urlWithdrawalsClick(Sender: TObject);
begin
  DockForm(fmWithdrawalList);
end;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
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
      fmPurposeList: frm := TfrmPurposeList.Create(Application);
      fmLoanTypeList: frm := TfrmLoanTypeList.Create(Application);
      fmAcctTypeList: frm := TfrmAccountTypeList.Create(Application);
      fmLoanCancelReasonList: frm := TfrmLoanCancelReasonList.Create(Application);
      fmLoanRejectReasonList: frm := TfrmLoanRejectionReasonList.Create(Application);
      fmSettings: frm := TfrmAppSettings.Create(Application);
      fmPaymentMain: frm := TfrmPaymentMain.Create(Application);
      fmPaymentList: frm := TfrmPaymentList.Create(Application);
      fmWithdrawalList: frm := TfrmWithdrawalList.Create(Application);
      fmChargeTypeList: frm := TfrmLoanClassChargeTypeList.Create(Application);
      fmInfoSourceList: frm := TfrmInfoSourceList.Create(Application);
      fmLoanCloseReasonList: frm := TfrmLoanCloseReasonList.Create(Application);
      else
        frm := nil;
    end;

    if Assigned(frm) then
    begin
      DOCKED_FORM := fm;

      frm.ManualDock(pnlDockMain);
      frm.Show;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DOCKED_FORM := fmNone;

  Height := 700; // for some reason form keeps on resizing...

  dmAccounting := TdmAccounting.Create(Application);

  // hide menu bar
  Self.Menu := nil;

  RecentClients := TObjectList<TRecentClient>.Create;
  RecentLoans := TObjectList<TRecentLoan>.Create;

  npMain.ActivePage := nppClient;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  SetCaptions;
end;

procedure TfrmMain.imgAcctTypeClick(Sender: TObject);
begin
  DockForm(fmAcctTypeList);
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

procedure TfrmMain.imgCancelClick(Sender: TObject);
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ISave,intf) then
        intf.Cancel;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.imgChargeTypesClick(Sender: TObject);
begin
  DockForm(fmChargeTypeList);
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.imgGroupsClick(Sender: TObject);
begin
  DockForm(fmGroupList);
end;

procedure TfrmMain.imgInfoSourcesClick(Sender: TObject);
begin
  DockForm(fmInfoSourceList);
end;

procedure TfrmMain.imgLoanCancellationReasonListClick(Sender: TObject);
begin
  DockForm(fmLoanCancelReasonList);
end;

procedure TfrmMain.imgLoanClosureReasonsListClick(Sender: TObject);
begin
  DockForm(fmLoanCloseReasonList);
end;

procedure TfrmMain.imgLoanTypeClick(Sender: TObject);
begin
  DockForm(fmLoanTypeList);
end;

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmMain.imgNewPaymentClick(Sender: TObject);
begin
  DockForm(fmPaymentMain);
end;

procedure TfrmMain.imgPurposeClick(Sender: TObject);
begin
  DockForm(fmPurposeList);
end;

procedure TfrmMain.imgRejectionReasonListClick(Sender: TObject);
begin
  DockForm(fmLoanRejectReasonList);
end;

procedure TfrmMain.imgSaveClick(Sender: TObject);
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ISave,intf) then
        if intf.Save then ShowConfirmationBox;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.imgSettingsClick(Sender: TObject);
begin
  DockForm(fmSettings);
end;

procedure TfrmMain.acGenericNewExecute(Sender: TObject);
var
  intf: INew;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,INew,intf) then
        intf.New;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.acAddActiveLoanExecute(Sender: TObject);
var
  intf: IPayment;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,IPayment,intf) then
        intf.AddActiveLoan;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.acSelectClientExecute(Sender: TObject);
var
  intf: ILoan;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,ILoan,intf) then
        intf.SelectClient;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
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

    if (RecentClients.Count >= MAX_RECENT_ITEMS)
        and (lbxRecent.IndexOf(lbxRecent.SelectedItem) > 0) then
    begin
      // remove topmost item
      RecentClients.Remove(RecentClients.Items[0]);
      lbxRecent.Delete(0);
    end;

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
      begin
        ll.Status := lln.Status;
        Exit;
      end;
    end;

    ll := TRecentLoan.Create(lln.Id,lln.Status,lln.Client);

    if RecentLoans.Count >= MAX_RECENT_ITEMS then
    begin
      // remove topmost item
      RecentLoans.Remove(RecentLoans.Items[0]);
      lbxRecentLoans.Delete(0);
    end;

    RecentLoans.Add(ll);
    lbxRecentLoans.Items.AddObject(ll.Client.Name,ll);
  end;
end;

procedure TfrmMain.SetCaptions;
begin
  lblCaption.Caption := ifn.AppName + ' - ' + ifn.AppDescription;
  lblWelcome.Caption := 'Welcome back ' + ifn.User.Name + '.';
  lblDate.Caption := 'Today is ' + FormatDateTime('mmmm dd, yyyy', ifn.AppDate);
  lblLocation.Caption := 'Location: ' + ifn.GetLocationNameByCode(ifn.LocationCode);
  lblVersion.Caption := 'Version ' + ifn.Version;
end;

end.
