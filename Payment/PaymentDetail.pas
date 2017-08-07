unit PaymentDetail;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  JvExControls, JvLabel, Vcl.Mask, RzEdit, Vcl.DBCtrls, RzDBCmbo, RzCmboBx;

type
  TfrmPaymentDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    lblLoanId: TJvLabel;
    lblType: TJvLabel;
    lblAccount: TJvLabel;
    lblBalance: TJvLabel;
    edPrincipal: TRzNumericEdit;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    edInterest: TRzNumericEdit;
    lblTotal: TJvLabel;
    JvLabel8: TJvLabel;
    edPenalty: TRzNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edPrincipalChange(Sender: TObject);
    procedure edInterestChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetTotalAmount;
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

procedure TfrmPaymentDetail.edInterestChange(Sender: TObject);
begin
  inherited;
  pmt.Details[pmt.DetailCount-1].Interest := edInterest.Value;
  SetTotalAmount;
end;

procedure TfrmPaymentDetail.edPrincipalChange(Sender: TObject);
begin
  inherited;
  pmt.Details[pmt.DetailCount-1].Principal := edPrincipal.Value;
  SetTotalAmount;
end;

procedure TfrmPaymentDetail.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  // set labels
  i := pmt.Client.IndexOf(pmt.Details[pmt.DetailCount-1].Loan);

  lblLoanId.Caption := pmt.Client.ActiveLoans[i].Id;
  lblType.Caption := pmt.Client.ActiveLoans[i].LoanTypeName;
  lblAccount.Caption := pmt.Client.ActiveLoans[i].AccountTypeName;
  lblBalance.Caption := FormatFloat('###,###,##0.00',pmt.Client.ActiveLoans[i].Balance);
end;

procedure TfrmPaymentDetail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then Save; // enter key
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

function TfrmPaymentDetail.ValidEntry: boolean;
var
  error: string;
begin
  if pmt.Details[pmt.DetailCount-1].Principal < 0 then error := 'Invalid value for principal.'
  else if pmt.Details[pmt.DetailCount-1].Interest < 0 then error := 'Invalid value for interest.'
  else if pmt.Details[pmt.DetailCount-1].TotalAmount <= 0 then error := 'No amount entered.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

end.
