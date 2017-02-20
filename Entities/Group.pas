unit Group;

interface

type
  TGroup = class(TObject)
  private
    FGroupId: integer;
    FGroupName: string;
    FParentGroupId: integer;
    FIsGov: integer;

    function GetIsGov: boolean;
    function GetHasParent: boolean;

  public
    property GroupId: integer read FGroupId write FGroupId;
    property GroupName: string read FGroupName write FGroupName;
    property ParentGroupId: integer read FParentGroupId write FParentGroupId;
    property IsGov: integer write FIsGov;
    property IsPublic: boolean read GetIsGov;
    property HasParent: boolean read GetHasParent;
  end;

var
  grp: TGroup;

implementation

function TGroup.GetIsGov: boolean;
begin
  Result := FIsGov = 1;
end;

function TGroup.GetHasParent: boolean;
begin
  Result := FParentGroupId > 0;
end;

end.
