unit RefereeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, System.Rtti, ADODB, RzButton;

type
  TfrmRefereeSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmRefereeSearch: TfrmRefereeSearch;

implementation

uses
  EntitiesData, Referee, AppConstants, RefereeDetail;

{$R *.dfm}

procedure TfrmRefereeSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@entity_type').Value :=
        TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.CL);
  inherited;
end;

procedure TfrmRefereeSearch.SearchList;
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

procedure TfrmRefereeSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    ref.Id := FieldByName('entity_id').AsString;
    ref.Name := FieldByName('name').AsString;;
  end;
end;

procedure TfrmRefereeSearch.Add;
begin
  with TfrmRefereeDetail.Create(self), grSearch.DataSource.DataSet do
  begin
    ref.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      DisableControls;
      Close;
      Open;
      Locate('entity_id',ref.Id,[]);
      EnableControls;
    end;
  end;
end;

procedure TfrmRefereeSearch.Cancel;
begin
  ref.Destroy;
end;

end.
