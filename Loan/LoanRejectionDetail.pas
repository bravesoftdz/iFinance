unit LoanRejectionDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel, RzButton,
  RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLoanRejectionDetail = class(TfrmBasePopupDetail)
    JvLabel17: TJvLabel;
    dteDateRejected: TRzDBDateTimeEdit;
    dbluReason: TRzDBLookupComboBox;
    JvLabel18: TJvLabel;
    JvLabel24: TJvLabel;
    mmRemarks: TRzDBMemo;
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
  frmLoanRejectionDetail: TfrmLoanRejectionDetail;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, Loan, LoansAuxData;

procedure TfrmLoanRejectionDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanRejectionDetail.Cancel;
begin
  ln.Cancel;
end;

function TfrmLoanRejectionDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteDateRejected.Text = '' then
    error := 'Please enter date rejected.'
  else if dbluReason.Text = '' then
    error := 'Please select reject reason.';

  Result := error = '';

  if not Result then CallErrorBox(error);
end;

procedure TfrmLoanRejectionDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

end.
