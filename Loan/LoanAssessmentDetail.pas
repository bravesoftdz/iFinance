unit LoanAssessmentDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, JvExControls,
  JvLabel, RzButton, RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  RzPanel, RzGrids, FinInfo, MonthlyExpense, Vcl.DBCtrls, RzDBCmbo;

type
  TfrmLoanAssessmentDetail = class(TfrmBasePopupDetail)
    JvLabel4: TJvLabel;
    dteDateAssessed: TRzDBDateTimeEdit;
    JvLabel11: TJvLabel;
    edRecAmount: TRzDBNumericEdit;
    pcAssessment: TRzPageControl;
    tsFinInfo: TRzTabSheet;
    tsMonExp: TRzTabSheet;
    grFinInfo: TRzStringGrid;
    grMonExp: TRzStringGrid;
    JvLabel1: TJvLabel;
    urlAppliedAmount: TRzURLLabel;
    mmRemarks: TRzDBMemo;
    JvLabel2: TJvLabel;
    pnlAdd: TRzPanel;
    btnAdd: TRzShapeButton;
    pnlRemoveComaker: TRzPanel;
    btnRemove: TRzShapeButton;
    JvLabel3: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    JvLabel5: TJvLabel;
    RzDBMemo2: TRzDBMemo;
    JvLabel6: TJvLabel;
    RzDBMemo3: TRzDBMemo;
    JvLabel7: TJvLabel;
    RzDBMemo4: TRzDBMemo;
    JvLabel8: TJvLabel;
    RzDBMemo5: TRzDBMemo;
    JvLabel9: TJvLabel;
    dbluRecommendation: TRzDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure grFinInfoDblClick(Sender: TObject);
    procedure grMonExpDblClick(Sender: TObject);
    procedure urlAppliedAmountClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbluRecommendationClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddFinancialInfo;
    procedure AddMonthlyExpense;
    procedure PopulateFinInfo;
    procedure PopulateMonthlyExpense;
    procedure AddRow(fin: TFinInfo);
    procedure AddRowExp(exp: TMonthlyExpense);
    procedure ModifyRemoveExp(const remove: boolean = false);
    procedure ModifyRemove(const remove: boolean = false);
    procedure ClearRow(grid: TRzStringGrid; const row: integer);
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLoanAssessmentDetail: TfrmLoanAssessmentDetail;

implementation

{$R *.dfm}

uses
  FinInfoDetail, MonthlyExpenseDetail, Loan, LoanData, DecisionBox, FormsUtil,
  IFinanceDialogs, LoansAuxData, Assessment;

procedure TfrmLoanAssessmentDetail.ClearRow(grid: TRzStringGrid; const row: Integer);
var
  rw, cl: integer;
begin
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

procedure TfrmLoanAssessmentDetail.dbluRecommendationClick(Sender: TObject);
begin
  inherited;
  urlAppliedAmount.Enabled := ln.Assessment.Recommendation = rcApprove;
  edRecAmount.Enabled := ln.Assessment.Recommendation = rcApprove;

  if ln.Assessment.Recommendation = rcReject then edRecAmount.Clear;

end;

procedure TfrmLoanAssessmentDetail.ModifyRemove(const remove: boolean);
const
  CONF = 'Are you sure you want to remove the selected financial information?';
var
  r, compId: integer;
begin
  inherited;

  with dmLoan.dstFinInfo, grFinInfo do
  begin
    if not Assigned(Objects[0,Row]) then Exit;

    r := Row;

    compId := (Objects[0,r] as TFinInfo).CompanyId;

    // locate the record in the dataset
    Locate('comp_id',compId,[]);
  end;

  if not remove then
  begin
    with TfrmFinInfoDetail.Create(self) do
    begin
      ShowModal;

      // update row
      if ModalResult = mrOk then
      begin
        grFinInfo.Cells[0,r] := ln.FinancialInfo[r-1].CompanyName;
        grFinInfo.Cells[1,r] := ln.FinancialInfo[r-1].Monthly;
        grFinInfo.Cells[2,r] := ln.FinancialInfo[r-1].Balance;

        grFinInfo.Objects[0,r] := ln.FinancialInfo[r-1];
      end;

      Free;
    end;
  end
  else
  begin
    with TfrmDecisionBox.Create(nil,CONF) do
    begin
      try
        ShowModal;

        if ModalResult = mrYes then
        begin
          ln.RemoveFinancialInfo(compId);
          ClearRow(grFinInfo,r);
        end;

        Free;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    end;
  end;
end;

procedure TfrmLoanAssessmentDetail.ModifyRemoveExp(const remove: boolean);
const
  CONF = 'Are you sure you want to remove the selected expense?';
var
  r: integer;
  expType: string;
begin
  inherited;

  with dmLoan.dstMonExp, grMonExp do
  begin
    if not Assigned(Objects[0,Row]) then Exit;

    r := Row;

    expType := (Objects[0,Row] as TMonthlyExpense).ExpenseType;
    Locate('exp_type',expType,[]);
  end;

  if not remove then
  begin
    with TfrmMonthlyExpDetail.Create(self) do
    begin
      ShowModal;

      // update row
      if ModalResult = mrOk then
      begin
        grMonExp.Cells[0,r] := ln.MonthlyExpense[r-1].ExpenseName;
        grMonExp.Cells[1,r] := ln.MonthlyExpense[r-1].ExpenseAmount;

        grMonExp.Objects[0,r] := ln.MonthlyExpense[r-1];
      end;

      Free;
    end;
  end
  else
  begin
    with TfrmDecisionBox.Create(nil,CONF) do
    begin
      try
        ShowModal;

        if ModalResult = mrYes then
        begin
          ln.RemoveMonthlyExpense(expType);
          ClearRow(grMonExp,r);
        end;

        Free;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    end;
  end;
end;

procedure TfrmLoanAssessmentDetail.AddRow(fin: TFinInfo);
var
  r: integer;
begin
  with grFinInfo do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := fin.CompanyName;
    Cells[1,r] := fin.Monthly;
    Cells[2,r] := fin.Balance;

    Objects[0,r] := fin;

  end;
end;

procedure TfrmLoanAssessmentDetail.AddRowExp(exp: TMonthlyExpense);
var
  r: integer;
begin
  with grMonExp do
  begin
    RowCount := RowCount + 1;

    r := RowCount - 2;

    Cells[0,r] := exp.ExpenseName;
    Cells[1,r] := exp.ExpenseAmount;

    Objects[0,r] := exp;

  end;
end;

procedure TfrmLoanAssessmentDetail.PopulateFinInfo;
var
  i, cnt: integer;
begin
  with grFinInfo do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Company';
    Cells[1,0] := 'Monthly';
    Cells[2,0] := 'Balance';

    // widths
    ColWidths[0] := 150;
    ColWidths[1] := 70;
    ColWidths[2] := 70;

    cnt := ln.FinancialInfoCount;

    for i := 0 to cnt - 1 do
      AddRow(ln.FinancialInfo[i]);

  end;
end;

procedure TfrmLoanAssessmentDetail.PopulateMonthlyExpense;
var
  i, cnt: integer;
begin
  with grMonExp do
  begin
    RowCount := RowCount + 1;

    FixedRows := 1;

    // headers
    Cells[0,0] := 'Expense';
    Cells[1,0] := 'Amount';

    // widths
    ColWidths[0] := 125;
    ColWidths[1] := 70;

    cnt := ln.MonthlyExpenseCount;

    for i := 0 to cnt - 1 do
      AddRowExp(ln.MonthlyExpense[i]);

  end;
end;

procedure TfrmLoanAssessmentDetail.btnAddClick(Sender: TObject);
begin
  inherited;
  if pcAssessment.ActivePage = tsFinInfo then
    AddFinancialInfo
  else
    AddMonthlyExpense;
end;

procedure TfrmLoanAssessmentDetail.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if pcAssessment.ActivePage = tsFinInfo then
    ModifyRemove(true)
  else
    ModifyRemoveExp(true);
end;

procedure TfrmLoanAssessmentDetail.grFinInfoDblClick(Sender: TObject);
begin
  ModifyRemove;
end;

procedure TfrmLoanAssessmentDetail.grMonExpDblClick(Sender: TObject);
begin
  ModifyRemoveExp;
end;

procedure TfrmLoanAssessmentDetail.AddFinancialInfo;
begin
  with TfrmFinInfoDetail.Create(nil) do
  begin
    try
      ln.AppendFinancialInfo;

      ShowModal;

      if ModalResult = mrOk then AddRow(ln.FinancialInfo[ln.FinancialInfoCount - 1]);

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanAssessmentDetail.AddMonthlyExpense;
begin
  with TfrmMonthlyExpDetail.Create(nil) do
  begin
    try
      ln.AppendMonthlyExpense;

      ShowModal;

      if ModalResult = mrOk then AddRowExp(ln.MonthlyExpense[ln.MonthlyExpenseCount - 1]);

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanAssessmentDetail.Save;
begin
  ln.Save;
end;

procedure TfrmLoanAssessmentDetail.urlAppliedAmountClick(Sender: TObject);
begin
  inherited;
  if ((ln.Action = laAssessing) or (ln.IsPending)) and (ln.Assessment.Recommendation = rcApprove) then
    edRecAmount.Value := ln.AppliedAmount;
end;

procedure TfrmLoanAssessmentDetail.Cancel;
begin
  ln.Cancel;
end;

procedure TfrmLoanAssessmentDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmLoanAssessmentDetail.FormShow(Sender: TObject);
begin
  inherited;
  PopulateFinInfo;
  PopulateMonthlyExpense;

  ExtendLastColumn(grFinInfo);
  ExtendLastColumn(grMonExp);

  // applied amount
  urlAppliedAmount.Caption := FormatFloat('###,##0.00',ln.AppliedAmount);
end;

function TfrmLoanAssessmentDetail.ValidEntry: boolean;
var
  error: string;
begin
  if dteDateAssessed.Text = '' then
    error := 'Please enter date assessed.'
  else if dbluRecommendation.Text = '' then
    error := 'Please select a recommendation.'
  else if (ln.Assessment.Recommendation = rcApprove) and  (edRecAmount.Value <= 0) then
    error := 'Invalid value for recommended amount.'
  else if edRecAmount.Value > ln.LoanClass.MaxLoan then
    error := 'Recommended amount exceeds the maximum loanable amount for the selected loan class.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
