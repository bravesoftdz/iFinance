unit LoanApprovalDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls,
  Vcl.DBCtrls, RzDBEdit, RzDBCmbo, Vcl.Mask, RzEdit, JvExControls, JvLabel,
  RzButton, RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLoanAppvDetail = class(TfrmBasePopupDetail)
    JvLabel8: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel10: TJvLabel;
    edAppvTerm: TRzDBNumericEdit;
    edAppvAmount: TRzDBNumericEdit;
    dteDateApproved: TRzDBDateTimeEdit;
    JvLabel24: TJvLabel;
    JvLabel16: TJvLabel;
    dbluAppvMethod: TRzDBLookupComboBox;
    mmRemarks: TRzDBMemo;
    JvLabel1: TJvLabel;
    urlRecommendedAmount: TRzURLLabel;
    JvLabel2: TJvLabel;
    urlDesiredTerm: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure urlRecommendedAmountClick(Sender: TObject);
    procedure urlDesiredTermClick(Sender: TObject);
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
  frmLoanAppvDetail: TfrmLoanAppvDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, Loan, FormsUtil, IFinanceDialogs;

procedure TfrmLoanAppvDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);

  // recommended amount
  urlRecommendedAmount.Caption := FormatFloat('###,##0.00',ln.RecommendedAmount);
  // desired term
  urlDesiredTerm.Caption := IntToStr(ln.DesiredTerm);
end;

procedure TfrmLoanAppvDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanAppvDetail.urlDesiredTermClick(Sender: TObject);
begin
  inherited;
  if (ln.Action = laApproving) and (ln.IsAssessed) then edAppvTerm.Value := ln.DesiredTerm;
end;

procedure TfrmLoanAppvDetail.urlRecommendedAmountClick(Sender: TObject);
begin
  inherited;
  if (ln.Action = laApproving) and (ln.IsAssessed) then edAppvAmount.Value := ln.RecommendedAmount;
end;

procedure TfrmLoanAppvDetail.Cancel;
begin
  ln.Cancel;
end;

function TfrmLoanAppvDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteDateApproved.Text = '' then
    error := 'Please enter date approved.'
  else if edAppvAmount.Value <= 0 then
    error := 'Invalid value for approved amount.'
  else if edAppvTerm.Value <= 0 then
    error := 'Invalid value for approved term.'
  else if dbluAppvMethod.Text = '' then
    error := 'Please select approval method.'
  else if edAppvTerm.Value > ln.DesiredTerm then
    error := 'Approved term exceeds the desired term.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
