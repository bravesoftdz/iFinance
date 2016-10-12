unit ClientList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, DockedFormIntf, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, System.Rtti, ADODB, ClientListIntf;

type
  TfrmClientList = class(TfrmBaseDocked, IDockedForm, IClientFilter)
    pnlSearch: TRzPanel;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grListDblClick(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTitle(const title: string);
    procedure FilterList(const filterType: TClientFilterType;
        const nonClients: boolean = false);
  end;

var
  frmClientList: TfrmClientList;

implementation

{$R *.dfm}

uses
  AppData, FormsUtil, DockIntf, Client, AppConstants;

procedure TfrmClientList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OpenGridDataSources(pnlList,false);
  inherited;
end;

procedure TfrmClientList.grListDblClick(Sender: TObject);
var
  id: string;
  intf: IDock;
begin
  if grList.DataSource.DataSet.RecordCount > 0 then
  begin
    id := grList.DataSource.DataSet.FieldByName('entity_id').AsString;

    cln := TClient.Create;
    cln.Id := id;

    if Supports(Application.MainForm,IDock,intf) then
      intf.DockForm(fmClientMain);
  end;
end;

procedure TfrmClientList.SetTitle(const title: string);
begin
  lblTitle.Caption := title;
end;

procedure TfrmClientList.edSearchKeyChange(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if Trim(edSearchKey.Text) <> '' then
    filter := 'name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grList.DataSource.DataSet.Filter := filter;
end;

procedure TfrmClientList.FilterList(const filterType: TClientFilterType;
        const nonClients: Boolean = False);
begin
  with dmApplication.dstClients.Parameters do
  begin
    case filterType of
      cftAll: ParamByName('@filter_type').Value := 0;
      cftActive: ParamByName('@filter_type').Value := 1;
      cftRecent: ParamByName('@filter_type').Value := 2;
    end;
  end;

  OpenGridDataSources(pnlList);
end;

end.
