unit LandlordSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, ADODB, System.Rtti, RzButton;

type
  TfrmLandlordSearch = class(TfrmBaseSearch)
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
  frmLandlordSearch: TfrmLandlordSearch;

implementation

{$R *.dfm}

uses
  Landlord, EntitiesData, LandlordDetail, AppConstants;

{ TfrmLandlordSearch }

procedure TfrmLandlordSearch.Add;
begin
  inherited;
  with TfrmLandlordDetail.Create(self), grSearch.DataSource.DataSet do
  begin
    llord.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      DisableControls;
      Close;
      Open;
      Locate('entity_id',llord.Id,[]);
      EnableControls;
    end;
  end;
end;

procedure TfrmLandlordSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@entity_type').Value :=
        TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.LL);
  inherited;
end;

procedure TfrmLandlordSearch.SearchList;
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

procedure TfrmLandlordSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    llord.Id := FieldByName('entity_id').AsString;
    llord.Name := FieldByName('name').AsString;;
    llord.Mobile := FieldByName('mobile_no').AsString;
    llord.Telephone := FieldByName('home_phone').AsString;
  end;
end;

procedure TfrmLandlordSearch.Cancel;
begin
  llord.Destroy;
end;

end.

