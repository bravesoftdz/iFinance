unit Withdrawal;

interface

uses
  ActiveClient;

type
  TWithdrawal = class
  private
    FId: string;
    FClient: TActiveClient;
    FAccountNo: string;
    FCardNo: string;
  public
    property Id: string read FId write FId;
    property Client: TActiveClient read FClient write FClient;
    property AccountNo: string read FAccountNo write FAccountNo;
    property CardNo: string read FCardNo write FCardNo;

    constructor Create;
    destructor Destroy; override;

    procedure Save;
    procedure Append;
    procedure Cancel;
  end;

var
  wd: TWithdrawal;

implementation

{ TWithdrawal }

uses
  PaymentData;

procedure TWithdrawal.Append;
begin
  with dmPayment.dstWithdrawal do
  begin
    Append;
  end;
end;

procedure TWithdrawal.Cancel;
begin
  with dmPayment.dstWithdrawal do
  begin
    Cancel;
  end;
end;

constructor TWithdrawal.Create;
begin
  if wd <> nil then wd := self
  else inherited Create;
end;

destructor TWithdrawal.Destroy;
begin
  wd := nil;
  inherited;
end;

procedure TWithdrawal.Save;
begin
  with dmPayment.dstWithdrawal do
  begin
    Post;
  end;
end;

end.
