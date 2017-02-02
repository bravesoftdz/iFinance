unit LoanCancellationDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel, RzButton,
  RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLoanCancellationDetail = class(TfrmBasePopupDetail)
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    dbluReason: TRzDBLookupComboBox;
    dteDateCancelled: TRzDBDateTimeEdit;
    mmRemarks: TRzDBMemo;
    JvLabel24: TJvLabel;
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
  frmLoanCancellationDetail: TfrmLoanCancellationDetail;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, Loan, LoansAuxData, IFinanceDialogs;

procedure TfrmLoanCancellationDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmLoanCancellationDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanCancellationDetail.Cancel;
begin
  ln.Cancel;
end;

function TfrmLoanCancellationDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteDateCancelled.Text = '' then
    error := 'Please enter date approved.'
  else if dbluReason.Text = '' then
    error := 'Please select cancel reason.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
