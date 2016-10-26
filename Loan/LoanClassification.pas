unit LoanClassification;

interface

uses
  Generics.Collections, Branch;

type
  TLoanClassification = class
  private
    FClassificationId: integer;
    FClassificationName: string;
    FInterest: real;
    FTerm: integer;
    FLoanType: string;
    FMaxLoan: real;
    FComakers: integer;
    FValidFrom: TDate;
    FValidUntil: TDate;

    function GetComakersNotRequired: boolean;

  public
    property ClassificationId: integer read FClassificationId write FClassificationId;
    property ClassificationName: string read FClassificationName write FClassificationName;
    property Interest: real read FInterest write FInterest;
    property Term: integer read FTerm write FTerm;
    property LoanType: string read FLoanType write FLoanType;
    property MaxLoan: real read FMaxLoan write FMaxLoan;
    property Comakers: integer read FComakers write FComakers;
    property ValidFrom: TDate read FValidFrom write FVAlidFrom;
    property ValidUntil: TDate read FValidUntil write FValidUntil;
    property ComakersNotRequired: boolean read GetComakersNotRequired;

    constructor Create(const classificationId: integer; const classificationName: string;
        const interest: real; const term: integer; const loanType: string; const maxLoan: real;
        const comakers: integer; const validFrom, validUntil: TDate);
  end;

var
  lnc: TLoanClassification;

implementation

constructor TLoanClassification.Create(const classificationId: integer; const classificationName: string;
        const interest: real; const term: integer; const loanType: string; const maxLoan: real;
        const comakers: integer; const validFrom, validUntil: TDate);
begin
  FClassificationId := classificationId;
  FClassificationName := classificationName;
  FInterest := interest;
  FTerm := term;
  FLoanType := loanType;
  FMaxLoan := maxLoan;
  FComakers := comakers;
  FValidFrom := validFrom;
  FValidUntil := validUntil;
end;

function TLoanClassification.GetComakersNotRequired: boolean;
begin
  Result := FComakers = 0;
end;

end.
