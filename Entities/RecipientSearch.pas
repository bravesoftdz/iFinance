unit RecipientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, System.Rtti, ADODB;

type
  TfrmRecipientSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    { Protected declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmRecipientSearch: TfrmRecipientSearch;

implementation

uses
  EntitiesData, Recipient, AppConstants;

{$R *.dfm}

procedure TfrmRecipientSearch.SearchList;
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

procedure TfrmRecipientSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    rcp.Id := FieldByName('entity_id').AsString;
    rcp.Name := FieldByName('name').AsString;;
  end;
end;

procedure TfrmRecipientSearch.Add;
begin

end;

procedure TfrmRecipientSearch.Cancel;
begin

end;

procedure TfrmRecipientSearch.FormCreate(Sender: TObject);
begin
  inherited;
  dmEntities := TdmEntities.Create(self);
  (grSearch.DataSource.DataSet as TADODataSet).Parameters.ParamByName('@entity_type').Value :=
        TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.RP);
  inherited;
end;

end.
