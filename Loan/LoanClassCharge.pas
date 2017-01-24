unit LoanClassCharge;

interface

type
  TValueType = (vtFixed, vtPercentage);

type
  TLoanClassCharge = class
  private
    FChargeType: string;
    FChargeName: string;
    FChargeValue: real;
    FValueType: TValueType;
  public

    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property ChargeValue: real read FChargeValue write FChargeValue;
    property ValueType: TValueType read FValueType write FValueType;

    constructor Create(const ct: string; const cv: real; vt: TValueType); overload;
    constructor Create(const ct, cn: string; const cv: real; vt: TValueType); overload;
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

constructor TLoanClassCharge.Create(const ct, cn: string; const cv: Real; vt: TValueType);
begin
  FChargeType := ct;
  FChargeName := cn;
  FChargeValue := cv;
  FValueType := vt;
end;

end.
