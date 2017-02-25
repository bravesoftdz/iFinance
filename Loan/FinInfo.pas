unit FinInfo;

interface

type
  TFinInfo = class(TObject)
  private
    FCompanyId: string;
    FCompanyName: string;
    FMonthly: string;
    FBalance: string;
  public
    property CompanyId: string read FCompanyId write FCompanyId;
    property CompanyName: string read FCompanyName write FCompanyName;
    property Monthly: string read FMonthly write FMonthly;
    property Balance: string read FBalance write FBalance;

    constructor Create(const companyId: string; const companyName, monthly, balance: string); overload;
  end;

var
  finInf: TFinInfo;

implementation

constructor TFinInfo.Create(const companyId: string;
  const companyName: string; const monthly: string; const balance: string);
begin
  FCompanyId := companyId;
  FCompanyName := companyName;
  FMonthly := monthly;
  FBalance := balance;
end;

end.
