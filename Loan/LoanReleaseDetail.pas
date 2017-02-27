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
    urlReleaseToClient: TRzURLLabel;
    pcAssessment: TRzPageControl;
    tsRecipients: TRzTabSheet;
    tsCharges: TRzTabSheet;
    RzPanel1: TRzPanel;
    btnRemove: TRzShapeButton;
    RzPanel2: TRzPanel;
    btnAdd: TRzShapeButton;
    grReleaseRecipient: TRzStringGrid;
    grCharges: TRzStringGrid;
    JvLabel1: TJvLabel;
    urlApprovedAmount: TRzURLLabel;
    JvLabel14: TJvLabel;
    edReleasedAmount: TRzNumericEdit;
    JvLabel2: TJvLabel;
    lblCharges: TJvLabel;
    JvLabel4: TJvLabel;
    lblTotalReleased: TJvLabel;
    procedure FormShow(Sender: TObject);
    procedure grReleaseRecipientDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure urlReleaseToClientClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure pcAssessmentChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure urlApprovedAmountClick(Sender: TObject);
    procedure edReleasedAmountChange(Sender: TObject);
  private
    { Private declarations }
    procedure AddRow(rec: TReleaseRecipient);
    procedure AddRowCharge(const charge: TLoanCharge);
    procedure PopulateReleaseRecipient;
    procedure PopulateCharges;
    procedure ModifyRemove(const remove: boolean = false);
    procedure ClearRow(grid: TRzStringGrid; const row: integer);

    function GetTotalReleased: real;
    function ConfirmRelease: string;
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
  Loan, ReleaseRecipientDetail, LoanData, FormsUtil, IFinanceGlobal,
  Recipient, IFinanceDialogs;

procedure TfrmLoanReleaseDetail.ClearRow(grid: TRzStringGrid; const row: Integer);
var
  rw, cl: integer;
begin
  // clear the object in the deleted row
  grid.Objects[0,row] := nil;

  // move up all rows
  for rw := row + 1 to grid.RowCount - 1 do
  begin
    for cl := 0 to grid.ColCount - 1 do
      grid.Cells[cl,rw-1] := grid.Cells[cl,rw];

    if Assigned(grid.Objects[0,rw]) then grid.Objects[0,rw-1] := grid.Objects[0,rw];

  end;

  // decrease row count
  grid.RowCount := grid.RowCount - 1;
end;

procedure TfrmLoanReleaseDetail.ModifyRemove(const remove: boolean);
const
  CONF = 'Are you sure you want to remove the selected recipient?';
var
  r: integer;
  recipient, method, locationCode, locationName: string;
  rec: TReleaseRecipient;
begin
  inherited;

  with dmLoan.dstLoanRelease, grReleaseRecipient do
  begin
    if not Assigned(Objects[0,Row]) then Exit;

    r := Row;

    rec := (Objects[0,r] as TReleaseRecipient);
    recipient := (Objects[0,r] as TReleaseRecipient).Recipient.Id;
    method := (Objects[0,r] as TReleaseRecipient).ReleaseMethod.Id;
    locationCode := (Objects[0,r] as TReleaseRecipient).LocationCode;
    locationName := (Objects[0,r] as TReleaseRecipient).LocationName;

    // locate the record in the dataset
    Locate('recipient;rel_method;loc_code',VarArrayOf([recipient,method,locationCode]),[]);
  end;

  if not remove then
  begin
    with TfrmReleaseRecipientDetail.Create(self) do
    begin
      rrp := rec;

      ShowModal;

      // update row
      if ModalResult = mrOk then
      begin
        grReleaseRecipient.Cells[0,r] := FormatDateTime('mm/dd/yyyy',rrp.Date);
        grReleaseRecipient.Cells[1,r] := rrp.Recipient.Name;
        grReleaseRecipient.Cells[2,r] := rrp.LocationName;
        grReleaseRecipient.Cells[3,r] := rrp.ReleaseMethod.Name;
        grReleaseRecipient.Cells[4,r] := FormatFloat('###,###,##0.00',rrp.Amount);

        grReleaseRecipient.Objects[0,r] := rrp;
      end;

      Free;
    end;
  end
  else
  begin
    if ShowDecisionBox(CONF) = mrYes then
    begin
      ln.RemoveReleaseRecipient(rec);
      ClearRow(grReleaseRecipient,r);
    end;
  end;
end;

procedure TfrmLoanReleaseDetail.pcAssessmentChange(Sender: TObject);
begin
  PopulateCharges;
  ExtendLastColumn(grCharges);
end;

procedure TfrmLoanReleaseDetail.AddRow(rec: TReleaseRecipient);
var
  r: integer;
begin
  with grReleaseRecipient do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := FormatDateTime('mm/dd/yyyy',rec.Date);
    Cells[1,r] := rec.Recipient.Name;
    Cells[2,r] := rec.LocationName;
    Cells[3,r] := rec.ReleaseMethod.Name;
    Cells[4,r] := FormatFloat('###,###,##0.00',rec.Amount);

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
    Cells[1,r] := FormatFloat('###,###,##0.00',charge.Amount);

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
    Cells[2,0] := 'Branch';
    Cells[3,0] := 'Method';
    Cells[4,0] := 'Amount';

    // widths
    ColWidths[0] := 80;
    ColWidths[1] := 150;
    ColWidths[2] := 100;
    ColWidths[3] := 60;
    ColWidths[4] := 75;

    cnt := ln.ReleaseRecipientCount;

    for i := 0 to cnt - 1 do
      AddRow(ln.ReleaseRecipients[i]);

  end;
end;

procedure TfrmLoanReleaseDetail.PopulateCharges;
var
  i, cnt: integer;
begin
  // clear rows
  grCharges.RowCount := 1;

  with grCharges do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Charge';
    Cells[1,0] := 'Amount';

    // widths
    ColWidths[0] := 200;
    ColWidths[1] := 80;

    cnt := ln.LoanChargeCount;

    for i := 0 to cnt - 1 do
      AddRowCharge(ln.LoanCharges[i]);
  end;
end;

procedure TfrmLoanReleaseDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanReleaseDetail.urlApprovedAmountClick(Sender: TObject);
begin
  inherited;
  if (ln.Action = laReleasing) and (ln.IsApproved) then
  begin
    edReleasedAmount.Value := ln.ApprovedAmount;

    ln.ReleaseAmount := ln.ApprovedAmount;

    ln.ComputeCharges;
    PopulateCharges;
    ExtendLastColumn(grCharges);
  end;
end;

procedure TfrmLoanReleaseDetail.urlReleaseToClientClick(Sender: TObject);
var
  error: string;
begin
  inherited;
  if ln.Action = laReleasing then
  begin
    if edReleasedAmount.Value > 0 then
    begin
      ln.ReleaseAmount := edReleasedAmount.Value;
      ln.ComputeCharges;

      rrp := TReleaseRecipient.Create;

      rrp.Recipient := TRecipient.Create(ln.Client.Id,ln.Client.Name);
      rrp.Date := ifn.AppDate;
      rrp.Amount := ln.ReleaseAmount - ln.TotalCharges;
      rrp.ReleaseMethod := TReleaseMethod.Create('C','Cash');
      rrp.LocationCode := ifn.LocationCode;
      rrp.LocationName := ifn.GetLocationNameByCode(ifn.LocationCode);

      if ln.ReleaseRecipientExists(rrp.Recipient.Id,rrp.LocationCode,rrp.ReleaseMethod.Id) then
      begin
        error := 'Release details already exists.';
        ShowErrorBox(error);
      end
      else
      begin
        ln.AppendReleaseRecipient(rrp);

        ln.AddReleaseRecipient(rrp);

        AddRow(rrp);
      end;
    end
    else ShowErrorBox('Pleae enter release amount.');
  end;
end;

procedure TfrmLoanReleaseDetail.btnAddClick(Sender: TObject);
begin
  if edReleasedAmount.Value > 0 then
  begin
    ln.ReleaseAmount := edReleasedAmount.Value;

    ln.AppendReleaseRecipient;

    with TfrmReleaseRecipientDetail.Create(self) do
    begin
      rrp := TReleaseRecipient.Create;

      ShowModal;

      if ModalResult = mrOk then AddRow(ln.ReleaseRecipients[ln.ReleaseRecipientCount - 1]);

      Free;
    end;
  end
  else if edReleasedAmount.Value <= 0 then ShowErrorBox('Pleae enter release amount.');
end;

procedure TfrmLoanReleaseDetail.btnCancelClick(Sender: TObject);
begin
  ln.ClearReleaseRecipients;
  ln.ClearLoanCharges;

  inherited;
end;

procedure TfrmLoanReleaseDetail.btnRemoveClick(Sender: TObject);
begin
  inherited;
  ModifyRemove(true);
end;

procedure TfrmLoanReleaseDetail.Cancel;
begin
  ln.Cancel;
end;

procedure TfrmLoanReleaseDetail.FormCreate(Sender: TObject);
begin
  inherited;

  // approved amount
  urlApprovedAmount.Caption := FormatFloat('###,##0.00',ln.ApprovedAmount);
end;

procedure TfrmLoanReleaseDetail.FormShow(Sender: TObject);
begin
  inherited;
  PopulateReleaseRecipient;

  ExtendLastColumn(grReleaseRecipient);
end;

procedure TfrmLoanReleaseDetail.grReleaseRecipientDblClick(Sender: TObject);
begin
  ModifyRemove;
end;

function TfrmLoanReleaseDetail.ValidEntry: boolean;
var
  error: string;
begin
  if ln.ReleaseRecipientCount = 0 then
    error := 'Please add at least one recipient.'
  else if ln.ReleaseAmount > ln.ApprovedAmount  then
    error := 'Release amount is greater than the approved amount.'
  else if GetTotalReleased <> ln.ReleaseAmount - ln.TotalCharges then
    error := 'TOTAL amount released is not equal to the amount FOR release.'
  else if ln.ReleaseAmount < ln.ApprovedAmount  then
    error := ConfirmRelease;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

function TfrmLoanReleaseDetail.GetTotalReleased: real;
var
  total: real;
  i, cnt: integer;
begin
  total := 0;

  cnt := ln.ReleaseRecipientCount - 1;

  for i := 0 to cnt do total := total + ln.ReleaseRecipients[i].Amount;

  Result := total;
end;

function TfrmLoanReleaseDetail.ConfirmRelease: string;
var
  msg: string;
begin
  msg := 'Amount to be released is less than the approved amount. Do you want to proceed?';

  if ShowDecisionBox(msg) = mrYes then Result := ''
  else Result := 'Releasing process cancelled.';
end;

procedure TfrmLoanReleaseDetail.edReleasedAmountChange(Sender: TObject);
begin
  ln.ReleaseAmount := edReleasedAmount.Value;

  ln.ComputeCharges;

  lblCharges.Caption := FormatFloat('###,###,##0.00',ln.TotalCharges);
  lblTotalReleased.Caption := FormatFloat('###,###,##0.00',ln.ReleaseAmount - ln.TotalCharges);
end;

end.
