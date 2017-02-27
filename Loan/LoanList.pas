unit LoanList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, LoanListIntf, DockedFormIntf, AppConstants, ADODB, System.Rtti,
  Vcl.DBCtrls, RzDBCmbo, RzButton, RzRadChk, RzDBChk, RzDBEdit, JvExControls,
  JvLabel, RzCmboBx;

type
  TfrmLoanList = class(TfrmBaseDocked, ILoanListFilter, IDockedForm)
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    JvLabel1: TJvLabel;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    cmbBranch: TRzComboBox;
    procedure grListDblClick(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FilterList(const filterType: TLoanFilterType);
    procedure SetTitle(const title: string);
  end;

var
  frmLoanList: TfrmLoanList;

implementation

{$R *.dfm}

uses
  AppData, FormsUtil, Loan, DockIntf, LoanClient, Employer;

procedure TfrmLoanList.edSearchKeyChange(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if Trim(edSearchKey.Text) <> '' then
    filter := 'name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grList.DataSource.DataSet.Filter := filter;
end;

procedure TfrmLoanList.FilterList(const filterType: TLoanFilterType);
begin
  with (grList.DataSource.DataSet as TADODataSet).Parameters do
    ParamByName('@filter_type').Value := filterType;

  OpenGridDataSources(pnlList);
end;

procedure TfrmLoanList.grListDblClick(Sender: TObject);
var
  id: string;
  intf: IDock;
  empl: TEmployer;
begin
  with  grList.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      empl := TEmployer.Create(FieldByName('emp_id').AsString,
                        FieldByName('emp_name').AsString,
                        FieldByName('grp_id').AsString,
                        FieldByName('emp_add').AsString);

      id := FieldByName('loan_id').AsString;

      ln := TLoan.Create;
      ln.Id := id;
      ln.Client := TLoanClient.Create(FieldByName('entity_id').AsString,
                        FieldByName('name').AsString, empl,
                        FieldByName('client_addr').AsString);
      ln.Status := FieldByName('status_id').AsString;
      ln.Action := laNone;

      if Supports(Application.MainForm,IDock,intf) then
        intf.DockForm(fmLoanMain);
    end;
  end;
end;

procedure TfrmLoanList.SetTitle(const title: string);
begin
  lblTitle.Caption := title;
end;

end.
