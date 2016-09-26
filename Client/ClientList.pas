unit ClientList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, DockedFormIntf, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, System.Rtti, ADODB;

type
  TfrmClientList = class(TfrmBaseDocked, IDockedForm)
    pnlSearch: TRzPanel;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    CheckBox1: TCheckBox;
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
  (grList.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@entity_type').Value :=
        TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.CL);
  OpenGridDataSources(pnlList);
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

end.
