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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  end;

var
  frmMonthlyExpDetail: TfrmMonthlyExpDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, FormsUtil, Loan, MonthlyExpense, IFinanceDialogs;

procedure TfrmMonthlyExpDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmMonthlyExpDetail.FormShow(Sender: TObject);
begin
  inherited;
  // disable type on editing
  dbluType.Enabled := dbluType.DataSource.DataSet.State = dsInsert;
end;

procedure TfrmMonthlyExpDetail.Save;
var
  expType, expName, expAmount: string;
begin
  with dmLoan.dstMonExp do
  begin
    if State in [dsInsert,dsEdit] then
      Post;

    expType := FieldByName('exp_type').AsString;
    expName := dbluType.Text;
    expAmount := edMonthly.Text;

    ln.AddMonthlyExpense(TMonthlyExpense.Create(expType,expName,expAmount),true);
  end;
end;

procedure TfrmMonthlyExpDetail.BindToObject;
begin
  inherited;

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

  if not Result then ShowErrorBox(error);
end;

end.
