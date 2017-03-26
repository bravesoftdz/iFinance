unit PaymentMain;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzBtnEdt, JvExControls,
  JvLabel, Vcl.Grids, RzGrids, RzDBEdit, SaveIntf, System.UITypes, PaymentIntf,
  Vcl.Imaging.pngimage, Payment;

type
  TfrmPaymentMain = class(TfrmBaseDocked, ISave, IPayment)
    c: TJvLabel;
    pnlDetail: TRzPanel;
    grDetail: TRzStringGrid;
    JvLabel7: TJvLabel;
    dtePaymentDate: TRzDBDateTimeEdit;
    edReceipt: TRzDBEdit;
    JvLabel1: TJvLabel;
    lblTotalAmount: TJvLabel;
    pnlAddPayment: TRzPanel;
    imgAddPayment: TImage;
    edClient: TRzEdit;
    pnlDeletePayment: TRzPanel;
    imgDeletePayment: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgAddPaymentClick(Sender: TObject);
    procedure imgAddPaymentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddPaymentMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure imgDeletePaymentClick(Sender: TObject);
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
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
    procedure AddActiveLoan;
  end;

var
  frmPaymentMain: TfrmPaymentMain;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  PaymentData, IFinanceDialogs, ActiveClientsSearch, ActiveClient,
  ActiveLoans, FormsUtil, PaymentDetail;

function TfrmPaymentMain.PaymentIsValid: boolean;
var
  error: string;
begin
  if not Assigned(pmt.Client) then error := 'Please select a client.'
  else if pmt.DetailCount = 0 then error := 'Please add at least one payment detail.';

  if error <> '' then ShowErrorBox(error);

  Result := error = ''
end;

function TfrmPaymentMain.Save: boolean;
begin
  Result := PaymentIsValid;

  if Result then
    if ShowWarningBox('No receipt number has been entered. Do you want to continue saving this entry?') = mrYes then
      pmt.Save
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
        on e: Exception do
          ShowErrorBox(e.Message);
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
        on e: Exception do
          ShowErrorBox(e.Message);
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

  pmt := TPayment.Create;
  pmt.Add;

  inherited;
end;

procedure TfrmPaymentMain.FormShow(Sender: TObject);
begin
  inherited;
  PopulateDetail;
  ExtendLastColumn(grDetail);
end;

procedure TfrmPaymentMain.AddActiveLoan;
begin
  // check if a client has been selected
  if not Assigned(pmt.Client) then
  begin
    if SelectActiveClient = mrOk then
    begin
      pmt.Client := activeCln;
      edClient.Text := activeCln.Name;

      pmt.Client.RetrieveActiveLoans;
    end
    else Exit;
  end;

  // show active loans of selected client
  if SelectActiveLoan = mrOk then ShowPaymentDetail;
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
  inherited;
  if pmt.DetailCount > 0 then
  begin
    if ShowDecisionBox('Are you sure you want to delete the selected payment?') = mrYes then
    begin
      pmt.RemoveDetail(TPaymentDetail(grDetail.Objects[0,grDetail.Row]).Loan);
      RemoveRow(grDetail.Row);
      SetTotalAmount;
    end;
  end;
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

    // decrease row count
    RowCount := RowCount - 1;
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
    Cells[3,0] := 'Amount';
    Cells[4,0] := 'Remarks';

    // widths
    ColWidths[0] := 120;
    ColWidths[1] := 120;
    ColWidths[2] := 120;
    ColWidths[3] := 120;
    ColWidths[4] := 250;

    cnt := pmt.DetailCount - 1;

    for i := 0 to cnt - 1 do AddRow(pmt.Details[i]);
  end;
end;

procedure TfrmPaymentMain.AddRow(const detail: TPaymentDetail);
var
  r: integer;
begin
  with grDetail do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := detail.Loan.Id;
    Cells[1,r] := detail.Loan.LoanTypeName;
    Cells[2,r] := detail.Loan.AccountTypeName;
    Cells[3,r] := FormatFloat('###,###,##0.00',detail.Amount);

    Objects[0,r] := detail;

  end;
end;

end.
