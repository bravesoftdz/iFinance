unit GroupList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel,
  RzDBEdit, Vcl.Imaging.pngimage, Vcl.ComCtrls, RzTreeVw, Group, Vcl.Menus,
  RzCmboBx;

type
  TfrmGroupList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edGroupName: TRzDBEdit;
    cbxPrivate: TRzDBCheckBox;
    cbxActive: TRzDBCheckBox;
    JvLabel12: TJvLabel;
    dbluParentGroup: TRzDBLookupComboBox;
    tvGroup: TRzTreeView;
    cmbBranch: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvGroupChange(Sender: TObject; Node: TTreeNode);
    procedure tvGroupDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvGroupDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cmbBranchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateTree;
    procedure PopulateGroupList;
    procedure FilterList;
    procedure UpdateTree;
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  public
    { Public declarations }
    function Save: boolean; override;
  end;

var
  frmGroupList: TfrmGroupList;

implementation

{$R *.dfm}

uses
  EntitiesData, IFinanceDialogs, FormsUtil;

procedure TfrmGroupList.PopulateTree;
var
  i, cnt: integer;

  function GetParentNode: TTreeNode;
  var
    n: integer;
  begin
    Result := nil;
    for n := 0 to tvGroup.Items.Count - 1 do
      if TGroup(tvGroup.Items[n].Data).GroupId = groups[i].ParentGroupId then
      begin
        Result := tvGroup.Items[n];
        Exit;
      end;
  end;

begin
  with tvGroup do
  begin
    Items.Clear;

    cnt := Length(groups) - 1;

    // loop through the list and insert items with no parent first
    for i := 0 to cnt do
      if not groups[i].HasParent then
        Items.AddObject(nil,groups[i].GroupName,groups[i]);

    // loop through the list and insert child items (with parent)
    for i := 0 to cnt do
      if groups[i].HasParent then
        Items.AddChildObject(GetParentNode,groups[i].GroupName,groups[i]);

    FullExpand;
  end;
end;

procedure TfrmGroupList.PopulateGroupList;
var
  gp: TGroup;
begin
  groups := [];

  with grList.DataSource.DataSet do
  begin
    DisableControls;

    First;

    while not Eof do
    begin
      gp := TGroup.Create;

      gp.GroupId := FieldByName('grp_id').AsString;
      gp.GroupName := FieldByName('grp_name').AsString;
      gp.ParentGroupId := FieldByName('par_grp_id').AsString;
      gp.IsGov := FieldByName('is_gov').AsInteger;
      gp.IsActive := FieldByName('is_active').AsInteger;

      SetLength(groups,Length(groups) + 1);
      groups[Length(groups)-1] := gp;

      Next;
    end;

    First;
    EnableControls;
  end;
end;

procedure TfrmGroupList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEntities.Free;
  inherited;
end;

procedure TfrmGroupList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);

  PopulateBranchComboBox(cmbBranch);

  inherited;
end;

procedure TfrmGroupList.FormShow(Sender: TObject);
begin
  inherited;
  UpdateTree;
end;

procedure TfrmGroupList.UpdateTree;
begin
  FilterList;
  PopulateGroupList;
  PopulateTree;
end;

procedure TfrmGroupList.SearchList;
begin
  grList.DataSource.DataSet.Locate('grp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmGroupList.tvGroupChange(Sender: TObject; Node: TTreeNode);
var
  groupId: string;
begin
  groupId := TGroup(Node.Data).GroupId;
  grList.DataSource.DataSet.Locate('grp_id',groupId,[]);
end;

procedure TfrmGroupList.tvGroupDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  src, dst: TTreeNode;
begin
  src := tvGroup.Selected;
  dst := tvGroup.GetNodeAt(X,Y);
  src.MoveTo(dst, naAddChild);

  // apply destination properties to source
  TGroup(src.Data).ParentGroupId := TGroup(dst.Data).GroupId;
  TGroup(src.Data).IsGov := TGroup(dst.Data).IsGov;
  TGroup(src.Data).IsActive := TGroup(dst.Data).IsActive;
  TGroup(src.Data).SaveChanges(src.Data);
end;

procedure TfrmGroupList.tvGroupDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  src, dst: TTreeNode;
begin
  src := tvGroup.Selected;
  dst := tvGroup.GetNodeAt(X,Y);
  Accept := Assigned(dst) and (src<>dst);
end;

procedure TfrmGroupList.FilterList;
var
  filterStr: string;
begin
  if cmbBranch.ItemIndex > -1 then
    filterStr := 'loc_code = ''' + cmbBranch.Value + ''''
  else
    filterStr := '';

  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmGroupList.cmbBranchChange(Sender: TObject);
begin
  inherited;
  UpdateTree;
end;

function TfrmGroupList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edGroupName.Text) = '' then  error := 'Please enter a group name.'
  else if Trim(edGroupName.Text) = (dbluParentGroup.Text) then
    error := 'Parent group cannot be the same as group.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

function TfrmGroupList.Save: boolean;
begin
  Result := inherited Save;

  PopulateGroupList;
  PopulateTree;
end;

end.
