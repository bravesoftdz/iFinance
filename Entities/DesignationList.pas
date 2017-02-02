unit DesignationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzDBEdit, JvExControls, JvLabel;

type
  TfrmDesignationList = class(TfrmBaseGridDetail)
    edDesignation: TRzDBEdit;
    JvLabel1: TJvLabel;
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
  frmDesignationList: TfrmDesignationList;

implementation

{$R *.dfm}

uses
  AuxData, IFinanceDialogs;

function TfrmDesignationList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edDesignation.Text) = '' then error := 'Please enter designation.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmDesignationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Free;

  inherited;
end;

procedure TfrmDesignationList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);
  inherited;
end;

procedure TfrmDesignationList.SearchList;
begin
  grList.DataSource.DataSet.Locate('designation',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
