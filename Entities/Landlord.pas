unit Landlord;

interface

uses
  Entity, SysUtils, ADODB, DB;

type
  TLandlord = class(TEntity)
  private
    FName: string;
    FMobile: string;
    FTelephone: string;
    function GetContact: string;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    property Name: string read FName write FName;
    property Mobile: string read FMobile write FMobile;
    property Telephone: string read FTelephone write FTelephone;
    property Contact: string read GetContact;
    constructor Create;
  end;

var
  llord: TLandlord;

implementation

uses
  EntitiesData;

{ TLandlord }

procedure TLandlord.Add;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag in [1,2] then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TLandlord.Cancel;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [1,2] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
    end;
  end;
end;

constructor TLandlord.Create;
begin
  if llord = nil then
    llord := self;
end;

procedure TLandlord.Edit;
begin
  inherited;

end;

function TLandlord.GetContact: string;
begin
  if (FMobile <> '') and (FTelephone <> '') then
    Result := FMobile + ' | ' + FTelephone
  else if FMobile <> '' then
    Result := FMobile
  else if FTelephone <> '' then
    Result := FTelephone
  else
    Result := '';
end;

procedure TLandlord.Save;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [1,2] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Post;
    end;
  end;
end;

end.
