unit GroupList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel,
  RzDBEdit;

type
  TfrmGroupList = class(TfrmBaseGridDetail)
    edGroupName: TRzDBEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  public
    { Public declarations }
  end;

var
  frmGroupList: TfrmGroupList;

implementation

{$R *.dfm}

uses
  EntitiesData, StatusIntf, FormsUtil;

procedure TfrmGroupList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEntities.Free;
  inherited;
end;

procedure TfrmGroupList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  inherited;
end;

procedure TfrmGroupList.SearchList;
begin
  grList.DataSource.DataSet.Locate('grp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

function TfrmGroupList.EntryIsValid: boolean;
var
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(edGroupName.Text) = '' then
    begin
      error := 'Please enter a group name.';
      st.ShowError(error);
    end;
  end;

  Result := error = '';
end;

end.
