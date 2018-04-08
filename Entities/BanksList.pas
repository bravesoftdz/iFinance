unit BanksList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzTabs, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, RzLabel, Vcl.ExtCtrls, RzPanel, RzButton,
  Vcl.DBCtrls, RzDBEdit, Vcl.Mask, RzEdit, JvExControls, JvLabel, SaveIntf, NewIntf,
  RzCmboBx;

type
  TfrmBanksList = class(TfrmBaseDocked, ISave, INew)
    JvLabel1: TJvLabel;
    mmBranch: TRzDBMemo;
    JvLabel3: TJvLabel;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    pnlList: TRzPanel;
    grBranches: TRzDBGrid;
    Label1: TLabel;
    cmbBanks: TRzComboBox;
    edBankName: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
    procedure cmbBanksClick(Sender: TObject);
  private
    { Private declarations }
    function EntryIsValid: boolean;
    procedure FilterBranchList;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
    procedure New;
  end;

implementation

{$R *.dfm}

uses
  AuxData, FormsUtil, IFinanceDialogs;

procedure TfrmBanksList.FilterBranchList;
begin
  grBranches.DataSource.DataSet.Filter := 'bank_code = ' + QuotedStr(cmbBanks.Value);
  edBankName.Text := cmbBanks.Text;
end;

procedure TfrmBanksList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);

  dmAux.Free;

  inherited;
end;

procedure TfrmBanksList.FormShow(Sender: TObject);
begin
  inherited;
  dmAux := TdmAux.Create(self);

  PopulateComboBox(dmAux.dstBanks,cmbBanks,'bank_code','bank_name',true);

  OpenDropdownDataSources(pnlDetail);
  OpenGridDataSources(pnlList);

  cmbBanks.ItemIndex := 0;
  FilterBranchList;
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
  New;
end;

procedure TfrmBanksList.Cancel;
begin
  with grBranches.DataSource.DataSet do
  begin
  if State in [dsInsert,dsEdit] then
    Cancel;
  end;
end;

procedure TfrmBanksList.New;
begin
  with grBranches.DataSource.DataSet do
  begin
    Append;
    FieldByName('bank_code').AsString := cmbBanks.Value;
  end;

  mmBranch.SetFocus;
end;

procedure TfrmBanksList.cmbBanksClick(Sender: TObject);
begin
  inherited;
  FilterBranchList;
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
