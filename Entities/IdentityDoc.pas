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
    FHasExpiry: boolean;
  public
    property IdType: string read FIdType write FIdType;
    property IdNo: string read FIdNo write FIdNo;
    property Expiry: TDate read FExpiry write FExpiry;
    property HasExpiry: boolean read FHasExpiry write FHasExpiry;

    constructor Create(const idType, idNo: string; const expiry: TDate;
        const hasExpiry: boolean); overload;
  end;

var
  identDoc: TIdentityDoc;

implementation

constructor TIdentityDoc.Create(const idType, idNo: string; const expiry: TDate;
        const hasExpiry: boolean);
begin
  FIdType := idType;
  FIdNo := idNo;
  FExpiry := expiry;
  FHasExpiry := hasExpiry;
end;

end.
