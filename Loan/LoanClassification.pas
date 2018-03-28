unit LoanClassification;

interface

uses
  LoanClassCharge, LoanType, LoansAuxData, Group, LoanClassAdvance, SysUtils;

type
  TLoanClassAction = (lcaNone, lcaCreating, lcaActivating, lcaDeactivating);

  TDiminishingType = (dtNone, dtScheduled, dtFixed);

  TLoanClassification = class
  private
    FClassificationId: integer;
    FGroup: TGroup;
    FClassificationName: string;
    FInterest: currency;
    FTerm: integer;
    FLoanType: TLoanType;
    FMaxLoan: currency;
    FComakersMin: integer;
    FComakersMax: integer;
    FValidFrom: TDate;
    FValidUntil: TDate;
    FClassCharges: array of TLoanClassCharge;
    FMaxAge: integer;
    FAction: TLoanClassAction;
    FInterestComputationMethod: string;
    FDiminishingType: TDiminishingType;
    FAdvancePayment: TLoanClassAdvance;

    function GetComakersNotRequired: boolean;
    function GetClassCharge(const i: integer): TLoanClassCharge;
    function GetClassChargesCount: integer;
    function GetHasMaxAge: boolean;
    function GetHasConcurrent: boolean;
    function GetIsActive: boolean;
    function GetIsActivated: boolean;
    function GetIsDeactivated: boolean;
    function GetInterestInDecimal: currency;
    function GetIsDiminishing: boolean;
    function GetIsFixed: boolean;
    function GetHasAdvancePayment: boolean;

  public
    procedure Add;
    procedure Save;
    procedure AppendCharge;

    procedure AddClassCharge(cg: TLoanClassCharge);
    procedure RemoveClassCharge(const cgType: string);
    procedure EmptyClassCharges;
    procedure RemoveAdvancePayment;

    function ClassChargeExists(const cgType: string;
        const forNew, forRenewal, forRestructure, forReloan: boolean): boolean;

    property ClassificationId: integer read FClassificationId write FClassificationId;
    property Group: TGroup read FGroup write FGroup;
    property ClassificationName: string read FClassificationName write FClassificationName;
    property Interest: currency read FInterest write FInterest;
    property Term: integer read FTerm write FTerm;
    property LoanType: TLoanType read FLoanType write FLoanType;
    property MaxLoan: currency read FMaxLoan write FMaxLoan;
    property ComakersMin: integer read FComakersMin write FComakersMin;
    property ComakersMax: integer read FComakersMax write FComakersMax;
    property ValidFrom: TDate read FValidFrom write FVAlidFrom;
    property ValidUntil: TDate read FValidUntil write FValidUntil;
    property ComakersNotRequired: boolean read GetComakersNotRequired;
    property ClassCharge[const i: integer]: TLoanClassCharge read GetClassCharge;
    property ClassChargesCount: integer read GetClassChargesCount;
    property MaxAge: integer read FMaxAge write FMaxAge;
    property HasMaxAge: boolean read GetHasMaxAge;
    property HasConcurrent: boolean read GetHasConcurrent;
    property IsActive: boolean read GetIsActive;
    property IsActivated: boolean read GetIsActivated;
    property IsDeactivated: boolean read GetIsDeactivated;
    property Action: TLoanClassAction read FAction write FAction;
    property InterestInDecimal: currency read GetInterestInDecimal;
    property InterestComputationMethod: string write FInterestComputationMethod;
    property IsDiminishing: boolean read GetIsDiminishing;
    property IsFixed: boolean read GetIsFixed;
    property DiminishingType: TDiminishingType read FDiminishingType write FDiminishingType;
    property AdvancePayment: TLoanClassAdvance read FAdvancePayment write FAdvancePayment;
    property HasAdvancePayment: boolean read GetHasAdvancePayment;

    constructor Create(const classificationId: integer; classificationName: string;
        const interest: real; const term: integer; const maxLoan: currency;
        const comakersMin, comakersMax: integer; const validFrom, validUntil: TDate; const age: integer;
        const lt: TLoanType; const gp: TGroup; const intCompMethod: string;
        const ADimType: TDiminishingType = dtNone);
  end;

var
  lnc: TLoanClassification;

implementation

uses
  IFinanceGlobal;

constructor TLoanClassification.Create(const classificationId: integer; classificationName: string;
        const interest: real; const term: integer; const maxLoan: currency;
        const comakersMin, comakersMax: integer; const validFrom, validUntil: TDate; const age: integer;
        const lt: TLoanType; const gp: TGroup; const intCompMethod: string;
        const ADimType: TDiminishingType);
begin
  FClassificationId := classificationId;
  FClassificationName := classificationName;
  FInterest := interest;
  FTerm := term;
  FMaxLoan := maxLoan;
  FComakersMin := comakersMin;
  FComakersMax := comakersMax;
  FValidFrom := validFrom;
  FValidUntil := validUntil;
  FMaxAge := age;
  FLoanType := lt;
  FGroup := gp;
  FInterestComputationMethod := intCompMethod;
  FDiminishingType := ADimType;

  // set action
  if IsActive then FAction := lcaNone
  else FAction := lcaCreating;
end;

procedure TLoanClassification.AddClassCharge(cg: TLoanClassCharge);
begin
  if not ClassChargeExists(cg.ChargeType,cg.ForNew,cg.ForRenewal,cg.ForRestructure,cg.ForReloan) then
  begin
    SetLength(FClassCharges,Length(FClassCharges) + 1);
    FClassCharges[Length(FClassCharges) - 1] := cg;
  end;
end;

procedure TLoanClassification.RemoveAdvancePayment;
begin
  FreeAndNil(FAdvancePayment);
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
  Result := (FComakersMin = 0) and (FComakersMax = 0);
end;

function TLoanClassification.GetClassCharge(const i: Integer): TLoanClassCharge;
begin
  Result := FClassCharges[i];
end;

function TLoanClassification.ClassChargeExists(const cgType: string;
  const forNew, forRenewal, forRestructure, forReloan: boolean): boolean;
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
      if (ch.ForNew = forNew) or (ch.ForRenewal = forRenewal) or
         (ch.ForRestructure = forRestructure) or (ch.ForReloan = forReloan) then
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

function TLoanClassification.GetHasAdvancePayment: boolean;
begin
  Result := Assigned(FAdvancePayment);
end;

function TLoanClassification.GetHasConcurrent: boolean;
begin
  Result := FGroup.Attributes.MaxConcurrent > 0;
end;

function TLoanClassification.GetIsActive: boolean;
begin
  Result := (FValidFrom <> 0) and
            ((FValidFrom > ifn.AppDate) and (FValidUntil < ifn.AppDate));
end;

function TLoanClassification.GetInterestInDecimal: currency;
begin
  Result := FInterest / 100;
end;

function TLoanClassification.GetIsActivated: boolean;
begin
  Result := (FValidFrom <> 0)
end;

function TLoanClassification.GetIsDeactivated: boolean;
begin
  Result := (FValidUntil <> 0)
end;

function TLoanClassification.GetIsDiminishing: boolean;
begin
  Result := FInterestComputationMethod = 'D';
end;

function TLoanClassification.GetIsFixed: boolean;
begin
  Result := FInterestComputationMethod = 'F';
end;

end.
