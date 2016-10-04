unit LoanClassList;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Data.DB, RzButton, RzRadChk, RzDBChk,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzDBEdit, JvExControls, JvLabel,
  RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLstBox, System.UITypes;

type
  TfrmLoanClassList = class(TfrmBaseDocked)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    edClassName: TRzDBEdit;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    btnNew: TRzButton;
    RzListBox1: TRzListBox;
    urlCopyAddress: TRzURLLabel;
    JvLabel3: TJvLabel;
    RzDBEdit1: TRzDBEdit;
    JvLabel4: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    JvLabel5: TJvLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    JvLabel6: TJvLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    RzListBox2: TRzListBox;
    RzURLLabel1: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoanClassList: TfrmLoanClassList;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  LoansAuxData, FormsUtil;

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

end.
