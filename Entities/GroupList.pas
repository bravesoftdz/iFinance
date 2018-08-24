unit GroupList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, Vcl.DBCtrls, RzDBCmbo, RzDBEdit, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, RzTreeVw, Group, Vcl.Menus, RzCmboBx;

type
  TfrmGroupList = class(TfrmBaseGridDetail)
    edGroupName: TRzDBEdit;
    cbxPublic: TRzDBCheckBox;
    cbxActive: TRzDBCheckBox;
    dbluParentGroup: TRzDBLookupComboBox;
    tvGroup: TRzTreeView;
    cmbBranch: TRzComboBox;
    edMaxTotal: TRzDBNumericEdit;
    RzGroupBox1: TRzGroupBox;
    dbluLoanType: TRzDBLookupComboBox;
    edConcurrent: TRzDBEdit;
    edIdentityDocs: TRzDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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
    procedure EnableControls(const enable: boolean);
    procedure SaveAttributes;
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  public
    { Public declarations }
    procedure New; override;
    function Save: boolean; override;
  end;

implementation

{$R *.dfm}

uses
  EntitiesData, IFinanceDialogs, FormsUtil, AuxData;

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
  dmAux.Free;

  inherited;
end;

procedure TfrmGroupList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  dmAux := TdmAux.Create(self);

  PopulateBranchComboBox(cmbBranch);

  inherited;
end;

procedure TfrmGroupList.FormShow(Sender: TObject);
begin
  inherited;
  UpdateTree;
end;

procedure TfrmGroupList.New;
begin
  inherited;
  TGroup.AddAttributes;
end;

function TfrmGroupList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmGroupList.UpdateTree;
begin
  FilterList;
  PopulateGroupList;
  PopulateTree;

  if Length(groups) > 0 then
  begin
    EnableControls(not groups[0].HasParent);
    groups[0].GetAttributes;
  end;
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

  EnableControls(not TGroup(Node.Data).HasParent);
  TGroup(Node.Data).GetAttributes;
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

procedure TfrmGroupList.BindToObject;
begin
  inherited;

end;

procedure TfrmGroupList.cmbBranchChange(Sender: TObject);
begin
  inherited;
  UpdateTree;
end;

function TfrmGroupList.EditIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmGroupList.EnableControls(const enable: boolean);
var
  i, cnt: integer;
begin
  cnt := pnlDetail.ControlCount - 1;
  for i := 0 to cnt do
  begin
    if pnlDetail.Controls[i].Tag = 1 then
    begin
      if pnlDetail.Controls[i] is TRzDBNumericEdit then
        (pnlDetail.Controls[i] as TRzDBNumericEdit).Enabled := enable
      else if pnlDetail.Controls[i] is TRzDBLookupComboBox then
        (pnlDetail.Controls[i] as TRzDBLookupComboBox).Enabled := enable
      else if pnlDetail.Controls[i] is TRzDBEdit then
        (pnlDetail.Controls[i] as TRzDBEdit).Enabled := enable
      else if pnlDetail.Controls[i] is TRzDBCheckBox then
        (pnlDetail.Controls[i] as TRzDBCheckBox).ReadOnly := not enable;
    end;
  end;
end;

function TfrmGroupList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edGroupName.Text) = '' then  error := 'Please enter a group name.'
  else if Trim(edGroupName.Text) = (dbluParentGroup.Text) then
    error := 'Parent group cannot be the same as group.'

  // check attributes
  // only parent groups have attributes
  else if dbluParentGroup.KeyValue = null then
  begin
    if Trim(edMaxTotal.Text) = '' then error := 'Please enter maximum total.'
    else if edMaxTotal.Value < 0 then error := 'Invalid amount for maximum total.'
    else if dbluLoanType.Text = '' then error := 'Please select a loan type.';
  end;

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

function TfrmGroupList.Save: boolean;
begin
  Result := false;

  if EntryIsValid then
  begin
    inherited Save;
    SaveAttributes;

    UpdateTree;

    Result := true;
  end;
end;

procedure TfrmGroupList.SaveAttributes;
begin
  with dmEntities.dstGroupAttribute do
  begin
    if State in [dsInsert,dsEdit] then
    begin
      if dbluParentGroup.KeyValue = null then
      begin
        Post;
        UpdateBatch;
      end
      else CancelBatch;
    end;
  end;
end;

end.
