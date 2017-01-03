unit LoanData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Rtti;

type
  TdmLoan = class(TDataModule)
    dstLoan: TADODataSet;
    dscLoan: TDataSource;
    dstLoanClass: TADODataSet;
    dscLoanClass: TDataSource;
    dstClients: TADODataSet;
    dscClients: TDataSource;
    dstLoanComaker: TADODataSet;
    dscLoanComaker: TDataSource;
    dstAlerts: TADODataSet;
    dscAlerts: TDataSource;
    dscComakers: TDataSource;
    dstComakers: TADODataSet;
    dscFinInfo: TDataSource;
    dstFinInfo: TADODataSet;
    dscMonExp: TDataSource;
    dstMonExp: TADODataSet;
    dstLoanAss: TADODataSet;
    dscLoanAss: TDataSource;
    dstLoanAppv: TADODataSet;
    dscLoanAppv: TDataSource;
    dstStatuses: TADODataSet;
    dscStatuses: TDataSource;
    dstLoanCancel: TADODataSet;
    dscLoanCancel: TDataSource;
    procedure dstLoanBeforeOpen(DataSet: TDataSet);
    procedure dstLoanClassBeforeOpen(DataSet: TDataSet);
    procedure dstLoanBeforePost(DataSet: TDataSet);
    procedure dstLoanNewRecord(DataSet: TDataSet);
    procedure dstLoanAfterPost(DataSet: TDataSet);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstLoanAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerBeforeOpen(DataSet: TDataSet);
    procedure dstLoanComakerNewRecord(DataSet: TDataSet);
    procedure dstLoanComakerAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerAfterPost(DataSet: TDataSet);
    procedure dstAlertsBeforeOpen(DataSet: TDataSet);
    procedure dstFinInfoBeforeOpen(DataSet: TDataSet);
    procedure dstFinInfoAfterOpen(DataSet: TDataSet);
    procedure dstMonExpAfterOpen(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure dstFinInfoBeforePost(DataSet: TDataSet);
    procedure dstLoanAssBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAppvBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAppvBeforePost(DataSet: TDataSet);
    procedure dstStatusesBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAssBeforePost(DataSet: TDataSet);
    procedure dstMonExpBeforeOpen(DataSet: TDataSet);
    procedure dstMonExpBeforePost(DataSet: TDataSet);
    procedure dstLoanAssAfterOpen(DataSet: TDataSet);
    procedure dstLoanAppvAfterOpen(DataSet: TDataSet);
    procedure dstLoanCancelBeforeOpen(DataSet: TDataSet);
    procedure dstLoanCancelBeforePost(DataSet: TDataSet);
    procedure dstLoanCancelAfterOpen(DataSet: TDataSet);
    procedure dstLoanAssAfterPost(DataSet: TDataSet);
    procedure dstLoanAppvAfterPost(DataSet: TDataSet);
    procedure dstLoanCancelAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetLoanClassProperties;
  public
    { Public declarations }
  end;

var
  dmLoan: TdmLoan;

implementation

uses
  AppData, Loan, DBUtil, IFinanceGlobal, LoanClassification, Comaker, FinInfo,
  MonthlyExpense;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmLoan.SetLoanClassProperties;
begin
  with dstLoan do
  begin
    ln.Status := FieldByName('status_id').AsString;
    ln.AppliedAmount := FieldByName('amt_appl').AsCurrency;
  end;
end;

procedure TdmLoan.dstAlertsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstFinInfoAfterOpen(DataSet: TDataSet);
var
  compId: integer;
  compName, balance, monthly: string;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssFinInfo';

  ln.ClearFinancialInfo;

  with DataSet do
  begin
    while not Eof do
    begin
      compId := FieldByName('comp_id').AsInteger;
      compName := FieldByName('comp_name').AsString;
      balance := FieldByName('loan_bal_f').AsString;
      monthly := FieldByName('mon_due_f').AsString;

      ln.AddFinancialInfo(TFinInfo.Create(compId,compName,balance,monthly));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstFinInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstFinInfoBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstLoanAfterOpen(DataSet: TDataSet);
begin
  SetLoanClassProperties;
end;

procedure TdmLoan.dstLoanAfterPost(DataSet: TDataSet);
begin
  SetLoanClassProperties;
end;

procedure TdmLoan.dstLoanAppvAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsApproved);
end;

procedure TdmLoan.dstLoanAppvAfterPost(DataSet: TDataSet);
begin
  ln.AddLoanState(lsApproved);
end;

procedure TdmLoan.dstLoanAppvBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanAppvBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('appv_by').AsString := ifn.User.UserId;
  SetCreatedFields(DataSet);
end;

procedure TdmLoan.dstLoanAssAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsAssessed);
end;

procedure TdmLoan.dstLoanAssAfterPost(DataSet: TDataSet);
begin
  ln.AddLoanState(lsAssessed);
end;

procedure TdmLoan.dstLoanAssBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanAssBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('ass_by').AsString := ifn.User.UserId;
end;

procedure TdmLoan.dstLoanBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  with DataSet do
  begin
    if State = dsInsert then
    begin
      id := GetLoanId;
      FieldByName('loan_id').AsString := id;
      FieldByName('entity_id').AsString := ln.Client.Id;

      SetCreatedFields(DataSet);

      ln.Id := id;
    end
    else
    begin
      Edit;

      if ln.Action = laAssessing then
        FieldByName('status_id').AsString :=
            TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.S)
      else if ln.Action = laApproving then
        FieldByName('status_id').AsString :=
            TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.A)
      else if ln.Action = laReleasing then
        FieldByName('status_id').AsString :=
            TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.R)
      else if ln.Action = laCancelling then
          FieldByName('status_id').AsString :=
            TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.C)
      else if ln.Action = laRejecting then
        FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.J);
    end;
  end;
end;

procedure TdmLoan.dstLoanCancelAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsCancelled);
end;

procedure TdmLoan.dstLoanCancelAfterPost(DataSet: TDataSet);
begin
  ln.AddLoanState(lsCancelled);
end;

procedure TdmLoan.dstLoanCancelBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanCancelBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('cancelled_by').AsString := ifn.User.UserId;
end;

procedure TdmLoan.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  if dstLoan.State = dsInsert then
    if DataSet.RecordCount > 0 then
      dstLoan.FieldByName('class_id').AsInteger := DataSet.FieldByName('class_id').AsInteger;
end;

procedure TdmLoan.dstLoanClassAfterScroll(DataSet: TDataSet);
var
  clId, term, comakers, groupId: integer;
  clName, loanType: string;
  interest, maxLoan: real;
  validFrom, validUntil: TDate;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    groupId := FieldByName('grp_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsFloat;
    term := FieldByName('term').AsInteger;
    loanType := FieldByName('loan_type').AsString;
    maxLoan := FieldByName('max_loan').AsFloat;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
  end;

  if not Assigned(ln.LoanClass) then
    ln.LoanClass := TLoanClassification.Create(clId, groupId, clName, interest,
        term, loanType, maxLoan, comakers, validFrom, validUntil)
  else
  begin
    with ln do
    begin
      LoanClass.ClassificationId := clId;
      LoanClass.GroupId := groupId;
      LoanClass.ClassificationName := clName;
      LoanClass.Interest := interest;
      LoanClass.Term := term;
      LoanClass.LoanType := loanType;
      LoanClass.MaxLoan := maxLoan;
      LoanClass.Comakers := comakers;
      LoanClass.ValidFrom := validFrom;
      LoanClass.ValidUntil := validUntil;
    end;
  end;
end;

procedure TdmLoan.dstLoanClassBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstLoanComakerAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanComaker';
  with DataSet do
  begin
    while not Eof do
    begin
      ln.AddComaker(TComaker.Create(FieldByName('name').AsString,
        FieldByName('entity_id').AsString));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanComakerAfterPost(DataSet: TDataSet);
begin
  RefreshDataSet('','entity_id',Dataset);
end;

procedure TdmLoan.dstLoanComakerBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanComakerNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstLoanNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('orig_branch').AsString := ifn.LocationCode;
  DataSet.FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
  DataSet.FieldByName('date_appl').AsDateTime := ifn.AppDate;
end;

procedure TdmLoan.dstMonExpAfterOpen(DataSet: TDataSet);
var
  expType, expName, expAmount: string;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssMonExp';

  ln.ClearMonthlyExpenses;

  with DataSet do
  begin
    while not Eof do
    begin
      expType := FieldByName('exp_type').AsString;
      expName := FieldByName('exp_name').AsString;
      expAmount := FieldByName('monthly_f').AsString;

      ln.AddMonthlyExpense(TMonthlyExpense.Create(expType,expName,expAmount));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstMonExpBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstMonExpBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstStatusesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

end.
