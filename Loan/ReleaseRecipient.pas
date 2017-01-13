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
    FReleaseMethod: TReleaseMethod;
    FAmount: string; // why string over real/float? This is already formatted in the stored proc
    FDate: string;   // see comment on FAmount
  public
    property Recipient: TRecipient read FRecipient write FRecipient;
    property ReleaseMethod: TReleaseMethod read FReleaseMethod write FReleaseMethod;
    property Amount: string read FAmount write FAmount;
    property Date: string read FDate write FDate;

    constructor Create; overload;
    constructor Create(const rpt: TRecipient; rm: TReleaseMethod;
        const amt, dt: string);  overload;
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
  const amt, dt: string);
begin
  FRecipient := rpt;
  FReleaseMethod := rm;
  FAmount := amt;
  FDate := dt;
end;

end.
