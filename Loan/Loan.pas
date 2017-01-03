unit Loan;

interface

uses
  SysUtils, Entity, LoanClient, AppConstants, DB, System.Rtti, ADODB, Variants,
  LoanClassification, Comaker, FinInfo, MonthlyExpense;

type
  TLoanAction = (laNone,laCreating,laAssessing,laApproving,laRejecting,laReleasing,laCancelling);

type TLoanState = (lsAssessed,lsApproved,lsReleased,lsCancelled,lsRejected);

type TLoanStatus = (A,C,P,R,F,J,S);

type
  TLoan = class(TEntity)
  private
    FClient: TLoanClient;
    FStatus: string;
    FAction: TLoanAction;
    FLoanClass: TLoanClassification;
    FComakers: array of TComaker;
    FAlerts: array of string;
    FFinancialInfo: array of TFinInfo;
    FMonthlyExpenses: array of TMonthlyExpense;
    FAppliedAmout: real;
    FLoanStatusHistory: array of TLoanState;

    procedure SaveComakers;
    procedure SaveAssessments;
    procedure SaveApproval;
    procedure SaveCancellation;

    function GetIsPending: boolean;
    function GetIsAssessed: boolean;
    function GetIsApproved: boolean;
    function GetIsReleased: boolean;
    function GetIsCancelled: boolean;
    function GetIsRejected: boolean;

    function GetComakerCount: integer;
    function GetAlert(const i: integer): string;
    function GetAlertsCount: integer;
    function GetHasId: boolean;
    function GetStatusName: string;
    function GetComaker(const i: integer): TComaker;
    function GetFinancialInfo(const i: integer): TFinInfo;
    function GetFinancialInfoCount: integer;
    function GetMonthlyExpense(const i: integer): TMonthlyExpense;
    function GetMonthlyExpenseCount: integer;
    function GetLoanState(const i: integer): TLoanState;
    function GetLoanStateCount: integer;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve(const closeDataSources: boolean = false);
    procedure SetDefaultValues;
    procedure AddComaker(cmk: TComaker);
    procedure RemoveComaker(cmk: TComaker);
    procedure AddAlert(const alert: string);
    procedure GetAlerts;
    procedure AppendFinancialInfo;
    procedure AddFinancialInfo(const financialInfo: TFinInfo; const overwrite: boolean = false);
    procedure RemoveFinancialInfo(const compId: integer);
    procedure AppendMonthlyExpense;
    procedure AddMonthlyExpense(const monthExp: TMonthlyExpense; const overwrite: boolean = false);
    procedure RemoveMonthlyExpense(const expType: string);
    procedure ClearFinancialInfo;
    procedure ClearMonthlyExpenses;
    procedure AddLoanState(const loanState: TLoanState);

    function ComakerExists(cmk: TComaker): boolean;
    function FinancialInfoExists(const compId: integer): boolean;
    function MonthlyExpenseExists(const expType: string): boolean;

    property Client: TLoanClient read FClient write FClient;
    property Status: string read FStatus write FStatus;
    property StatusName: string read GetStatusName;
    property Action: TLoanAction read FAction write FAction;
    property LoanClass: TLoanClassification read FLoanClass write FLoanClass;
    property IsPending: boolean read GetIsPending;
    property IsAssessed: boolean read GetIsAssessed;
    property IsApproved: boolean read GetIsApproved;
    property IsReleased: boolean read GetIsReleased;
    property IsCancelled: boolean read GetIsCancelled;
    property IsRejected: boolean read GetIsRejected;
    property ComakerCount: integer read GetComakerCount;
    property Alerts[const i: integer]: string read GetAlert;
    property AlertsCount: integer read GetAlertsCount;
    property HasId: boolean read GetHasId;
    property Comaker[const i: integer]: TComaker read GetComaker;
    property AppliedAmount: real read FAppliedAmout write FAppliedAmout;
    property FinancialInfoCount: integer read GetFinancialInfoCount;
    property FinancialInfo[const i: integer]: TFinInfo read GetFinancialInfo;
    property MonthlyExpenseCount: integer read GetMonthlyExpenseCount;
    property MonthlyExpense[const i: integer]: TMonthlyExpense read GetMonthlyExpense;
    property LoanStatusHistory[const i: integer]: TLoanState read GetLoanState;
    property LoanSatusCount: integer read GetLoanStateCount;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

var
  ln: TLoan;

implementation

uses
  LoanData, IFinanceGlobal;

constructor TLoan.Create;
begin
  if ln <> nil then
    Abort
  else
  begin
    ln := self;

    if HasId then
      FAction := laNone
    else
      FAction := laCreating;
  end;
end;

destructor TLoan.Destroy;
begin
  if ln = self then
    ln := nil;
end;

procedure TLoan.Add;
begin
  with dmLoan.dstLoan do
  begin
    Open;
    Append;
  end;

  with dmLoan.dstLoanComaker do
    Open;
end;

procedure TLoan.Save;
begin
  with dmLoan.dstLoan do
    if State in [dsInsert,dsEdit] then
      Post;

  if ln.Action = laCreating then
    SaveComakers
  else if ln.Action = laAssessing then
    SaveAssessments
  else if ln.Action = laApproving then
    SaveApproval
  else if ln.Action = laCancelling then
    SaveCancellation;   

  ln.Action := laNone;
end;

procedure TLoan.Edit;
begin

end;

procedure TLoan.Cancel;
begin
  with dmLoan, dmLoan.dstLoan do
  begin
    if (ln.Action = laCreating) or (ln.IsPending) then
    begin
     if State in [dsInsert,dsEdit] then
       Cancel;
    end;

    if ln.Action = laAssessing then
    begin
      dstLoanClass.Cancel;

      dstFinInfo.Close;
      dstFinInfo.Open;

      dstMonExp.Close;
      dstMonExp.Open;
    end
    else if ln.Action = laApproving then
    begin
      if dstLoanAppv.State in [dsInsert,dsEdit] then
        dstLoanAppv.Cancel;
    end
    else if ln.Action = laCancelling then
    begin
      if dstLoanCancel.State in [dsInsert,dsEdit] then
        dstLoanCancel.Cancel;
    end;
  end;

end;

procedure TLoan.Retrieve(const closeDataSources: boolean = false);
var
  i: integer;
begin
  // clear loan state history
  SetLength(FLoanStatusHistory,0);

  with dmLoan do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [1] then
        begin
          if closeDataSources then
            (Components[i] as TADODataSet).Close;

          (Components[i] as TADODataSet).DisableControls;
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).EnableControls;
        end;
    end;
  end;

  ln.Action := laNone;
end;

procedure TLoan.SetDefaultValues;
begin
  with dmLoan do
  begin
    if ln.Action = laAssessing then
    begin
      if not dstLoanAss.Active then
        dstLoanAss.Open;

      dstLoanAss.Append;
      dstLoanAss.FieldByName('date_ass').AsDateTime := ifn.AppDate;
      dstLoanAss.FieldByName('rec_amt').AsCurrency := ln.AppliedAmount;
      dstLoanAss.FieldByName('ass_by').AsString := ifn.User.UserId;
    end;
  end;
end;

procedure TLoan.AddComaker(cmk: TComaker);
begin
  if not ComakerExists(cmk) then
  begin
    SetLength(FComakers,Length(FComakers) + 1);
    FComakers[Length(FComakers) - 1] := cmk;
  end;
end;

procedure TLoan.RemoveComaker(cmk: TComaker);
var
  i, len: integer;
  co: TComaker;
begin
  len := Length(FComakers);

  for i := 0 to len - 1 do
  begin
    co := FComakers[i];
    if co.Id <> cmk.Id then
      FComakers[i] := co;
  end;

  SetLength(FComakers,Length(FComakers) - 1);
end;

procedure TLoan.GetAlerts;
begin
  // clear alerts
  FAlerts := [];

  with dmLoan do
  begin
    dstAlerts.Close;
    dstAlerts.Open;
  end;
end;

procedure TLoan.AddAlert(const alert: string);
begin
  SetLength(FAlerts,Length(FAlerts) + 1);
  FAlerts[Length(FAlerts) - 1] := alert;
end;

procedure TLoan.AppendFinancialInfo;
begin
  with dmLoan.dstFinInfo do
    Append;
end;

procedure TLoan.AppendMonthlyExpense;
begin
  with dmLoan.dstMonExp do
    Append;
end;

procedure TLoan.AddFinancialInfo(const financialInfo: TFinInfo; const overwrite: boolean = false);
var
  index: integer;
begin
  if not FinancialInfoExists(financialInfo.CompanyId) then
  begin
    SetLength(FFinancialInfo,Length(FFinancialInfo) + 1);
    FFinancialInfo[Length(FFinancialInfo) - 1] := financialInfo;
  end
  else if overwrite then
  begin
    with dmLoan.dstFinInfo do
      index := RecNo;

    FFinancialInfo[index - 1] := financialInfo;
  end;
end;

procedure TLoan.RemoveFinancialInfo(const compId: integer);
var
  i, len, ii: integer;
  fin: TFinInfo;
begin
  len := Length(FFinancialInfo);
  ii := -1;

  for i := 0 to len - 1 do
  begin
    fin := FFinancialInfo[i];
    if fin.CompanyId = compId then ii := i + 1
    else Inc(ii);

    FFinancialInfo[i] := FFinancialInfo[ii];
  end;

  SetLength(FFinancialInfo,Length(FFinancialInfo) - 1);

  // remove from db
  with dmLoan.dstFinInfo do
    Delete;
end;

procedure TLoan.AddMonthlyExpense(const monthExp: TMonthlyExpense; const overwrite: boolean = false);
var
  index: integer;
begin
  if not MonthlyExpenseExists(monthExp.ExpenseType) then
  begin
    SetLength(FMonthlyExpenses,Length(FMonthlyExpenses) + 1);
    FMonthlyExpenses[Length(FMonthlyExpenses) - 1] := monthExp;
  end
  else if overwrite then
  begin
    with dmLoan.dstMonExp do
      index := RecNo;

    FMonthlyExpenses[index - 1] := monthExp;
  end;
end;

procedure TLoan.RemoveMonthlyExpense(const expType: string);
var
  i, len, ii: integer;
  exp: TMonthlyExpense;
begin
  len := Length(FMonthlyExpenses);
  ii := -1;

  for i := 0 to len - 1 do
  begin
    exp := FMonthlyExpenses[i];
    if exp.ExpenseType = expType then ii := i + 1
    else Inc(ii);

    FMonthlyExpenses[i] := FMonthlyExpenses[ii];
  end;

  SetLength(FMonthlyExpenses,Length(FMonthlyExpenses) - 1);

  // remove from db
  with dmLoan.dstMonExp do
    Delete;
end;

procedure TLoan.SaveComakers;
var
  i, len: integer;
begin
  with dmLoan.dstLoanComaker do
  begin
    len := Length(FComakers) - 1;
    for i := 0 to len do
    begin
      Append;
      FieldByName('entity_id').AsString := FComakers[i].Id;
      Post;
    end;
  end;
end;

procedure TLoan.SaveAssessments;
begin
  with dmLoan do
  begin
    if dstLoanAss.State in [dsInsert,dsEdit] then
      dstLoanAss.Post;

    dstFinInfo.UpdateBatch;
    dstMonExp.UpdateBatch;
  end;
end;

procedure TLoan.SaveApproval;
begin
  with dmLoan.dstLoanAppv do
    if State in [dsInsert,dsEdit] then
      Post;
end;

procedure TLoan.SaveCancellation;
begin
  with dmLoan.dstLoanCancel do
    if State in [dsInsert,dsEdit] then
      Post;
end;

procedure TLoan.ClearFinancialInfo;
begin
  SetLength(FFinancialInfo,0);
end;

procedure TLoan.ClearMonthlyExpenses;
begin
  SetLength(FMonthlyExpenses,0);
end;

procedure TLoan.AddLoanState(const loanState: TLoanState);
begin
  SetLength(FLoanStatusHistory,Length(FLoanStatusHistory) + 1);
  FLoanStatusHistory[Length(FLoanStatusHistory) - 1] := loanState;
end;

function TLoan.GetIsPending: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
end;

function TLoan.GetIsAssessed: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.S);
end;

function TLoan.GetIsApproved: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.A);
end;

function TLoan.GetIsReleased: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.R);
end;

function TLoan.GetIsCancelled: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.C);
end;

function TLoan.GetIsRejected: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.J);
end;

function TLoan.GetComakerCount: integer;
begin
  Result := Length(FComakers);
end;

function TLoan.GetFinancialInfoCount: integer;
begin
  Result := Length(FFinancialInfo);
end;

function TLoan.GetMonthlyExpenseCount: integer;
begin
  Result := Length(FMonthlyExpenses);
end;

function TLoan.ComakerExists(cmk: TComaker): boolean;
var
  i, len: integer;
  co: TComaker;
begin
  Result := false;

  len := Length(FComakers);

  for i := 0 to len - 1 do
  begin
    co := FComakers[i];
    if co.Id = cmk.Id then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.GetAlert(const i: integer): string;
begin
  Result := FAlerts[i];
end;

function TLoan.GetAlertsCount: integer;
begin
  Result := Length(FAlerts);
end;

function TLoan.GetHasId: boolean;
begin
  Result := FId <> '';
end;

function TLoan.GetStatusName: string;
begin
  if IsPending then Result := 'Pending'
  else if IsAssessed then Result := 'Assessed'
  else if IsApproved then Result := 'Approved'
  else if IsReleased then Result := 'Active'
  else if IsCancelled then Result := 'Cancelled'
  else if IsRejected then Result := 'Rejected';
end;

function TLoan.FinancialInfoExists(const compId: Integer): boolean;
var
  i, len: integer;
  fin: TFinInfo;
begin
  Result := false;

  len := Length(FFinancialInfo);

  for i := 0 to len - 1 do
  begin
    fin := FFinancialInfo[i];
    if fin.CompanyId = compId then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.MonthlyExpenseExists(const expType: string): boolean;
var
  i, len: integer;
  exp: TMonthlyExpense;
begin
  Result := false;

  len := Length(FMonthlyExpenses);

  for i := 0 to len - 1 do
  begin
    exp := FMonthlyExpenses[i];
    if exp.ExpenseType = expType then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.GetComaker(const i: Integer): TComaker;
begin
  Result := FComakers[i];
end;

function TLoan.GetFinancialInfo(const i: integer): TFinInfo;
begin
  Result := FFinancialInfo[i];
end;

function TLoan.GetMonthlyExpense(const i: Integer): TMonthlyExpense;
begin
  Result := FMonthlyExpenses[i];
end;

function TLoan.GetLoanState(const i: integer): TLoanState;
begin
  Result := FLoanStatusHistory[i];
end;

function TLoan.GetLoanStateCount;
begin
  Result := Length(FLoanStatusHistory);
end;

end.
