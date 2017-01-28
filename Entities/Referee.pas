unit Referee;

interface

uses
  Entity, ADODB, DB;

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

uses
  EntitiesData;

constructor TReferee.Create;
begin
  if ref = nil then
    ref := self;
end;

procedure TReferee.Add;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag in [9,10] then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TReferee.Save;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [9,10] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Post;
    end;
  end;
end;

procedure TReferee.Edit;
begin

end;

procedure TReferee.Cancel;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [9,10] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
    end;
  end;
end;

end.
