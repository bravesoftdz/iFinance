unit LoanApprovalDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls,
  Vcl.DBCtrls, RzDBEdit, RzDBCmbo, Vcl.Mask, RzEdit, RzButton, RzTabs, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLoanAppvDetail = class(TfrmBasePopupDetail)
    edAppvTerm: TRzDBNumericEdit;
    edAppvAmount: TRzDBNumericEdit;
    dteDateApproved: TRzDBDateTimeEdit;
    dbluAppvMethod: TRzDBLookupComboBox;
    mmRemarks: TRzDBMemo;
    urlRecommendedAmount: TRzURLLabel;
    urlDesiredTerm: TRzURLLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblAppliedAmount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure urlRecommendedAmountClick(Sender: TObject);
    procedure urlDesiredTermClick(Sender: TObject);
  private
    { Private declarations }
    function ConfirmApproval: string;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLoanAppvDetail: TfrmLoanAppvDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, Loan, FormsUtil, IFinanceDialogs, Assessment, IFinanceGlobal;

procedure TfrmLoanAppvDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);

  // applied amount
  lblAppliedAmount.Caption := FormatCurr('###,##0.00',ln.AppliedAmount);
  // recommended amount
  urlRecommendedAmount.Caption := FormatCurr('###,##0.00',ln.Assessment.RecommendedAmount);
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
  if (ln.Action = laApproving) and (ln.IsAssessed) and (ln.Assessment.Recommendation = rcApprove) then
    edAppvAmount.Value := ln.Assessment.RecommendedAmount;
end;

procedure TfrmLoanAppvDetail.BindToObject;
begin
  inherited;

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
  else if edAppvTerm.Value > ln.LoanClass.Term then
    error := 'Approved term exceeds the maximum term set for the selected loan class.'
  else if edAppvAmount.Value > ln.LoanClass.MaxLoan then
    error := 'Approved amount exceeds the maximum loanable amount for the selected loan class.'
  else if edAppvAmount.Value > ifn.User.CreditLimit then
    error := 'Approved amount exceeds YOUR approved credit limit.'
  else if edAppvAmount.Value > ln.Assessment.RecommendedAmount then
    error := ConfirmApproval;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

function TfrmLoanAppvDetail.ConfirmApproval: string;
var
  msg: string;
begin
  msg := 'Amount to be approved is greater than the recommended amount. Do you want to proceed?';

  if ShowDecisionBox(msg) = mrYes then Result := ''
  else Result := 'Approving process cancelled.';
end;

end.
