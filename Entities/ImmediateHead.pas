unit ImmediateHead;

interface

uses
  Entity, ADODB, DB;

type
  TImmediateHead = class(TEntity)
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
  immHead: TImmediateHead;

implementation

{ TImmediateHead }

uses
  EntitiesData;

procedure TImmediateHead.Add;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag in [3,4] then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TImmediateHead.Cancel;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [3,4] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
    end;
  end;
end;

constructor TImmediateHead.Create;
begin
  if immHead = nil then
    immHead := self;
end;

procedure TImmediateHead.Edit;
begin
  inherited;

end;

procedure TImmediateHead.Save;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [3,4] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Post;
    end;
  end;
end;

end.
