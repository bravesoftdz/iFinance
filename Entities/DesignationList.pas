unit DesignationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzDBEdit;

type
  TfrmDesignationList = class(TfrmBaseGridDetail)
    edDesignation: TRzDBEdit;
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

procedure TfrmDesignationList.BindToObject;
begin
  inherited;

end;

function TfrmDesignationList.EditIsAllowed: boolean;
begin
  Result := true;
end;

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

function TfrmDesignationList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmDesignationList.SearchList;
begin
  grList.DataSource.DataSet.Locate('designation',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
