unit LoanClassChargeDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel, Vcl.DBCtrls, RzDBCmbo, DB, RzRadGrp,
  RzDBRGrp, RzRadChk, RzDBChk;

type
  TfrmLoanClassChargeDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    rbgValueType: TRzDBRadioGroup;
    dbluType: TRzDBLookupComboBox;
    edValue: TRzDBNumericEdit;
    JvLabel3: TJvLabel;
    edRatio: TRzDBNumericEdit;
    edMaximum: TRzDBNumericEdit;
    JvLabel4: TJvLabel;
    RzGroupBox2: TRzGroupBox;
    chbForNew: TRzDBCheckBox;
    chbForRenewal: TRzDBCheckBox;
    chbForRestructure: TRzDBCheckBox;
    chbForReloan: TRzDBCheckBox;
    rbgMaxValueType: TRzDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbgValueTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLoanClassChargeDetail: TfrmLoanClassChargeDetail;

implementation

{$R *.dfm}

uses
  LoansAuxData, FormsUtil, LoanClassification, IFinanceDialogs, LoanClassCharge;

procedure TfrmLoanClassChargeDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmLoanClassChargeDetail.FormShow(Sender: TObject);
begin
  inherited;
  // disable type on editing
  dbluType.Enabled := dbluType.DataSource.DataSet.State = dsInsert;
end;

procedure TfrmLoanClassChargeDetail.rbgValueTypeChange(Sender: TObject);
begin
  inherited;
  edRatio.Enabled := TValueType(rbgValueType.ItemIndex) = vtRatio;
  edMaximum.Enabled := TValueType(rbgValueType.ItemIndex) = vtRatio;
  rbgMaxValueType.Enabled := TValueType(rbgValueType.ItemIndex) = vtRatio;
end;

procedure TfrmLoanClassChargeDetail.Save;
begin
  with dmLoansAux.dstClassCharges do
    if State in [dsInsert,dsEdit] then
      Post;
end;

procedure TfrmLoanClassChargeDetail.Cancel;
begin
  with dmLoansAux.dstClassCharges do
    if State in [dsInsert,dsEdit] then
      Cancel;
end;

function TfrmLoanClassChargeDetail.ValidEntry: boolean;
var
  error: string;
begin
  with dmLoansAux.dstClassCharges do
  begin
    if Trim(dbluType.Text) = '' then
      error := 'Please select a type.'
    else if (State = dsInsert) and (lnc.ClassChargeExists(dbluType.GetKeyValue,
        chbForNew.Checked,chbForRenewal.Checked,
        chbForRestructure.Checked,chbForReloan.Checked)) then
      error := 'Type already exists.'
    else if Trim(edValue.Text) = '' then
      error := 'Please enter a value.'
    else if edValue.Value <= 0 then
      error := 'Invalid value entered.'
    else if rbgValueType.ItemIndex = Integer(vtRatio) then
    begin
      if Trim(edRatio.Text) = '' then
        error := 'Please enter a ratio.'
      else if edRatio.Value <= 0 then
        error := 'Invalid ratio entered.'
      else if Trim(edMaximum.Text) = '' then
        error := 'Please enter a maximum.'
      else if edMaximum.Value <= 0 then
        error := 'Invalid maximum entered.'
      else if rbgMaxValueType.ItemIndex = -1 then
        error := 'Please select maximum type.';
    end
    else if (not chbForNew.Checked) and (not chbForRenewal.Checked) then
      error := 'No loan applicability selected.';
  end;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
