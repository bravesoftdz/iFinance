unit ClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

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
  LoanData, LoanClient, Employer;

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
var
  empl: TEmployer;
begin
  with grSearch.DataSource.DataSet do
  begin
    empl := TEmployer.Create(FieldByName('emp_id').AsString,
                        FieldByName('emp_name').AsString,
                        FieldByName('grp_id').AsInteger,
                        FieldByName('emp_add').AsString);

    lnc := TLoanClient.Create;
    lnc.Id := FieldByName('entity_id').AsString;
    lnc.Name := FieldByName('name').AsString;
    lnc.Employer := empl;
    lnc.Address := FieldByName('client_addr').AsString;
  end;
end;

procedure TfrmClientSearch.Cancel;
begin

end;

end.
