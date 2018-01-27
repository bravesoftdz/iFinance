unit ActiveLoans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, RzGrids, ActiveClient;

type
  TfrmActiveLoans = class(TfrmBasePopup)
    pnlLoans: TRzPanel;
    grLoans: TRzStringGrid;
    procedure grLoansDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grLoansDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
  private
    { Private declarations }
    procedure SetReturn;
    procedure PopulateLoans;
    procedure AddRow(loan: TLoan);
  public
    { Public declarations }
  end;

var
  frmActiveLoans: TfrmActiveLoans;

implementation

{$R *.dfm}

uses
  PaymentData, Payment, FormsUtil;

procedure TfrmActiveLoans.FormShow(Sender: TObject);
begin
  inherited;
  PopulateLoans;
  ExtendLastColumn(grLoans);
end;

procedure TfrmActiveLoans.grLoansDblClick(Sender: TObject);
begin
  inherited;
  SetReturn;
end;

procedure TfrmActiveLoans.grLoansDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  cellStr: string;
begin
  with grLoans do
  begin
    cellStr := Cells[ACol,ARow];

    if ARow = 0 then Canvas.Font.Style := [fsBold]
    else Canvas.Font.Style := [];

    Canvas.Font.Size := Font.Size;
    Canvas.Font.Name := Font.Name;

    if ARow = 0 then
      Canvas.TextRect(Rect,Rect.Left + (ColWidths[ACol] div 2) - (Canvas.TextWidth(cellStr) div 2), Rect.Top + 2, cellStr)
    else if (ACol = 3) and (ARow > 0) then
      Canvas.TextRect(Rect,Rect.Left - Canvas.TextWidth(cellStr) + ColWidths[3] - 8,Rect.Top + 2,cellStr)
    else
      Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, cellStr);
  end;
end;

procedure TfrmActiveLoans.SetReturn;
var
  detail: TPaymentDetail;
begin
  if pmt.Client.ActiveLoansCount > pmt.DetailCount then
  begin
    detail := TPaymentDetail.Create;
    detail.PaymentDate := pmt.Date;
    detail.Loan := TLoan(grLoans.Objects[0,grLoans.Row]);
    pmt.AddDetail(detail);

    ModalResult := mrOK;
  end
  else ModalResult := mrClose;
end;

procedure TfrmActiveLoans.PopulateLoans;
var
  i, cnt: integer;
begin
  with grLoans do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Loan ID';
    Cells[1,0] := 'Type';
    Cells[2,0] := 'Account';
    Cells[3,0] := 'Balance';

    // widths
    ColWidths[0] := 100;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := 100;

    cnt := pmt.Client.ActiveLoansCount;

    for i := 0 to cnt - 1 do
      if not pmt.DetailExists(pmt.Client.ActiveLoans[i]) then
        AddRow(pmt.Client.ActiveLoans[i]);
  end;
end;

procedure TfrmActiveLoans.AddRow(loan: TLoan);
var
  r: integer;
begin
  with grLoans do
  begin
    if not FirstRow(grLoans) then RowCount := RowCount + 1;

    r := RowCount - FixedRows;

    Cells[0,r] := loan.Id;
    Cells[1,r] := loan.LoanTypeName;
    Cells[2,r] := loan.AccountTypeName;
    Cells[3,r] := FormatCurr('###,###,##0.00',loan.Balance);

    Objects[0,r] := loan;

  end;
end;

end.
