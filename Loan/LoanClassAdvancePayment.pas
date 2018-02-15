unit LoanClassAdvancePayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzRadChk,
  Vcl.Mask, RzEdit, RzRadGrp, RzDBRGrp, DB, LoanClassAdvance, JvExControls,
  JvLabel;

type
  TfrmLoanClassAdvancePaymentDetail = class(TfrmBasePopupDetail)
    edNumberOfMonths: TRzNumericEdit;
    RzGroupBox2: TRzGroupBox;
    rbgAdvanceInterest: TRzDBRadioGroup;
    JvLabel14: TJvLabel;
    cbxIncludePrincipal: TRzCheckBox;
    procedure rbgAdvanceInterestChange(Sender: TObject);
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

    // interest
    if rbgAdvanceInterest.ItemIndex = 2 then lnc.AdvancePayment.Interest := edNumberOfMonths.IntValue
    else lnc.AdvancePayment.Interest := StrToInt(rbgAdvanceInterest.Value);

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
var
  interest, principal: integer;
begin
  inherited;
  // interest
  if Assigned(lnc.AdvancePayment) then
  begin
    case lnc.AdvancePayment.Interest of
      -1: interest := 1;
       0: interest := 0;
       else
       begin
         interest := 2;
         edNumberOfMonths.IntValue := lnc.AdvancePayment.NumberOfMonths;
       end;
    end;
    rbgAdvanceInterest.ItemIndex := interest;
  end
  else rbgAdvanceInterest.ItemIndex := 0;

  // principal
  if Assigned(lnc.AdvancePayment) then
  begin
    cbxIncludePrincipal.ReadOnly := lnc.AdvancePayment.Interest = 0;
    cbxIncludePrincipal.Checked := lnc.AdvancePayment.Principal <> 0;
  end;
end;

procedure TfrmLoanClassAdvancePaymentDetail.rbgAdvanceInterestChange(
  Sender: TObject);
begin
  inherited;
  edNumberOfMonths.Enabled := rbgAdvanceInterest.ItemIndex = 2;
  cbxIncludePrincipal.ReadOnly := rbgAdvanceInterest.ItemIndex = 0;

  if rbgAdvanceInterest.ItemIndex = 0 then
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
  if (rbgAdvanceInterest.ItemIndex = 2) and (lnc.AdvancePayment.NumberOfMonths < 1) then
    error := 'Advance interest should not be zero.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
