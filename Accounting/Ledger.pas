unit Ledger;

interface

uses
  System.Rtti;

type
  TLedger = class
  private
    FDebit: single;
    FPrimaryKey: string;
    FPostingId: string;
    FRefPostingId: string;
    FEventObject: string;
    FValueDate: TDateTime;
    FCredit: single;
    FCaseType: string;
    FCurrentStatus: string;
    FNewStatus: string;
    function GetPosted: boolean;
    function GetStatusChanged: boolean;
    function GetUnreferencedPayment: boolean;
  public
    property PostingId: string read FPostingId write FPostingId;
    property RefPostingId: string read FRefPostingId write FRefPostingId;
    property EventObject: string read FEventObject write FEventObject;
    property PrimaryKey: string read FPrimaryKey write FPrimaryKey;
    property ValueDate: TDateTime read FValueDate write FValueDate;
    property Credit: single read FCredit write FCredit;
    property Debit: single read FDebit write FDebit;
    property CaseType: string read FCaseType write FCaseType;
    property CurrentStatus: string read FCurrentStatus write FCurrentStatus;
    property NewStatus: string read FNewStatus write FNewStatus;
    property Posted: boolean read GetPosted;
    property StatusChanged: boolean read GetStatusChanged;
    property UnreferencedPayment: boolean read GetUnreferencedPayment;
  end;

implementation

uses
  AppConstants;

{ TLedger }

function TLedger.GetPosted: boolean;
begin
  Result := FPostingId <> '';
end;

function TLedger.GetStatusChanged: boolean;
begin
  Result := FNewStatus <> '';
end;

function TLedger.GetUnreferencedPayment: boolean;
begin
  Result := (FEventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.PAY))
    and (FRefPostingId = '');
end;

end.
