unit EmployerSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmEmployerSearch = class(TfrmBaseSearch)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmEmployerSearch: TfrmEmployerSearch;

implementation

{$R *.dfm}

uses
  EntitiesData, Employer;

procedure TfrmEmployerSearch.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  inherited;
end;

procedure TfrmEmployerSearch.SearchList;
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

procedure TfrmEmployerSearch.SetReturn;
begin
  with dmEntities.dstEmployers do
  begin
    emp.Id := FieldByName('emp_id').AsString;
    emp.Name := FieldByName('emp_name').AsString;
    emp.Address := FieldByName('emp_add').AsString;
    emp.GroupId := FieldByName('grp_id').AsInteger;
  end;
end;

procedure TfrmEmployerSearch.Add;
begin
  // no need to implement.. this is implemented in a different window
end;

procedure TfrmEmployerSearch.Cancel;
begin
  emp.Destroy;
end;

end.
