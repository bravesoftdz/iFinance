unit LoanClassChargeDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel, RzRadGrp, RzDBRGrp, Vcl.DBCtrls,
  RzDBCmbo, DB;

type
  TfrmLoanClassChargeDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    rbgValueType: TRzDBRadioGroup;
    dbluType: TRzDBLookupComboBox;
    edValue: TRzDBNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  LoansAuxData, FormsUtil, LoanClassification;

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
    else if Trim(edValue.Text) = '' then
      error := 'Please enter a value.'
    else if edValue.Value <= 0 then
      error := 'Invalid value entered.'
    else if (State = dsInsert) and (lnc.ClassChargeExists(dbluType.GetKeyValue)) then
      error := 'Type already exists.';
  end;


  Result := error = '';

  lblStatus.Caption := error;
  lblStatus.Visible := not Result;
end;

end.
