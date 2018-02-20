unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls,
  Vcl.ExtCtrls, SaveIntf, RzLabel, RzPanel, RzTabs, Vcl.Mask, StatusIntf,
  RzEdit, RzDBEdit, JvLabel, JvExControls, Vcl.DBCtrls, RzDBCmbo,
  Vcl.ComCtrls, RzDTP, RzDBDTP, RzButton, RzRadChk, RzDBChk, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzBtnEdt, RzLaunch, ClientIntf, Vcl.Imaging.pngimage,
  RzCmboBx, RzLstBox, RzDBList, NewIntf, RzGrids, RzChkLst;

type
  TfrmClientMain = class(TfrmBaseDocked, ISave, IClient, INew)
    lblClientName: TRzLabel;
    pcClient: TRzPageControl;
    tsClientInfo: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel35: TJvLabel;
    edLastname: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edMiddlename: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    tsReferences: TRzTabSheet;
    edAge: TRzEdit;
    bteReferee: TRzButtonEdit;
    JvLabel4: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    JvLabel5: TJvLabel;
    RzDBEdit5: TRzDBEdit;
    JvLabel6: TJvLabel;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    urlCopyAddress: TRzURLLabel;
    JvLabel14: TJvLabel;
    dbluResStatusPres: TRzDBLookupComboBox;
    JvLabel15: TJvLabel;
    bteLandlord: TRzButtonEdit;
    edLandlordContact: TRzEdit;
    JvLabel16: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    edStreeProv: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    JvLabel11: TJvLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    JvLabel17: TJvLabel;
    dbluResStatusProv: TRzDBLookupComboBox;
    JvLabel18: TJvLabel;
    bteLandlord2: TRzButtonEdit;
    JvLabel19: TJvLabel;
    edLandlordContact2: TRzEdit;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    JvLabel22: TJvLabel;
    edMobile: TRzDBEdit;
    edTelephone: TRzDBEdit;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    bteEmployer: TRzButtonEdit;
    JvLabel25: TJvLabel;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    mmEmployerAddress: TRzMemo;
    JvLabel26: TJvLabel;
    JvLabel27: TJvLabel;
    bteImmHead: TRzButtonEdit;
    JvLabel28: TJvLabel;
    RzDBEdit12: TRzDBEdit;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    tsIdentityInfo: TRzTabSheet;
    pnlFamRef: TRzPanel;
    grRefList: TRzDBGrid;
    tsLoansHistory: TRzTabSheet;
    pnlIdentity: TRzPanel;
    grIdentityList: TRzDBGrid;
    pnlLoans: TRzPanel;
    grLoans: TRzDBGrid;
    PhotoLauncher: TRzLauncher;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    urlRefreshRefList: TRzURLLabel;
    dteBirthdate: TRzDBDateTimeEdit;
    RzDBMemo1: TRzDBMemo;
    tsGroups: TRzTabSheet;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzGroupBox5: TRzGroupBox;
    pnlToolbar: TRzPanel;
    pnlClientMainBtn: TRzPanel;
    imgClientMain: TImage;
    pnlFamRefBtn: TRzPanel;
    imgFamRef: TImage;
    pnlIdentInfoBtn: TRzPanel;
    imgIdentInfo: TImage;
    pnlLoanHistoryBtn: TRzPanel;
    imgLoanHistory: TImage;
    pnlGroups: TRzPanel;
    imgGroups: TImage;
    RzGroupBox6: TRzGroupBox;
    RzGroupBox7: TRzGroupBox;
    pnlTakePhoto: TRzPanel;
    imgTakePhoto: TImage;
    pnlPhoto: TRzPanel;
    imgClient: TImage;
    pnlFamRefDetail: TRzPanel;
    pnlAddFamRef: TRzPanel;
    sbtnNewFamRef: TRzShapeButton;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    JvLabel40: TJvLabel;
    RzDBEdit3: TRzDBEdit;
    JvLabel41: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    JvLabel42: TJvLabel;
    JvLabel39: TJvLabel;
    RzDBLookupComboBox9: TRzDBLookupComboBox;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    urlCopyClientAddress: TRzURLLabel;
    RzDBLookupComboBox10: TRzDBLookupComboBox;
    JvLabel45: TJvLabel;
    RzDBEdit13: TRzDBEdit;
    JvLabel44: TJvLabel;
    JvLabel43: TJvLabel;
    RzDBEdit14: TRzDBEdit;
    JvLabel47: TJvLabel;
    RzDBEdit20: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    JvLabel46: TJvLabel;
    pnlRemoveFamRef: TRzPanel;
    sbtnRemoveFamRef: TRzShapeButton;
    RzGroupBox1: TRzGroupBox;
    pnlIdentDocDetail: TRzPanel;
    JvLabel49: TJvLabel;
    JvLabel50: TJvLabel;
    JvLabel51: TJvLabel;
    JvLabel52: TJvLabel;
    pnlIdentDoc: TRzPanel;
    sbtnNewIdentDoc: TRzShapeButton;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    pnlRemIdentDoc: TRzPanel;
    sbtnRemIdentDoc: TRzShapeButton;
    cmbIdType: TRzDBLookupComboBox;
    edIdNo: TRzDBEdit;
    dteExpiry: TRzDBDateTimeEdit;
    tsBankAcctInfo: TRzTabSheet;
    pnlAccounts: TRzPanel;
    pnlAcctDetails: TRzPanel;
    JvLabel37: TJvLabel;
    JvLabel48: TJvLabel;
    RzPanel5: TRzPanel;
    sbtnNewBankAccount: TRzShapeButton;
    RzPanel6: TRzPanel;
    RzLabel2: TRzLabel;
    RzPanel7: TRzPanel;
    sbtnRemoveBankAccount: TRzShapeButton;
    RzPanel8: TRzPanel;
    imgBankAccount: TImage;
    JvLabel34: TJvLabel;
    JvLabel33: TJvLabel;
    edCardNo: TRzDBEdit;
    edAccount: TRzDBEdit;
    JvLabel31: TJvLabel;
    dteCardExpiry: TRzDBDateTimeEdit;
    mmBank: TRzDBMemo;
    grAccounts: TRzDBGrid;
    dbluBank: TRzDBLookupComboBox;
    lbGroups: TRzListBox;
    pnlAddGroup: TRzPanel;
    sbtnAddGroup: TRzShapeButton;
    pnlRemoveGroup: TRzPanel;
    sbtnRemoveGroup: TRzShapeButton;
    RzGroupBox8: TRzGroupBox;
    JvLabel32: TJvLabel;
    dbluInformationSource: TRzDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bteLandlordButtonClick(Sender: TObject);
    procedure bteLandlord2ButtonClick(Sender: TObject);
    procedure bteRefereeAltBtnClick(Sender: TObject);
    procedure bteRefereeButtonClick(Sender: TObject);
    procedure urlCopyAddressClick(Sender: TObject);
    procedure bteLandlordAltBtnClick(Sender: TObject);
    procedure bteLandlord2AltBtnClick(Sender: TObject);
    procedure bteEmployerButtonClick(Sender: TObject);
    procedure bteEmployerAltBtnClick(Sender: TObject);
    procedure PhotoLauncherFinished(Sender: TObject);
    procedure bteImmHeadButtonClick(Sender: TObject);
    procedure bteImmHeadAltBtnClick(Sender: TObject);
    procedure urlRefreshRefListClick(Sender: TObject);
    procedure dteBirthdateChange(Sender: TObject);
    procedure cmbIdTypeClick(Sender: TObject);
    procedure urlCopyClientAddressClick(Sender: TObject);
    procedure imgClientMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgClientMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgClientMainClick(Sender: TObject);
    procedure imgFamRefClick(Sender: TObject);
    procedure imgIdentInfoClick(Sender: TObject);
    procedure imgGroupsClick(Sender: TObject);
    procedure imgLoanHistoryClick(Sender: TObject);
    procedure imgTakePhotoClick(Sender: TObject);
    procedure sbtnNewFamRefClick(Sender: TObject);
    procedure sbtnRemoveFamRefClick(Sender: TObject);
    procedure sbtnRemIdentDocClick(Sender: TObject);
    procedure sbtnNewIdentDocClick(Sender: TObject);
    procedure dbluResStatusPresClick(Sender: TObject);
    procedure dbluResStatusProvClick(Sender: TObject);
    procedure imgBankAccountClick(Sender: TObject);
    procedure sbtnNewBankAccountClick(Sender: TObject);
    procedure sbtnRemoveBankAccountClick(Sender: TObject);
    procedure sbtnAddGroupClick(Sender: TObject);
    procedure sbtnRemoveGroupClick(Sender: TObject);
  private
    { Private declarations }
    procedure CopyAddress;
    procedure GetAge;
    procedure ChangeControlState;
    procedure ChangeIdentControlState;
    procedure ChangeFamRefControlState;
    procedure ChangeAccntInfoControlState;
    procedure HideTabs;
    procedure SetActiveTab(const tabIndex: integer);
    procedure NewFamRef;
    procedure NewIdentity;
    procedure NewAccount;
    procedure PopulateGroups;
    procedure ShowAlerts;

    function CheckClientInfo: string;
    function CheckIdentInfo: string;
    function CheckAcctInfo: string;
  public
    { Public declarations }
    procedure Cancel;

    procedure SetClientName;
    procedure SetUnboundControls(const changeTab: boolean = true);
    procedure LoadPhoto;
    procedure SetLandLordControlsPres;
    procedure SetLandLordControlsProv;

    function Save: boolean;
    procedure New;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead, RefereeSearch, Referee, AuxData, DockIntf, RefData,
  EmployerSearch, Employer, IdentityDoc, IFinanceGlobal,
  ReferenceSearch, Reference, LoansAuxData, LoanClassification,
  DBUtil, IFinanceDialogs, EntityUtils, Alert, Alerts, EntitiesData, GroupSearch,
  Group;

{$R *.dfm}

{ TfrmClientMain }

const
  CLIENT = 0;
  FAMREF = 1;
  IDENT  = 2;
  LOANS  = 3;
  GROUPS = 4;
  BANKACCOUNTS = 5;

function TfrmClientMain.CheckClientInfo: string;
var
  error: string;
  duplicates: integer;
begin
  if Trim(edLastname.Text) = '' then
    error := 'Please enter client''s lastname.'
  else if Trim(edFirstname.Text) = '' then
    error := 'Please enter client''s firstname.'
  else if Trim(edMiddlename.Text) = '' then
    error := 'Please enter client''s middlename.'
  else if cln.Adding then
  begin
    duplicates := CheckDuplicate(edLastname.Text,edFirstname.Text, edMiddlename.Text);
    if duplicates > 0 then  error := 'Duplicates found.'
    else if duplicates = -1 then // -1 means to abort the adding of the new record
    begin
      Result := 'Abort';  // assign any value to the Result it's not going to displayed anyway
      Exit;
    end;
  end;

  Result := error;

  if Result <> '' then ShowErrorBox(error);
end;

function TfrmClientMain.CheckIdentInfo: string;
var
  error: string;
  inserting: boolean;
begin
  inserting := grIdentityList.DataSource.DataSet.State = dsInsert;

  if cmbIdType.Text = '' then
    error := 'Please select ID type.'
  else if Trim(edIdNo.Text) = '' then
    error := 'Please enter ID number.'
  else if inserting then
    if cln.IdentityDocExists(cmbIdType.GetKeyValue) then
      error := 'Identity type already exists.';

  Result := error;

  if Result <> '' then ShowErrorBox(error);
end;

function TfrmClientMain.CheckAcctInfo;
var
  error: string;
begin
  if dbluBank.Text = '' then
    error := 'Please select a bank.'
  else if Trim(edAccount.Text) = '' then
    error := 'Please enter account number.'
  else if Trim(edCardNo.Text) = '' then
    error := 'Please enter card number.'
  else if cln.AccountNoExists(Trim(edAccount.Text)) then
    error := 'Account number already exists.'
  else if cln.CardNoExists(Trim(edCardNo.Text)) then
    error := 'Card number already exists.';

  Result := error;

  if Result <> '' then ShowErrorBox(error);
end;

procedure TfrmClientMain.SetLandLordControlsPres;
var
  rentingPres: boolean;
begin
  // present adddress
  rentingPres := dbluResStatusPres.GetKeyValue = 'R';
  bteLandlord.Enabled := rentingPres;
  edLandlordContact.Enabled := rentingPres;

  if not rentingPres then
  begin
    bteLandlord.Clear;
    edLandlordContact.Clear;
    cln.LandlordPres := nil;
  end;
end;

procedure TfrmClientMain.SetLandLordControlsProv;
var
  rentingProv: boolean;
begin
  // provincial adddress
  rentingProv := dbluResStatusProv.GetKeyValue = 'R';
  bteLandlord2.Enabled := rentingProv;
  edLandlordContact2.Enabled := rentingProv;

  if not rentingProv then
  begin
    bteLandlord2.Clear;
    edLandlordContact2.Clear;
    cln.LandlordProv := nil;
  end;
end;

procedure TfrmClientMain.New;
begin
  case pcClient.ActivePageIndex of
    FAMREF: NewFamRef;
    IDENT: NewIdentity;
    BANKACCOUNTS: NewAccount;
  end;
end;

procedure TfrmClientMain.cmbIdTypeClick(Sender: TObject);
var
  hasExpiry, inserting: boolean;
begin
  hasExpiry := cmbIdType.ListSource.DataSet.FieldByName('has_expiry').AsInteger = 1;
  inserting := grIdentityList.DataSource.DataSet.State = dsInsert;

  if inserting then
  begin
    if hasExpiry then
      dteExpiry.Date := ifn.AppDate
    else
      dteExpiry.Clear
  end;

  dteExpiry.Enabled := hasExpiry;
end;

procedure TfrmClientMain.bteEmployerAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.Employer := nil;
  bteEmployer.Clear;
  mmEmployerAddress.Clear;
end;

procedure TfrmClientMain.bteEmployerButtonClick(Sender: TObject);
begin
  with TfrmEmployerSearch.Create(nil) do
  begin
    try
      emp := TEmployer.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        bteEmployer.Text := emp.Name;
        mmEmployerAddress.Text := emp.Address;
        cln.Employer := emp;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteImmHeadAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.ImmediateHead := nil;
  bteImmHead.Clear;
end;

procedure TfrmClientMain.bteImmHeadButtonClick(Sender: TObject);
begin
  with TfrmImmHeadSearch.Create(nil) do
  begin
    try
      immHead := TImmediateHead.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        if Trim(immHead.Id) = Trim(cln.Id)  then
          ShowErrorBox('Immediate head cannot be the same as client.')
        else
        begin
          bteImmHead.Text := immHead.Name;
          cln.ImmediateHead := immHead;
        end;
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteLandlord2AltBtnClick(Sender: TObject);
begin
  inherited;
  cln.LandlordProv := nil;
  bteLandlord2.Clear;
  edLandlordContact2.Clear;
end;

procedure TfrmClientMain.bteLandlord2ButtonClick(Sender: TObject);
begin
  with TfrmLandlordSearch.Create(nil) do
  begin
    try
      llord := TLandLord.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        if Trim(llord.Id) <> Trim(cln.Id) then
        begin
          bteLandlord2.Text := llord.Name;
          edLandLordContact2.Text := llord.Contact;
          cln.LandlordProv := llord;
        end
        else
          ShowErrorBox('Landlord cannot be the same as client.');
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteLandlordAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.LandlordPres := nil;
  bteLandlord.Clear;
  edLandlordContact.Clear;
end;

procedure TfrmClientMain.bteLandlordButtonClick(Sender: TObject);
begin
  with TfrmLandlordSearch.Create(nil) do
  begin
    try
      llord := TLandLord.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        if Trim(llord.Id) <> Trim(cln.Id) then
        begin
          bteLandlord.Text := llord.Name;
          edLandLordContact.Text := llord.Contact;
          cln.LandlordPres := llord;
        end
        else
          ShowErrorBox('Landlord cannot be the same as client.');
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteRefereeAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.Referee := nil;
  bteReferee.Clear;
  dbluInformationSource.Enabled := true;
end;

procedure TfrmClientMain.bteRefereeButtonClick(Sender: TObject);
begin
  with TfrmRefereeSearch.Create(self) do
  begin
    try
      try
        ref := TReferee.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
          if Trim(cln.Id) <> Trim(ref.Id) then
          begin
            bteReferee.Text := ref.Name;
            cln.Referee := ref;
            dbluInformationSource.Enabled := false;
          end
          else
            ShowErrorBox('Referred by cannot be the same as client.');
        end;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;

end;

procedure TfrmClientMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  intf: IDock;
begin
  if cln.HasId then
    if Supports(Application.MainForm,IDock,intf) then
      intf.AddRecentClient(cln);

  dmClient.Destroy;
  dmAux.Destroy;
  dmRef.Destroy;

  cln.Destroy;

  // close photo utility
  if PhotoLauncher.Running then
    SendMessage(FindWindow(nil,'PhotoUtil'),WM_CLOSE,0,0);

  Application.BringToFront;
  inherited;
end;

procedure TfrmClientMain.HideTabs;
var
  i: integer;
begin
  for i := 0 to pcClient.PageCount - 1 do
    pcClient.Pages[i].TabVisible := false;
end;

procedure TfrmClientMain.SetActiveTab(const tabIndex: Integer);
begin
  // cancel changes prior to changing tab
  cln.Cancel;

  pcClient.ActivePageIndex := tabIndex;

  case tabIndex of
    FAMREF:
      begin
        OpenGridDataSources(pnlFamRef);
        OpenDropdownDataSources(pnlFamRefDetail);
        ChangeFamRefControlState;
      end;
    IDENT:
      begin
        OpenGridDataSources(pnlIdentity);
        OpenDropdownDataSources(pnlIdentDocDetail);
        ChangeIdentControlState;

        grIdentityList.QuickCompare.Active := grIdentityList.DataSource.DataSet.RecordCount > 0;
        grIdentityList.QuickCompare.FieldValue := ifn.AppDate;
      end;
    LOANS:
      begin
        OpenGridDataSources(pnlLoans);
      end;
    GROUPS:
      begin
        PopulateGroups;
      end;
    BANKACCOUNTS:
      begin
        OpenGridDataSources(pnlAccounts);
        OpenDropdownDataSources(pnlAcctDetails);
        ChangeAccntInfoControlState;
      end;
  end;
end;

procedure TfrmClientMain.imgBankAccountClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(BANKACCOUNTS);
end;

procedure TfrmClientMain.imgClientMainClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(CLIENT);
end;

procedure TfrmClientMain.imgClientMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonDown(Sender);
end;

procedure TfrmClientMain.imgClientMainMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonUp(Sender);
end;

procedure TfrmClientMain.imgFamRefClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(FAMREF);
end;

procedure TfrmClientMain.imgIdentInfoClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(IDENT);
end;

procedure TfrmClientMain.imgGroupsClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(GROUPS);
end;

procedure TfrmClientMain.imgLoanHistoryClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(LOANS);
end;

procedure TfrmClientMain.imgTakePhotoClick(Sender: TObject);
var
  fileName: string;
begin
  inherited;
  try
    if not PhotoLauncher.Running then
    begin
      fileName := FormatDateTime('mmddyyyhhmmss',Now);

      cln.Photo := fileName + '.bmp';

      PhotoLauncher.Parameters := ifn.PhotoPath + ' ' + Trim(fileName);
      PhotoLauncher.Launch;
      Application.MainForm.Enabled := false;
    end;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmClient := TdmClient.Create(self);
  dmAux := TdmAux.Create(self);
  dmRef := TdmRef.Create(self);

  if not Assigned(cln) then
  begin
    cln := TClient.Create;
    cln.Add;
  end
  else
  begin
    cln.Retrieve;
    SetClientName;
  end;

  SetUnBoundControls;
  HideTabs;
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsClientInfo);
  LoadPhoto;

  SetLandLordControlsPres;
  SetLandLordControlsProv;
end;

function TfrmClientMain.Save: boolean;
var
  error: string;
begin

  try
    error := '';

    case pcClient.ActivePageIndex of

      CLIENT: error := CheckClientInfo;
      IDENT : error := CheckIdentInfo;
      BANKACCOUNTS: error := CheckAcctInfo;

    end;

    Result := error = '';

    if Result then
    begin
      // alerts
      case pcClient.ActivePageIndex of

        CLIENT: ShowAlerts;

      end;

      cln.Save;
      SetClientName;

      case pcClient.ActivePageIndex of

        CLIENT, FAMREF: Exit;
        IDENT : ChangeIdentControlState;

      end;

    end;
  finally

  end;
end;

procedure TfrmClientMain.NewFamRef;
begin
  with TfrmReferenceSearch.Create(nil) do
  begin
    try
      ShowModal;

      if ModalResult = mrOK then
      begin
        with grRefList.DataSource.DataSet do
        begin
          if Trim(cln.Id) = Trim(refc.Id) then
            ShowErrorBox('Client cannot be declared as a reference.')
          else if cln.ReferenceExists(refc) then
            ShowErrorBox('Reference already exists.')
          else
          begin
            Append;
            FieldByName('ref_entity_id').AsString := refc.Id;
            Post;

            ChangeFamRefControlState;

            refc.Free;
          end;
        end;
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.NewIdentity;
begin
  with grIdentityList.DataSource.DataSet do
  begin
    if State = dsBrowse then
    begin
      Append;
      ChangeIdentControlState;
      grIdentityList.DataSource.DataSet.FieldByName('ident_type').FocusControl;
    end;
  end;
end;

procedure TfrmClientMain.NewAccount;
begin
  with grAccounts.DataSource.DataSet do
  begin
    Append;
    ChangeAccntInfoControlState;
    dbluBank.SetFocus;
  end;
end;

procedure TfrmClientMain.sbtnAddGroupClick(Sender: TObject);
var
  clientGroup: TClientGroup;
begin
  dmEntities := TdmEntities.Create(self);

  with TfrmGroupSearch.Create(self) do
  begin
    try
      try
        grp := TGroup.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
          clientGroup := TClientGroup.Create;

          clientGroup.Id := grp.GroupId;
          clientGroup.Name := grp.GroupName;

          if cln.AddGroup(clientGroup,true) then lbGroups.AddObject(clientGroup.Name, TObject(clientGroup));
        end;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    finally
      dmEntities.Free;
      Free;
      grp.Free;
    end;
  end;
end;

procedure TfrmClientMain.sbtnNewBankAccountClick(Sender: TObject);
begin
  NewAccount;
end;

procedure TfrmClientMain.sbtnNewFamRefClick(Sender: TObject);
begin
  NewFamRef;
end;

procedure TfrmClientMain.sbtnNewIdentDocClick(Sender: TObject);
begin
  NewIdentity;
end;

procedure TfrmClientMain.sbtnRemIdentDocClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected identity document?';
var
  idType: string;
begin
  try
    if grIdentityList.DataSource.DataSet.RecordCount > 0 then
    begin
      idType := grIdentityList.DataSource.DataSet.FieldByName('ident_type').AsString;

      if ShowDecisionBox(CONF) = mrYes then
      begin
        grIdentityList.DataSource.DataSet.Delete;
        cln.RemoveIdentityDoc(idType);
        ChangeIdentControlState;
      end;

    end;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.sbtnRemoveBankAccountClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected bank account?';
begin
  with grAccounts.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      try
        if ShowDecisionBox(conf) = mrYes then Delete;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    end;
  end;
end;

procedure TfrmClientMain.sbtnRemoveFamRefClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected reference?';
var
  id: string;
begin
  try
    if grRefList.DataSource.DataSet.RecordCount > 0 then
    begin
      id := grRefList.DataSource.DataSet.FieldByName('ref_entity_id').AsString;

      if ShowDecisionBox(CONF) = mrYes then
      begin
        grRefList.DataSource.DataSet.Delete;
        cln.RemoveReference(id);
        ChangeFamRefControlState;
      end;

    end;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.sbtnRemoveGroupClick(Sender: TObject);
const
  CONF = 'Are you sure you want to remove the selected group?';
var
  group: TClientGroup;
begin
  try
    if lbGroups.SelectedItem <> '' then
    begin
      group := TClientGroup(lbGroups.Items.Objects[lbGroups.IndexOf(lbGroups.SelectedItem)]);

      if group.EmployerGroup then ShowErrorBox('Cannot remove an employer group.')
      else if ShowDecisionBox(CONF) = mrYes then
      begin
        cln.RemoveGroup(group,true);
        lbGroups.DeleteSelected;
      end;

    end;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.Cancel;
begin
  cln.Cancel;
  SetUnboundControls(false);

  case pcClient.ActivePageIndex of

    CLIENT: Exit;
    FAMREF: ChangeFamRefControlState;
    IDENT : ChangeIdentControlState;
    BANKACCOUNTS: ChangeAccntInfoControlState;

  end;
end;

procedure TfrmClientMain.SetClientName;
var
  displayId: string;
begin
  if cln.DisplayId <> '' then
    displayId := cln.DisplayId
  else
    displayId := cln.Id;

  lblClientName.Caption := UpperCase(cln.Name + '   ' + displayId);

  ChangeControlState;
end;

procedure TfrmClientMain.SetUnboundControls(const changeTab: boolean = true);

  procedure ClearUnboundControls;
  var
    i: integer;
  begin
    with tsClientInfo do
    begin
      for i := 0 to ControlCount - 1 do
        if Controls[i].Tag = 1 then
        begin
          if Controls[i] is TRzButtonEdit then
            (Controls[i] as TRzButtonEdit).Clear
          else if Controls[i] is TRzEdit then
            (Controls[i] as TRzEdit).Clear
          else if Controls[i] is TRzMemo then
            (Controls[i] as TRzMemo).Clear;
        end;
    end;
  end;

begin
  if changeTab then
    pcClient.ActivePageIndex := 0;

  GetAge;

  ClearUnboundControls;

  // referee
  if Assigned(cln.Referee) then
    bteReferee.Text := cln.Referee.Name;

  // information source .. disable when referee is present
  dbluInformationSource.Enabled := not Assigned(cln.Referee);

  // landlord present address
  if Assigned(cln.LandlordPres) then
  begin
    bteLandlord.Text := cln.LandlordPres.Name;
    edLandlordContact.Text := cln.LandlordPres.Contact;
  end;

  // landlord provincial address
  if Assigned(cln.LandlordProv) then
  begin
    bteLandlord2.Text := cln.LandlordProv.Name;
    edLandlordContact2.Text := cln.LandlordProv.Contact;
  end;

  // employer
  if Assigned(cln.Employer) then
  begin
    bteEmployer.Text := cln.Employer.Name;
    mmEmployerAddress.Text := cln.Employer.Address;
  end;

  // immediate head
  if Assigned(cln.ImmediateHead) then
  begin
    bteImmHead.Text := cln.ImmediateHead.Name;
  end;

end;

procedure TfrmClientMain.ShowAlerts;
begin
  alrt := TAlert.Create;
  try
    // contact numbers
    if (edMobile.Text = '') and (edTelephone.Text = '') then
      alrt.Add('No contact numbers entered.');

    if not cln.Adding then
    begin
      if cln.IdentityDocsCount = 0 then alrt.Add('No identity documents added.');

    end;

    if alrt.Count > 0 then
      with TfrmAlerts.Create(self) do
      begin
        ShowModal;
        Free;
      end;

  finally
    alrt.Free;
  end;
end;

procedure TfrmClientMain.urlCopyAddressClick(Sender: TObject);
begin
  inherited;
  CopyAddress;
end;

procedure TfrmClientMain.urlCopyClientAddressClick(Sender: TObject);
begin
  inherited;
  refc.CopyClientAddress;
end;

procedure TfrmClientMain.urlRefreshRefListClick(Sender: TObject);
begin
  inherited;
  with grRefList.DataSource.DataSet do
  begin
    Close;
    Open;
  end;
end;

procedure TfrmClientMain.CopyAddress;
begin
  try
    // transfer the focus to "post" the changes
    // this is a hack
    edStreeProv.SetFocus;

    cln.CopyAddress;

    // set unbound controls
    if Assigned(cln.LandlordPres) then
    begin
      cln.LandLordProv := cln.LandlordPres;
      bteLandlord2.Text := cln.LandlordPres.Name;
      edLandlordContact2.Text := cln.LandlordPres.Contact;
    end
    else
    begin
      cln.LandLordProv := nil;
      bteLandlord2.Clear;
      edLandlordContact2.Clear;
    end;
  except
    on e: Exception do ShowErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.dbluResStatusPresClick(Sender: TObject);
begin
  SetLandLordControlsPres;
end;

procedure TfrmClientMain.dbluResStatusProvClick(Sender: TObject);
begin
  inherited;
  SetLandLordControlsProv;
end;

procedure TfrmClientMain.GetAge;
var
  Month, Day, Year, CurrentYear, CurrentMonth, CurrentDay: Word;
  age: integer;
begin
  age := 0;
  if dteBirthdate.Text <> '' then
  begin
    DecodeDate(dteBirthdate.Date, Year, Month, Day);
    DecodeDate(Date, CurrentYear, CurrentMonth, CurrentDay);

    if (Year = CurrentYear) and (Month = CurrentMonth) and (Day = CurrentDay) then
    begin
      age := 0;
    end
    else
    begin
      age := CurrentYear - Year;
      if (Month > CurrentMonth) then
        Dec(age)
      else
      begin
        if Month = CurrentMonth then
          if (Day > CurrentDay) then
            Dec(age);
      end;
    end;
  end;

  edAge.Text := IntToStr(age);
end;

procedure TfrmClientMain.PhotoLauncherFinished(Sender: TObject);
begin
  inherited;
  LoadPhoto;
end;

procedure TfrmClientMain.PopulateGroups;
var
  i, cnt: integer;
begin
  cln.GetGroups;

  lbGroups.Clear;

  cnt := cln.GroupCount - 1;

  for i := 0 to cnt do lbGroups.AddObject(cln.Groups[i].Name, cln.groups[i]);
end;

procedure TfrmClientMain.dteBirthdateChange(Sender: TObject);
begin
  inherited;
  GetAge;
end;

procedure TfrmClientMain.LoadPhoto;
var
  filename: string;
begin
  filename := ifn.PhotoPath + Trim(cln.Photo);

  if FileExists(fileName) then
  begin
    imgClient.Picture.LoadFromFile(fileName);
    imgClient.Visible := true;
  end
  else
    imgClient.Visible := false;

  if not Application.MainForm.Active then
    Application.MainForm.Enabled := true;
end;

procedure TfrmClientMain.ChangeControlState;
var
  hasId: boolean;
begin
  hasId := cln.HasId;

  edLastName.ReadOnly := hasId;
  edFirstName.ReadOnly := hasId;
  edMiddleName.ReadOnly := hasId;

  pnlToolBar.Visible := hasId;
end;

procedure TfrmClientMain.ChangeFamRefControlState;
var
  i: integer;
begin
  with grRefList.DataSource.DataSet do
  begin
    for i := 0 to pnlFamRefDetail.ControlCount - 1 do
      if pnlFamRefDetail.Controls[i].Tag = 1 then
        pnlFamRefDetail.Controls[i].Enabled := (State in [dsInsert,dsEdit]) or
                (RecordCount > 0);
  end;
end;

procedure TfrmClientMain.ChangeIdentControlState;
begin
  with grIdentityList.DataSource.DataSet do
  begin
    cmbIdType.Readonly := not (State in [dsInsert]);
    edIdNo.Enabled := (RecordCount > 0) or (State in [dsInsert]);
    dteExpiry.Enabled := (RecordCount > 0) or (State in [dsInsert]);
  end;
end;

procedure TfrmClientMain.ChangeAccntInfoControlState;
begin
  with grAccounts.DataSource.DataSet do
  begin
    edAccount.Enabled := State in [dsInsert];
    edCardNo.Enabled := State in [dsInsert];
  end;
end;

end.
