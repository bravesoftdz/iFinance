unit WithdrawalDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzDBEdit,
  RzEdit, JvExControls, JvLabel, Vcl.Mask, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo;

type
  TfrmWithdrawalDetail = class(TfrmBasePopupDetail)
    dteWithdrawalDate: TRzDBDateTimeEdit;
    JvLabel7: TJvLabel;
    c: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel5: TJvLabel;
    edWithdrawn: TRzDBNumericEdit;
    JvLabel2: TJvLabel;
    edCardNo: TRzEdit;
    bteClient: TRzButtonEdit;
    dbluAccount: TRzDBLookupComboBox;
    procedure bteClientButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetClientBankAccounts;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmWithdrawalDetail: TfrmWithdrawalDetail;

implementation

{$R *.dfm}

{ TfrmWithdrawalDetail }

uses
  PaymentData, IFinanceDialogs, Withdrawal, ActiveClientsSearch, ActiveClient;

procedure TfrmWithdrawalDetail.bteClientButtonClick(Sender: TObject);
begin
  with TfrmActiveClientsSearch.Create(self) do
  begin
    try
      try
        ShowModal;

        if ModalResult = mrOK then
        begin
          wd.Client := activeCln;
          bteClient.Text := activeCln.Name;

          GetClientBankAccounts;
        end;

      except
        on e: Exception do ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmWithdrawalDetail.Cancel;
begin
  inherited;

end;

procedure TfrmWithdrawalDetail.GetClientBankAccounts;
begin
  dbluAccount.ListSource.DataSet.Open;
  dbluAccount.Enabled := true;
end;

procedure TfrmWithdrawalDetail.Save;
begin
  inherited;
  wd.Save;
end;

function TfrmWithdrawalDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteWithdrawalDate.Text = '' then error := 'Please select a date.'
  else if not Assigned(wd.Client) then error := 'No client selected.'
  else if dbluAccount.Text = '' then error := 'Please select an account.'
  else if edWithdrawn.Value <= 0 then error := 'Invalid value for amount.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

end.
