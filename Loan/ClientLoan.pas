unit ClientLoan;

interface

type
  TClientLoan = class(TObject)
  private
    FLoanId: string;
    FLoanClassId: integer;
    FBalance: real;
  public
    property LoanId: string read FLoanId write FLoanId;
    property LoanClassId: integer read  FLoanClassId write FLoanClassId;
    property Balance: real read FBalance write FBalance;

    constructor Create; overload;
    constructor Create(const lnId: string; const lncId: integer; const bal: real); overload;
  end;

implementation

constructor TClientLoan.Create;
begin
  inherited Create;
end;

constructor TClientLoan.Create(const lnId: string; const lncId: Integer; const bal: Real);
begin
  FLoanId := lnId;
  FLoanClassId := lncId;
  FBalance := bal;
end;

end.
