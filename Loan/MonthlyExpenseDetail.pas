unit MonthlyExpenseDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel, DB;

type
  TfrmMonthlyExpDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbluType: TRzDBLookupComboBox;
    edMonthly: TRzDBNumericEdit;
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
  frmMonthlyExpDetail: TfrmMonthlyExpDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, FormsUtil, Loan;

procedure TfrmMonthlyExpDetail.FormShow(Sender: TObject);
begin
  inherited;
  // disable type on editing
  dbluType.Enabled := dbluType.DataSource.DataSet.State = dsInsert;
end;

procedure TfrmMonthlyExpDetail.Save;
begin
  with dmLoan.dstMonExp do
    if State in [dsInsert,dsEdit] then
      Post;
end;

procedure TfrmMonthlyExpDetail.Cancel;
begin
  with dmLoan.dstMonExp do
    if State in [dsInsert,dsEdit] then
      Cancel;
end;

function TfrmMonthlyExpDetail.ValidEntry: boolean;
var
  error: string;
begin
  with dmLoan.dstMonExp do
  begin
    if Trim(dbluType.Text) = '' then
      error := 'Please select a type.'
    else if Trim(edMonthly.Text) = '' then
      error := 'Please enter monthly amount.'
    else if (State = dsInsert) and (ln.MonthlyExpenseExists(dbluType.GetKeyValue)) then
      error := 'Expense already exists.';
  end;

  Result := error = '';

  lblStatus.Caption := error;
  lblStatus.Visible := not Result;
end;

end.
