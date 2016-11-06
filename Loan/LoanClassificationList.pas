unit LoanClassificationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzButton, RzRadChk,
  RzDBChk, Vcl.DBCtrls, RzDBCmbo, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  JvExControls, JvLabel, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, SaveIntf, RzLstBox, RzChkLst, JvGroupHeader;

type
  TfrmLoanClassificationList = class(TfrmBaseDocked,ISave)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edClassName: TRzDBEdit;
    dbluLoanType: TRzDBLookupComboBox;
    btnNew: TRzButton;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    edTerm: TRzDBEdit;
    JvLabel5: TJvLabel;
    edComakers: TRzDBEdit;
    urlRefreshList: TRzURLLabel;
    JvLabel6: TJvLabel;
    dbluGroup: TRzDBLookupComboBox;
    JvLabel7: TJvLabel;
    dbluCompMethod: TRzDBLookupComboBox;
    edInterest: TRzDBNumericEdit;
    JvLabel8: TJvLabel;
    edMaxLoan: TRzDBNumericEdit;
    JvLabel9: TJvLabel;
    dbluAcctType: TRzDBLookupComboBox;
    JvGroupHeader4: TJvGroupHeader;
    grCharges: TRzDBGrid;
    dbluBranch: TRzDBLookupComboBox;
    btnAddCharge: TRzButton;
    btnRemoveCharge: TRzButton;
    JvLabel10: TJvLabel;
    dteFrom: TRzDBDateTimeEdit;
    dteUntil: TRzDBDateTimeEdit;
    procedure btnNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure urlRefreshListClick(Sender: TObject);
    procedure dbluGroupClick(Sender: TObject);
    procedure btnAddChargeClick(Sender: TObject);
    procedure grChargesDblClick(Sender: TObject);
    procedure btnRemoveChargeClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState;
    function EntryIsValid: boolean;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmLoanClassificationList: TfrmLoanClassificationList;

implementation

{$R *.dfm}

uses
  LoansAuxData, FormsUtil, StatusIntf, AuxData, LoanClassChargeDetail, DecisionBox,
  LoanClassification;

procedure TfrmLoanClassificationList.btnAddChargeClick(Sender: TObject);
begin
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

procedure TfrmLoanClassificationList.btnNewClick(Sender: TObject);
begin
  inherited;
  grList.DataSource.DataSet.Append;
  ChangeControlState;
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
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(dbluGroup.Text) = '' then
    begin
      error := 'Please select a group.';
      st.ShowError(error);
    end
    else if Trim(edClassName.Text) = '' then
    begin
      error := 'Please enter a class name.';
      st.ShowError(error);
    end
    else if dbluLoanType.Text = '' then
    begin
      error := 'Please select a loan type.';
      st.ShowError(error);
    end
    else if dbluAcctType.Text = '' then
    begin
      error := 'Please select an account type.';
      st.ShowError(error);
    end
    else if edInterest.Text = '' then
    begin
      error := 'Please enter an interest rate.';
      st.ShowError(error);
    end
    else if edTerm.Text = '' then
    begin
      error := 'Please enter a term.';
      st.ShowError(error);
    end

  end;

  Result := error = '';
end;

procedure TfrmLoanClassificationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(tsDetail,false);
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

  OpenDropdownDataSources(tsDetail);
  OpenGridDataSources(pnlList);

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

procedure TfrmLoanClassificationList.ChangeControlState;
begin
  with grList.DataSource.DataSet do
  begin
    btnAddCharge.Enabled := State <> dsInsert;
    btnRemoveCharge.Enabled := State <> dsInsert;
  end;
end;

end.
