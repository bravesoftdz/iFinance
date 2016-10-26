unit Comaker;

interface

uses
  Entity;

type
  TComaker = class(TEntity)
  public
    constructor Create; overload;
    constructor Create(const id: string); overload;
  end;

var
  cm: TComaker;

implementation

constructor TComaker.Create;
begin
  inherited Create;
end;

constructor TComaker.Create(const id: string);
begin
  FId := id;
end;

end.
