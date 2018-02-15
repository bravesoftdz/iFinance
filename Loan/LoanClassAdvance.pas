unit LoanClassAdvance;

interface

type
  TLoanClassAdvance = class
  private
    FInterest: integer;
    FPrincipal: integer;
    function GetNumberOfMonths: integer;
  public
    property Interest: integer read FInterest write FInterest;
    property Principal: integer read FPrincipal write FPrincipal;
    property NumberOfMonths: integer read GetNumberOfMonths;
  end;

implementation

{ TLoanClassAdvance }

function TLoanClassAdvance.GetNumberOfMonths: integer;
begin
  if FInterest > 0 then Result := FInterest
  else Result := FPrincipal;
end;

end.
