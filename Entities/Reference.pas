unit Reference;

interface

uses
  Entity;

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

    constructor Create(const id, name, refType: string; const isDependent, isStudent: boolean); overload;
    constructor Create(const id, firstname, lastname, middlename: string); overload;
  end;

var
  refc: TReference;

implementation

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
begin

end;

procedure TReference.Save;
begin

end;

procedure TReference.Edit;
begin

end;

procedure TReference.Cancel;
begin

end;

end.
