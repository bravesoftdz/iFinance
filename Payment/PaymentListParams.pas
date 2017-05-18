unit PaymentListParams;

interface

uses
  SysUtils;

type
  TPaymentListParams = class
  private
    FFromDate: TDateTime;
    FUntilDate: TDateTime;
    FLocationCode: string;
  public
    property FromDate: TDateTime read FFromDate write FFromDate;
    property UntilDate: TDateTime read FUntilDate write FUntilDate;
    property LocationCode: string read FLocationCode write FLocationCode;

    constructor Create;
    destructor Destroy; override;

  end;

var
  plp: TPaymentListParams;

implementation

uses
  IFinanceGlobal;

constructor TPaymentListParams.Create;
begin
  if plp <> nil then
    Abort
  else
  begin
    plp := self;

    FFromDate := ifn.AppDate;
    FUntilDate := ifn.AppDate;
    FLocationCode := ifn.LocationCode;
  end;
end;

destructor TPaymentListParams.Destroy;
begin
  if plp = self then
    plp := nil;
  inherited;
end;


end.
