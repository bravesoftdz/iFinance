unit EmployerList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls,
  JvLabel, Vcl.Imaging.pngimage, RzCmboBx;

type
  TfrmEmployerList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbluGroup: TRzDBLookupComboBox;
    edEmployerName: TRzDBEdit;
    JvLabel3: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    cmbBranch: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbBranchChange(Sender: TObject);
  private
    { Private declarations }
    procedure FilterList;
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  end;

var
  frmEmployerList: TfrmEmployerList;

implementation

{$R *.dfm}

uses
  EntitiesData, IFinanceDialogs, FormsUtil;

procedure TfrmEmployerList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEntities.Free;
  inherited;
end;

procedure TfrmEmployerList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  PopulateBranchComboBox(cmbBranch);
  inherited;
end;

procedure TfrmEmployerList.FilterList;
var
  filterStr: string;
begin
  if cmbBranch.ItemIndex > -1 then
    filterStr := 'loc_code = ''' + cmbBranch.Value + ''''
  else
    filterStr := '';

  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmEmployerList.cmbBranchChange(Sender: TObject);
begin
  inherited;
  FilterList;
end;

function TfrmEmployerList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edEmployerName.Text) = '' then error := 'Please enter an employer name.'
  else if Trim(dbluGroup.Text) = '' then error := 'Please select a group.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmEmployerList.SearchList;
begin
  grList.DataSource.DataSet.Locate('emp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
