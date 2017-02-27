unit LoanClassificationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzButton, RzRadChk,
  RzDBChk, Vcl.DBCtrls, RzDBCmbo, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  JvExControls, JvLabel, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, SaveIntf, RzLstBox, RzChkLst, NewIntf, RzCmboBx,
  RzGrids;

type
  TfrmLoanClassificationList = class(TfrmBaseDocked,ISave,INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edClassName: TRzDBEdit;
    dbluLoanType: TRzDBLookupComboBox;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    edTerm: TRzDBEdit;
    JvLabel5: TJvLabel;
    edComakers: TRzDBEdit;
    JvLabel6: TJvLabel;
    dbluGroup: TRzDBLookupComboBox;
    JvLabel7: TJvLabel;
    dbluCompMethod: TRzDBLookupComboBox;
    edInterest: TRzDBNumericEdit;
    JvLabel8: TJvLabel;
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
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    JvLabel14: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    Label1: TLabel;
    cmbBranch: TRzComboBox;
    pnlCharges: TRzPanel;
    grCharges: TRzDBGrid;
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    btnAddCharge: TRzShapeButton;
    RzPanel2: TRzPanel;
    btnRemoveCharge: TRzShapeButton;
    cbxNew: TRzCheckBox;
    cbxRenewal: TRzCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure urlRefreshListClick(Sender: TObject);
    procedure dbluGroupClick(Sender: TObject);
    procedure grChargesDblClick(Sender: TObject);
    procedure sbtnNewClick(Sender: TObject);
    procedure btnAddChargesClick(Sender: TObject);
    procedure btnRemoveChargeClick(Sender: TObject);
    procedure cbxNewClick(Sender: TObject);
    procedure cbxRenewalClick(Sender: TObject);
    procedure dbluBranchClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState;
    procedure FilterCharges;
    function EntryIsValid: boolean;
    function ConfirmDate: string;
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
  LoanType, LoanClassification;

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

procedure TfrmLoanClassificationList.FilterCharges;
var
  filter: string;
  filters: TStringList;
  i, cnt: integer;
begin
  filters := TStringList.Create;

  if cbxNew.Checked then filters.Add('(for_new = 1)');
  if cbxRenewal.Checked then filters.Add('(for_renew = 1)');

  cnt := filters.Count - 1;

  for i := 0 to cnt do
  begin
    filter := filter + filters[i];

    if i < filters.Count - 1 then filter := filter + ' or ';
  end;

  grCharges.DataSource.DataSet.Filter := filter;

  filters.Free;
end;

procedure TfrmLoanClassificationList.sbtnNewClick(Sender: TObject);
begin
  New;
end;

procedure TfrmLoanClassificationList.New;
begin
  grList.DataSource.DataSet.Append;
  ChangeControlState;

  // focus the first control
  dbluBranch.SetFocus;;
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
  end;
end;

procedure TfrmLoanClassificationList.cbxNewClick(Sender: TObject);
begin
  FilterCharges;
end;

procedure TfrmLoanClassificationList.cbxRenewalClick(Sender: TObject);
begin
  FilterCharges;
end;

procedure TfrmLoanClassificationList.dbluBranchClick(Sender: TObject);
begin
  inherited;
  // filter groups
  with dbluGroup.ListSource.DataSet do
  begin
    Filter := 'loc_code = ''' + dbluBranch.GetKeyValue + '''';
    Filtered := true;
  end;
end;

procedure TfrmLoanClassificationList.dbluGroupClick(Sender: TObject);
begin
  inherited;
  if dbluGroup.DataSource.DataSet.State in [dsInsert,dsEdit] then
    edClassName.Text := dbluGroup.Text;
end;

function TfrmLoanClassificationList.EntryIsValid: boolean;
var
  error: string;
begin
  if dbluBranch.Text = '' then error := 'Please select a branch.'
  else if Trim(dbluGroup.Text) = '' then error := 'Please select a group.'
  else if Trim(edClassName.Text) = '' then error := 'Please enter a class name.'
  else if dbluLoanType.Text = '' then error := 'Please select a loan type.'
  else if edInterest.Text = '' then error := 'Please enter an interest rate.'
  else if edTerm.Text = '' then error := 'Please enter a term.'
  else if edMaxLoan.Value <= 0 then error := 'Please enter a maximum loan.'
  else if dbluCompMethod.Text = '' then error := 'Please select a computation method.'
  else if dbluPayFreq.Text = '' then error := 'Please select a payment frequency.'
  else if dteFrom.Text = '' then error := 'Please specify a start date.'
  else if edMaxLoan.Value > ltype.MaxTotalAmount then
    error := 'Maximum loan exceeds the maximum total amount for the selected loan type.'
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
  OpenGridDataSources(pnlCharges);

  PopulateBranchComboBox(cmbBranch);

  ChangeControlState;
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

procedure TfrmLoanClassificationList.btnRemoveChargeClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected loan class charge?';
var
  cgType: string;
begin

  with TfrmDecisionBox.Create(nil, CONF) do
  begin
    try
      if grCharges.DataSource.DataSet.RecordCount > 0 then
      begin
        cgType := grCharges.DataSource.DataSet.FieldByName('charge_type').AsString;

        ShowModal;

        if ModalResult = mrYes then
        begin
          grCharges.DataSource.DataSet.Delete;
          lnc.RemoveClassCharge(cgType);
        end;

        Free;
      end;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanClassificationList.btnAddChargesClick(Sender: TObject);
begin
  inherited;
  with TfrmLoanClassChargeDetail.Create(nil) do
  begin
    try
      grCharges.DataSource.DataSet.Append;
      ShowModal;
      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanClassificationList.ChangeControlState;
begin
  with grList.DataSource.DataSet do
  begin
    btnAddCharge.Enabled := State <> dsInsert;
    btnRemoveCharge.Enabled := State <> dsInsert;
  end;
end;

end.
