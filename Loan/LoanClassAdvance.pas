unit LoanClassAdvance;

interface

type
  TAdvanceMethod = (amNone,amUponRelease,amPreset);

  TLoanClassAdvance = class
  private
    FInterest: integer;
    FPrincipal: integer;
    FAdvanceMethod: TAdvanceMethod;
    FIncludePrincipal: boolean;

    function GetNumberOfMonths: integer;
  public
    property Interest: integer read FInterest write FInterest;
    property Principal: integer read FPrincipal write FPrincipal;
    property NumberOfMonths: integer read GetNumberOfMonths;
    property AdvanceMethod: TAdvanceMethod read FAdvanceMethod write FAdvanceMethod;
    property IncludePrincipal: boolean read FIncludePrincipal write FIncludePrincipal;
  end;

implementation

{ TLoanClassAdvance }

function TLoanClassAdvance.GetNumberOfMonths: integer;
begin
  if FInterest > 0 then Result := FInterest
  else Result := FPrincipal;
end;

end.
