unit BanksSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmBankSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

var
  frmBankSearch: TfrmBankSearch;

implementation

{$R *.dfm}

uses
  AuxData, Bank;

procedure TfrmBankSearch.SearchList;
var
  filter: string;
begin
  inherited;
  if Trim(edSearchKey.Text) <> '' then
    filter := 'bank_name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grSearch.DataSource.DataSet.Filter := filter;
end;

procedure TfrmBankSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    bnk.Id := FieldByName('bank_id').AsString;
    bnk.BankName := FieldByName('bank_name').AsString;
    bnk.BankCode := FieldByName('bank_code').AsString;
    bnk.Branch := FieldByName('branch').AsString;
  end;
end;

procedure TfrmBankSearch.Add;
begin

end;

procedure TfrmBankSearch.Cancel;
begin
  bnk.Destroy;
end;


end.
