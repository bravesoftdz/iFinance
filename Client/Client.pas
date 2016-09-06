unit Client;

interface

uses
  SysUtils, ClientData, Dialogs, DB, Entity, ADODB, LandLord, ImmediateHead;

type
  TClient = class(TEntity)
  private
    FLandlord: TLandLord;
    FImmediateHead: TImmediateHead;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    property Landlord: TLandLord read FLandlord write FLandlord;
    property ImmediateHead: TImmediateHead read FImmediateHead write FImmediateHead;
  end;

var
  cln: TClient;

implementation

{ TClient }

procedure TClient.Add;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag <> 0 then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TClient.Cancel;
begin
  inherited;

end;

procedure TClient.Edit;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        (Components[i] as TADODataSet).Open;
        if (Components[i] as TADODataSet).Tag = 1 then
          if (Components[i] as TADODataSet).RecordCount = 0 then
            (Components[i] as TADODataSet).Edit;
      end;
    end;
  end;
end;

procedure TClient.Save;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          (Components[i] as TADODataSet).Post;
  end;
end;

end.
