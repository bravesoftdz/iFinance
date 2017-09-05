unit ActiveClient;

interface

uses
  AppConstants;

type
  TPaymentSchedule = class
  private
    FDate: TDate;
    FAmount: real;
    FCaseType: TCaseTypes;
  public
    property Date: TDate read FDate write FDate;
    property Amount: real read FAmount write FAmount;
    property CaseType: TCaseTypes read FCaseType write FCaseType;
  end;

  TLoan = class
  strict private
    FId: string;
    FLoanTypeName: string;
    FAccountTypeName: string;
    FBalance: real;
    FInterestMethod: string;
    FSchedule: array of TPaymentSchedule;

    function GetIsDiminishing: boolean;
    function GetIsFixed: boolean;
    function GetSchedule(const i: integer): TPaymentSchedule;

  public
    property Id: string read FId write FId;
    property Balance: real read FBalance write FBalance;
    property LoanTypeName: string read FLoanTypeName write FLoanTypeName;
    property AccountTypeName: string read FAccountTypeName write FAccountTypeName;
    property InterestMethod: string write FInterestMethod;
    property IsDiminishing: boolean read GetIsDiminishing;
    property IsFixed: boolean read GetIsFixed;
    property Schedules[const i: integer]: TPaymentSchedule read GetSchedule;

    procedure GetPaymentSchedule;
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
  PaymentData;

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

function TLoan.GetIsDiminishing: boolean;
begin
  Result := FInterestMethod = 'D';
end;

function TLoan.GetIsFixed: boolean;
begin
  Result := FInterestMethod = 'F';
end;

procedure TLoan.GetPaymentSchedule;
begin

end;

function TLoan.GetSchedule(const i: integer): TPaymentSchedule;
begin
  Result := FSchedule[i];
end;

end.
