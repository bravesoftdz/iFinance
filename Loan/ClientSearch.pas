unit ClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmClientSearch = class(TfrmBaseSearch)
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
  frmClientSearch: TfrmClientSearch;

implementation

{$R *.dfm}

uses
  LoanData, LoanClient;

procedure TfrmClientSearch.Add;
begin

end;

procedure TfrmClientSearch.SearchList;
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

procedure TfrmClientSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    lnc := TLoanClient.Create;
    lnc.Id := FieldByName('entity_id').AsString;
    lnc.Name := FieldByName('name').AsString;;
  end;
end;

procedure TfrmClientSearch.Cancel;
begin

end;

end.
