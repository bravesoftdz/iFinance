unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls,
  Vcl.ExtCtrls, SaveIntf, RzLabel, RzPanel, RzTabs, Vcl.Mask, StatusIntf,
  RzEdit, RzDBEdit, JvLabel, JvExControls, JvGroupHeader, Vcl.DBCtrls, RzDBCmbo,
  Vcl.ComCtrls, RzDTP, RzDBDTP, RzButton, RzRadChk, RzDBChk, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzBtnEdt, RzLaunch, ClientIntf, Vcl.Imaging.pngimage,
  RzCmboBx, RzLstBox, RzDBList;

type
  TfrmClientMain = class(TfrmBaseDocked, ISave, IClient)
    lblClientName: TRzLabel;
    pcClient: TRzPageControl;
    tsClientInfo: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
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
    RzGroupBox1: TRzGroupBox;
    tsReferences: TRzTabSheet;
    edAge: TRzEdit;
    bteReferee: TRzButtonEdit;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel4: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    JvLabel5: TJvLabel;
    RzDBEdit5: TRzDBEdit;
    JvLabel6: TJvLabel;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    urlCopyAddress: TRzURLLabel;
    JvLabel14: TJvLabel;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    JvLabel15: TJvLabel;
    bteLandlord: TRzButtonEdit;
    edLandlordContact: TRzEdit;
    JvLabel16: TJvLabel;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    JvLabel11: TJvLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    JvLabel17: TJvLabel;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    JvLabel18: TJvLabel;
    bteLandlord2: TRzButtonEdit;
    JvLabel19: TJvLabel;
    edLandlordContact2: TRzEdit;
    JvGroupHeader5: TJvGroupHeader;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    JvLabel22: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    JvGroupHeader6: TJvGroupHeader;
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
    JvLabel31: TJvLabel;
    JvLabel32: TJvLabel;
    RzDBEdit15: TRzDBEdit;
    JvLabel33: TJvLabel;
    RzDBEdit16: TRzDBEdit;
    JvLabel34: TJvLabel;
    JvLabel36: TJvLabel;
    urlTakePhoto: TRzURLLabel;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    JvGroupHeader1: TJvGroupHeader;
    tsIdentityInfo: TRzTabSheet;
    pnlFamRef: TRzPanel;
    grRefList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsFamRefDetail: TRzTabSheet;
    tsLoansHistory: TRzTabSheet;
    pnlIdentity: TRzPanel;
    grIdentityList: TRzDBGrid;
    RzPageControl1: TRzPageControl;
    tsIdentDetail: TRzTabSheet;
    pnlLoans: TRzPanel;
    grLoans: TRzDBGrid;
    RzPageControl2: TRzPageControl;
    tsLoansDetail: TRzTabSheet;
    PhotoLauncher: TRzLauncher;
    imgClient: TImage;
    bteBank: TRzButtonEdit;
    mmBranch: TRzMemo;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    JvLabel37: TJvLabel;
    edIdNo: TRzDBEdit;
    JvLabel38: TJvLabel;
    lblExpiry: TJvLabel;
    cmbIdType: TRzDBLookupComboBox;
    btnNewId: TRzButton;
    chbNoExpiry: TRzDBCheckBox;
    btnRemoveId: TRzButton;
    btnNewRef: TRzButton;
    btnRemoveRef: TRzButton;
    JvLabel39: TJvLabel;
    RzDBLookupComboBox9: TRzDBLookupComboBox;
    JvGroupHeader7: TJvGroupHeader;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    JvLabel42: TJvLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    JvGroupHeader8: TJvGroupHeader;
    JvLabel43: TJvLabel;
    JvLabel44: TJvLabel;
    JvLabel45: TJvLabel;
    RzDBLookupComboBox10: TRzDBLookupComboBox;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    JvGroupHeader9: TJvGroupHeader;
    JvLabel46: TJvLabel;
    JvLabel47: TJvLabel;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit20: TRzDBEdit;
    urlRefreshIdentList: TRzURLLabel;
    urlRefreshRefList: TRzURLLabel;
    urlCopyClientAddress: TRzURLLabel;
    dteBirthdate: TRzDBDateTimeEdit;
    dteExpiry: TRzDBDateTimeEdit;
    JvLabel48: TJvLabel;
    RzDBLookupComboBox11: TRzDBLookupComboBox;
    imgPhoto: TImage;
    JvGroupHeader10: TJvGroupHeader;
    JvLabel49: TJvLabel;
    JvLabel51: TJvLabel;
    JvLabel53: TJvLabel;
    JvLabel55: TJvLabel;
    edPurpose: TRzDBEdit;
    edDesiredTerm: TRzDBEdit;
    JvGroupHeader11: TJvGroupHeader;
    JvGroupHeader12: TJvGroupHeader;
    JvLabel56: TJvLabel;
    JvLabel57: TJvLabel;
    JvGroupHeader13: TJvGroupHeader;
    JvLabel61: TJvLabel;
    grComakers: TRzDBGrid;
    JvGroupHeader14: TJvGroupHeader;
    JvLabel63: TJvLabel;
    RzComboBox1: TRzComboBox;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit21: TRzDBEdit;
    RzDBEdit22: TRzDBEdit;
    RzDBEdit23: TRzDBEdit;
    RzDBEdit24: TRzDBEdit;
    RzDBEdit25: TRzDBEdit;
    RzDBEdit26: TRzDBEdit;
    JvLabel52: TJvLabel;
    RzDBEdit28: TRzDBEdit;
    RzDBEdit29: TRzDBEdit;
    RzDBEdit30: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    tsLoanClassAccess: TRzTabSheet;
    JvGroupHeader15: TJvGroupHeader;
    JvGroupHeader16: TJvGroupHeader;
    grAvailList: TRzDBGrid;
    btnMakeAccessible: TRzButton;
    grAccessList: TRzDBGrid;
    btnRemoveAccessibility: TRzButton;
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
    procedure urlTakePhotoClick(Sender: TObject);
    procedure PhotoLauncherFinished(Sender: TObject);
    procedure bteImmHeadButtonClick(Sender: TObject);
    procedure bteImmHeadAltBtnClick(Sender: TObject);
    procedure bteBankButtonClick(Sender: TObject);
    procedure bteBankAltBtnClick(Sender: TObject);
    procedure pcClientChange(Sender: TObject);
    procedure btnNewIdClick(Sender: TObject);
    procedure pcClientChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnRemoveIdClick(Sender: TObject);
    procedure urlRefreshIdentListClick(Sender: TObject);
    procedure urlRefreshRefListClick(Sender: TObject);
    procedure dteBirthdateChange(Sender: TObject);
    procedure btnNewRefClick(Sender: TObject);
    procedure btnRemoveRefClick(Sender: TObject);
    procedure cmbIdTypeClick(Sender: TObject);
    procedure urlCopyClientAddressClick(Sender: TObject);
    procedure btnRemoveAccessibilityClick(Sender: TObject);
    procedure btnMakeAccessibleClick(Sender: TObject);
  private
    { Private declarations }
    procedure CopyAddress;
    procedure GetAge;
    procedure ChangeControlState;
    procedure ChangeIdentControlState;
    procedure ChangeFamRefControlState;
    procedure CallErrorBox(const error: string);
    procedure ShowTabs(const show: boolean = true);

    function CheckClientInfo: string;
    function CheckIdentInfo: string;
  public
    { Public declarations }
    procedure Cancel;
    procedure SetClientName;
    procedure SetUnboundControls(const changeTab: boolean = true);
    procedure LoadPhoto;

    function Save: boolean;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead, RefereeSearch, Referee, AuxData, DockIntf, RefData,
  EmployerSearch, Employer, Bank, BanksSearch, IdentityDoc, IFinanceGlobal,
  ReferenceSearch, Reference, DecisionBox, LoansAuxData, LoanClassification,
  DBUtil;

{$R *.dfm}

{ TfrmClientMain }

const
  CLIENT = 0;
  FAMREF = 1;
  IDENT  = 2;
  LOANS  = 3;
  LOANCLASSACCESS = 4;

function TfrmClientMain.CheckClientInfo: string;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then
    error := 'Please enter client''s lastname.'
  else if Trim(edFirstname.Text) = '' then
    error := 'Please enter client''s firstname.';

  Result := error;

  CallErrorBox(error);
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

  CallErrorBox(error);
end;

procedure TfrmClientMain.CallErrorBox(const error: string);
var
  intf: IStatus;
begin
  if Supports(Application.MainForm,IStatus,intf) then
    intf.ShowError(error);
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

procedure TfrmClientMain.bteBankAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.Bank := nil;
  bteBank.Clear;
  mmBranch.Clear;
end;

procedure TfrmClientMain.bteBankButtonClick(Sender: TObject);
begin
  with TfrmBankSearch.Create(nil) do
  begin
    try
      bnk := TBank.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        bteBank.Text := bnk.BankName;
        mmBranch.Text := bnk.Branch;
        cln.Bank := bnk;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
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
          CallErrorBox('Immediate head cannot be the same as client.')
        else
        begin
          bteImmHead.Text := immHead.Name;
          cln.ImmediateHead := immHead;
        end;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
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
          CallErrorBox('Landlord cannot be the same as client.');
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
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
          CallErrorBox('Landlord cannot be the same as client.');
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteRefereeAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.Referee := nil;
  bteReferee.Clear;
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
          end
          else
            CallErrorBox('Referred by cannot be the same as client.');
        end;
      except
        on e: Exception do
          ShowMessage(e.Message);
      end;
    finally
      Free;
    end;
  end;

end;

procedure TfrmClientMain.btnMakeAccessibleClick(Sender: TObject);
var
  sql, classId: string;
begin
  try
    if grAvailList.DataSource.DataSet.RecordCount > 0 then
    begin
      classId := grAvailList.DataSource.DataSet.FieldByName('class_id').AsString;

      sql := 'INSERT INTO ENTITYLOANCLASS VALUES (' + QuotedStr(cln.Id) +
          ',' + classId + ')';

      ExecuteSQL(sql);

      OpenGridDataSources(tsLoanClassAccess);
    end;
  except
    on e: Exception do
      CallErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.btnNewIdClick(Sender: TObject);
begin
  with grIdentityList.DataSource.DataSet do
  begin
    if State = dsBrowse then
    begin
      Append;
      ChangeIdentControlState;
    end;
  end;
end;

procedure TfrmClientMain.btnNewRefClick(Sender: TObject);
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
            CallErrorBox('Client cannot be declared as a reference.')
          else if cln.ReferenceExists(refc) then
            CallErrorBox('Reference already exists.')
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
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.btnRemoveAccessibilityClick(Sender: TObject);
const
  CONF = 'Are you sure you want to remove client access to the selected loan class?';
var
  sql: string;
begin
  if grAccessList.DataSource.DataSet.RecordCount > 0 then
  begin
  if (Assigned(cln.Employer)) and (lnc.GroupId = cln.Employer.GroupId) then
    CallErrorBox('Cannot remove the loan class. Loan class belongs to the client''s employer group.')
  else
    with TfrmDecisionBox.Create(nil, CONF) do
    begin
      try
        begin
          ShowModal;

          if ModalResult = mrYes then
          begin
            sql := 'DELETE ENTITYLOANCLASS WHERE ENTITY_ID = ' + QuotedStr(cln.Id) +
                ' AND CLASS_ID = ' + IntToStr(lnc.ClassificationId);
            ExecuteSQL(sql);
            OpenGridDataSources(tsLoanClassAccess);
          end;

          Free;
        end;
      except
        on e: Exception do
          ShowMessage(e.Message);
      end;
    end;
  end;
end;

procedure TfrmClientMain.btnRemoveIdClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected identity document?';
var
  idType: string;
begin
  with TfrmDecisionBox.Create(nil, CONF) do
  begin
    try
      if grIdentityList.DataSource.DataSet.RecordCount > 0 then
      begin
        idType := grIdentityList.DataSource.DataSet.FieldByName('ident_type').AsString;

        ShowModal;

        if ModalResult = mrYes then
        begin
          grIdentityList.DataSource.DataSet.Delete;
          cln.RemoveIdentityDoc(idType);
          ChangeIdentControlState;
        end;

        Free;
      end;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.btnRemoveRefClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected reference?';
var
  id: string;
begin
  with TfrmDecisionBox.Create(nil,CONF) do
  begin
    try
      if grRefList.DataSource.DataSet.RecordCount > 0 then
      begin
        id := grRefList.DataSource.DataSet.FieldByName('ref_entity_id').AsString;

        ShowModal;

        if ModalResult = mrYes then
        begin
          grRefList.DataSource.DataSet.Delete;
          cln.RemoveReference(id);
          ChangeFamRefControlState;
        end;

        Free;
      end;
    except
      on e: Exception do
        ShowMessage(e.Message);
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

  inherited;
end;

procedure TfrmClientMain.ShowTabs(const show: boolean = true);
var
  i: integer;
begin
  for i := FAMREF to pcClient.PageCount - 1 do
    pcClient.Pages[i].TabVisible := show;
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
    ShowTabs(false);
  end
  else
  begin
    cln.Retrieve;
    SetClientName;
  end;

  SetUnBoundControls;
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsClientInfo);
  LoadPhoto;
end;

function TfrmClientMain.Save: boolean;
var
  error: string;
begin
  Result := false;

  try
    error := '';

    case pcClient.ActivePageIndex of

      CLIENT: error := CheckClientInfo;
      IDENT : error := CheckIdentInfo;

    end;

    Result := error = '';

    if Result then
    begin
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

procedure TfrmClientMain.Cancel;
begin
  cln.Cancel;
  SetUnboundControls(false);

  case pcClient.ActivePageIndex of

    CLIENT: Exit;
    FAMREF: ChangeFamRefControlState;
    IDENT : ChangeIdentControlState;

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

  ShowTabs;
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

  // bank
  if Assigned(cln.Bank) then
  begin
    bteBank.Text := cln.Bank.BankName;
    mmBranch.Text := cln.Bank.Branch;
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

procedure TfrmClientMain.urlRefreshIdentListClick(Sender: TObject);
begin
  inherited;
  with grIdentityList.DataSource.DataSet do
  begin
    Close;
    Open;
  end;
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

procedure TfrmClientMain.urlTakePhotoClick(Sender: TObject);
begin
  inherited;
  try
    if not PhotoLauncher.Running then
    begin
      PhotoLauncher.Parameters := ifn.PhotoPath + ' ' + Trim(cln.Id);
      PhotoLauncher.Launch;
      Application.MainForm.Enabled := false;
    end;
  except
    on e: Exception do
      CallErrorBox(e.Message);
  end;
end;

procedure TfrmClientMain.CopyAddress;
begin
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

procedure TfrmClientMain.dteBirthdateChange(Sender: TObject);
begin
  inherited;
  GetAge;
end;

procedure TfrmClientMain.LoadPhoto;
var
  filename: string;
begin
  filename := ifn.PhotoPath + Trim(cln.Id) + '.bmp';

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

procedure TfrmClientMain.pcClientChange(Sender: TObject);
begin
  case pcClient.ActivePageIndex of
    FAMREF:
      begin
        OpenGridDataSources(pnlFamRef);
        OpenDropdownDataSources(tsFamRefDetail);
        ChangeFamRefControlState;
      end;
    IDENT:
      begin
        OpenGridDataSources(pnlIdentity);
        OpenDropdownDataSources(tsIdentDetail);
        ChangeIdentControlState;

        grIdentityList.QuickCompare.Active := grIdentityList.DataSource.DataSet.RecordCount > 0;
        grIdentityList.QuickCompare.FieldValue := ifn.AppDate;
      end;
    LOANS:
      begin
        OpenGridDataSources(pnlLoans);
        OpenGridDataSources(tsLoansDetail);
      end;
    LOANCLASSACCESS:
      begin
        OpenGridDataSources(tsLoanClassAccess);
      end;
  end;
end;

procedure TfrmClientMain.pcClientChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := (cln.HasId) or (NewIndex = CLIENT);
end;

procedure TfrmClientMain.ChangeControlState;
var
  hasId: boolean;
begin
  hasId := cln.HasId;

  edLastName.ReadOnly := hasId;
  edFirstName.ReadOnly := hasId;
  edMiddleName.ReadOnly := hasId;

  urlTakePhoto.Enabled := hasId;
end;

procedure TfrmClientMain.ChangeFamRefControlState;
var
  i: integer;
begin
  with grRefList.DataSource.DataSet do
  begin
    for i := 0 to tsFamRefDetail.ControlCount - 1 do
      if tsFamRefDetail.Controls[i].Tag = 1 then
        tsFamRefDetail.Controls[i].Enabled := (State in [dsInsert,dsEdit]) or
                (RecordCount > 0);
  end;
end;

procedure TfrmClientMain.ChangeIdentControlState;
begin
  with grIdentityList.DataSource.DataSet do
  begin
    cmbIdType.Enabled := State in [dsInsert];
    edIdNo.Enabled := (RecordCount > 0) or (State in [dsInsert]);
    dteExpiry.Enabled := (RecordCount > 0) or (State in [dsInsert]);
  end;
end;

end.
