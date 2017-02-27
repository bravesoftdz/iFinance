unit LoanClassification;

interface

uses
  LoanClassCharge, LoanType, LoansAuxData;

type
  TLoanClassification = class
  private
    FClassificationId: integer;
    FGroupId: string;
    FClassificationName: string;
    FInterest: real;
    FTerm: integer;
    FLoanType: TLoanType;
    FMaxLoan: real;
    FComakers: integer;
    FValidFrom: TDate;
    FValidUntil: TDate;
    FClassCharges: array of TLoanClassCharge;
    FMaxAge: integer;

    function GetComakersNotRequired: boolean;
    function GetClassCharge(const i: integer): TLoanClassCharge;
    function GetClassChargesCount: integer;
    function GetHasMaxAge: boolean;
    function GetHasConcurrent: boolean;

  public
    procedure Add;
    procedure Save;
    procedure AppendCharge;

    procedure AddClassCharge(cg: TLoanClassCharge);
    procedure RemoveClassCharge(const cgType: string);
    procedure EmptyClassCharges;

    function ClassChargeExists(const cgType: string; const forNew, forRenewal: boolean): boolean;

    property ClassificationId: integer read FClassificationId write FClassificationId;
    property GroupId: string read FGroupId write FGroupId;
    property ClassificationName: string read FClassificationName write FClassificationName;
    property Interest: real read FInterest write FInterest;
    property Term: integer read FTerm write FTerm;
    property LoanType: TLoanType read FLoanType write FLoanType;
    property MaxLoan: real read FMaxLoan write FMaxLoan;
    property Comakers: integer read FComakers write FComakers;
    property ValidFrom: TDate read FValidFrom write FVAlidFrom;
    property ValidUntil: TDate read FValidUntil write FValidUntil;
    property ComakersNotRequired: boolean read GetComakersNotRequired;
    property ClassCharge[const i: integer]: TLoanClassCharge read GetClassCharge;
    property ClassChargesCount: integer read GetClassChargesCount;
    property MaxAge: integer read FMaxAge write FMaxAge;
    property HasMaxAge: boolean read GetHasMaxAge;
    property HasConcurrent: boolean read GetHasConcurrent;

    constructor Create(const classificationId: integer; const groupId, classificationName: string;
        const interest: real; const term: integer; const maxLoan: real;
        const comakers: integer; const validFrom, validUntil: TDate; const age: integer;
        const lt: TLoanType);
  end;

var
  lnc: TLoanClassification;

implementation

constructor TLoanClassification.Create(const classificationId: integer; const groupId, classificationName: string;
        const interest: real; const term: integer; const maxLoan: real; const comakers: integer;
        const validFrom, validUntil: TDate; const age: integer; const lt: TLoanType);
begin
  FClassificationId := classificationId;
  FGroupId := groupId;
  FClassificationName := classificationName;
  FInterest := interest;
  FTerm := term;
  FMaxLoan := maxLoan;
  FComakers := comakers;
  FValidFrom := validFrom;
  FValidUntil := validUntil;
  FMaxAge := age;
  FLoanType := lt;
end;

procedure TLoanClassification.AddClassCharge(cg: TLoanClassCharge);
begin
  if not ClassChargeExists(cg.ChargeType,cg.ForNew,cg.ForRenewal) then
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

procedure TLoanClassification.Add;
begin

end;

procedure TLoanClassification.Save;
begin

end;

procedure TLoanClassification.AppendCharge;
begin

end;

function TLoanClassification.GetComakersNotRequired: boolean;
begin
  Result := FComakers = 0;
end;

function TLoanClassification.GetClassCharge(const i: Integer): TLoanClassCharge;
begin
  Result := FClassCharges[i];
end;

function TLoanClassification.ClassChargeExists(const cgType: string; const forNew, forRenewal: boolean): boolean;
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
      if (ch.ForNew = forNew) or (ch.ForRenewal = forRenewal) then
      begin
        Result := true;
        Exit;
      end;
    end;
  end;
end;

function TLoanClassification.GetClassChargesCount: integer;
begin
  Result := Length(FClassCharges);
end;

function TLoanClassification.GetHasMaxAge: boolean;
begin
  Result := FMaxAge > 0;
end;

function TLoanClassification.GetHasConcurrent: boolean;
begin
  Result := FLoanType.MaxConcurrent > 0;
end;

end.
