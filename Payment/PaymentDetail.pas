unit PaymentDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  JvExControls, JvLabel, Vcl.Mask, RzEdit;

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
    edAmount: TRzNumericEdit;
    JvLabel5: TJvLabel;
    procedure FormCreate(Sender: TObject);
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
  frmPaymentDetail: TfrmPaymentDetail;

implementation

{$R *.dfm}

uses
  Payment, IFinanceDialogs;

procedure TfrmPaymentDetail.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  // set labels
  i := pmt.Client.ActiveLoansCount - 1;

  lblLoanId.Caption := pmt.Client.ActiveLoans[i].Id;
  lblType.Caption := pmt.Client.ActiveLoans[i].LoanTypeName;
  lblAccount.Caption := pmt.Client.ActiveLoans[i].AccountTypeName;
  lblBalance.Caption := FormatFloat('###,###,##0.00',pmt.Client.ActiveLoans[i].Balance);
end;

procedure TfrmPaymentDetail.Save;
var
  detail: TPaymentDetail;
begin
  detail := pmt.Details[pmt.DetailCount-1];
  detail.Amount := edAmount.Value;
  ModalResult := mrOK;
end;

procedure TfrmPaymentDetail.Cancel;
var
  detail: TPaymentDetail;
begin
  detail := pmt.Details[pmt.DetailCount-1];
  pmt.RemoveDetail(detail.Loan);
end;

function TfrmPaymentDetail.ValidEntry: boolean;
var
  error: string;
begin
  if edAmount.Value <= 0 then error := 'Invalid value for amount.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

end.
