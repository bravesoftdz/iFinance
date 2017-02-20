unit BankAccount;

interface

uses
  Bank;

type
  TBankAccount = class(TObject)
  private
    FBank: TBank;
    FAccountNo: string;
    FCardNo: string;
    FCardExpiry: TDate;
  public
    property Bank: TBank read FBank write FBank;
    property AccountNo: string read FAccountNo write FAccountNo;
    property CardNo: string read FCardNo write FCardNo;
    property CardExpiry: TDate read FCardExpiry write FCardExpiry;

    constructor Create; overload;
    constructor Create(const bk: TBank; const acctNo, cardNo: string;
        const cardExp: TDate); overload;
  end;

var
  bnkAcct: TBankAccount;

implementation

constructor TBankAccount.Create;
begin
  inherited;
end;

constructor TBankAccount.Create(const bk: TBank; const acctNo, cardNo: string;
  const cardExp: TDate);
begin
  FBank := bk;
  FAccountNo := acctNo;
  FCardNo := cardNo;
  FCardExpiry := cardExp;
end;

end.
