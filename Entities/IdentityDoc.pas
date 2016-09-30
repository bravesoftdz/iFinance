unit IdentityDoc;

interface

uses
  System.Variants;

type
  TIdentityDoc = class(TObject)
  private
    FIdType: string;
    FIdNo: string;
    FExpiry: TDate;
    FExpiryStr: string;
    FHasExpiry: boolean;
  public
    property IdType: string read FIdType write FIdType;
    property IdNo: string read FIdNo write FIdNo;
    property Expiry: TDate read FExpiry write FExpiry;
    property ExpiryStr: string read FExpiryStr write FExpiryStr;
    property HasExpiry: boolean read FHasExpiry write FHasExpiry;

    constructor Create(const idType, idNo: string; const expiry: TDate;
        const expiryStr: string; const hasExpiry: boolean); overload;
  end;

var
  identDoc: TIdentityDoc;

implementation

constructor TIdentityDoc.Create(const idType, idNo: string; const expiry: TDate;
        const expiryStr: string; const hasExpiry: boolean);
begin
  FIdType := idType;
  FIdNo := idNo;
  FExpiry := expiry;
  FExpiryStr := expiryStr;
  FHasExpiry := hasExpiry;
end;

end.
