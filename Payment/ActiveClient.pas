unit ActiveClient;

interface

uses
  AppConstants, System.Rtti, SysUtils, DateUtils;

type
  TLoan = class
  strict private
    FId: string;
    FLoanTypeName: string;
    FAccountTypeName: string;
    FBalance: real;
    FInterestMethod: string;
    FPrincipalDue: real;
    FInterestDue: real;
    FUseFactorRate: boolean;
    FLastTransactionDate: TDateTime;
    FInterestInDecimal: real;
    FPaymentSchedule: TDateTime;
    FApplyExemption: boolean;

    function GetIsDiminishing: boolean;
    function GetIsFixed: boolean;
    function GetInterestDue(const paymentDate: TDateTime; const ledgerAmount: real): real;

  public
    property Id: string read FId write FId;
    property Balance: real read FBalance write FBalance;
    property LoanTypeName: string read FLoanTypeName write FLoanTypeName;
    property AccountTypeName: string read FAccountTypeName write FAccountTypeName;
    property InterestMethod: string write FInterestMethod;
    property IsDiminishing: boolean read GetIsDiminishing;
    property IsFixed: boolean read GetIsFixed;
    property PrincipalDue: real read FPrincipalDue write FPrincipalDue;
    property InterestDue: real read FInterestDue write FInterestDue;
    property UseFactorRate: boolean read FUseFactorRate write FUseFactorRate;
    property LastTransactionDate: TDateTime read FLastTransactionDate write FLastTransactionDate;
    property InterestInDecimal: real read FInterestInDecimal write FInterestInDecimal;
    property PaymentSchedule: TDateTime read FPaymentSchedule write FPaymentSchedule;
    property ApplyExemption: boolean read FApplyExemption write FApplyExemption;

    procedure GetPaymentDue(const paymentDate: TDateTime);
  end;

  TActiveClient = class
  private
    FId: string;
    FName: string;
    FLoans: array of TLoan;

    function GetLoan(const i: integer): TLoan;
    function GetLoanCount: integer;

  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property ActiveLoans[const i: integer]: TLoan read GetLoan;
    property ActiveLoansCount: integer read GetLoanCount;

    procedure AddLoan(const ln: TLoan);
    procedure RetrieveActiveLoans;

    function IndexOf(const loan: TLoan): integer;

    constructor Create;
  end;

var
  activeCln: TActiveClient;

implementation

uses
  PaymentData, IFinanceGlobal;

constructor TActiveClient.Create;
begin
  if activeCln = nil then inherited Create
  else activeCln := self;
end;

procedure TActiveClient.AddLoan(const ln: TLoan);
begin
  SetLength(FLoans,Length(FLoans)+1);
  FLoans[Length(FLoans)-1] := ln;
end;

procedure TActiveClient.RetrieveActiveLoans;
var
  loan: TLoan;
begin
  // check if loans have been retrieved
  // retrieve only once
  if Length(FLoans) > 0 then Exit;

  try
    with dmPayment.dstActiveLoans do
    begin
      Open;
      while not Eof do
      begin
        loan := TLoan.Create;

        loan.Id := FieldByName('loan_id').AsString;
        loan.Balance := FieldByName('balance').AsFloat;
        loan.LoanTypeName := FieldByName('loan_type_name').AsString;
        loan.AccountTypeName := FieldByName('acct_type_name').AsString;
        loan.InterestMethod := FieldByName('int_comp_method').AsString;
        loan.UseFactorRate := FieldByName('use_factor_rate').AsBoolean;
        loan.LastTransactionDate := FieldByName('last_transaction_date').AsDateTime;
        loan.InterestInDecimal := FieldByName('int_rate').AsFloat / 100;
        loan.ApplyExemption := FieldByName('apply_exemption').AsBoolean;

        AddLoan(loan);

        Next;
      end;
    end;
  finally
    dmPayment.dstActiveLoans.Close;
  end;
end;

function TActiveClient.GetLoan(const i: integer): TLoan;
begin
  Result := FLoans[i];
end;

function TActiveClient.GetLoanCount: integer;
begin
  Result := Length(FLoans);
end;

function TActiveClient.IndexOf(const loan: TLoan): integer;
var
  i: integer;
  l: TLoan;
begin

  for i := Low(FLoans) to High(FLoans) do
  begin
    l := FLoans[i];
    if l.Id = loan.Id then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

{ TLoan }

function TLoan.GetInterestDue(const paymentDate: TDateTime;
  const ledgerAmount: real): real;
var
  interest: real;
  days: integer;
begin
  if IsDiminishing then
  begin
    // advance payment
    if paymentDate < FPaymentSchedule then
    begin
      days := DaysBetween(paymentDate,FLastTransactionDate);
      interest := (FBalance * FInterestInDecimal * days) / ifn.DaysInAMonth;
      Result := interest;
    end;
  end
  else Result := ledgerAmount;
end;

function TLoan.GetIsDiminishing: boolean;
begin
  Result := FInterestMethod = 'D';
end;

function TLoan.GetIsFixed: boolean;
begin
  Result := FInterestMethod = 'F';
end;

procedure TLoan.GetPaymentDue(const paymentDate: TDateTime);
var
  caseType: TCaseTypes;
  caseTypeFilter: string;
begin
  try
    with dmPayment.dstSchedule do
    begin
      Parameters.ParamByName('@loan_id').Value := FId;
      Open;

      FPaymentSchedule := FieldByName('value_date').AsDateTime;

      // loop thru each case type
      for caseType := TCaseTypes.ITS to TCaseTypes.PRC do
      begin
        case caseType of
          ITS: caseTypeFilter := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
          PRC: caseTypeFilter := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
        end;

        Filter := '(case_type = ' + QuotedStr(caseTypeFilter) + ')';

        if RecordCount > 1 then
        begin
          case caseType of
            ITS: FInterestDue := GetInterestDue(paymentDate,FieldByName('payment_due').AsFloat);
            PRC: FPrincipalDue := FieldByName('payment_due').AsFloat;
          end;
        end;
      end;

    end;
  finally
    dmPayment.dstSchedule.Close;
  end;
end;

end.
