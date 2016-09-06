unit Entity;

interface

uses
  SysUtils;

type
  TEntity = class(TObject)
  protected
    FId: string;
  public
    procedure Add; virtual; abstract;
    procedure Save; virtual; abstract;
    procedure Edit; virtual; abstract;
    procedure Cancel; virtual; abstract;
    constructor Create;
    destructor Destroy; override;
    property Id: string read FId write FId;
  end;

var
  ent: TEntity;

implementation

constructor TEntity.Create;
begin
  if ent <> nil then
    Abort
  else
    ent := self;
end;

destructor TEntity.Destroy;
begin
  if ent = self then
    ent := nil;
  inherited;
end;

end.
