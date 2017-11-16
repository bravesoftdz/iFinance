unit IFinanceGlobal;

interface

uses
  SysUtils, User, Vcl.Graphics, Location;

type
  TFirstPayment = class
  strict private
    FMaxDaysHalf: byte;
    FFullInterestRate: currency;
    FMinDaysFullInterest: byte;
    FHalfInterestRate: currency;
    FMinDaysHalf: byte;
    FMaxDaysFullInterest: byte;
  public
    property MinDaysHalfInterest: byte read FMinDaysHalf write FMinDaysHalf;
    property MaxDaysHalfInterest: byte read FMaxDaysHalf write FMaxDaysHalf;
    property MinDaysFullInterest: byte read FMinDaysFullInterest write FMinDaysFullInterest;
  end;

  TRules = class
  strict private
    FFirstPayment: TFirstPayment;
  public
    property FirstPayment: TFirstPayment read FFirstPayment write FFirstPayment;

    constructor Create;
  end;

  TIFinance = class(TObject)
  private
    FAppName: string;
    FAppDescription: string;
    FAppDate: TDate;
    FLocationCode: string;
    FLocationPrefix: string;
    FUser: TUser;
    FPhotoPath: string;
    FPhotoUtility: string;
    FControlDisabledColor: TColor;
    FMaxComakeredLoans: byte;
    FAppImagesPath: string;
    FVersion: string;
    FLocations: array of TLocation;
    FDaysInAMonth: byte;
    FRules: TRules;

    function GetLocation(const i: integer): TLocation;
    function GetLocationCount: integer;
    function GetHalfMonth: byte;

  public
    procedure AddLocation(const loc: TLocation);

    function GetLocationNameByCode(const code: string): string;

    property AppDate: TDate read FAppDate write FAppDate;
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationPrefix: string read FLocationPrefix write FLocationPrefix;
    property User: TUser read FUser write FUser;
    property PhotoPath: string read FPhotoPath write FPhotoPath;
    property PhotoUtility: string read FPhotoUtility write FPhotoUtility;
    property ControlDisabledColor: TColor read FControlDisabledColor write FControlDisabledColor;
    property MaxComakeredLoans: byte read FMaxComakeredLoans write FMaxComakeredLoans;
    property AppImagesPath: string read FAppImagesPath write FAppImagesPath;
    property Version: string read FVersion write FVersion;
    property AppName: string read FAppName write FAppName;
    property AppDescription: string read FAppDescription write FAppDescription;
    property Locations[const i: integer]: TLocation read GetLocation;
    property LocationCount: integer read GetLocationCount;
    property DaysInAMonth: byte read FDaysInAMonth write FDaysInAMonth;
    property Rules: TRules read FRules write FRules;
    property HalfMonth: byte read GetHalfMonth;

    constructor Create;
    destructor Destroy; override;
  end;

var
  ifn: TIFinance;

implementation

{ TIFinance }

constructor TIFinance.Create;
begin
  if ifn <> nil then
    Abort
  else
  begin
    FAppName := 'i-Finance';
    FAppDescription := 'Integrated Financial Management Information System';

    FPhotoUtility := 'PhotoUtil.exe.';
    FControlDisabledColor := clWhite;
    FMaxComakeredLoans := 3;
    FDaysInAMonth := 30;

    FUser := TUser.Create;
    FRules := TRules.Create;

    ifn := self;
  end;
end;

destructor TIFinance.Destroy;
begin
  if ifn = self then
    ifn := nil;
  inherited Destroy;
end;

procedure TIFinance.AddLocation(const loc: TLocation);
begin
  SetLength(FLocations,Length(FLocations) + 1);
  FLocations[Length(FLocations) - 1] := loc;
end;

function TIFinance.GetHalfMonth: byte;
begin
  Result := 15;
end;

function TIFinance.GetLocation(const i: Integer): TLocation;
begin
  Result := FLocations[i];
end;

function TIFinance.GetLocationNameByCode(const code: string): string;
var
  loc: TLocation;
begin
  Result := 'Unknown';

  for loc in FLocations do
    if code = Trim(loc.LocationCode) then
    begin
      Result := loc.LocationName;
      Exit;
    end;
end;

function TIFinance.GetLocationCount: integer;
begin
  Result := Length(FLocations);
end;

{ TRules }

constructor TRules.Create;
begin
  FFirstPayment := TFirstPayment.Create;

  FFirstPayment.MinDaysHalfInterest := 5;
  FFirstPayment.MaxDaysHalfInterest := 15;
  FFirstPayment.MinDaysFullInterest := 16;
end;

end.
