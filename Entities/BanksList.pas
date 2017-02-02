unit BanksList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzTabs, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, RzLabel, Vcl.ExtCtrls, RzPanel, RzButton,
  Vcl.DBCtrls, RzDBEdit, Vcl.Mask, RzEdit, JvExControls, JvLabel, SaveIntf;

type
  TfrmBanksList = class(TfrmBaseDocked, ISave)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    grBranches: TRzDBGrid;
    JvLabel1: TJvLabel;
    edBankName: TRzDBEdit;
    mmBranch: TRzDBMemo;
    JvLabel3: TJvLabel;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    pnlBranches: TRzPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
  private
    { Private declarations }
    function EntryIsValid: boolean;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmBanksList: TfrmBanksList;

implementation

{$R *.dfm}

uses
  AuxData, FormsUtil, IFinanceDialogs;

procedure TfrmBanksList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);
  OpenGridDataSources(pnlBranches,false);

  dmAux.Free;

  inherited;
end;

procedure TfrmBanksList.FormShow(Sender: TObject);
begin
  inherited;
  dmAux := TdmAux.Create(self);

  OpenDropdownDataSources(pnlDetail);
  OpenGridDataSources(pnlList);
  OpenGridDataSources(pnlBranches);
end;

function TfrmBanksList.Save: boolean;
begin
  Result := false;
  with grBranches.DataSource.DataSet do
  begin
    if EntryIsValid then
    begin
      if State in [dsInsert,dsEdit] then
      begin
        Post;
        Result := true;
      end;
    end
  end;
end;

procedure TfrmBanksList.sbtnNewClick(Sender: TObject);
begin
  inherited;
  grBranches.DataSource.DataSet.Append;
end;

procedure TfrmBanksList.Cancel;
begin
  with grBranches.DataSource.DataSet do
  begin
  if State in [dsInsert,dsEdit] then
    Cancel;
  end;
end;

function TfrmBanksList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(mmBranch.Text) = '' then error := 'Please enter branch.';

  if error <> '' then ShowErrorBox(error);


  Result := error = '';
end;

end.
