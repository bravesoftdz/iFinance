unit PaymentDetail;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  JvExControls, JvLabel, Vcl.Mask, RzEdit, Vcl.DBCtrls, RzDBCmbo, RzCmboBx,
  Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzRadChk, DateUtils;

type
  TfrmPaymentDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    lblLoanId: TJvLabel;
    lblType: TJvLabel;
    lblAccount: TJvLabel;
    lblLoanBalance: TJvLabel;
    edPrincipal: TRzNumericEdit;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    edInterest: TRzNumericEdit;
    lblTotal: TJvLabel;
    JvLabel8: TJvLabel;
    edPenalty: TRzNumericEdit;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    urlPrincipalDue: TRzURLLabel;
    urlInterestTotalDue: TRzURLLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    lblInterestBalance: TJvLabel;
    lblInterestDue: TJvLabel;
    cbxFullPayment: TRzCheckBox;
    JvLabel7: TJvLabel;
    lblLastTransaction: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edPrincipalChange(Sender: TObject);
    procedure edInterestChange(Sender: TObject);
    procedure edPenaltyChange(Sender: TObject);
    procedure urlPrincipalDueClick(Sender: TObject);
    procedure urlInterestTotalDueClick(Sender: TObject);
    procedure cbxFullPaymentClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTotalAmount;
    procedure GetFullPayment;
    procedure SetLoanDetails;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmPaymentDetail: TfrmPaymentDetail;

implementation

{$R *.dfm}

uses
  Payment, IFinanceDialogs, FormsUtil;

procedure TfrmPaymentDetail.cbxFullPaymentClick(Sender: TObject);
begin
  inherited;
  GetFullPayment;
end;

procedure TfrmPaymentDetail.edInterestChange(Sender: TObject);
begin
  inherited;
  pmt.Details[pmt.DetailCount-1].Interest := edInterest.Value;
  SetTotalAmount;
end;

procedure TfrmPaymentDetail.edPenaltyChange(Sender: TObject);
begin
  inherited;
  pmt.Details[pmt.DetailCount-1].Penalty := edPenalty.Value;
  SetTotalAmount;
end;

procedure TfrmPaymentDetail.edPrincipalChange(Sender: TObject);
begin
  inherited;
  pmt.Details[pmt.DetailCount-1].Principal := edPrincipal.Value;
  SetTotalAmount;
end;

procedure TfrmPaymentDetail.FormCreate(Sender: TObject);
begin
  SetLoanDetails;
end;

procedure TfrmPaymentDetail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then Save; // enter key
end;

procedure TfrmPaymentDetail.GetFullPayment;
var
  i: integer;
begin
  i := pmt.Client.IndexOf(pmt.Details[pmt.DetailCount-1].Loan);

  if cbxFullPayment.Checked then
  begin
    edPrincipal.Value := pmt.Client.ActiveLoans[i].Balance;
    edInterest.Value := pmt.Client.ActiveLoans[i].FullPaymentInterest +
      pmt.Client.ActiveLoans[i].InterestTotalDue;
  end
  else
  begin
    edPrincipal.Clear;
    edInterest.Clear;
  end;

  pmt.Details[pmt.DetailCount-1].IsFullPayment := cbxFullPayment.Checked;

  edPrincipal.Enabled := not cbxFullPayment.Checked;
  edInterest.Enabled := not cbxFullPayment.Checked;

  urlPrincipalDue.Enabled := not cbxFullPayment.Checked;
  urlInterestTotalDue.Enabled := not cbxFullPayment.Checked;

  SetLoanDetails;
end;

procedure TfrmPaymentDetail.Save;
begin

end;

procedure TfrmPaymentDetail.Cancel;
var
  detail: TPaymentDetail;
begin
  detail := pmt.Details[pmt.DetailCount-1];
  pmt.RemoveDetail(detail.Loan);
end;

procedure TfrmPaymentDetail.SetTotalAmount;
var
  amount: real;
begin
  with lblTotal do
  begin
    amount := pmt.Details[pmt.DetailCount-1].TotalAmount;

    // change colour
    if amount < 0 then Color := clRed else Color := clBlack;

    Caption := 'Total amount: ' + FormatFloat('###,###,##0.00',amount);
  end;
end;

procedure TfrmPaymentDetail.urlInterestTotalDueClick(Sender: TObject);
begin
  inherited;
  edInterest.Text := urlInterestTotalDue.Caption;
end;

procedure TfrmPaymentDetail.urlPrincipalDueClick(Sender: TObject);
begin
  inherited;
  edPrincipal.Text := urlPrincipalDue.Caption;
end;

function TfrmPaymentDetail.ValidEntry: boolean;
var
  error: string;
  LDetail: TPaymentDetail;
begin
  LDetail := pmt.Details[pmt.DetailCount-1];

  if LDetail.Principal < 0 then error := 'Invalid value for principal.'
  else if LDetail.Interest < 0 then error := 'Invalid value for interest.'
  else if LDetail.TotalAmount <= 0 then error := 'No amount entered.'
  else if LDetail.Principal > LDetail.Loan.Balance then
    error := 'Principal amount is greater than to the loan balance.'
  else if (not LDetail.IsFullPayment) and (LDetail.Interest > LDetail.Loan.InterestTotalDue) then
    error := 'Interest amount is greater than the total interest due.'
  else if (not LDetail.IsFullPayment) and (LDetail.Principal > LDetail.Loan.Balance) then
    error :=  'Principal amount is equal to the loan balance. If this is a full payment posting, tick the FULL PAYMENT box instead.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmPaymentDetail.SetLoanDetails;
var
  i: integer;
begin
  i := pmt.Client.IndexOf(pmt.Details[pmt.DetailCount-1].Loan);

  // get the ledger
  pmt.Client.ActiveLoans[i].RetrieveLedger;
  pmt.Client.ActiveLoans[i].GetPaymentDue(pmt.Date);

  // set labels
  lblLoanId.Caption := pmt.Client.ActiveLoans[i].Id;
  lblType.Caption := pmt.Client.ActiveLoans[i].LoanTypeName;
  lblAccount.Caption := pmt.Client.ActiveLoans[i].AccountTypeName;
  lblLoanBalance.Caption := FormatFloat('###,###,##0.00', pmt.Client.ActiveLoans[i].Balance);
  lblInterestBalance.Caption := FormatFloat('###,###,##0.00;-;-', pmt.Client.ActiveLoans[i].InterestBalance);

  if pmt.Details[pmt.DetailCount-1].IsFullPayment then
    lblInterestDue.Caption := FormatFloat('###,###,##0.00;-;-', pmt.Client.ActiveLoans[i].FullPaymentInterest)
  else
    lblInterestDue.Caption := FormatFloat('###,###,##0.00;-;-', pmt.Client.ActiveLoans[i].InterestDue);

  lblLastTransaction.Caption := FormatDateTime('mm/dd/yyyy', pmt.Client.ActiveLoans[i].LastTransactionDate);

  urlPrincipalDue.Caption := FormatFloat('###,###,##0.00', pmt.Client.ActiveLoans[i].PrincipalDue);
  urlInterestTotalDue.Caption := FormatFloat('###,###,##0.00', pmt.Client.ActiveLoans[i].InterestTotalDue);
end;

end.
