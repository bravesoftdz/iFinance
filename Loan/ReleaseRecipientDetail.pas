unit ReleaseRecipientDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzEdit, RzBtnEdt,
  Vcl.DBCtrls, RzDBCmbo, Vcl.StdCtrls, Vcl.Mask, RzDBEdit, JvExControls,
  JvLabel, RzButton, RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  RzPanel, DB;

type
  TfrmReleaseRecipientDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edAmount: TRzDBNumericEdit;
    dbluMethod: TRzDBLookupComboBox;
    c: TJvLabel;
    bteRecipient: TRzButtonEdit;
    JvLabel17: TJvLabel;
    dteDateReleased: TRzDBDateTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure bteRecipientButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateUnboundFields;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmReleaseRecipientDetail: TfrmReleaseRecipientDetail;

implementation

{$R *.dfm}

uses
  LoanData, LoansAuxData, FormsUtil, RecipientSearch, Recipient, ReleaseRecipient,
  Loan, IFinanceDialogs;

procedure TfrmReleaseRecipientDetail.PopulateUnboundFields;
begin
  with dmLoan.dstLoanRelease do
  begin
    if State <> dsInsert then
      bteRecipient.Text := rrp.Recipient.Name;
  end;
end;

procedure TfrmReleaseRecipientDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);

  PopulateUnboundFields;
end;

procedure TfrmReleaseRecipientDetail.Save;
begin
  with dmLoan.dstLoanRelease do
  begin
    if State in [dsInsert,dsEdit] then
    begin
      FieldByName('recipient').AsString := rrp.Recipient.Id;
      Post;
    end;

    rrp.Date := dteDateReleased.Date;
    rrp.Amount := edAmount.Value;
    rrp.ReleaseMethod := TReleaseMethod.Create(dbluMethod.GetKeyValue,dbluMethod.Text);

    ln.AddReleaseRecipient(rrp,true);
  end;
end;

procedure TfrmReleaseRecipientDetail.bteRecipientButtonClick(Sender: TObject);
begin
  with TfrmRecipientSearch.Create(self) do
  begin
    try
      try
        rcp := TRecipient.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
            bteRecipient.Text := rcp.Name;
            rrp.Recipient := rcp;
        end;

      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmReleaseRecipientDetail.Cancel;
begin
  with dmLoan.dstMonExp do
    if State in [dsInsert,dsEdit] then
      Cancel;
end;

function TfrmReleaseRecipientDetail.ValidEntry: boolean;
var
  error: string;
begin
  with dmLoan.dstLoanRelease do
  begin
    if Trim(dteDateReleased.Text) = '' then
      error := 'Please enter date release.'
    else if bteRecipient.Text = '' then
      error := 'Please enter recipient.'
    else if dbluMethod.Text = '' then
      error := 'Please select a release method'
    else if edAmount.Value <= 0 then
      error := 'Invalid value for amount.'
    else if (State = dsInsert) and (ln.ReleaseRecipientExists(rrp.Recipient.Id,dbluMethod.GetKeyValue)) then
      error := 'Recipient and release method already exists.';
  end;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
