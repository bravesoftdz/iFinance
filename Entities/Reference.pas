unit Reference;

interface

uses
  Entity, ADODB, DB;

type
  TReference = class(TEntity)
  private
    FFirstname: string;
    FLastname: string;
    FMiddlename: string;
    FName: string;
    FRefType: string;
    FIsDependent: boolean;
    FIsStudent: boolean;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;

    property Firstname: string read FFirstname write FFirstname;
    property Lastname: string read FLastname write FLastname;
    property Middlename: string read FMiddlename write FMiddlename;
    property Name: string read FName write FName;
    property RefType: string read FRefType write FRefType;
    property IsDependent: boolean read FIsDependent write FIsDependent;
    property IsStudent: boolean read FIsStudent write FIsStudent;

    constructor Create; overload;
    constructor Create(const id, name, refType: string; const isDependent, isStudent: boolean); overload;
    constructor Create(const id, firstname, lastname, middlename: string); overload;
  end;

var
  refc: TReference;

implementation

uses
  RefData;

constructor TReference.Create;
begin
  inherited Create;
end;

constructor TReference.Create(const id, name, refType: string;
  const isDependent: boolean; const isStudent: boolean);
begin
  FId := id;
  FName := name;
  FRefType := refType;
  FIsDependent := isDependent;
  FIsStudent := isStudent;
end;

constructor TReference.Create(const id: string; const firstname: string;
  const lastname: string; const middlename: string);
begin
  FId := id;
  FFirstname := firstname;
  FLastname := lastname;
  FMiddlename := middlename;
end;

procedure TReference.Add;
var
  i: integer;
begin
  with dmRef do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [3,4] then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
  end;
end;

procedure TReference.Save;
var
  i: integer;
begin
  with dmRef do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [3,4] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Post;
  end;
end;

procedure TReference.Edit;
begin

end;

procedure TReference.Cancel;
var
  i: integer;
begin
  with dmRef do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag in [3,4] then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
  end;
end;

end.
