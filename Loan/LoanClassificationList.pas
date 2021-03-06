unit LoanClassificationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzButton, RzRadChk,
  RzDBChk, Vcl.DBCtrls, RzDBCmbo, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  JvExControls, JvLabel, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, SaveIntf, RzLstBox, RzChkLst, NewIntf, RzCmboBx,
  RzGrids, RzBtnEdt, RzRadGrp, RzDBRGrp;

type
  TfrmLoanClassificationList = class(TfrmBaseDocked,ISave,INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    JvLabel1: TJvLabel;
    edClassName: TRzDBEdit;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    edTerm: TRzDBEdit;
    JvLabel5: TJvLabel;
    edComakersMin: TRzDBEdit;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    dbluCompMethod: TRzDBLookupComboBox;
    edInterest: TRzDBNumericEdit;
    edMaxLoan: TRzDBNumericEdit;
    JvLabel9: TJvLabel;
    dbluBranch: TRzDBLookupComboBox;
    JvLabel10: TJvLabel;
    dteFrom: TRzDBDateTimeEdit;
    dteUntil: TRzDBDateTimeEdit;
    JvLabel12: TJvLabel;
    dbluPayFreq: TRzDBLookupComboBox;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    JvLabel14: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    Label1: TLabel;
    cmbBranch: TRzComboBox;
    bteGroup: TRzButtonEdit;
    pnlActivate: TRzPanel;
    sbtnActivate: TRzShapeButton;
    RzPanel3: TRzPanel;
    RzShapeButton1: TRzShapeButton;
    JvLabel11: TJvLabel;
    JvLabel13: TJvLabel;
    edComakersMax: TRzDBEdit;
    JvLabel2: TJvLabel;
    JvLabel8: TJvLabel;
    urlClassCharges: TRzURLLabel;
    urlAdvancePayment: TRzURLLabel;
    rbgDiminishingType: TRzDBRadioGroup;
    JvLabel15: TJvLabel;
    edMaxAdvancePayment: TRzDBNumericEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure urlRefreshListClick(Sender: TObject);
    procedure grChargesDblClick(Sender: TObject);
    procedure sbtnNewClick(Sender: TObject);
    procedure dbluBranchClick(Sender: TObject);
    procedure bteGroupButtonClick(Sender: TObject);
    procedure grListCellClick(Column: TColumn);
    procedure grListKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbtnActivateClick(Sender: TObject);
    procedure dbluCompMethodClick(Sender: TObject);
    procedure urlClassChargesClick(Sender: TObject);
    procedure urlAdvancePaymentClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState;
    function EntryIsValid: boolean;
    function ConfirmDate: string;
    procedure SetUnboundControls;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
    procedure New;
  end;

var
  frmLoanClassificationList: TfrmLoanClassificationList;

implementation

{$R *.dfm}

uses
  LoansAuxData, FormsUtil, IFinanceDialogs, AuxData, LoanClassChargeDetail, DecisionBox,
  LoanType, LoanClassification, Group, GroupUtils, GroupSearch, EntitiesData,
  LoanClassChargeList, LoanClassAdvancePayment;

function TfrmLoanClassificationList.Save: boolean;
begin
  Result := false;
  with grList.DataSource.DataSet do
  begin
    if EntryIsValid then
    begin
      if State in [dsInsert,dsEdit] then
      begin
        Post;
        Result := true;
        ChangeControlState;
      end;
    end
  end;
end;

function TfrmLoanClassificationList.ConfirmDate;
var
  msg: string;
begin
  msg := 'Setting the end date will restrict making any changes to this classification. Do you want to proceed?';

  if ShowWarningBox(msg) = mrYes then Result := ''
  else Result := 'Saving has been cancelled.';
end;

procedure TfrmLoanClassificationList.SetUnboundControls;
begin
  if (Assigned(lnc)) and (Assigned(lnc.Group)) then
    bteGroup.Text := lnc.Group.GroupName;
end;

procedure TfrmLoanClassificationList.sbtnActivateClick(Sender: TObject);
begin
  inherited;
  if not lnc.IsActive then ShowErrorBox('Loan class is already active.');
end;

procedure TfrmLoanClassificationList.sbtnNewClick(Sender: TObject);
begin
  New;
end;

procedure TfrmLoanClassificationList.New;
begin
  grList.DataSource.DataSet.Append;
  ChangeControlState;

  bteGroup.Clear;

  // focus the first control
  dbluBranch.SetFocus;
end;

procedure TfrmLoanClassificationList.urlAdvancePaymentClick(Sender: TObject);
begin
  with TfrmLoanClassAdvancePaymentDetail.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmLoanClassificationList.urlClassChargesClick(Sender: TObject);
begin
  with TfrmLoanClassChargeList.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmLoanClassificationList.urlRefreshListClick(Sender: TObject);
begin
  inherited;
  with grList.DataSource.DataSet do
  begin
    Close;
    Open;
  end
end;

procedure TfrmLoanClassificationList.Cancel;
begin
  with grList.DataSource.DataSet do
  begin
    if State in [dsInsert,dsEdit] then
      Cancel;

    ChangeControlState;

    SetUnboundControls;
  end;
end;

procedure TfrmLoanClassificationList.dbluBranchClick(Sender: TObject);
begin
  inherited;
  // filter groups
  with dmAux.dstGroups do
  begin
    Filter := 'loc_code = ''' + dbluBranch.GetKeyValue + '''';
    Filtered := true;
    PopulateGroupList(dmAux.dstGroups);
  end;
end;

procedure TfrmLoanClassificationList.dbluCompMethodClick(Sender: TObject);
var
  diminishing: boolean;
begin
  inherited;
  diminishing := dbluCompMethod.KeyValue = 'D';

  if not diminishing then rbgDiminishingType.Value := '0'
  else rbgDiminishingType.Value := '1';

  rbgDiminishingType.ReadOnly := not diminishing;
end;

function TfrmLoanClassificationList.EntryIsValid: boolean;
var
  error: string;
begin
  if dbluBranch.Text = '' then error := 'Please select a branch.'
  else if Trim(bteGroup.Text) = '' then error := 'Please select a group.'
  else if Trim(edClassName.Text) = '' then error := 'Please enter a class name.'
  else if edInterest.Text = '' then error := 'Please enter an interest rate.'
  else if edTerm.Text = '' then error := 'Please enter the terms of this loan class.'
  else if edMaxLoan.Value <= 0 then error := 'Please enter a maximum loan.'
  else if dbluCompMethod.Text = '' then error := 'Please select a computation method.'
  else if dbluPayFreq.Text = '' then error := 'Please select a payment frequency.'
  else if dteFrom.Text = '' then error := 'Please specify a start date.'
  // else if edMaxLoan.Value > ltype then
  //  error := 'Maximum loan exceeds the maximum total amount for the selected group.'
  else if dteUntil.Text <> '' then
  begin
    if dteUntil.Date <= dteFrom.Date then error := 'End date cannot be less than or equal to the start date.'
    else error := ConfirmDate;
  end;

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmLoanClassificationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);

  dmAux.Free;
  dmLoansAux.Free;

  inherited;
end;

procedure TfrmLoanClassificationList.FormCreate(Sender: TObject);
begin
  inherited;
  dmAux := TdmAux.Create(self);
  dmLoansAux := TdmLoansAux.Create(self);

  OpenDropdownDataSources(pnlDetail);
  OpenGridDataSources(pnlList);

  PopulateBranchComboBox(cmbBranch);

  ChangeControlState;
end;

procedure TfrmLoanClassificationList.FormShow(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmLoanClassificationList.grChargesDblClick(Sender: TObject);
begin
  with TfrmLoanClassChargeDetail.Create(nil) do
  begin
    try
      ShowModal;
      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanClassificationList.grListCellClick(Column: TColumn);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmLoanClassificationList.grListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_UP, VK_DOWN] then SetUnboundControls;
end;

procedure TfrmLoanClassificationList.bteGroupButtonClick(Sender: TObject);
begin
  inherited;
  dmEntities := TdmEntities.Create(self);

  with TfrmGroupSearch.Create(self) do
  begin
    try
      try
        grp := TGroup.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
          with grList.DataSource.DataSet do
          begin
            if State <> dsInsert then Edit;

            FieldByName('grp_id').AsString := grp.GroupId;

            bteGroup.Text := grp.GroupName;
          end;
        end;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    finally
      dmEntities.Free;
      Free;
    end;
  end;
end;

procedure TfrmLoanClassificationList.ChangeControlState;
begin
  with grList.DataSource.DataSet do
  begin
    urlClassCharges.Enabled := (State <> dsInsert) and (RecordCount > 0);
    urlAdvancePayment.Enabled := (State <> dsInsert) and (RecordCount > 0);
  end;
end;

end.
