unit LoanCharge;

interface

type
  TLoanCharge = class(TObject)
  private
    FChargeType: string;
    FChargeName: string;
    FAmount: string;
  public
    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property Amount: string read FAmount write FAmount;

    constructor Create(const chargeType, chargeName, amt: string);
  end;

implementation

constructor TLoanCharge.Create(const chargeType: string; const chargeName: string; const amt: string);
begin
  FChargeType := chargeType;
  FChargeName := chargeName;
  FAmount := amt;
end;

end.
