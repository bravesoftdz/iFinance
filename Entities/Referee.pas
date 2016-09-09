unit Referee;

interface

uses
  Entity;

type
  TReferee = class(TEntity)
  private
    FName: string;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    property Name: string read FName write FName;
    constructor Create;
  end;

var
  ref: TReferee;

implementation

constructor TReferee.Create;
begin
  if ref = nil then
    ref := self;
end;

procedure TReferee.Add;
begin

end;

procedure TReferee.Save;
begin

end;

procedure TReferee.Edit;
begin

end;

procedure TReferee.Cancel;
begin

end;

end.
