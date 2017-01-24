unit LoanClient;

interface

uses
  Employer;

type
  TLoanClient = class(TObject)
  private
    FId: string;
    FName: string;
    FEmployer: TEmployer;
    FAddress: string;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property Employer: TEmployer read FEmployer write FEmployer;
    property Address: string read FAddress write FAddress;

    constructor Create; overload;
    constructor Create(const id, name: string; emp: TEmployer; const addr: string); overload;
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

constructor TLoanClient.Create(const id, name: string; emp: TEmployer; const addr: string);
begin
  inherited Create;

  FId := id;
  FName := name;
  FEmployer := emp;
  FAddress := addr;
end;

destructor TLoanClient.Destroy;
begin
  if lnc = self then
    lnc := nil;
  inherited;
end;

end.
