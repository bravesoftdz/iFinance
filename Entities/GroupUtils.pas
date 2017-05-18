unit GroupUtils;

interface

uses
  Group, ADODB;

procedure PopulateGroupList(DataSet: TADODataSet);

implementation

procedure PopulateGroupList(DataSet: TADODataSet);
var
  gp: TGroup;
begin
  groups := [];

  with DataSet do
  begin
    Open;
    DisableControls;

    while not Eof do
    begin
      gp := TGroup.Create;

      gp.GroupId := FieldByName('grp_id').AsString;
      gp.GroupName := FieldByName('grp_name').AsString;
      gp.ParentGroupId := FieldByName('par_grp_id').AsString;
      gp.IsActive := FieldByName('is_active').AsInteger;

      SetLength(groups,Length(groups) + 1);
      groups[Length(groups)-1] := gp;

      Next;
    end;

    Close;
    EnableControls;
  end;
end;

end.
