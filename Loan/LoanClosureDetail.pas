unit LoanClosureDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  Vcl.DBCtrls, RzDBEdit, RzDBCmbo, Vcl.Mask, RzEdit, JvExControls, JvLabel;

type
  TfrmLoanClosureDetail = class(TfrmBasePopupDetail)
    JvLabel17: TJvLabel;
    dteDateClosed: TRzDBDateTimeEdit;
    JvLabel18: TJvLabel;
    dbluReason: TRzDBLookupComboBox;
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

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, Loan, LoansAuxData, IFinanceDialogs;

procedure TfrmLoanClosureDetail.Cancel;
begin
  inherited;
  ln.Cancel;
end;

procedure TfrmLoanClosureDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmLoanClosureDetail.Save;
begin
  inherited;
  ln.Save;
end;

function TfrmLoanClosureDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteDateClosed.Text = '' then
    error := 'Please enter date closed.'
  else if dbluReason.Text = '' then
    error := 'Please select closure reason.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
