unit PurposeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit;

type
  TfrmPurposeList = class(TfrmBaseGridDetail)
    edPurpose: TRzDBEdit;
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

procedure TfrmPurposeList.BindToObject;
begin
  inherited;

end;

function TfrmPurposeList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmPurposeList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edPurpose.Text) = '' then error := 'Please enter purpose.';

  if error <> '' then ShowErrorBox(error);
  
  Result := error = '';
end;

procedure TfrmPurposeList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmAux.Free;

  inherited;
end;

procedure TfrmPurposeList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);

  inherited;
end;

function TfrmPurposeList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmPurposeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('purpose',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;


end.
