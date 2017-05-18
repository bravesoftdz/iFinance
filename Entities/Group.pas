unit Group;

interface

type
  TGroupAttributes = class
  strict private
    FMaxTotalAmount: real;
    FConcurrent: integer;
  public
    property MaxTotalAmount: real read FMaxTotalAmount write FMaxTotalAmount;
    property Concurrent: integer read FConcurrent write FConcurrent;
  end;

type
  TGroup = class(TObject)
  private
    FGroupId: string;
    FGroupName: string;
    FParentGroupId: string;
    FIsGov: integer;
    FIsActive: integer;
    FAttributes: TGroupAttributes;

    function GetIsGov: boolean;
    function GetHasParent: boolean;

  public
    procedure SaveChanges(const gr: TObject);

    property GroupId: string read FGroupId write FGroupId;
    property GroupName: string read FGroupName write FGroupName;
    property ParentGroupId: string read FParentGroupId write FParentGroupId;
    property IsGov: integer read FIsGov write FIsGov;
    property IsPublic: boolean read GetIsGov;
    property HasParent: boolean read GetHasParent;
    property IsActive: integer read FIsActive write FIsActive;
    property Attributes: TGroupAttributes read FAttributes write FAttributes;

    procedure GetAttributes;
    class procedure AddAttributes;

  end;

var
  grp: TGroup;
  groups: array of TGroup;

implementation

uses
  EntitiesData;

procedure TGroup.SaveChanges(const gr: TObject);
begin
  with dmEntities.dstGroups do
  begin
    Edit;
    FieldByName('par_grp_id').AsString := TGroup(gr).FParentGroupId;
    FieldByName('is_active').AsInteger := TGroup(gr).FIsActive;
    Post;
  end;
end;

function TGroup.GetIsGov: boolean;
begin
  Result := FIsGov = 1;
end;

class procedure TGroup.AddAttributes;
begin
  dmEntities.dstGroupAttribute.Append;
end;

procedure TGroup.GetAttributes;
begin
  // locate the attributes dataset
  // append when necessary .. only append if group is a PARENT
  with dmEntities.dstGroupAttribute do
  begin
    if not Locate('grp_id',FGroupId,[]) then Append
  end;
end;

function TGroup.GetHasParent: boolean;
begin
  Result := FParentGroupId <> '';
end;

end.
