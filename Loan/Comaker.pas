unit Comaker;

interface

uses
  Entity, ADODB, DB, Employer;

type
  TComaker = class(TEntity)
  private
    FName: string;
    FComakeredLoans: integer;
    FEmployer: TEmployer;

    function GetHasId: boolean;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve;
    procedure CopyAddress;

    property Name: string read FName write FName;
    property ComakeredLoans: integer read FComakeredLoans write FComakeredLoans;
    property Employer: TEmployer read FEmployer write FEmployer;
    property HasId: boolean read GetHasId;

    constructor Create; overload;
    constructor Create(const id: string); overload;
    constructor Create(const name, id: string); overload;
  end;

var
  cm: TComaker;

implementation

uses
  ComakerData;

constructor TComaker.Create;
begin
  inherited Create;
end;

constructor TComaker.Create(const id: string);
begin
  FId := id;
end;

constructor TComaker.Create(const name, id: string);
begin
  FName := name;
  FId := id;
end;

procedure TComaker.Add;
var
  i: integer;
begin
  with dmComaker do
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

procedure TComaker.Save;
var
  i: integer;
begin
  with dmComaker do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          (Components[i] as TADODataSet).Post;
  end;
end;

procedure TComaker.Edit;
begin

end;

procedure TComaker.Cancel;
begin

end;

procedure TComaker.Retrieve;
var
  i: integer;
begin
  with dmComaker do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        (Components[i] as TADODataSet).Open;

        if (Components[i] as TADODataSet).Tag in [1] then
          if (Components[i] as TADODataSet).RecordCount > 0 then
            (Components[i] as TADODataSet).Edit;
      end;
    end;
  end;
end;

procedure TComaker.CopyAddress;
var
  i: integer;
begin
  with dmComaker, dmComaker.dstAddressInfo do
  begin
    if dstAddressInfo2.RecordCount > 0 then
      dstAddressInfo2.Edit
    else
      dstAddressInfo2.Append;

    for i := 0 to FieldCount - 1 do
      if dstAddressInfo2.Fields.FindField(Fields[i].FieldName) <> nil then
        if not dstAddressInfo2.Fields[i].ReadOnly then
          dstAddressInfo2.FieldByName(Fields[i].FieldName).Value := FieldByName(Fields[i].FieldName).Value;
  end;

end;

function TComaker.GetHasId;
begin
  Result := FId <> '';
end;

end.
