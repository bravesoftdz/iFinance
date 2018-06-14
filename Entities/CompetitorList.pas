unit CompetitorList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzDBEdit, JvExControls, JvLabel, RzCmboBx;

type
  TfrmCompetitorList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edCompName: TRzDBEdit;
    cmbBranch: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmbBranchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure FilterList;
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  end;

var
  frmCompetitorList: TfrmCompetitorList;

implementation

{$R *.dfm}

uses
  AuxData, IFinanceDialogs, FormsUtil;

procedure TfrmCompetitorList.BindToObject;
begin
  inherited;

end;

procedure TfrmCompetitorList.cmbBranchChange(Sender: TObject);
begin
  inherited;
  FilterList;
end;

function TfrmCompetitorList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmCompetitorList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edCompName.Text) = '' then error := 'Please enter name.';

  if error <> '' then ShowErrorBox(error);
  
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

  PopulateBranchComboBox(cmbBranch);

  inherited;
end;

procedure TfrmCompetitorList.FormShow(Sender: TObject);
begin
  inherited;
  FilterList;
end;

function TfrmCompetitorList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmCompetitorList.SearchList;
begin
  grList.DataSource.DataSet.Locate('comp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmCompetitorList.FilterList;
var
  filterStr: string;
begin
  if cmbBranch.ItemIndex > -1 then
    filterStr := 'loc_code = ''' + cmbBranch.Value + ''''
  else
    filterStr := '';

  grList.DataSource.DataSet.Filter := filterStr;
end;

end.
