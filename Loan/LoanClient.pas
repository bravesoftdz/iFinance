unit LoanClient;

interface

type
  TLoanClient = class(TObject)
  private
    FId: string;
    FName: string;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;

    constructor Create;
    destructor Destroy; override;
  end;

var
  lnc: TLoanClient;

implementation

constructor TLoanClient.Create;
begin
  if lnc = nil then
    lnc := self;
end;

destructor TLoanClient.Destroy;
begin
  if lnc = self then
    lnc := nil;
  inherited;
end;

end.
