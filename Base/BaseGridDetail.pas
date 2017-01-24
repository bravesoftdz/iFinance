unit BaseGridDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, System.ImageList, Vcl.ImgList, JvImageList,
  SaveIntf, JvExControls, JvSpeedButton, Vcl.Imaging.pngimage;

type
  TfrmBaseGridDetail = class(TfrmBaseDocked,ISave)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    btnNew: TRzButton;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    imgAdd: TImage;
    pnlSave: TRzPanel;
    imgSave: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgAddClick(Sender: TObject);
    procedure imgSaveClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure imgAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  protected
    procedure SearchList; virtual; abstract;
    function EntryIsValid: boolean; virtual; abstract;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmBaseGridDetail: TfrmBaseGridDetail;

implementation

{$R *.dfm}

uses
  FormsUtil;

procedure TfrmBaseGridDetail.edSearchKeyChange(Sender: TObject);
begin
  inherited;
  SearchList;
end;

procedure TfrmBaseGridDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(tsDetail,false);
  OpenGridDataSources(pnlList,false);
  inherited;
end;

procedure TfrmBaseGridDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(pnlList);
end;

procedure TfrmBaseGridDetail.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsDetail);
end;

procedure TfrmBaseGridDetail.imgAddClick(Sender: TObject);
begin
  inherited;
  grList.DataSource.DataSet.Append;
end;

procedure TfrmBaseGridDetail.imgAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonDown(Sender);
end;

procedure TfrmBaseGridDetail.imgAddMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonUp(Sender);
end;

procedure TfrmBaseGridDetail.imgCancelClick(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfrmBaseGridDetail.imgSaveClick(Sender: TObject);
begin
  inherited;
  Save;
end;

function TfrmBaseGridDetail.Save: boolean;
begin
  Result := false;
  with grList.DataSource.DataSet do
  begin
    if State in [dsInsert,dsEdit] then
      if EntryIsValid then
      begin
        grList.DataSource.DataSet.Post;
        Result := true;
      end
  end;
end;

procedure TfrmBaseGridDetail.Cancel;
begin
  grList.DataSource.DataSet.Cancel;
end;

end.
