unit ImmHeadSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, Vcl.Mask, RzEdit, RzLabel, Vcl.Imaging.pngimage, RzPanel, Data.DB,
  Vcl.StdCtrls;

type
  TfrmImmHeadSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
  protected
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
  public
    { Public declarations }
  end;

var
  frmImmHeadSearch: TfrmImmHeadSearch;

implementation

{$R *.dfm}

{ TfrmImmHeadSearch }

uses
  EntitiesData, ImmediateHead, ImmHeadDetail;

procedure TfrmImmHeadSearch.Add;
begin
  with TfrmImmHeadDetail.Create(self) do
  begin
    immHead.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      grSearch.DataSource.DataSet.Close;
      grSearch.DataSource.DataSet.Open;
    end;
  end;
end;

procedure TfrmImmHeadSearch.SearchList;
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

procedure TfrmImmHeadSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    immHead.Id := FieldByName('entity_id').AsString;
    immHead.Name := FieldByName('name').AsString;;
  end;
end;

end.
