unit Ledger;

interface

type
  TLedger = class
  private
    FPostingId: integer;
    FLocationPrefix: string;
    FRefPostingId: integer;
    FDebit: real;
    FCredit: real;
    FEventObject: string;
    FPkEventObject: string;
    FCaseType: string;
    FStatusCode: string;
    FPostDate: TDateTime;
    FValueDate: TDateTime;
  public
    property PostingId: integer read FPostingId write FPostingId;
    property RefPostingId: integer read FRefPostingId write FRefPostingId;
    property LocationPrefix: string read FLocationPrefix write FLocationPrefix;
    property Debit: real read FDebit write FDebit;
    property Credit: real read FCredit write FCredit;
    property EventObject: string read FEventObject write FEventObject;
    property PkEventObject: string read FPkEventObject write FPkEventObject;
    property CaseType: string read FCaseType write FCaseType;
    property StatusCode: string read FStatusCode write FStatusCode;
    property PostDate: TDateTime read FPostDate write FPostDate;
    property ValueDate: TDateTime read FValueDate write FValueDate;

    constructor Create;

    procedure Post(const o: TObject);
  end;

var
  ldgr: TLedger;

implementation

constructor TLedger.Create;
begin
  if ldgr <> nil then ldgr := self
  else inherited Create;
end;

procedure TLedger.Post(const o: TObject);
begin

end;

end.
