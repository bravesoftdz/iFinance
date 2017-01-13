unit LoanReleaseDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, JvExControls,
  JvLabel, RzButton, RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  RzPanel, RzGrids, ReleaseRecipient, LoanCharge;

type
  TfrmLoanReleaseDetail = class(TfrmBasePopupDetail)
    btnAddRecipient: TRzButton;
    btnRemoveRecipient: TRzButton;
    urlReleaseToClient: TRzURLLabel;
    pcAssessment: TRzPageControl;
    tsRecipients: TRzTabSheet;
    tsMonExp: TRzTabSheet;
    grCharges: TRzStringGrid;
    grReleaseRecipient: TRzStringGrid;
    procedure btnAddRecipientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AddRow(rec: TReleaseRecipient);
    procedure AddRowCharge(const charge: TLoanCharge);
    procedure PopulateReleaseRecipient;
    procedure PopulateCharges;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLoanReleaseDetail: TfrmLoanReleaseDetail;

implementation

{$R *.dfm}

uses
  Loan, ReleaseRecipientDetail;

procedure TfrmLoanReleaseDetail.AddRow(rec: TReleaseRecipient);
var
  r: integer;
begin
  with grReleaseRecipient do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := rec.Date;
    Cells[1,r] := rec.Recipient.Name;
    Cells[2,r] := rec.ReleaseMethod.Name;
    Cells[3,r] := rec.Amount;

    Objects[0,r] := rec;

  end;
end;

procedure TfrmLoanReleaseDetail.AddRowCharge(const charge: TLoanCharge);
var
  r: integer;
begin
  with grCharges do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := charge.ChargeName;
    Cells[1,r] := charge.Amount;

    Objects[0,r] := charge;

  end;
end;

procedure TfrmLoanReleaseDetail.PopulateReleaseRecipient;
var
  i, cnt: integer;
begin
  with grReleaseRecipient do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Date';
    Cells[1,0] := 'Recipient';
    Cells[2,0] := 'Method';
    Cells[3,0] := 'Amount';

    // widths
    ColWidths[0] := 70;
    ColWidths[1] := 145;
    ColWidths[2] := 70;
    ColWidths[3] := 60;

    cnt := ln.ReleaseRecipientCount;

    for i := 0 to cnt - 1 do
      AddRow(ln.ReleaseRecipients[i]);

  end;
end;

procedure TfrmLoanReleaseDetail.PopulateCharges;
var
  i, cnt: integer;
begin
  with grReleaseRecipient do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Charge';
    Cells[1,0] := 'Amount';

    // widths
    ColWidths[0] := 120;
    ColWidths[1] := 70;

    cnt := ln.LoanChargeCount;

    for i := 0 to cnt - 1 do
      AddRowCharge(ln.LoanCharges[i]);

  end;
end;

procedure TfrmLoanReleaseDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanReleaseDetail.btnAddRecipientClick(Sender: TObject);
begin
  with TfrmReleaseRecipientDetail.Create(self) do
  begin
    ln.AppendReleaseRecipient;

    rrp := TReleaseRecipient.Create;

    ShowModal;

    if ModalResult = mrOk then AddRow(ln.ReleaseRecipients[ln.ReleaseRecipientCount - 1]);

    Free;
  end;
end;

procedure TfrmLoanReleaseDetail.Cancel;
begin
  ln.Cancel;
end;

procedure TfrmLoanReleaseDetail.FormShow(Sender: TObject);
begin
  inherited;
  PopulateReleaseRecipient;
  PopulateCharges;
end;

function TfrmLoanReleaseDetail.ValidEntry: boolean;
var
  error: string;
begin
  if ln.ReleaseRecipientCount = 0 then
    error := 'Please add at least one recipient.';

  Result := error = '';

  if not Result then CallErrorBox(error);
end;

end.
