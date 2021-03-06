unit ReleaseRecipient;

interface

uses
  Recipient;

type
  TReleaseMethod = class
  private
    FId: string;
    FName: string;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;

    constructor Create(const id: string; const name: string);
  end;

type
  TReleaseRecipient = class(TObject)
  private
    FRecipient: TRecipient;
    FLocationCode: string;
    FLocationName: string;
    FReleaseMethod: TReleaseMethod;
    FAmount: currency;
    FDate: TDate;
  public
    property Recipient: TRecipient read FRecipient write FRecipient;
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationName: string read FLocationName write FLocationName;
    property ReleaseMethod: TReleaseMethod read FReleaseMethod write FReleaseMethod;
    property Amount: currency read FAmount write FAmount;
    property Date: TDate read FDate write FDate;

    constructor Create; overload;
    constructor Create(const rpt: TRecipient; rm: TReleaseMethod; const locCode, locName: string;
        const amt: currency; const dt: TDate);  overload;
  end;

var
  rrp: TReleaseRecipient;

implementation

constructor TReleaseMethod.Create(const id: string; const name: string);
begin
  FId := id;
  FName := name;
end;

constructor TReleaseRecipient.Create;
begin
  inherited;
end;

constructor TReleaseRecipient.Create(const rpt: TRecipient; rm: TReleaseMethod;
  const locCode, locName: string; const amt: currency; const dt: TDate);
begin
  FRecipient := rpt;
  FLocationCode := locCode;
  FLocationName := locName;
  FReleaseMethod := rm;
  FAmount := amt;
  FDate := dt;
end;

end.
