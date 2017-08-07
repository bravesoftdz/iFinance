unit PaymentMethod;

interface

type
  TMethod = (mdCash,mdCheck,mdBankWithdrawal);

type
  TPaymentMethod = class
  private
    FMethod: TMethod;
    FName: string;
    FCharge: real;
  public
    property Method: TMethod read FMethod write FMethod;
    property Name: string read FName write FName;
    property Charge: real read FCharge write FCharge;

  end;

  TPaymentMethods = array of TPaymentMethod;

var
  pmtMethods: TPaymentMethods;

implementation

end.
