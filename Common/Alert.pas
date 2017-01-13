unit Alert;

interface

type
  TAlert = class(TObject)
  private
    FAlerts: array of string;

    function GetAlert(const i: integer): string;
    function GetCount: integer;

  public
    procedure Add(const al: string);
    procedure Clear;

    property Alerts[const i: integer]: string read GetAlert;
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
    FAlerts := [];
    alrt := self;
  end;
end;

procedure TAlert.Add(const al: string);
begin
  SetLength(FAlerts,Length(FAlerts) + 1);
  FAlerts[Length(FAlerts) - 1] := al;
end;

procedure TAlert.Clear;
begin
  FAlerts := [];
end;

function TAlert.GetAlert(const i: integer): string;
begin
  Result := FAlerts[i];
end;

function TAlert.GetCount;
begin
  Result := Length(FAlerts);
end;

end.
