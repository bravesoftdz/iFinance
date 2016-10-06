unit Group;

interface

type
  TGroup = class
  private
    FGroupId: integer;
    FGroupName: string;
    FParentGroupId: integer;
    FIsGov: integer;

    function GetIsPublic: boolean;
  public
    property GroupId: integer read FGroupId write FGroupId;
    property GroupName: string read FGroupName write FGroupName;
    property ParentGroupId: integer read FParentGroupId write FParentGroupId;
    property IsGov: integer write FIsGov;
    property IsPublic: boolean read GetIsPublic;
  end;

var
  grp: TGroup;

implementation

function TGroup.GetIsPublic: boolean;
begin
  Result := FIsGov = 1;
end;

end.
