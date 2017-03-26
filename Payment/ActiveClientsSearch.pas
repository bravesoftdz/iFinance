unit ActiveClientsSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, ADODB;

type
  TfrmActiveClientsSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmActiveClientsSearch: TfrmActiveClientsSearch;

implementation

{$R *.dfm}

uses
  ActiveClient, AppData;

procedure TfrmActiveClientsSearch.SearchList;
var
  filter: string;
begin
  if Trim(edSearchKey.Text) <> '' then
    filter := 'name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grSearch.DataSource.DataSet.Filter := filter;
end;

procedure TfrmActiveClientsSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    activeCln := TActiveClient.Create;
    activeCln.Id := FieldByName('entity_id').AsString;
    activeCln.Name := FieldByName('name').AsString;
  end;
end;

procedure TfrmActiveClientsSearch.Add;
begin

end;

procedure TfrmActiveClientsSearch.Cancel;
begin

end;

procedure TfrmActiveClientsSearch.FormCreate(Sender: TObject);
begin
  // set parameters
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@filter_type').Value := 1;
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@non_clients').Value := 0;

  inherited;
end;

end.
