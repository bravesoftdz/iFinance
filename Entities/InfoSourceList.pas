unit InfoSourceList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit;

type
  TfrmInfoSourceList = class(TfrmBaseGridDetail)
    edSource: TRzDBEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  end;

implementation

{$R *.dfm}

uses
  AuxData, IFinanceDialogs;

{ TfrmInfoSourceList }

procedure TfrmInfoSourceList.BindToObject;
begin
  inherited;

end;

function TfrmInfoSourceList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmInfoSourceList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edSource.Text) = '' then error := 'Please enter source.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmInfoSourceList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Free;

  inherited;
end;

procedure TfrmInfoSourceList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);

  inherited;
end;

function TfrmInfoSourceList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmInfoSourceList.SearchList;
begin
  grList.DataSource.DataSet.Locate('source_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
