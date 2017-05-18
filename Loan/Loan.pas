unit Loan;

interface

uses
  SysUtils, Entity, LoanClient, AppConstants, DB, System.Rtti, ADODB, Variants,
  LoanClassification, Comaker, FinInfo, MonthlyExpense, ReleaseRecipient,
  LoanCharge, LoanClassCharge, Assessment, Posting;

type TLoanAction = (laNone,laCreating,laAssessing,laApproving,laRejecting,laReleasing,laCancelling);

type TLoanState = (lsNone,lsAssessed,lsApproved,lsActive,lsCancelled,lsRejected);

type TLoanStatus = (A,C,P,R,F,J,S);

{ ****** Loan Status *****
	-- 0 = all
	-- 1 = pending = P
	-- 2 = assessed = S
	-- 3 = approved = A
	-- 4 = active / released = R
	-- 5 = cancelled = C
	-- 6 = denied / rejected = J

  ***** Loan Status ***** }

type
  TLoan = class(TEntity)
  private
    FClient: TLoanClient;
    FStatus: string;
    FAction: TLoanAction;
    FLoanClass: TLoanClassification;
    FComakers: array of TComaker;
    FFinancialInfo: array of TFinInfo;
    FMonthlyExpenses: array of TMonthlyExpense;
    FAppliedAmout: real;
    FLoanStatusHistory: array of TLoanState;
    FReleaseRecipients: array of TReleaseRecipient;
    FLoanCharges: array of TLoanCharge;
    FApprovedAmount: real;
    FDesiredTerm: integer;
    FAssessment: TAssessment;
    FReleaseAmount: real;
    FApprovedTerm: integer;

    procedure SaveComakers;
    procedure SaveAssessments;
    procedure SaveApproval;
    procedure SaveCancellation;
    procedure SaveRejection;
    procedure SaveRelease;

    function GetIsPending: boolean;
    function GetIsAssessed: boolean;
    function GetIsApproved: boolean;
    function GetIsActive: boolean;
    function GetIsCancelled: boolean;
    function GetIsRejected: boolean;

    function GetComakerCount: integer;
    function GetNew: boolean;
    function GetStatusName: string;
    function GetComaker(const i: integer): TComaker;
    function GetFinancialInfo(const i: integer): TFinInfo;
    function GetFinancialInfoCount: integer;
    function GetMonthlyExpense(const i: integer): TMonthlyExpense;
    function GetMonthlyExpenseCount: integer;
    function GetLoanState(const i: integer): TLoanState;
    function GetLoanStateCount: integer;
    function GetReleaseRecipient(const i: integer): TReleaseRecipient;
    function GetReleaseRecipientCount: integer;
    function GetLoanCharge(const i: integer): TLoanCharge;
    function GetLoanChargeCount: integer;
    function GetIsFinalised: boolean;
    function GetTotalCharges: real;
    function GetTotalReleased: real;
    function GetNetProceeds: real;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve(const closeDataSources: boolean = false);
    procedure SetDefaultValues;
    procedure AddComaker(cmk: TComaker; const append: boolean = false);
    procedure RemoveComaker(cmk: TComaker);
    procedure AppendFinancialInfo;
    procedure AddFinancialInfo(const financialInfo: TFinInfo; const overwrite: boolean = false);
    procedure RemoveFinancialInfo(const compId: string);
    procedure AppendMonthlyExpense;
    procedure AddMonthlyExpense(const monthExp: TMonthlyExpense; const overwrite: boolean = false);
    procedure RemoveMonthlyExpense(const expType: string);
    procedure ClearFinancialInfo;
    procedure ClearMonthlyExpenses;
    procedure AddLoanState(const loanState: TLoanState);
    procedure GetAlerts;
    procedure AddReleaseRecipient(const rec: TReleaseRecipient; const overwrite: boolean = false);
    procedure AppendReleaseRecipient(const rec: TReleaseRecipient = nil);
    procedure ClearReleaseRecipients;
    procedure AddLoanCharge(const charge: TLoanCharge; const append: boolean = false);
    procedure ClearLoanCharges;
    procedure ComputeCharges;
    procedure RemoveReleaseRecipient(const rec: TReleaseRecipient);
    procedure ChangeLoanStatus;
    procedure ClearComakers;

    function ComakerExists(cmk: TComaker): boolean;
    function FinancialInfoExists(const compId: string): boolean;
    function MonthlyExpenseExists(const expType: string): boolean;
    function ReleaseRecipientExists(const recipient, location, method: string): boolean;
    function LoanChargeExists(const charge: TLoanCharge): boolean;
    function LoanStateExists(const state: TLoanState): boolean;
    function HasLoanState(const ls: TLoanState): boolean;

    property Client: TLoanClient read FClient write FClient;
    property Status: string read FStatus write FStatus;
    property StatusName: string read GetStatusName;
    property Action: TLoanAction read FAction write FAction;
    property LoanClass: TLoanClassification read FLoanClass write FLoanClass;
    property IsPending: boolean read GetIsPending;
    property IsAssessed: boolean read GetIsAssessed;
    property IsApproved: boolean read GetIsApproved;
    property IsActive: boolean read GetIsActive;
    property IsCancelled: boolean read GetIsCancelled;
    property IsRejected: boolean read GetIsRejected;
    property ComakerCount: integer read GetComakerCount;
    property New: boolean read GetNew;
    property Comaker[const i: integer]: TComaker read GetComaker;
    property AppliedAmount: real read FAppliedAmout write FAppliedAmout;
    property FinancialInfoCount: integer read GetFinancialInfoCount;
    property FinancialInfo[const i: integer]: TFinInfo read GetFinancialInfo;
    property MonthlyExpenseCount: integer read GetMonthlyExpenseCount;
    property MonthlyExpense[const i: integer]: TMonthlyExpense read GetMonthlyExpense;
    property LoanStatusHistory[const i: integer]: TLoanState read GetLoanState;
    property LoanSatusCount: integer read GetLoanStateCount;
    property ReleaseRecipients[const i: integer]: TReleaseRecipient read GetReleaseRecipient;
    property ReleaseRecipientCount: integer read GetReleaseRecipientCount;
    property LoanCharges[const i: integer]: TLoanCharge read GetLoanCharge;
    property LoanChargeCount: integer read GetLoanChargeCount;
    property ApprovedAmount: real read FApprovedAmount write FApprovedAmount;
    property DesiredTerm: integer read FDesiredTerm write FDesiredTerm;
    property IsFinalised: boolean read GetIsFinalised;
    property TotalCharges: real read GetTotalCharges;
    property TotalReleased: real read GetTotalReleased;
    property Assessment: TAssessment read FAssessment write FAssessment;
    property ReleaseAmount: real read FReleaseAmount write FReleaseAmount;
    property ApprovedTerm: integer read FApprovedTerm write FApprovedTerm;
    property NetProceeds: real read GetNetProceeds;

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

  if (ln.Action = laCreating) or (ln.IsPending) then
    SaveComakers;

  if ln.Action = laAssessing then
    SaveAssessments
  else if ln.Action = laApproving then
    SaveApproval
  else if ln.Action = laCancelling then
    SaveCancellation
  else if ln.Action = laRejecting then
    SaveRejection
  else if ln.Action = laReleasing then
    SaveRelease;

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

      dstLoanComaker.CancelBatch;

      // close loan class
      if ln.Action = laCreating then dstLoanClass.Close;
    end;

    if ln.Action = laAssessing then
    begin
      dstLoanAss.Cancel;

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
    end
    else if ln.Action = laRejecting then
    begin
      if dstLoanReject.State in [dsInsert,dsEdit] then
        dstLoanReject.Cancel;
    end
    else if ln.Action = laReleasing then
    begin
      if dstLoanRelease.State in [dsInsert,dsEdit] then
        dstLoanRelease.Cancel;

      dstLoanRelease.CancelBatch;
      dstLoanCharge.CancelBatch;
    end;
  end;

  ln.Action := laNone;
end;

procedure TLoan.Retrieve(const closeDataSources: boolean = false);
var
  i: integer;
  tags: set of 1..6;
begin
  // clear loan state history
  if closeDataSources then SetLength(FLoanStatusHistory,0);

  // set tags according to loan status and action
  if ln.IsPending then  tags := [1]
  else if ln.IsAssessed then tags := [1,2]
  else if ln.IsApproved then tags := [1,2,3]
  else if ln.IsActive then tags := [1,2,3,4]
  else if ln.IsCancelled then tags := [1,2,3,5]
  else if ln.IsRejected then tags := [1,2,3,6];

  // add tags depending on action
  if ln.Action = laAssessing then tags := tags + [2]
  else if ln.Action = laApproving then tags := tags + [3]
  else if ln.Action = laReleasing then tags := tags + [4]
  else if ln.Action = laCancelling then tags := tags + [5]
  else if ln.Action = laRejecting then tags := tags + [6];

  with dmLoan do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in tags then
        begin
          if closeDataSources then
            (Components[i] as TADODataSet).Close;

          (Components[i] as TADODataSet).DisableControls;
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).EnableControls;
        end;
    end;
  end;
end;

procedure TLoan.SetDefaultValues;
begin
  with dmLoan do
  begin
    if ln.Action = laAssessing then
    begin
      if dstLoanAss.RecordCount = 0 then
      begin
        dstLoanAss.Append;
        dstLoanAss.FieldByName('date_ass').AsDateTime := ifn.AppDate;
        dstLoanAss.FieldByName('ass_by').AsString := ifn.User.UserId;
      end;
    end
    else if ln.Action = laApproving then
    begin
      if dstLoanAppv.RecordCount = 0 then
      begin
        dstLoanAppv.Append;
        dstLoanAppv.FieldByName('date_appv').AsDateTime := ifn.AppDate;
        dstLoanAppv.FieldByName('appv_by').AsString := ifn.User.UserId;
      end;
    end
    else if ln.Action = laCancelling then
    begin
      if dstLoanCancel.RecordCount = 0 then
      begin
        dstLoanCancel.Append;
        dstLoanCancel.FieldByName('cancelled_date').AsDateTime := ifn.AppDate;
        dstLoanCancel.FieldByName('cancelled_by').AsString := ifn.User.UserId;
      end;
    end
    else if ln.Action = laRejecting then
    begin
      if dstLoanReject.RecordCount = 0 then
      begin
        dstLoanReject.Append;
        dstLoanReject.FieldByName('date_rejected').AsDateTime := ifn.AppDate;
        dstLoanReject.FieldByName('rejected_by').AsString := ifn.User.UserId;
      end;
    end;
  end;
end;

procedure TLoan.AddComaker(cmk: TComaker; const append: boolean);
begin
  if not ComakerExists(cmk) then
  begin
    SetLength(FComakers,Length(FComakers) + 1);
    FComakers[Length(FComakers) - 1] := cmk;

    // add in db
    if (append) and (ln.IsPending) then
    with dmLoan.dstLoanComaker do
    begin
      Append;
      FieldByName('entity_id').AsString := cmk.Id;
      Post;
    end;
  end;
end;

procedure TLoan.RemoveComaker(cmk: TComaker);
var
  i, ii, len: integer;
  co: TComaker;
begin
  len := Length(FComakers);

  ii := 0;
  for i := 0 to len - 1 do
  begin
    co := FComakers[i];
    if co.Id <> cmk.Id then
    begin
      FComakers[ii] := co;
      Inc(ii);
    end;
  end;

  SetLength(FComakers,Length(FComakers) - 1);

  // delete from db
  with dmLoan.dstLoanComaker do
  begin
    if RecordCount > 0 then
    begin
      Locate('entity_id',cmk.Id,[]);
      Delete;
    end;
  end;
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

procedure TLoan.RemoveFinancialInfo(const compId: string);
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
  i, cnt: integer;
begin
  with dmLoan.dstLoanComaker do
  begin
    cnt := ln.ComakerCount - 1;
    if ln.Action = laCreating then
    begin
      for i := 0 to cnt do
      begin
        Append;
        FieldByName('entity_id').AsString := ln.Comaker[i].Id;
        Post;
      end;
    end;

    UpdateBatch;
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

    // requery to refresh dataset
    dstLoanAss.Requery;
    dstFinInfo.Requery;
    dstMonExp.Requery;
  end;
end;

procedure TLoan.SaveApproval;
begin
  with dmLoan.dstLoanAppv do
    if State in [dsInsert,dsEdit] then
    begin
      Post;
      Requery;
    end;
end;

procedure TLoan.SaveCancellation;
begin
  with dmLoan.dstLoanCancel do
    if State in [dsInsert,dsEdit] then
    begin
      Post;
      Requery;
    end;
end;

procedure TLoan.SaveRejection;
begin
  with dmLoan.dstLoanReject do
    if State in [dsInsert,dsEdit] then
    begin
      Post;
      Requery;
    end;
end;

procedure TLoan.SaveRelease;
begin
  with dmLoan do
  begin
    dstLoanRelease.UpdateBatch;
    dstLoanCharge.UpdateBatch;

    dstLoanRelease.Requery;
    dstLoanCharge.Requery;

    if not ln.HasLoanState(lsActive) then
    begin
      ln.ChangeLoanStatus;
      ln.AddLoanState(lsActive);

      TPosting.Post(TObject(self));
    end
  end;
end;

procedure TLoan.ChangeLoanStatus;
begin
  with dmLoan.dstLoan do
  begin
    Edit;

    if ln.Action = laAssessing then
      FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.S)
    else if ln.Action = laApproving then
      FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.A)
    else if ln.Action = laReleasing then
    begin
      FieldByName('balance').AsFloat := FReleaseAmount;
      FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.R)
    end
    else if ln.Action = laCancelling then
        FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.C)
    else if ln.Action = laRejecting then
      FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.J);

    Post;
  end;
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
  if not LoanStateExists(loanState) then
  begin
    SetLength(FLoanStatusHistory,Length(FLoanStatusHistory) + 1);
    FLoanStatusHistory[Length(FLoanStatusHistory) - 1] := loanState;
  end;
end;

procedure TLoan.GetAlerts;
begin
  with dmLoan.dstAlerts do
    Open;
end;

procedure TLoan.AddReleaseRecipient(const rec: TReleaseRecipient; const overwrite: boolean);
var
  index: integer;
begin
  if not ReleaseRecipientExists(rec.Recipient.Id,rec.LocationCode, rec.ReleaseMethod.Id) then
  begin
    SetLength(FReleaseRecipients,Length(FReleaseRecipients) + 1);
    FReleaseRecipients[Length(FReleaseRecipients) - 1] := rec;
  end
  else if overwrite then
  begin
    // get the record no
    // Note: DataSet.Locate has been called prior to opening the detail window
    with dmLoan.dstLoanRelease do
      index := RecNo;

    FReleaseRecipients[index - 1] := rec;
  end;
end;

procedure TLoan.AppendReleaseRecipient(const rec: TReleaseRecipient = nil);
begin
  with dmLoan.dstLoanRelease, rec do
  begin
    Append;

    if Assigned(rec) then
    begin
      FieldByName('recipient').AsString := Recipient.Id;
      FieldByName('rel_method').AsString := ReleaseMethod.Id;
      FieldByName('rel_amt').AsFloat := Amount;
      FieldByName('date_rel').AsDateTime := rec.Date;
      Post;
    end;
  end;
end;

procedure TLoan.ClearReleaseRecipients;
begin
  FReleaseRecipients := [];
end;

procedure TLoan.AddLoanCharge(const charge: TLoanCharge; const append: boolean);
var
  lc: TLoanCharge;
begin
  if not LoanChargeExists(charge) then
  begin
    SetLength(FLoanCharges,Length(FLoanCharges) + 1);
    FLoanCharges[Length(FLoanCharges) - 1] := charge;

    if append then
    begin
      with dmLoan.dstLoanCharge do
      begin
        Append;
        FieldByName('loan_id').AsString := FId;
        FieldByName('charge_type').AsString := charge.ChargeType;
        FieldByName('charge_amt').AsFloat := charge.Amount;
        Post;
      end;
    end;
  end
  else
  begin
    // update if charge exists
    for lc in FLoanCharges do
      if lc.ChargeType = charge.ChargeType then
        lc.Amount := charge.Amount;

    if append then
    begin
      with dmLoan.dstLoanCharge do
      begin
        Locate('charge_type',charge.ChargeType,[]);
        Edit;
        FieldByName('charge_amt').AsFloat := charge.Amount;
        Post;
      end;
    end;
  end;
end;

procedure TLoan.ClearLoanCharges;
begin
  FLoanCharges := [];
end;

procedure TLoan.ComputeCharges;
var
  i, cnt: integer;
  charge: TLoanCharge;
  classCharge: TLoanClassCharge;
begin
  cnt := FLoanClass.ClassChargesCount - 1;

  for i := 0 to cnt do
  begin
    classCharge := FLoanClass.ClassCharge[i];

    charge := TLoanCharge.Create;

    charge.ChargeType := classCharge.ChargeType;
    charge.ChargeName := classCharge.ChargeName;

    if classCharge.ValueType = vtFixed then
      charge.Amount := classCharge.ChargeValue
    else if classCharge.ValueType = vtPercentage then
      charge.Amount := (classCharge.ChargeValue * FReleaseAmount) / 100
    else if classCharge.ValueType = vtRatio then
    begin
      if classCharge.MaxValueType = mvtAmount then
      begin
        charge.Amount := classCharge.ChargeValue * (FReleaseAmount / classCharge.RatioAmount) * FApprovedTerm;
        if charge.Amount > classCharge.MaxValue then
          charge.Amount := classCharge.MaxValue;
      end
      else
        charge.Amount := classCharge.ChargeValue * (FReleaseAmount / classCharge.RatioAmount) * classCharge.MaxValue;
    end;

    AddLoanCharge(charge,true);
  end;
end;

procedure TLoan.RemoveReleaseRecipient(const rec: TReleaseRecipient);
var
  i, len, ii: integer;
  rcp: TReleaseRecipient;
begin
  len := Length(FReleaseRecipients);

  ii := 0;

  for i := 0 to len - 1 do
  begin
    rcp := FReleaseRecipients[i];
    if (rcp.Recipient.Id = rec.Recipient.Id) and (rcp.ReleaseMethod.Id = rec.ReleaseMethod.Id) then
      Continue
    else
    begin
      FReleaseRecipients[ii] := rcp;
      Inc(ii);
    end;
  end;

  SetLength(FReleaseRecipients,Length(FReleaseRecipients) - 1);

  // remove from db
  with dmLoan.dstLoanRelease do
    Delete;
end;

procedure TLoan.ClearComakers;
begin
  FComakers := [];
end;

function TLoan.HasLoanState(const ls: TLoanState): boolean;
var
  i, len: integer;
begin
  Result := false;

  len := Length(FLoanStatusHistory);
  for i := 0 to len - 1 do
  begin
    if FLoanStatusHistory[i] = ls then
    begin
      Result := true;
      Exit;
    end;
  end;
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

function TLoan.GetIsActive: boolean;
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

function TLoan.GetNetProceeds: real;
begin
  Result := FReleaseAmount - GetTotalCharges;
end;

function TLoan.GetNew: boolean;
begin
  Result := FId = '';
end;

function TLoan.GetStatusName: string;
begin
  if IsPending then Result := 'Pending'
  else if IsAssessed then Result := 'Assessed'
  else if IsApproved then Result := 'Approved'
  else if IsActive then Result := 'Active'
  else if IsCancelled then Result := 'Cancelled'
  else if IsRejected then Result := 'Rejected';
end;

function TLoan.FinancialInfoExists(const compId: string): boolean;
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

function TLoan.ReleaseRecipientExists(const recipient, location, method: string): boolean;
var
  i, len: integer;
  rcp: TReleaseRecipient;
begin
  Result := false;

  len := Length(FReleaseRecipients);

  for i := 0 to len - 1 do
  begin
    rcp := FReleaseRecipients[i];
    if (rcp.Recipient.Id = recipient) and
        (Trim(rcp.LocationCode) = Trim(location)) and
        (rcp.ReleaseMethod.Id = method) then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.GetReleaseRecipientCount;
begin
  Result := Length(FReleaseRecipients);
end;

function TLoan.GetReleaseRecipient(const i: integer): TReleaseRecipient;
begin
  Result := FReleaseRecipients[i];
end;

function TLoan.GetLoanCharge(const i: Integer): TLoanCharge;
begin
  Result := FLoanCharges[i];
end;

function TLoan.GetLoanChargeCount;
begin
  Result := Length(FLoanCharges);
end;

function TLoan.LoanChargeExists(const charge: TLoanCharge): boolean;
var
  i, len: integer;
  ch: TLoanCharge;
begin
  Result := false;

  len := Length(FLoanCharges);

  for i := 0 to len - 1 do
  begin
    ch := FLoanCharges[i];
    if ch.ChargeType = charge.ChargeType then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.LoanStateExists(const state: TLoanState): boolean;
var
  i, len: integer;
  st: TLoanState;
begin
  Result := false;

  len := Length(FLoanStatusHistory);

  for i := 0 to len - 1 do
  begin
    st := FLoanStatusHistory[i];
    if st = state then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.GetIsFinalised: boolean;
begin
  Result := IsRejected or IsCancelled or IsActive;
end;

function TLoan.GetTotalCharges: real;
var
  i, cnt: integer;
  total: real;
begin
  cnt := GetLoanChargeCount - 1;

  total := 0;

  for i := 0 to cnt do total := FLoanCharges[i].Amount + total;

  Result := total;
end;

function TLoan.GetTotalReleased: real;
var
  rr: TReleaseRecipient;
  total: real;
begin
  total := 0;

  for rr in FReleaseRecipients do
    total := total + rr.Amount;

  Result := total;
end;

end.

