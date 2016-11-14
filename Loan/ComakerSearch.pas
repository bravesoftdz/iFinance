unit ComakerSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmComakerSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmComakerSearch: TfrmComakerSearch;

implementation

{$R *.dfm}

uses
  LoanData, Comaker, ComakerDetail;

procedure TfrmComakerSearch.SearchList;
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

procedure TfrmComakerSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    cm.ID := (FieldByName('entity_id').AsString);
    cm.Name := FieldByName('name').AsString;
    cm.ComakeredLoans := FieldByName('comakered_loans').AsInteger;
  end;
end;

procedure TfrmComakerSearch.Add;
begin
  with TfrmComakerDetail.Create(self), grSearch.DataSource.DataSet do
  begin
    cm.Add;

    ShowModal;

    if ModalResult = mrOK then
    begin
      // refresh the grid
      DisableControls;
      Close;
      Open;
      EnableControls;
    end;
  end;
end;

procedure TfrmComakerSearch.Cancel;
begin

end;

end.
