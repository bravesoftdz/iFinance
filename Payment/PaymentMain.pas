unit PaymentMain;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzBtnEdt, JvExControls,
  JvLabel, Vcl.Grids, RzGrids, RzDBEdit, SaveIntf, System.UITypes, PaymentIntf,
  Vcl.Imaging.pngimage, Payment, StrUtils, Vcl.Graphics, System.Types, RzCmboBx;

type
  TfrmPaymentMain = class(TfrmBaseDocked, ISave, IPayment)
    c: TJvLabel;
    pnlDetail: TRzPanel;
    grDetail: TRzStringGrid;
    JvLabel7: TJvLabel;
    JvLabel1: TJvLabel;
    lblTotalAmount: TJvLabel;
    pnlAddPayment: TRzPanel;
    imgAddPayment: TImage;
    edClient: TRzEdit;
    pnlDeletePayment: TRzPanel;
    imgDeletePayment: TImage;
    JvLabel2: TJvLabel;
    lblReferenceNo: TJvLabel;
    JvLabel4: TJvLabel;
    lblPosted: TJvLabel;
    dtePaymentDate: TRzDBDateTimeEdit;
    edReceipt: TRzDBEdit;
    cmbPaymentMethod: TRzComboBox;
    JvLabel3: TJvLabel;
    lblWithdrawn: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgAddPaymentClick(Sender: TObject);
    procedure imgAddPaymentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddPaymentMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure imgDeletePaymentClick(Sender: TObject);
    procedure grDetailResize(Sender: TObject);
    procedure grDetailDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dtePaymentDateChange(Sender: TObject);
  private
    { Private declarations }
    function SelectActiveClient: TModalResult;
    function SelectActiveLoan: TModalResult;
    function PaymentIsValid: boolean;

    procedure ShowPaymentDetail;
    procedure SetTotalAmount;
    procedure PopulateDetail;
    procedure AddRow(const detail: TPaymentDetail);
    procedure RemoveRow(const row: integer);
    procedure SetUnboundControls;
    procedure Retrieve;
    procedure ChangeControlState;
    procedure DeletePayment;
    procedure SetWithdrawnAmount;
    procedure BindControlToObject;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
    procedure AddActiveLoan;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  PaymentData, IFinanceDialogs, ActiveClientsSearch, ActiveClient,
  ActiveLoans, FormsUtil, PaymentDetail, PaymentMethod, IFinanceGlobal;

function TfrmPaymentMain.PaymentIsValid: boolean;
var
  error: string;
begin
  BindControlToObject;

  if pmt.Date < ifn.AppDate then error := 'Payment date is set in the past.'
  else if not Assigned(pmt.PaymentMethod) then error := 'No payment method selected.'
  else if not Assigned(pmt.Client) then error := 'Please select a client.'
  else if pmt.DetailCount = 0 then error := 'Please add at least one payment detail.'
  else if pmt.PaymentMethod.Method = mdBankWithdrawal then
  begin
    if pmt.TotalAmount > pmt.Withdrawn then
      error := 'Total amount paid is greater than amount withdrawn.';
  end;

  if error <> '' then ShowErrorBox(error);

  Result := error = ''
end;

function TfrmPaymentMain.Save: boolean;
begin
  Result := false;

  if (pmt.IsNew) and (PaymentIsValid) then
  begin
    try
      if (Trim(edReceipt.Text) = '') and (ShowWarningBox('Receipt number has NOT been entered. ' +
        'Do you want to continue saving this entry?') <> mrYes) then
      begin
        Result := false;
        Exit;
      end;

      pmt.Save;

      SetUnboundControls;
      ChangeControlState;

      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        ShowErrorBox(E.Message);
      end;
    end;
  end;
end;

function TfrmPaymentMain.SelectActiveClient: TModalResult;
begin
  Result := mrCancel;

  with TfrmActiveClientsSearch.Create(self) do
  begin
    try
      try
        ShowModal;

        Result := ModalResult;

      except
        on e: Exception do ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

function TfrmPaymentMain.SelectActiveLoan: TModalResult;
begin
  Result := mrCancel;
  with TfrmActiveLoans.Create(self) do
  begin
    try
      try
        ShowModal;

        Result := ModalResult;

      except
        on e: Exception do ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmPaymentMain.ShowPaymentDetail;
begin
  with TfrmPaymentDetail.Create(self) do
  begin
    try
      try
        ShowModal;

        if ModalResult = mrOK then
        begin
          AddRow(pmt.Details[pmt.DetailCount-1]);
          SetTotalAmount;
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

procedure TfrmPaymentMain.Cancel;
begin

end;

procedure TfrmPaymentMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmPayment.Destroy;
  pmt.Destroy;

  inherited;
end;

procedure TfrmPaymentMain.FormCreate(Sender: TObject);
begin
  dmPayment := TdmPayment.Create(self);

  try
    if (not Assigned(pmt)) or (pmt.IsNew) then
    begin
      if not Assigned(pmt) then pmt := TPayment.Create;
      pmt.Add;

      if pmt.IsWithdrawal then
      begin
        edClient.Text := pmt.Client.Name;
        SetWithdrawnAmount;
      end;
    end
    else Retrieve;

    PopulatePaymentMethodComboBox(cmbPaymentMethod,pmt.PaymentMethod.Method = mdBankWithdrawal);
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;

  ChangeControlState;

  inherited;
end;

procedure TfrmPaymentMain.FormShow(Sender: TObject);
begin
  inherited;
  PopulateDetail;
end;

procedure TfrmPaymentMain.grDetailDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  cellStr: string;
begin
  with grDetail do
  begin
    cellStr := Cells[ACol,ARow];

    if ARow = 0 then Canvas.Font.Style := [fsBold]
    else Canvas.Font.Style := [];

    Canvas.Font.Size := Font.Size;
    Canvas.Font.Name := Font.Name;

    if ARow = 0 then
      Canvas.TextRect(Rect,Rect.Left + (ColWidths[ACol] div 2) - (Canvas.TextWidth(cellStr) div 2), Rect.Top + 2, cellStr)
    else if (ACol in [3,4,5,6]) and (ARow > 0) then
      Canvas.TextRect(Rect,Rect.Left - Canvas.TextWidth(cellStr) + ColWidths[3] - 20,Rect.Top + 2,cellStr)
    else
      Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, cellStr);
  end;
end;

procedure TfrmPaymentMain.grDetailResize(Sender: TObject);
begin
  inherited;
  ExtendLastColumn(grDetail);
end;

procedure TfrmPaymentMain.AddActiveLoan;
begin
  if pmt.IsNew then
  begin
    // check if a client has been selected
    if not Assigned(pmt.Client) then
    begin
      if SelectActiveClient = mrOk then
      begin
        pmt.Client := activeCln;
        edClient.Text := activeCln.Name;
      end
      else Exit;
    end;

    pmt.Client.RetrieveActiveLoans;

    // show active loans of selected client
    if SelectActiveLoan = mrOk then ShowPaymentDetail;
  end
  else ShowErrorBox('Adding a NEW payment has been restricted.');
end;

procedure TfrmPaymentMain.SetTotalAmount;
begin
  lblTotalAmount.Caption := 'Total amount paid: ' + FormatFloat('###,###,##0.00',pmt.TotalAmount);
end;

procedure TfrmPaymentMain.imgAddPaymentClick(Sender: TObject);
begin
  inherited;
  AddActiveLoan;
end;

procedure TfrmPaymentMain.imgAddPaymentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonDown(Sender);
end;

procedure TfrmPaymentMain.imgAddPaymentMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonUp(Sender);
end;

procedure TfrmPaymentMain.imgDeletePaymentClick(Sender: TObject);
begin
  DeletePayment;
end;

procedure TfrmPaymentMain.DeletePayment;
begin
  if pmt.IsNew then
  begin
    if pmt.DetailCount > 0 then
    begin
      if ShowDecisionBox('Are you sure you want to delete the selected payment?') = mrYes then
      begin
        pmt.RemoveDetail(TPaymentDetail(grDetail.Objects[0,grDetail.Row]).Loan);
        RemoveRow(grDetail.Row);
        SetTotalAmount;
      end;
    end;
  end
  else ShowErrorBox('Deleting a payment has been restricted.');
end;

procedure TfrmPaymentMain.dtePaymentDateChange(Sender: TObject);
begin
  inherited;
  pmt.Date := dtePaymentDate.Date;
end;

procedure TfrmPaymentMain.RemoveRow(const row: Integer);
var
  rw, cl: integer;
begin
  with grDetail do
  begin
    // clear the object in the deleted row
    Objects[0,row] := nil;

    // move up all rows
    for rw := row + 1 to RowCount - 1 do
    begin
      for cl := 0 to ColCount - 1 do
        Cells[cl,rw-1] := Cells[cl,rw];

      if Assigned(Objects[0,rw]) then Objects[0,rw-1] := Objects[0,rw];

    end;

    // decrease row count or clear if details is empty
    if pmt.DetailCount = 0 then
    begin
      for cl := 0 to ColCount - 1 do
        Cells[cl,row] := '';
    end
    else RowCount := RowCount - 1
  end;
end;

procedure TfrmPaymentMain.PopulateDetail;
var
  i, cnt: integer;
begin
  with grDetail do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Loan ID';
    Cells[1,0] := 'Type';
    Cells[2,0] := 'Account';
    Cells[3,0] := 'Principal';
    Cells[4,0] := 'Interest';
    Cells[5,0] := 'Penalty';
    Cells[6,0] := 'Total amount';
    Cells[7,0] := 'Remarks';

    // widths
    ColWidths[0] := 120;
    ColWidths[1] := 120;
    ColWidths[2] := 120;
    ColWidths[3] := 80;
    ColWidths[4] := 80;
    ColWidths[5] := 80;
    ColWidths[6] := 100;
    ColWidths[7] := 200;

    cnt := pmt.DetailCount - 1;

    for i := 0 to cnt do AddRow(pmt.Details[i]);
  end;
end;

procedure TfrmPaymentMain.AddRow(const detail: TPaymentDetail);
var
  r: integer;
begin
  with grDetail do
  begin
    if not FirstRow(grDetail) then RowCount := RowCount + 1;

    r := RowCount - FixedRows;

    Cells[0,r] := detail.Loan.Id;
    Cells[1,r] := detail.Loan.LoanTypeName;
    Cells[2,r] := detail.Loan.AccountTypeName;
    Cells[3,r] := FormatCurr('###,###,##0.00',detail.Principal);
    Cells[4,r] := FormatCurr('###,###,##0.00',detail.Interest);
    Cells[5,r] := FormatCurr('###,###,##0.00',detail.Penalty);
    Cells[6,r] := FormatCurr('###,###,##0.00',detail.TotalAmount);

    Objects[0,r] := detail;
  end;
end;

procedure TfrmPaymentMain.BindControlToObject;
begin
  // payment method
  pmt.PaymentMethod := TPaymentMethod(cmbPaymentMethod.Items.Objects[cmbPaymentMethod.ItemIndex]);
end;

procedure TfrmPaymentMain.SetUnboundControls;
begin
  edClient.Text := pmt.Client.Name;

  cmbPaymentMethod.ItemIndex := Integer(pmt.PaymentMethod.Method);

  lblReferenceNo.Caption := pmt.ReferenceNo;
  lblPosted.Caption := IfThen(pmt.IsPosted,'Yes','No');
end;

procedure TfrmPaymentMain.SetWithdrawnAmount;
begin
  lblWithdrawn.Caption := 'Amount withdrawn: ' + FormatCurr('###,##0.00',pmt.Withdrawn);
end;

procedure TfrmPaymentMain.Retrieve;
begin
  pmt.Retrieve;

  SetUnboundControls;
  SetTotalAmount;
end;

procedure TfrmPaymentMain.ChangeControlState;
var
  new: boolean;
begin
  new := pmt.IsNew;

  // dtePaymentDate.ReadOnly := not new;
  edReceipt.ReadOnly := not new;
  cmbPaymentMethod.ReadOnly := not new;
end;

end.
