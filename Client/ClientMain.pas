unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls,
  Vcl.ExtCtrls, SaveIntf, RzLabel, RzPanel, RzTabs, Vcl.Mask, StatusIntf,
  RzEdit, RzDBEdit, JvLabel, JvExControls, JvGroupHeader, Vcl.DBCtrls, RzDBCmbo,
  Vcl.ComCtrls, RzDTP, RzDBDTP, RzButton, RzRadChk, RzDBChk, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzBtnEdt, RzLaunch;

type
  TfrmClientMain = class(TfrmBaseDocked, ISave)
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
    dtpBirthdate: TRzDateTimePicker;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    tsLoansHistory: TRzTabSheet;
    pnlIdentity: TRzPanel;
    grIdentityList: TRzDBGrid;
    RzPageControl1: TRzPageControl;
    tsIdentDetail: TRzTabSheet;
    RzPanel2: TRzPanel;
    RzDBGrid2: TRzDBGrid;
    RzPageControl2: TRzPageControl;
    RzTabSheet2: TRzTabSheet;
    PhotoLauncher: TRzLauncher;
    imgClient: TImage;
    bteBank: TRzButtonEdit;
    bteOtherIncome: TRzButtonEdit;
    mmBranch: TRzMemo;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    JvLabel37: TJvLabel;
    edIdNo: TRzDBEdit;
    JvLabel38: TJvLabel;
    JvLabel39: TJvLabel;
    cmbIdType: TRzDBLookupComboBox;
    dtpExpiry: TRzDateTimePicker;
    chbNonExpiring: TRzCheckBox;
    btnNew: TRzButton;
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
    procedure dtpBirthdateChange(Sender: TObject);
    procedure bteEmployerButtonClick(Sender: TObject);
    procedure bteEmployerAltBtnClick(Sender: TObject);
    procedure urlTakePhotoClick(Sender: TObject);
    procedure PhotoLauncherFinished(Sender: TObject);
    procedure bteImmHeadButtonClick(Sender: TObject);
    procedure bteImmHeadAltBtnClick(Sender: TObject);
    procedure bteBankButtonClick(Sender: TObject);
    procedure bteBankAltBtnClick(Sender: TObject);
    procedure pcClientChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure pcClientChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edIdNoChange(Sender: TObject);
    procedure dtpExpiryChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetClientName;
    procedure SetUnboundControls;
    procedure CopyAddress;
    procedure GetAge;
    procedure LoadPhoto;
    procedure ChangeControlState;
    procedure ChangeIdentControlState;
    procedure SetIdentUnboundControls;
    function CheckClientInfo(st: IStatus): string;
    function CheckIdentInfo(st: IStatus): string;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead, RefereeSearch, Referee, AuxData, DockIntf,
  EmployerSearch, Employer, Bank, BanksSearch, IdentityDoc;

{$R *.dfm}

{ TfrmClientMain }

const
  CLIENT = 0;
  FAMREF = 1;
  IDENT  = 2;
  LOANS  = 3;

function Parsedate(const dateStr: string): TDate;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Delimiter := '-';
  sl.DelimitedText := dateStr;

  Result := EncodeDate(StrToInt(sl[0]),StrToInt(sl[1]),StrToInt(sl[2]));
end;

function TfrmClientMain.CheckClientInfo(st: IStatus): string;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then
  begin
    error := 'Please enter client''s lastname.';
    st.ShowError(error);
  end
  else if Trim(edFirstname.Text) = '' then
  begin
    error := 'Please enter client''s firstname.';
    st.ShowError(error);
  end;

  Result := error;
end;

function TfrmClientMain.CheckIdentInfo(st: IStatus): string;
var
  error: string;
  inserting: boolean;
begin
  inserting := grIdentityList.DataSource.DataSet.State = dsInsert;

  if Trim(edIdNo.Text) = '' then
  begin
    error := 'Please enter ID number.';
    st.ShowError(error);
  end
  else if inserting then
  begin
    if cln.IdentityDocExists(cmbIdType.GetKeyValue) then
    begin
      error := 'Identity type already exists.';
      st.ShowError(error);
    end;
  end;

  Result := error;
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
        bteImmHead.Text := immHead.Name;
        cln.ImmediateHead := immHead;
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
        bteLandlord2.Text := llord.Name;
        edLandLordContact2.Text := llord.Contact;
        cln.LandlordProv := llord;
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
        bteLandlord.Text := llord.Name;
        edLandLordContact.Text := llord.Contact;
        cln.LandlordPres := llord;
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
          bteReferee.Text := ref.Name;
          cln.Referee := ref;
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

procedure TfrmClientMain.btnNewClick(Sender: TObject);
begin
  inherited;
  grIdentityList.DataSource.DataSet.Append;
  ChangeIdentControlState;
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

  cln.Destroy;

  // close photo utility
  if PhotoLauncher.Running then
    SendMessage(FindWindow(nil,'PhotoUtil'),WM_CLOSE,0,0);

  inherited;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmClient := TdmClient.Create(self);
  dmAux := TdmAux.Create(self);

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

  pcClient.ActivePageIndex := 0;
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsClientInfo);
  LoadPhoto;
end;

function TfrmClientMain.Save: boolean;
var
  st: IStatus;
  error: string;
begin
  Result := false;

  try
    if Supports(Application.MainForm,IStatus,st) then
    begin
      error := '';

      case pcClient.ActivePageIndex of

        CLIENT: error := CheckClientInfo(st);
        IDENT : error := CheckIdentInfo(st);

      end;

      Result := error = '';

      if Result then
      begin
        cln.Birthdate := dtpBirthdate.Date;
        cln.Save;
        SetClientName;
      end;
    end;
  finally

  end;
end;

procedure TfrmClientMain.Cancel;
begin
  cln.Cancel;
  SetUnboundControls;
end;

procedure TfrmClientMain.SetClientName;
begin
  with dmClient.dstPersonalInfo do
  begin
    lblClientName.Caption := UpperCase(FieldByName('lastname').AsString + ', ' +
        FieldByName('firstname').AsString + '   ' +
        FieldByName('entity_id').AsString);

    ChangeControlState;
  end;
end;

procedure TfrmClientMain.SetUnboundControls;
begin
  // birthdate
  if cln.BirthdateStr <> '' then
    dtpBirthdate.Date := Parsedate(cln.BirthdateStr)
  else
    dtpBirthdate.Date := Date;

  GetAge;

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

procedure TfrmClientMain.urlTakePhotoClick(Sender: TObject);
begin
  inherited;
  PhotoLauncher.Parameters := '_photo\ ' + cln.Id;
  PhotoLauncher.Launch;
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

procedure TfrmClientMain.dtpBirthdateChange(Sender: TObject);
begin
  inherited;
  GetAge;
end;

procedure TfrmClientMain.dtpExpiryChange(Sender: TObject);
begin
  inherited;
  identDoc.Expiry := dtpExpiry.Date;
end;

procedure TfrmClientMain.edIdNoChange(Sender: TObject);
var
  inserting: boolean;
begin
  // this is a hack
  inserting := grIdentityList.DataSource.DataSet.State = dsInsert;

  if (not inserting) and Assigned(identDoc) then
    SetIdentUnboundControls;
end;

procedure TfrmClientMain.GetAge;
var
  Month, Day, Year, CurrentYear, CurrentMonth, CurrentDay: Word;
  age: integer;
begin
  DecodeDate(dtpBirthdate.Date, Year, Month, Day);
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

  edAge.Text := IntToStr(age);
end;

procedure TfrmClientMain.PhotoLauncherFinished(Sender: TObject);
begin
  inherited;
  LoadPhoto;
end;

procedure TfrmClientMain.LoadPhoto;
var
  filename: string;
begin
  filename := '_photo\' + cln.Id + '.bmp';

  if FileExists(fileName) then
    imgClient.Picture.LoadFromFile(fileName);
end;

procedure TfrmClientMain.pcClientChange(Sender: TObject);
begin
  case pcClient.ActivePageIndex of
    IDENT:
      begin
        OpenGridDataSources(pnlIdentity);
        OpenDropdownDataSources(tsIdentDetail);
        ChangeIdentControlState;
        SetIdentUnboundControls;
      end;
  end;
end;

procedure TfrmClientMain.pcClientChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := cln.HasId;
end;

procedure TfrmClientMain.ChangeControlState;
begin
  edLastName.ReadOnly := cln.HasId;
  edFirstName.ReadOnly := cln.HasId;
  edMiddleName.ReadOnly := cln.HasId;
end;

procedure TfrmClientMain.ChangeIdentControlState;
var
  inserting: boolean;
begin
  inserting := grIdentityList.DataSource.DataSet.State = dsInsert;
  cmbIdType.Enabled := inserting;
end;

procedure TfrmClientMain.SetIdentUnboundControls;
begin
  if Assigned(identDoc) and (identDoc.ExpiryStr <> '') then
    dtpExpiry.Date := ParseDate(identDoc.ExpiryStr)
  else
    dtpExpiry.Date := Date;

  dtpExpiry.Enabled := not identDoc.HasExpiry;
  chbNonExpiring.Checked := not identDoc.HasExpiry;
end;

end.
