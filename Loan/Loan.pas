unit Loan;

interface

uses
  SysUtils, Entity, LoanClient, AppConstants, DB, System.Rtti, ADODB, Variants,
  LoanClassification, Comaker;

type
  TLoanAction = (laNone,laCreating,laAssessing,laApproving,laDenying,laReleasing,laCancelling);

type TLoanStatus = (A,C,P,R,D,X,S);

type
  TLoan = class(TEntity)
  private
    FClient: TLoanClient;
    FStatus: string;
    FAction: TLoanAction;
    FLoanClass: TLoanClassification;
    FComakers: array of TComaker;
    FAlerts: array of string;
    FCompetitors: array of integer;
    FMonthlyExpenses: array of string;

    procedure SaveComakers;

    function GetIsPending: boolean;
    function GetIsAssessed: boolean;
    function GetIsApproved: boolean;
    function GetIsReleased: boolean;
    function GetIsCancelled: boolean;
    function GetIsDenied: boolean;
    function GetIsApprovedCancelled: boolean;
    function GetComakerCount: integer;
    function GetAlert(const i: integer): string;
    function GetAlertsCount: integer;
    function GetHasId: boolean;
    function GetStatusName: string;
    function GetComaker(const i: integer): TComaker;

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
    procedure AddCompetitor(const compId: integer);
    procedure RemoveCompetitor(const compId: integer);
    procedure AddMonthlyExpense(const expType: string);
    procedure RemoveMonthlyExpense(const expType: string);

    function ComakerExists(cmk: TComaker): boolean;
    function CompetitorExists(const compId: integer): boolean;
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
    property IsDenied: boolean read GetIsDenied;
    property IsApprovedCancelled: boolean read GetIsApprovedCancelled;
    property ComakerCount: integer read GetComakerCount;
    property Alerts[const i: integer]: string read GetAlert;
    property AlertsCount: integer read GetAlertsCount;
    property HasId: boolean read GetHasId;
    property Comaker[const i: integer]: TComaker read GetComaker;

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
    SaveComakers;

  ln.Action := laNone;
end;

procedure TLoan.Edit;
begin

end;

procedure TLoan.Cancel;
begin
  with dmLoan, dmLoan.dstLoan do
  begin
    if State in [dsInsert,dsEdit] then
      Cancel;

    dstLoanClass.close;
  end;

end;

procedure TLoan.Retrieve(const closeDataSources: boolean = false);
var
  i: integer;
begin
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
  with dmLoan, dmLoan.dstLoan do
  begin
    Edit;
    if ln.Action = laApproving then
    begin
      FieldByName('date_appv').AsDateTime := ifn.AppDate;
      FieldByName('amt_appv').AsFloat := FieldByName('amt_appl').AsFloat;
      FieldByName('terms').AsInteger := FieldByName('des_term').AsInteger;
    end
    else if ln.Action = laReleasing then
    begin
      FieldByName('date_rel').AsDateTime := ifn.AppDate;
      FieldByName('amt_rel').AsFloat := FieldByName('amt_appv').AsFloat;
    end
    else
    begin
      if ln.IsPending then
      begin
        FieldByName('date_appv').Value := null;
        FieldByName('amt_appv').Value := null;
        FieldByName('terms').Value := null;
        FieldByName('date_rel').Value := null;
        FieldByName('amt_rel').Value := null;
        FieldByName('rel_by').Value := null;
        FieldByName('appv_by').Value := null;
      end
      else if ln.IsApproved then
      begin
        FieldByName('date_rel').Value := null;
        FieldByName('amt_rel').Value := null;
        FieldByName('rel_by').Value := null;
      end;
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

procedure TLoan.AddCompetitor(const compId: Integer);
begin
  if not CompetitorExists(compId) then
  begin
    SetLength(FCompetitors,Length(FCompetitors) + 1);
    FCompetitors[Length(FCompetitors) - 1] := compId;
  end;
end;

procedure TLoan.RemoveCompetitor(const compId: integer);
var
  i, len, id: integer;
begin
  len := Length(FCompetitors);

  for i := 0 to len - 1 do
  begin
    id := FCompetitors[i];
    if id <> compId then
      FCompetitors[i] := id;
  end;

  SetLength(FCompetitors,Length(FCompetitors) - 1);
end;

procedure TLoan.AddMonthlyExpense(const expType: string);
begin
  if not MonthlyExpenseExists(expType) then
  begin
    SetLength(FMonthlyExpenses,Length(FMonthlyExpenses) + 1);
    FMonthlyExpenses[Length(FMonthlyExpenses) - 1] := expType;
  end;
end;

procedure TLoan.RemoveMonthlyExpense(const expType: string);
var
  i, len: integer;
  exp: string;
begin
  len := Length(FMonthlyExpenses);

  for i := 0 to len - 1 do
  begin
    exp := FMonthlyExpenses[i];
    if exp <> expType then
      FMonthlyExpenses[i] := exp;
  end;

  SetLength(FMonthlyExpenses,Length(FMonthlyExpenses) - 1);
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

function TLoan.GetIsDenied: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.D);
end;

function TLoan.GetIsApprovedCancelled: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.X);
end;

function TLoan.GetComakerCount: integer;
begin
  Result := Length(FComakers);
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
  else if IsDenied then Result := 'Denied'
  else if IsApprovedCancelled then Result := 'Approved (cancelled)';
end;

function TLoan.CompetitorExists(const compId: Integer): boolean;
var
  i, len, id: integer;
begin
  Result := false;

  len := Length(FCompetitors);

  for i := 0 to len - 1 do
  begin
    id := FCompetitors[i];
    if id = compId then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TLoan.MonthlyExpenseExists(const expType: string): boolean;
var
  i, len: integer;
  exp: string;
begin
  Result := false;

  len := Length(FMonthlyExpenses);

  for i := 0 to len - 1 do
  begin
    exp := FMonthlyExpenses[i];
    if exp = expType then
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

end.
