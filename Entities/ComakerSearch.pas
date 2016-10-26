unit ComakerSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmComakerSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmComakerSearch: TfrmComakerSearch;

implementation

{$R *.dfm}

uses
  EntitiesData, Comaker;

procedure TfrmComakerSearch.SearchList;
var
  filter: string;
begin
  inherited;
  if Trim(edSearchKey.Text) <> '' then
    filter := 'name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grSearch.DataSource.DataSet.Filter := filter;
end;

procedure TfrmComakerSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
    cm := TComaker.Create(FieldByName('entity_id').AsString);
end;

procedure TfrmComakerSearch.Add;
begin

end;

procedure TfrmComakerSearch.Cancel;
begin

end;

procedure TfrmComakerSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  inherited;
end;

end.
