unit ReferenceSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

type
  TfrmReferenceSearch = class(TfrmBaseSearch)
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
  frmReferenceSearch: TfrmReferenceSearch;

implementation

{$R *.dfm}

uses
  RefData, Reference, ReferenceDetail;

procedure TfrmReferenceSearch.SearchList;
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

procedure TfrmReferenceSearch.SetReturn;
var
  id, firstname, lastname, middlename: string;
begin
  with grSearch.DataSource.DataSet do
  begin
    id := FieldByName('entity_id').AsString;
    firstname := FieldByName('firstname').AsString;
    lastname := FieldByName('lastname').AsString;
    middlename := FieldByName('middlename').AsString;

    refc := TReference.Create(id,firstname,lastname,middlename);
  end;
end;

procedure TfrmReferenceSearch.Add;
begin
  with TfrmReferenceDetail.Create(self) do
  begin
    refc := TReference.Create;

    refc.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      with grSearch.DataSource.DataSet do
      begin
        DisableControls;
        Close;
        Open;
        Locate('entity_id',refc.Id,[]);
        EnableControls;
      end;
    end;

    refc.Free;
  end;
end;

procedure TfrmReferenceSearch.Cancel;
begin

end;

end.
