unit LoanClassification;

interface

uses
  Generics.Collections, Group;

type
  TLoanClassification = class
  private
    FClassificationId: integer;
    FClassificationName: string;
    FInterest: real;
    FTerm: integer;
    FLoanType: string;
    FValidFrom: TDate;
    FValidUntil: TDate;
    FGroups: TObjectList<TGroup>;

  public
    property ClassificationId: integer read FClassificationId write FClassificationId;
    property ClassificationName: string read FClassificationName write FClassificationName;
    property Interest: real read FInterest write FInterest;
    property Term: integer read FTerm write FTerm;
    property LoanType: string read FLoanType write FLoanType;
    property ValidFrom: TDate read FValidFrom write FVAlidFrom;
    property ValidUntil: TDate read FValidUntil write FValidUntil;
    property Groups:  TObjectList<TGroup> read FGroups write FGroups;

    constructor Create(const classificationId: integer; const classificationName: string;
        const interest, term: integer; const loanType: string; const validFrom,
        validUntil: TDate);
  end;

var
  lnc: TLoanClassification;

implementation

constructor TLoanClassification.Create(const classificationId: integer; const classificationName: string;
        const interest, term: integer; const loanType: string; const validFrom,
        validUntil: TDate);
begin
  FClassificationId := classificationId;
  FClassificationName := classificationName;
  FInterest := interest;
  FTerm := term;
  FLoanType := loanType;
  FValidFrom := validFrom;
  FValidUntil := validUntil;
  FGroups := TObjectList<TGroup>.Create;
end;

end.
