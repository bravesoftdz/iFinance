unit LoanCharge;

interface

type
  TLoanCharge = class(TObject)
  private
    FChargeType: string;
    FChargeName: string;
    FAmount: real;
  public
    property ChargeType: string read FChargeType write FChargeType;
    property ChargeName: string read FChargeName write FChargeName;
    property Amount: real read FAmount write FAmount;

    constructor Create; overload;
    constructor Create(const chargeType, chargeName: string; const amt: real); overload;
  end;

implementation

constructor TLoanCharge.Create;
begin
  inherited;
end;

constructor TLoanCharge.Create(const chargeType, chargeName: string; const amt: real);
begin
  FChargeType := chargeType;
  FChargeName := chargeName;
  FAmount := amt;
end;

end.
