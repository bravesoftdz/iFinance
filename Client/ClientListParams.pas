unit ClientListParams;

interface

uses
  SysUtils;

type
  TClientListParams = class(TObject)
  private
    FSearchKey: string;
    FShowNonClients: boolean;
  public
    property SearchKey: string read FSearchKey write FSearchKey;
    property ShowNonClients: boolean read FShowNonClients write FShowNonClients;

    constructor Create;
    destructor Destroy; override;

  end;

var
  clp: TClientListParams;

implementation

constructor TClientListParams.Create;
begin
  if clp <> nil then
    Abort
  else
    clp := self;
end;

destructor TClientListParams.Destroy;
begin
  if clp = self then
    clp := nil;
  inherited;
end;

end.
