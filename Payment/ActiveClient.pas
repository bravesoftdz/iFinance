unit ActiveClient;

interface

type
  TLoan = class
  strict private
    FId: string;
    FLoanTypeName: string;
    FAccountTypeName: string;
    FBalance: real;
  public
    property Id: string read FId write FId;
    property Balance: real read FBalance write FBalance;
    property LoanTypeName: string read FLoanTypeName write FLoanTypeName;
    property AccountTypeName: string read FAccountTypeName write FAccountTypeName;
  end;

type
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

end.
