unit Group;

interface

type
  TGroup = class(TObject)
  private
    FGroupId: integer;
    FGroupName: string;
    FParentGroupId: integer;
    FIsGov: integer;
    FIsActive: integer;

    function GetIsGov: boolean;
    function GetHasParent: boolean;

  public
    procedure SaveChanges(const gr: TObject);

    property GroupId: integer read FGroupId write FGroupId;
    property GroupName: string read FGroupName write FGroupName;
    property ParentGroupId: integer read FParentGroupId write FParentGroupId;
    property IsGov: integer read FIsGov write FIsGov;
    property IsPublic: boolean read GetIsGov;
    property HasParent: boolean read GetHasParent;
    property IsActive: integer read FIsActive write FIsActive;
  end;

var
  grp: TGroup;

implementation

uses
  EntitiesData;

procedure TGroup.SaveChanges(const gr: TObject);
begin
  with dmEntities.dstGroups do
  begin
    Edit;
    FieldByName('par_grp_id').AsInteger := TGroup(gr).FParentGroupId;
    FieldByName('is_gov').AsInteger := TGroup(gr).FIsGov;
    FieldByName('is_active').AsInteger := TGroup(gr).FIsActive;
    Post;
  end;
end;

function TGroup.GetIsGov: boolean;
begin
  Result := FIsGov = 1;
end;

function TGroup.GetHasParent: boolean;
begin
  Result := FParentGroupId > 0;
end;

end.
