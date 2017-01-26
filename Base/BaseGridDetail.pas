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
    pnlSave: TRzPanel;
    pnlCancel: TRzPanel;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    sbtnNew: TRzShapeButton;
    sbtnSave: TRzShapeButton;
    sbtnCancel: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
    procedure sbtnSaveClick(Sender: TObject);
    procedure sbtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallErrorBox(const error: string);
    procedure ShowConfirmation;
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
  FormsUtil, ConfBox, ErrorBox;

procedure TfrmBaseGridDetail.edSearchKeyChange(Sender: TObject);
begin
  inherited;
  SearchList;
end;

procedure TfrmBaseGridDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
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
  OpenDropdownDataSources(pnlDetail);
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

procedure TfrmBaseGridDetail.sbtnCancelClick(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfrmBaseGridDetail.sbtnNewClick(Sender: TObject);
begin
  inherited;
  grList.DataSource.DataSet.Append;
end;

procedure TfrmBaseGridDetail.sbtnSaveClick(Sender: TObject);
begin
  inherited;
  try
    if Save then ShowConfirmation;
  except
  on e: Exception do
    CallErrorBox(e.Message);
  end;
end;

procedure TfrmBaseGridDetail.Cancel;
begin
  grList.DataSource.DataSet.Cancel;
end;

procedure TfrmBaseGridDetail.CallErrorBox(const error: string);
begin
  with TfrmErrorBox.Create(self,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmBaseGridDetail.ShowConfirmation;
const
  conf = 'Record has been saved successfully.';
begin
  with TfrmConfBox.Create(self,conf) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
