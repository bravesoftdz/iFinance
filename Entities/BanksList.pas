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
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    grBranches: TRzDBGrid;
    btnNew: TRzButton;
    JvLabel1: TJvLabel;
    edBankName: TRzDBEdit;
    mmBranch: TRzDBMemo;
    JvLabel3: TJvLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
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
  AuxData, FormsUtil, StatusIntf;

procedure TfrmBanksList.btnNewClick(Sender: TObject);
begin
  inherited;
  grBranches.DataSource.DataSet.Append;
end;

procedure TfrmBanksList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OpenDropdownDataSources(tsDetail,false);
  OpenGridDataSources(pnlList,false);

  dmAux.Free;

  inherited;
end;

procedure TfrmBanksList.FormShow(Sender: TObject);
begin
  inherited;
  dmAux := TdmAux.Create(self);

  OpenDropdownDataSources(tsDetail);
  OpenGridDataSources(pnlList);
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
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(mmBranch.Text) = '' then
    begin
      error := 'Please enter branch.';
      st.ShowError(error);
    end;
  end;

  Result := error = '';
end;

end.
