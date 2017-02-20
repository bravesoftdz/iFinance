unit GroupList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel,
  RzDBEdit, Vcl.Imaging.pngimage, Vcl.ComCtrls, RzTreeVw, Group;

type
  TfrmGroupList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edGroupName: TRzDBEdit;
    cbxPrivate: TRzDBCheckBox;
    cbxActive: TRzDBCheckBox;
    JvLabel12: TJvLabel;
    dbluParentGroup: TRzDBLookupComboBox;
    tvGroup: TRzTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvGroupChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    GroupList: array of TGroup;

    procedure PopulateTree;
    procedure PopulateGroupList;
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
  EntitiesData, IFinanceDialogs;

procedure TfrmGroupList.PopulateTree;
var
  i, cnt: integer;

  function GetParentNode: TTreeNode;
  var
    n: integer;
  begin
    Result := nil;
    for n := 0 to tvGroup.Items.Count - 1 do
      if TGroup(tvGroup.Items[n].Data).GroupId = GroupList[i].ParentGroupId then
      begin
        Result := tvGroup.Items[n];
        Exit;
      end;
  end;

begin
  with tvGroup do
  begin
    Items.Clear;

    cnt := Length(GroupList) - 1;

    // loop through the list and insert items with no parent first
    for i := 0 to cnt do
      if not GroupList[i].HasParent then
        Items.AddObject(nil,GroupList[i].GroupName,GroupList[i]);

    // loop through the list and insert items with parent
    for i := 0 to cnt do
      if GroupList[i].HasParent then
        Items.AddChildObject(GetParentNode,GroupList[i].GroupName,GroupList[i]);

    FullExpand;
  end;
end;

procedure TfrmGroupList.PopulateGroupList;
var
  gp: TGroup;
begin
  GroupList := [];

  with grList.DataSource.DataSet do
  begin
    DisableControls;

    First;

    while not Eof do
    begin
      gp := TGroup.Create;

      gp.GroupId := FieldByName('grp_id').AsInteger;
      gp.GroupName := FieldByName('grp_name').AsString;
      gp.ParentGroupId := FieldByName('par_grp_id').AsInteger;
      gp.IsGov := FieldByName('is_gov').AsInteger;

      SetLength(GroupList,Length(GroupList) + 1);
      GroupList[Length(GroupList)-1] := gp;

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
  inherited;

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
  groupId: integer;
begin
  groupId := TGroup(Node.Data).GroupId;
  grList.DataSource.DataSet.Locate('grp_id',groupId,[]);
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
  inherited Save;

  PopulateGroupList;
  PopulateTree;
end;

end.
