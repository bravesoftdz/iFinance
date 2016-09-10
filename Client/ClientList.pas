unit ClientList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, DockedFormIntf, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid;

type
  TfrmClientList = class(TfrmBaseDocked, IDockedForm)
    pnlSearch: TRzPanel;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTitle(const title: string);
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

procedure TfrmClientList.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(pnlList);
end;

procedure TfrmClientList.grListDblClick(Sender: TObject);
var
  id: string;
  intf: IDock;
begin
  id := grList.DataSource.DataSet.FieldByName('entity_id').AsString;

  cln := TClient.Create;
  cln.Id := id;

  if Supports(Application.MainForm,IDock,intf) then
    intf.DockForm(fmClientMain);
end;

procedure TfrmClientList.SetTitle(const title: string);
begin
  lblTitle.Caption := title;
end;

end.
