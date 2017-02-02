unit FinInfoDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel, RzButton,
  RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, DB;

type
  TfrmFinInfoDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbluCompany: TRzDBLookupComboBox;
    edMonthly: TRzDBNumericEdit;
    JvLabel3: TJvLabel;
    edBalance: TRzDBNumericEdit;
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
  frmFinInfoDetail: TfrmFinInfoDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, FormsUtil, Loan, FinInfo, IFinanceDialogs;

procedure TfrmFinInfoDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmFinInfoDetail.FormShow(Sender: TObject);
begin
  inherited;
  // disable company on editing
  dbluCompany.Enabled := dbluCompany.DataSource.DataSet.State = dsInsert;
end;

procedure TfrmFinInfoDetail.Save;
var
  compId: integer;
  compName, balance, monthly: string;
begin
  with dmLoan.dstFinInfo do
  begin
    if State in [dsInsert,dsEdit] then
      Post;

    compId := FieldByName('comp_id').AsInteger;
    compName := dbluCompany.Text;
    balance := edBalance.Text;
    monthly := edMonthly.Text;

    ln.AddFinancialInfo(TFinInfo.Create(compId,compName,monthly,balance),true);
  end;
end;

procedure TfrmFinInfoDetail.Cancel;
begin
  with dmLoan.dstFinInfo do
    if State in [dsInsert,dsEdit] then
      Cancel;
end;

function TfrmFinInfoDetail.ValidEntry: boolean;
var
  error: string;
begin
  with dmLoan.dstFinInfo do
  begin
    if Trim(dbluCompany.Text) = '' then
      error := 'Please select a company.'
    else if Trim(edMonthly.Text) = '' then
      error := 'Please enter monthly due.'
    else if Trim(edBalance.Text) = '' then
      error := 'Please enter balance.'
    else if (State = dsInsert) and (ln.FinancialInfoExists(StrToInt(dbluCompany.GetKeyValue))) then
      error := 'Financial information already exists.';
  end;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
