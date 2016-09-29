unit Bank;

interface

type
  TBank = class(TObject)
  private
    FId: string;
    FBankName: string;
    FBankCode: string;
    FBranch: string;
  public
    property Id: string read FId write FId;
    property BankName: string read FBankName write FBankName;
    property BankCode: string read FBankCode write FBankCode;
    property Branch: string read FBranch write FBranch;
  end;

var
  bnk: TBank;

implementation

end.
