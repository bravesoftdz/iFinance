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
  public

    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property ChargeValue: real read FChargeValue write FChargeValue;
    property ValueType: TValueType read FValueType write FValueType;
    property RatioAmount: real read FRatioAmount write FRatioAmount;
    property MaxAmount: real read FMaxAmount write FMaxAmount;

    constructor Create(const ct: string; const cv: real; vt: TValueType); overload;
    constructor Create(const ct, cn: string; const cv: real; vt: TValueType;
        const ratioAmt, maxAmt: real); overload;
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
  const ratioAmt, maxAmt: real);
begin
  FChargeType := ct;
  FChargeName := cn;
  FChargeValue := cv;
  FValueType := vt;
  FRatioAmount := ratioAmt;
  FMaxAmount := maxAmt;
end;

end.
