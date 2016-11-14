unit CompetitorList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzDBEdit, JvExControls, JvLabel;

type
  TfrmCompetitorList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edCompName: TRzDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  end;

var
  frmCompetitorList: TfrmCompetitorList;

implementation

{$R *.dfm}

uses
  AuxData, StatusIntf;

function TfrmCompetitorList.EntryIsValid: boolean;
var
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(edCompName.Text) = '' then
    begin
      error := 'Please enter name.';
      st.ShowError(error);
    end;
  end;

  Result := error = '';
end;

procedure TfrmCompetitorList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Free;

  inherited;
end;

procedure TfrmCompetitorList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);

  inherited;
end;

procedure TfrmCompetitorList.SearchList;
begin
  grList.DataSource.DataSet.Locate('comp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
