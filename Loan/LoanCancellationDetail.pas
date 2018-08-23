unit LoanCancellationDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, RzButton,
  RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLoanCancellationDetail = class(TfrmBasePopupDetail)
    dbluReason: TRzDBLookupComboBox;
    dteDateCancelled: TRzDBDateTimeEdit;
    mmRemarks: TRzDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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

procedure TfrmLoanCancellationDetail.BindToObject;
begin
  inherited;

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
    error := 'Please enter date cancelled.'
  else if dbluReason.Text = '' then
    error := 'Please select cancellation reason.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
