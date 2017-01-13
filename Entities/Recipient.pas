unit Recipient;

interface

uses
  Entity, ADODB, DB;

type
  TRecipient = class(TEntity)
  private
    FName: string;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;

    property Name: string read FName write FName;

    constructor Create(const id, name: string); overload;
  end;

var
  rcp: TRecipient;

implementation

uses
  EntitiesData;

constructor TRecipient.Create(const id: string; const name: string);
begin
  FId := id;
  FName := name;
end;

procedure TRecipient.Add;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag in [7,8] then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TRecipient.Save;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [7,8] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Post;
    end;
  end;
end;

procedure TRecipient.Edit;
begin

end;

procedure TRecipient.Cancel;
var
  i: integer;
begin
  with dmEntities do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [7,8] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
    end;
  end;
end;

end.
