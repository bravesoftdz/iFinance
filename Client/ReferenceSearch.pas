unit ReferenceSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

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
  RefData, Reference;

procedure TfrmReferenceSearch.SearchList;
begin
  grSearch.DataSource.DataSet.Locate('name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
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

end;

procedure TfrmReferenceSearch.Cancel;
begin

end;

end.
