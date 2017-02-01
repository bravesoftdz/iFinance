unit PurposeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, JvExControls, JvLabel;

type
  TfrmPurposeList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edPurpose: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  end;

var
  frmPurposeList: TfrmPurposeList;

implementation

{$R *.dfm}

uses
  AuxData, StatusIntf;

function TfrmPurposeList.EntryIsValid: boolean;
var
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(edPurpose.Text) = '' then
    begin
      error := 'Please enter purpose.';
      st.ShowError(error);
    end;
  end;

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

procedure TfrmPurposeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('purpose',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;


end.
