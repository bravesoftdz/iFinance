unit EmployerList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, JvImageList, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls,
  JvLabel;

type
  TfrmEmployerList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    edEmployerName: TRzDBEdit;
    JvLabel3: TJvLabel;
    RzDBMemo1: TRzDBMemo;
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
  frmEmployerList: TfrmEmployerList;

implementation

{$R *.dfm}

uses
  EntitiesData, StatusIntf, FormsUtil;

procedure TfrmEmployerList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEntities.Free;
  inherited;
end;

procedure TfrmEmployerList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);
  inherited;
end;

function TfrmEmployerList.EntryIsValid: boolean;
var
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(edEmployerName.Text) = '' then
    begin
      error := 'Please enter an employee name.';
      st.ShowError(error);
    end;
  end;

  Result := error = '';
end;

procedure TfrmEmployerList.SearchList;
begin
  grList.DataSource.DataSet.Locate('emp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
