unit LoanClassAdvancePayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzRadChk,
  Vcl.Mask, RzEdit, RzRadGrp, RzDBRGrp, DB, LoanClassAdvance, JvExControls,
  JvLabel, RzDBChk;

type
  TfrmLoanClassAdvancePaymentDetail = class(TfrmBasePopupDetail)
    edNumberOfMonths: TRzNumericEdit;
    RzGroupBox2: TRzGroupBox;
    rbgMethod: TRzDBRadioGroup;
    JvLabel14: TJvLabel;
    cbxIncludePrincipal: TRzDBCheckBox;
    procedure rbgMethodChange(Sender: TObject);
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

implementation

{$R *.dfm}

uses
  LoansAuxData, IFinanceDialogs, LoanClassification;

{ TfrmLoanClassAdvancePaymentDetail }

procedure TfrmLoanClassAdvancePaymentDetail.BindToObject;
begin
  with lnc do
  begin
    if not Assigned(AdvancePayment) then lnc.AdvancePayment := TLoanClassAdvance.Create;

    AdvancePayment.AdvanceMethod := TAdvanceMethod(StrToInt(rbgMethod.Value));

    // interest
    if AdvancePayment.AdvanceMethod = amPreset then lnc.AdvancePayment.Interest := edNumberOfMonths.IntValue
    else lnc.AdvancePayment.Interest := 0;

    // principal
    if cbxIncludePrincipal.Checked then lnc.AdvancePayment.Principal := lnc.AdvancePayment.Interest
    else lnc.AdvancePayment.Principal := 0;
  end;

end;

procedure TfrmLoanClassAdvancePaymentDetail.Cancel;
begin
  with dmLoansAux.dstAdvancePayment do
    if State in [dsInsert,dsEdit] then
      Cancel;
end;

procedure TfrmLoanClassAdvancePaymentDetail.FormCreate(Sender: TObject);
begin
  inherited;
  // interest
  if Assigned(lnc.AdvancePayment) then
  begin
    rbgMethod.Value := VarToStr(lnc.AdvancePayment.AdvanceMethod);
    edNumberOfMonths.IntValue := lnc.AdvancePayment.NumberOfMonths;
  end
  else rbgMethod.Value := '0';

  // principal
  if Assigned(lnc.AdvancePayment) then
    cbxIncludePrincipal.ReadOnly := lnc.AdvancePayment.AdvanceMethod = amNone;
end;

procedure TfrmLoanClassAdvancePaymentDetail.rbgMethodChange(
  Sender: TObject);
begin
  inherited;
  edNumberOfMonths.Enabled := rbgMethod.Value = VarToStr(amPreset);
  cbxIncludePrincipal.ReadOnly := rbgMethod.Value = VarToStr(amNone);

  if rbgMethod.Value = VarToStr(amNone) then
    cbxIncludePrincipal.Checked := false;
end;

procedure TfrmLoanClassAdvancePaymentDetail.Save;
begin
  with dmLoansAux.dstAdvancePayment do
  begin
    Edit;
    FieldByName('int').AsInteger := lnc.AdvancePayment.Interest;
    FieldByName('principal').AsInteger := lnc.AdvancePayment.Principal;
    Post;
  end;
end;

function TfrmLoanClassAdvancePaymentDetail.ValidEntry: boolean;
var
  error: string;
begin
  if (lnc.AdvancePayment.AdvanceMethod = amPreset) and (lnc.AdvancePayment.NumberOfMonths < 1) then
    error := 'Number of months should not be zero.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
