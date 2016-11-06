unit LoanClassCharge;

interface

type
  TValueType = (vtFixed, vtPercentage);

type
  TLoanClassCharge = class
  private
    FChargeType: string;
    FChargeValue: real;
    FValueType: TValueType;
  public

    property ChargeType: string read FChargeType write FChargeType;
    property ChargeValue: real read FChargeValue write FChargeValue;
    property ValueType: TValueType read FValueType write FValueType;

    constructor Create(const ct: string; const cv: real; vt: TValueType);
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

end.
