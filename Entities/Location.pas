unit Location;

interface

type
  TLocation = class(TObject)
  private
    FLocationCode: string;
    FLocationName: string;
  public
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationName: string read FLocationName write FLocationName;
  end;

implementation

end.
