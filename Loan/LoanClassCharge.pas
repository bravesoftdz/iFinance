unit LoanClassCharge;

interface

type
  TValueType = (vtFixed, vtPercentage, vtRatio);

type
  TLoanClassCharge = class
  private
    FChargeType: string;
    FChargeName: string;
    FChargeValue: real;
    FValueType: TValueType;
    FRatioAmount: real;
    FMaxAmount: real;
    FForNew: boolean;
    FForRenewal: boolean;
  public

    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property ChargeValue: real read FChargeValue write FChargeValue;
    property ValueType: TValueType read FValueType write FValueType;
    property RatioAmount: real read FRatioAmount write FRatioAmount;
    property MaxAmount: real read FMaxAmount write FMaxAmount;
    property ForNew: boolean read FForNew write FForNew;
    property ForRenewal: boolean read FForRenewal write FForRenewal;

    constructor Create(const ct: string; const cv: real; vt: TValueType); overload;
    constructor Create(const ct, cn: string; const cv: real; vt: TValueType;
        const ratioAmt, maxAmt: real; const fn, fr: boolean); overload;
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

constructor TLoanClassCharge.Create(const ct, cn: string; const cv: Real; vt: TValueType;
  const ratioAmt, maxAmt: real; const fn, fr: boolean);
begin
  FChargeType := ct;
  FChargeName := cn;
  FChargeValue := cv;
  FValueType := vt;
  FRatioAmount := ratioAmt;
  FMaxAmount := maxAmt;
  FForNew := fn;
  FForRenewal := fr;
end;

end.
