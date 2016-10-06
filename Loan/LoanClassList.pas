unit LoanClassList;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Data.DB, RzButton, RzRadChk, RzDBChk,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzDBEdit, JvExControls, JvLabel,
  RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLstBox, System.UITypes,
  SaveIntf, Vcl.Forms;

type
  TfrmLoanClassList = class(TfrmBaseDocked,ISave)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edClassName: TRzDBEdit;
    dbluType: TRzDBLookupComboBox;
    btnNew: TRzButton;
    lbxGroups: TRzListBox;
    urlCopyAddress: TRzURLLabel;
    JvLabel3: TJvLabel;
    edInterest: TRzDBEdit;
    JvLabel4: TJvLabel;
    edTerm: TRzDBEdit;
    JvLabel5: TJvLabel;
    dteValidFrom: TRzDBDateTimeEdit;
    JvLabel6: TJvLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    lbxBranches: TRzListBox;
    RzURLLabel1: TRzURLLabel;
    JvLabel7: TJvLabel;
    urlLoanClassList: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure urlLoanClassListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Save: boolean;
    function EntryIsValid: boolean;
    procedure Cancel;
  end;

var
  frmLoanClassList: TfrmLoanClassList;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  LoansAuxData, FormsUtil, StatusIntf;

procedure TfrmLoanClassList.btnNewClick(Sender: TObject);
begin
  inherited;
  grList.DataSource.DataSet.Append;
end;

procedure TfrmLoanClassList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenGridDataSources(pnlList,false);
  OpenDropdownDataSources(tsDetail,false);

  dmLoansAux.Free;

  inherited;
end;

procedure TfrmLoanClassList.FormCreate(Sender: TObject);
begin
  inherited;
  dmLoansAux := TdmLoansAux.Create(self);

  OpenGridDataSources(pnlList);
  OpenDropdownDataSources(tsDetail);
end;

function TfrmLoanClassList.Save: boolean;
begin
  Result := false;
  with grList.DataSource.DataSet do
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

procedure TfrmLoanClassList.urlLoanClassListClick(Sender: TObject);
begin
  with grList.DataSource.DataSet do
  begin
    Close;
    Open;
  end
end;

procedure TfrmLoanClassList.Cancel;
begin
  with grList.DataSource.DataSet do
  begin
    if State in [dsInsert,dsEdit] then
      Cancel;
  end;
end;

function TfrmLoanClassList.EntryIsValid: boolean;
var
  st: IStatus;
  error: string;
begin
  if Supports(Application.MainForm,IStatus,st) then
  begin
    if Trim(edClassName.Text) = '' then
    begin
      error := 'Please enter class name.';
      st.ShowError(error);
    end
    else if dbluType.Text = '' then
    begin
      error := 'Please select type.';
      st.ShowError(error);
    end
    else if edInterest.Text = '' then
    begin
      error := 'Please enter interest rate.';
      st.ShowError(error);
    end
    else if edTerm.Text = '' then
    begin
      error := 'Please enter term.';
      st.ShowError(error);
    end
    else if dteValidFrom.Text = '' then
    begin
      error := 'Please enter valid from date.';
      st.ShowError(error);
    end;

  end;

  Result := error = '';
end;

end.
