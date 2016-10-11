unit LoanClassificationList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, RzButton, RzRadChk,
  RzDBChk, Vcl.DBCtrls, RzDBCmbo, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  JvExControls, JvLabel, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, SaveIntf;

type
  TfrmLoanClassificationList = class(TfrmBaseDocked,ISave)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edClassName: TRzDBEdit;
    dbluType: TRzDBLookupComboBox;
    btnNew: TRzButton;
    JvLabel3: TJvLabel;
    edInterest: TRzDBEdit;
    JvLabel4: TJvLabel;
    edTerm: TRzDBEdit;
    JvLabel5: TJvLabel;
    edComakers: TRzDBEdit;
    RzPageControl1: TRzPageControl;
    tsGroups: TRzTabSheet;
    tsBranches: TRzTabSheet;
    grGroups: TRzDBGrid;
    urlRefreshList: TRzURLLabel;
    urlClassGroup: TRzURLLabel;
    procedure btnNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure urlRefreshListClick(Sender: TObject);
    procedure urlClassGroupClick(Sender: TObject);
  private
    { Private declarations }
    function EntryIsValid: boolean;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmLoanClassificationList: TfrmLoanClassificationList;

implementation

{$R *.dfm}

uses
  LoansAuxData, FormsUtil, StatusIntf, ClassGroup;

procedure TfrmLoanClassificationList.btnNewClick(Sender: TObject);
begin
  inherited;
  grList.DataSource.DataSet.Append;
end;

function TfrmLoanClassificationList.Save: boolean;
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

procedure TfrmLoanClassificationList.urlClassGroupClick(Sender: TObject);
begin
  inherited;
  with TfrmClassGroup.Create(self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmLoanClassificationList.urlRefreshListClick(Sender: TObject);
begin
  inherited;
  with grList.DataSource.DataSet do
  begin
    Close;
    Open;
  end
end;

procedure TfrmLoanClassificationList.Cancel;
begin
  with grList.DataSource.DataSet do
  begin
    if State in [dsInsert,dsEdit] then
      Cancel;
  end;
end;

function TfrmLoanClassificationList.EntryIsValid: boolean;
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

  end;

  Result := error = '';
end;

procedure TfrmLoanClassificationList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmLoansAux.Free;
end;

procedure TfrmLoanClassificationList.FormCreate(Sender: TObject);
begin
  inherited;
  dmLoansAux := TdmLoansAux.Create(self);
end;

end.
