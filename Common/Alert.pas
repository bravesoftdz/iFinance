unit Alert;

interface

type
  TAlert = class(TObject)
  private
    FItems: array of string;

    function GetItem(const i: integer): string;
    function GetCount: integer;

  public
    procedure Add(const al: string);
    procedure Clear;

    property Items[const i: integer]: string read GetItem;
    property Count: integer read GetCount;

    constructor Create;
  end;

var
  alrt: TAlert;

implementation

constructor TAlert.Create;
begin
  if alrt = nil then
  begin
    FItems := [];
    alrt := self;
  end;
end;

procedure TAlert.Add(const al: string);
begin
  SetLength(FItems,Length(FItems) + 1);
  FItems[Length(FItems) - 1] := al;
end;

procedure TAlert.Clear;
begin
  FItems := [];
end;

function TAlert.GetItem(const i: integer): string;
begin
  Result := FItems[i];
end;

function TAlert.GetCount;
begin
  Result := Length(FItems);
end;

end.
