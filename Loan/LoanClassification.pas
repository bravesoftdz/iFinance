unit LoanClassification;

interface

uses
  LoanClassCharge;

type
  TLoanClassification = class
  private
    FClassificationId: integer;
    FGroupId: integer;
    FClassificationName: string;
    FInterest: real;
    FTerm: integer;
    FLoanType: string;
    FMaxLoan: real;
    FComakers: integer;
    FValidFrom: TDate;
    FValidUntil: TDate;
    FClassCharges: array of TLoanClassCharge;

    function GetComakersNotRequired: boolean;
    function GetClassCharge(const i: integer): TLoanClassCharge;

  public
    procedure AddClassCharge(cg: TLoanClassCharge);
    procedure RemoveClassCharge(const cgType: string);
    procedure EmptyClassCharges;

    function ClassChargeExists(const cgType: string): boolean;

    property ClassificationId: integer read FClassificationId write FClassificationId;
    property GroupId: integer read FGroupId write FGroupId;
    property ClassificationName: string read FClassificationName write FClassificationName;
    property Interest: real read FInterest write FInterest;
    property Term: integer read FTerm write FTerm;
    property LoanType: string read FLoanType write FLoanType;
    property MaxLoan: real read FMaxLoan write FMaxLoan;
    property Comakers: integer read FComakers write FComakers;
    property ValidFrom: TDate read FValidFrom write FVAlidFrom;
    property ValidUntil: TDate read FValidUntil write FValidUntil;
    property ComakersNotRequired: boolean read GetComakersNotRequired;
    property ClassCharge[const i: integer]: TLoanClassCharge read GetClassCharge;

    constructor Create(const classificationId, groupId: integer; const classificationName: string;
        const interest: real; const term: integer; const loanType: string; const maxLoan: real;
        const comakers: integer; const validFrom, validUntil: TDate);
  end;

var
  lnc: TLoanClassification;

implementation

constructor TLoanClassification.Create(const classificationId, groupId: integer; const classificationName: string;
        const interest: real; const term: integer; const loanType: string; const maxLoan: real;
        const comakers: integer; const validFrom, validUntil: TDate);
begin
  FClassificationId := classificationId;
  FGroupId := groupId;
  FClassificationName := classificationName;
  FInterest := interest;
  FTerm := term;
  FLoanType := loanType;
  FMaxLoan := maxLoan;
  FComakers := comakers;
  FValidFrom := validFrom;
  FValidUntil := validUntil;
end;

procedure TLoanClassification.AddClassCharge(cg: TLoanClassCharge);
begin
  if not ClassChargeExists(cg.ChargeType) then
  begin
    SetLength(FClassCharges,Length(FClassCharges) + 1);
    FClassCharges[Length(FClassCharges) - 1] := cg;
  end;
end;

procedure TLoanClassification.RemoveClassCharge(const cgType: string);
var
  i, len: integer;
  cg: TLoanClassCharge;
begin
  len := Length(FClassCharges);

  for i := 0 to len - 1 do
  begin
    cg := FClassCharges[i];
    if cg.ChargeType <> cgType then
      FClassCharges[i] := cg;
  end;

  SetLength(FClassCharges,Length(FClassCharges) - 1);
end;

procedure TLoanClassification.EmptyClassCharges;
begin
  FClassCharges := [];
end;

function TLoanClassification.GetComakersNotRequired: boolean;
begin
  Result := FComakers = 0;
end;

function TLoanClassification.GetClassCharge(const i: Integer): TLoanClassCharge;
begin
  Result := FClassCharges[i];
end;

function TLoanClassification.ClassChargeExists(const cgType: string): boolean;
var
  i, len: integer;
  ch: TLoanClassCharge;
begin
  Result := false;

  len := Length(FClassCharges);

  for i := 0 to len - 1 do
  begin
    ch := FClassCharges[i];
    if ch.ChargeType = cgType then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

end.
