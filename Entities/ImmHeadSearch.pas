unit ImmHeadSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, Vcl.Mask, RzEdit, RzLabel, Vcl.Imaging.pngimage, RzPanel, Data.DB,
  Vcl.StdCtrls, ADODB, System.Rtti, RzButton;

type
  TfrmImmHeadSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmImmHeadSearch: TfrmImmHeadSearch;

implementation

{$R *.dfm}

{ TfrmImmHeadSearch }

uses
  EntitiesData, ImmediateHead, ImmHeadDetail, AppConstants;

procedure TfrmImmHeadSearch.Add;
begin
  with TfrmImmHeadDetail.Create(self), grSearch.DataSource.DataSet do
  begin
    immHead.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      DisableControls;
      Close;
      Open;
      Locate('entity_id',immHead.Id,[]);
      EnableControls;
    end;
  end;
end;

procedure TfrmImmHeadSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@entity_type').Value :=
        TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.IH);
  inherited;
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

procedure TfrmImmHeadSearch.Cancel;
begin
  immHead.Destroy;
end;

end.
