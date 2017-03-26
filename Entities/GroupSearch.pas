unit GroupSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton, Vcl.ComCtrls, RzTreeVw;

type
  TfrmGroupSearch = class(TfrmBasePopup)
    pnlSearch: TRzPanel;
    pnlSelect: TRzPanel;
    btnSelect: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    tvGroup: TRzTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tvGroupDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateTree;
  protected
    { Public declarations }
  end;

var
  frmGroupSearch: TfrmGroupSearch;

implementation

{$R *.dfm}

uses
  EntitiesData, Group, IFinanceGlobal, GroupUtils;

procedure TfrmGroupSearch.PopulateTree;
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

procedure TfrmGroupSearch.tvGroupDblClick(Sender: TObject);
begin
  inherited;
  if Assigned(tvGroup.Selected.Data) then ModalResult := mrOk;
end;

procedure TfrmGroupSearch.btnSelectClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmGroupSearch.FormClose(Sender: TObject; var Action: TCloseAction);
var
  selGroup: TGroup;
begin
  if ModalResult = mrOK then
  begin
    selGroup := TGroup(tvGroup.Selected.Data);
    if Assigned(selGroup) then
    begin
      grp.GroupId := selGroup.GroupId;
      grp.GroupName := selGroup.GroupName;
    end;
  end;

  dmEntities.Free;

  inherited;
end;

procedure TfrmGroupSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);

  PopulateGroupList(dmEntities.dstGroups);
  PopulateTree;

  inherited;
end;

procedure TfrmGroupSearch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ModalResult := mrOK;
  inherited;
end;

procedure TfrmGroupSearch.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
