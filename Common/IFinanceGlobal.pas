unit IFinanceGlobal;

interface

uses
  SysUtils, User, Vcl.Graphics;

type
  TIFinance = class(TObject)
  private
    FAppDate: TDate;
    FLocationCode: string;
    FLocationPrefix: string;
    FUser: TUser;
    FPhotoPath: string;
    FPhotoUtility: string;
    FControlDisabledColor: TColor;
    FMaxComakeredLoans: integer;
    FAppImagesPath: string;
  public
    property AppDate: TDate read FAppDate write FAppDate;
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationPrefix: string read FLocationPrefix write FLocationPrefix;
    property User: TUser read FUser write FUser;
    property PhotoPath: string read FPhotoPath write FPhotoPath;
    property PhotoUtility: string read FPhotoUtility write FPhotoUtility;
    property ControlDisabledColor: TColor read FControlDisabledColor write FControlDisabledColor;
    property MaxComakeredLoans: integer read FMaxComakeredLoans write FMaxComakeredLoans;
    property AppImagesPath: string read FAppImagesPath write FAppImagesPath;

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
    FPhotoUtility := 'PhotoUtil.exe.';
    FControlDisabledColor := clWhite;
    FMaxComakeredLoans := 3;

    FUser := TUser.Create;

    ifn := self;
  end;
end;

destructor TIFinance.Destroy;
begin
  if ifn = self then
    ifn := nil;
  inherited Destroy;
end;

end.
