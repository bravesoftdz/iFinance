unit Loan;

interface

uses
  SysUtils, Entity, LoanClient, AppConstants, DB, System.Rtti, ADODB, Variants;

type
  TLoanAction = (laNone,laCreating,laApproving,laDenying,laReleasing,laCancelling);

type
  TLoan = class(TEntity)
  private
    FClient: TLoanClient;
    FStatus: string;
    FAction: TLoanAction;

    function GetIsPending: boolean;
    function GetIsApproved: boolean;
    function GetIsReleased: boolean;
    function GetIsCancelled: boolean;
    function GetIsDenied: boolean;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve(const closeDataSources: boolean = false);
    procedure SetDefaultValues;

    property Client: TLoanClient read FClient write FClient;
    property Status: string read FStatus write FStatus;
    property Action: TLoanAction read FAction write FAction;
    property IsPending: boolean read GetIsPending;
    property IsApproved: boolean read GetIsApproved;
    property IsReleased: boolean read GetIsReleased;
    property IsCancelled: boolean read GetIsCancelled;
    property IsDenied: boolean read GetIsDenied;

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
end;

procedure TLoan.Save;
begin
  with dmLoan.dstLoan do
    Post;
end;

procedure TLoan.Edit;
begin

end;

procedure TLoan.Cancel;
begin
  with dmLoan.dstLoan do
    if State in [dsInsert,dsEdit] then
      Cancel;
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

          (Components[i] as TADODataSet).Open;
        end;
    end;
  end;
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
      FieldByName('int').AsFloat := dstLoanClass.FieldByName('int_rate').AsFloat;
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
        FieldByName('int').Value := null;
        FieldByName('terms').Value := null;
        FieldByName('date_rel').Value := null;
        FieldByName('amt_rel').Value := null;
        FieldByName('rel_by').Value := null;
        FieldByName('status_id').Value := null;
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

function TLoan.GetIsPending: boolean;
begin
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
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
  Result := FStatus =  TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.X);
end;

end.