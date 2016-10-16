unit Branch;

interface

type
  TBranch = class
  private
    FCode: string;
    FName: string;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
  end;

implementation

end.
