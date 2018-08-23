unit ClientMain;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls,
  Vcl.ExtCtrls, SaveIntf, RzLabel, RzPanel, RzTabs, Vcl.Mask, StatusIntf,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo,
  Vcl.ComCtrls, RzDTP, RzDBDTP, RzButton, RzRadChk, RzDBChk, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzBtnEdt, ClientIntf,
  RzCmboBx, RzLstBox, RzDBList, NewIntf, RzGrids, RzChkLst, ADODB, Vcl.Menus,
  DSPack, DXSUtil, DirectShow9, JPEG;

type
  TfrmClientMain = class(TfrmBaseDocked, ISave, IClient, INew)
    lblClientName: TRzLabel;
    pcClient: TRzPageControl;
    tsClientInfo: TRzTabSheet;
    edLastname: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edMiddlename: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    tsReferences: TRzTabSheet;
    edAge: TRzEdit;
    bteReferee: TRzButtonEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    urlCopyAddress: TRzURLLabel;
    dbluResStatusPres: TRzDBLookupComboBox;
    bteLandlord: TRzButtonEdit;
    edLandlordContact: TRzEdit;
    edStreeProv: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    dbluResStatusProv: TRzDBLookupComboBox;
    bteLandlord2: TRzButtonEdit;
    edLandlordContact2: TRzEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    edMobile: TRzDBEdit;
    edTelephone: TRzDBEdit;
    bteEmployer: TRzButtonEdit;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    mmEmployerAddress: TRzMemo;
    bteImmHead: TRzButtonEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    tsIdentityInfo: TRzTabSheet;
    pnlFamRef: TRzPanel;
    grRefList: TRzDBGrid;
    tsLoansHistory: TRzTabSheet;
    pnlIdentity: TRzPanel;
    grIdentityList: TRzDBGrid;
    pnlLoans: TRzPanel;
    grLoans: TRzDBGrid;
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
    RzGroupBox6: TRzGroupBox;
    RzGroupBox7: TRzGroupBox;
    pnlFamRefDetail: TRzPanel;
    pnlAddFamRef: TRzPanel;
    sbtnNewFamRef: TRzShapeButton;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    RzDBLookupComboBox9: TRzDBLookupComboBox;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    urlCopyClientAddress: TRzURLLabel;
    RzDBLookupComboBox10: TRzDBLookupComboBox;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    RzDBEdit20: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    pnlRemoveFamRef: TRzPanel;
    sbtnRemoveFamRef: TRzShapeButton;
    RzGroupBox1: TRzGroupBox;
    pnlIdentDocDetail: TRzPanel;
    pnlIdentDoc: TRzPanel;
    sbtnNewIdentDoc: TRzShapeButton;
    pnlRemIdentDoc: TRzPanel;
    sbtnRemIdentDoc: TRzShapeButton;
    cmbIdType: TRzDBLookupComboBox;
    edIdNo: TRzDBEdit;
    dteExpiry: TRzDBDateTimeEdit;
    tsBankAcctInfo: TRzTabSheet;
    pnlAccounts: TRzPanel;
    pnlAcctDetails: TRzPanel;
    RzPanel5: TRzPanel;
    sbtnNewBankAccount: TRzShapeButton;
    RzPanel7: TRzPanel;
    sbtnRemoveBankAccount: TRzShapeButton;
    edCardNo: TRzDBEdit;
    edAccount: TRzDBEdit;
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
    dbluInformationSource: TRzDBLookupComboBox;
    ppLoans: TPopupMenu;
    Ledger1: TMenuItem;
    Loandetails1: TMenuItem;
    tsPromissoryNotes: TRzTabSheet;
    pnlPromissoryNotes: TRzPanel;
    grPromissoryNotes: TRzDBGrid;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    sbtnNewPromissoryNote: TRzShapeButton;
    RzPanel10: TRzPanel;
    sbtnRemovePromissoryNote: TRzShapeButton;
    edPNNo: TRzDBEdit;
    urlHome: TRzURLLabel;
    urlFamilyAndReferences: TRzURLLabel;
    urlIdentityInformation: TRzURLLabel;
    urlBankAccountInformation: TRzURLLabel;
    urlLoanHistory: TRzURLLabel;
    urlGroups: TRzURLLabel;
    urlPromissoryNotes: TRzURLLabel;
    urlPhoto: TRzURLLabel;
    tsPhoto: TRzTabSheet;
    pnlPhoto: TRzPanel;
    imgClient: TImage;
    VideoWindow: TVideoWindow;
    ListBox: TListBox;
    ListBox2: TListBox;
    pnlTakePhoto: TRzPanel;
    btnTakePhoto: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    SampleGrabber: TSampleGrabber;
    VideoSourceFilter: DSPack.TFilter;
    CaptureGraph: TFilterGraph;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
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
    procedure sbtnNewFamRefClick(Sender: TObject);
    procedure sbtnRemoveFamRefClick(Sender: TObject);
    procedure sbtnRemIdentDocClick(Sender: TObject);
    procedure sbtnNewIdentDocClick(Sender: TObject);
    procedure dbluResStatusPresClick(Sender: TObject);
    procedure dbluResStatusProvClick(Sender: TObject);
    procedure sbtnNewBankAccountClick(Sender: TObject);
    procedure sbtnRemoveBankAccountClick(Sender: TObject);
    procedure sbtnAddGroupClick(Sender: TObject);
    procedure sbtnRemoveGroupClick(Sender: TObject);
    procedure grLoansDblClick(Sender: TObject);
    procedure Ledger1Click(Sender: TObject);
    procedure Loandetails1Click(Sender: TObject);
    procedure sbtnNewPromissoryNoteClick(Sender: TObject);
    procedure sbtnRemovePromissoryNoteClick(Sender: TObject);
    procedure urlHomeClick(Sender: TObject);
    procedure urlFamilyAndReferencesClick(Sender: TObject);
    procedure urlIdentityInformationClick(Sender: TObject);
    procedure urlBankAccountInformationClick(Sender: TObject);
    procedure urlLoanHistoryClick(Sender: TObject);
    procedure urlGroupsClick(Sender: TObject);
    procedure urlPromissoryNotesClick(Sender: TObject);
    procedure urlPhotoClick(Sender: TObject);
    procedure btnTakePhotoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    VideoDevice: TSysDevEnum;
    VideoMediaTypes: TEnumMediaType;

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
    procedure NewPromissoryNote;
    procedure PopulateGroups;
    procedure ShowAlerts;
    procedure ShowLedger;
    procedure ShowLoanDetails;

    procedure InitPhotoCapture;
    procedure SetImageDevice;
    procedure StartCapture;
    procedure GetSnapshot;
    procedure CancelPhotoCapture;

    function CheckClientInfo: string;
    function CheckIdentInfo: string;
    function CheckAcctInfo: string;
    function CheckPromissoryNote: string;
  public
    { Public declarations }
    procedure Cancel;

    procedure SetClientName;
    procedure LoadPhoto;
    procedure SetUnboundControls(const changeTab: boolean = true);
    procedure SetLandLordControlsPres;
    procedure SetLandLordControlsProv;

    function Save: boolean;
    procedure New;
  end;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead, RefereeSearch, Referee, AuxData, DockIntf, RefData,
  EmployerSearch, Employer, IdentityDoc, IFinanceGlobal,
  ReferenceSearch, Reference, LoansAuxData, LoanClassification,
  DBUtil, IFinanceDialogs, EntityUtils, Alert, Alerts, EntitiesData, GroupSearch,
  Group, LoanLedger, Loan, LoanClient, AppConstants;

{$R *.dfm}

{ TfrmClientMain }

const
  CLIENT = 0;
  FAMREF = 1;
  IDENT  = 2;
  LOANS  = 3;
  GROUPS = 4;
  BANKACCOUNTS = 5;
  PROMISSORYNOTES = 6;
  CLIENTPHOTO = 7;

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

function TfrmClientMain.CheckPromissoryNote: string;
var
  error: string;
begin
  if Trim(edPNNo.Text) = '' then error := 'Please enter PN number.';

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

procedure TfrmClientMain.btnCancelClick(Sender: TObject);
begin
  inherited;
  CancelPhotoCapture;
end;

procedure TfrmClientMain.btnTakePhotoClick(Sender: TObject);
begin
  inherited;
  try
    if VideoWindow.Visible then
    begin
      GetSnapshot;
      CancelPhotoCapture;
      LoadPhoto;
    end
    else
    begin
      ListBox.ItemIndex := 0;
      SetImageDevice;
      VideoWindow.Visible := true;
    end
  except
    on E: Exception do ShowErrorBox(E.Message);
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
  inherited;
end;

procedure TfrmClientMain.HideTabs;
var
  i: integer;
begin
  for i := 0 to pcClient.PageCount - 1 do
    pcClient.Pages[i].TabVisible := false;
end;

procedure TfrmClientMain.InitPhotoCapture;
var
  i: integer;
begin
  VideoDevice := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  for i := 0 to VideoDevice.CountFilters - 1 do
    ListBox.Items.Add(VideoDevice.Filters[i].FriendlyName);

  VideoMediaTypes := TEnumMediaType.Create;

  LoadPhoto;
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

    PROMISSORYNOTES:
      begin
        OpenGridDataSources(pnlPromissoryNotes);
      end;

    CLIENTPHOTO:
      begin
        InitPhotoCapture;
      end;
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
  Result := false;

  try
    try
      error := '';

      case pcClient.ActivePageIndex of

        CLIENT: error := CheckClientInfo;
        IDENT : error := CheckIdentInfo;
        BANKACCOUNTS: error := CheckAcctInfo;
        PROMISSORYNOTES: error := CheckPromissoryNote;

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

        Result := true;
      end;
    except
      on E: Exception do
      begin
        ShowErrorBox('Unable to save client record.');
        Result := false;
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

procedure TfrmClientMain.NewPromissoryNote;
begin
  with grPromissoryNotes.DataSource.DataSet do
  begin
    Append;
    edPNNo.SetFocus;
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

procedure TfrmClientMain.sbtnNewPromissoryNoteClick(Sender: TObject);
begin
  inherited;
  NewPromissoryNote;
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

procedure TfrmClientMain.sbtnRemovePromissoryNoteClick(Sender: TObject);
const
  CONF = 'Are you sure you want to remove the selected promissory note number?';
begin
  try
    if grPromissoryNotes.DataSource.DataSet.RecordCount > 0 then
      if ShowDecisionBox(CONF) = mrYes then grPromissoryNotes.DataSource.DataSet.Delete;
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

procedure TfrmClientMain.CancelPhotoCapture;
begin
  CaptureGraph.Active := false;
  VideoWindow.Visible := false;

  if Assigned(VideoDevice) then VideoDevice.Free;
  if Assigned(VideoMediaTypes) then VideoMediaTypes.Free;
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

procedure TfrmClientMain.SetImageDevice;
var
 PinList: TPinList;
 i: integer;
begin
  if ListBox.Items.Count = 0 then
  begin
    // lblStatus.Caption := 'No imaging device found.';
    Exit;
  end;

  VideoDevice.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ListBox.ItemIndex <> -1 then
  begin
    // Set the device which we work with
    VideoSourceFilter.BaseFilter.Moniker := VideoDevice.GetMoniker(ListBox.ItemIndex);
    VideoSourceFilter.FilterGraph := CaptureGraph;
    CaptureGraph.Active := true;
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    ListBox2.Clear;
    VideoMediaTypes.Assign(PinList.First);

    // Adding permission to ListBox2, which supports device
    for i := 0 to VideoMediaTypes.Count - 1 do
      ListBox2.Items.Add(VideoMediaTypes.MediaDescription[i]);

    CaptureGraph.Active := false;
    PinList.Free;

    ListBox2.ItemIndex := 0;

    StartCapture;
  end;
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
      if cln.IdentityDocsCount = 0 then alrt.Add('No identity documents added.');

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

procedure TfrmClientMain.ShowLedger;
var
  loanId: string;
begin
  with (dmClient.dstLedger as TADODataSet) do
  begin
    loanId := grLoans.DataSource.DataSet.FieldByName('loan_id').AsString;
    Parameters.ParamByName('@loan_id').Value := loanId;
    Parameters.ParamByName('@as_of_date').Value := ifn.AppDate;
  end;

  with TfrmLoanLedger.Create(self,dmClient.dscLedger) do
  begin
    Parent := self;
    Show;
    //Free;
  end
end;

procedure TfrmClientMain.ShowLoanDetails;
var
  id: string;
  intf: IDock;
  empl: TEmployer;
begin
  with  grLoans.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      empl := cln.Employer;

      id := FieldByName('loan_id').AsString;

      ln := TLoan.Create;
      ln.Id := id;
      ln.Client := TLoanClient.Create(cln.Id,
                        cln.Name,
                        empl,
                        '', // FieldByName('client_addr').AsString,
                        0,  // FieldByName('age').AsInteger,
                        0,  // FieldByName('net_pay').AsCurrency,
                        cln.IdentityDocsCount);
      ln.Status := FieldByName('status_id').AsString;
      ln.Action := laNone;

      if Supports(Application.MainForm,IDock,intf) then
        intf.DockForm(fmLoanMain);
    end;
  end;
end;

procedure TfrmClientMain.StartCapture;
var
 PinList: TPinList;
 intf: IBaseFilter;
begin
  // Activating graph filter, at this stage the source filter is added to the graph
  CaptureGraph.Active := true;

  // The configuration of the output device
  if VideoSourceFilter.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    if ListBox2.ItemIndex <> -1 then
    with (PinList.First as IAMStreamConfig) do
      SetFormat(VideoMediaTypes.Items[ListBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;

  // now render streams
  with CaptureGraph as IcaptureGraphBuilder2 do
  begin
    // Hooking up a preview video (VideoWindow)
    if VideoSourceFilter.BaseFilter.DataLength > 0 then
      if Supports(VideoSourceFilter,IBaseFilter,intf) then
        if Supports(SampleGrabber,IBaseFilter,intf) then
          if Supports(VideoWindow,IBaseFilter,intf) then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as DirectShow9.IBaseFilter,
        SampleGrabber as DirectShow9.IBaseFilter , VideoWindow as DirectShow9.IBaseFilter);
   end;

 //Launch video
 CaptureGraph.Play;
end;

procedure TfrmClientMain.urlBankAccountInformationClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(BANKACCOUNTS);
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

procedure TfrmClientMain.urlHomeClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(CLIENT);
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
    DecodeDate(ifn.AppDate, CurrentYear, CurrentMonth, CurrentDay);

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

procedure TfrmClientMain.GetSnapshot;
var
  path: string;
  filename: string;
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  try
    path := '';

    SampleGrabber.GetBitmap(imgClient.Picture.Bitmap);

    path := ifn.PhotoPath;

    filename := cln.Id + '.jpg';

    // save file
    if not DirectoryExists(path) then CreateDir(path);

    jpg.CompressionQuality := 50;
    jpg.Assign(imgClient.Picture.Bitmap);
    jpg.SaveToFile(path + filename);

    VideoWindow.Visible := false;
  finally
    jpg.Free;
  end;
end;

procedure TfrmClientMain.grLoansDblClick(Sender: TObject);
begin
  inherited;
  ShowLoanDetails;
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

procedure TfrmClientMain.urlFamilyAndReferencesClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(FAMREF);
end;

procedure TfrmClientMain.urlGroupsClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(GROUPS);
end;

procedure TfrmClientMain.urlIdentityInformationClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(IDENT);
end;

procedure TfrmClientMain.urlLoanHistoryClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(LOANS);
end;

procedure TfrmClientMain.urlPhotoClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(CLIENTPHOTO);
end;

procedure TfrmClientMain.urlPromissoryNotesClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(PROMISSORYNOTES);
end;

procedure TfrmClientMain.dteBirthdateChange(Sender: TObject);
begin
  inherited;
  GetAge;
end;

procedure TfrmClientMain.Ledger1Click(Sender: TObject);
begin
  inherited;
  ShowLedger;
end;

procedure TfrmClientMain.LoadPhoto;
var
  imageFile: string;
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  try
    imageFile := ifn.PhotoPath + Trim(cln.Id) + '.jpg';

    if FileExists(imageFile) then
    begin
      jpg.LoadFromFile(imageFile);
      imgClient.Picture.Assign(jpg);
      imgClient.Visible := true;
    end else imgClient.Visible := false;

  finally
    jpg.Free;
  end;
end;

procedure TfrmClientMain.Loandetails1Click(Sender: TObject);
begin
  inherited;
  ShowLoanDetails;
end;

procedure TfrmClientMain.ChangeControlState;
var
  hasId: boolean;
begin
  hasId := cln.HasId;

  edLastName.ReadOnly := hasId;
  edFirstName.ReadOnly := hasId;
  edMiddleName.ReadOnly := hasId;

  pnlToolBar.Enabled := hasId;
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
