unit LoanClassCharge;

interface

type
  TValueType = (vtFixed, vtPercentage, vtRatio);

type
  TMaxValueType = (mvtMonths,mvtAmount);

type
  TLoanClassCharge = class
  private
    FChargeType: string;
    FChargeName: string;
    FChargeValue: real;
    FValueType: TValueType;
    FRatioAmount: real;
    FMaxValue: real;
    FMaxValueType: TMaxValueType;
    FForNew: boolean;
    FForRenewal: boolean;
    FForRestructure: boolean;
    FForReloan: boolean;
  public

    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property ChargeValue: real read FChargeValue write FChargeValue;
    property ValueType: TValueType read FValueType write FValueType;
    property RatioAmount: real read FRatioAmount write FRatioAmount;
    property MaxValue: real read FMaxValue write FMaxValue;
    property MaxValueType: TMaxValueType read FMaxValueType write FMaxValueType;
    property ForNew: boolean read FForNew write FForNew;
    property ForRenewal: boolean read FForRenewal write FForRenewal;
    property ForRestructure: boolean read FForRestructure write FForRestructure;
    property ForReloan: boolean read FForReloan write FForReloan;

    constructor Create(const ct: string; const cv: real; vt: TValueType); overload;
    constructor Create(const ct, cn: string; const cv: real; vt: TValueType;
        const ratioAmt, maxVal: real; const mvt: TMaxValueType;  fn, fr, ft, fl: boolean); overload;
  end;

var
  cg: TLoanClassCharge;

implementation

constructor TLoanClassCharge.Create(const ct: string; const cv: Real; vt: TValueType);
begin
  FChargeType := ct;
  FChargeValue := cv;
  FValueType := vt;
end;

constructor TLoanClassCharge.Create(const ct, cn: string; const cv: real; vt: TValueType;
  const ratioAmt, maxVal: real; const mvt: TMaxValueType;  fn, fr, ft, fl: boolean);
begin
  FChargeType := ct;
  FChargeName := cn;
  FChargeValue := cv;
  FValueType := vt;
  FRatioAmount := ratioAmt;
  FMaxValue := maxVal;
  FMaxValueType := mvt;
  FForNew := fn;
  FForRenewal := fr;
  FForRestructure := ft;
  FForReloan := fl;
end;

end.
