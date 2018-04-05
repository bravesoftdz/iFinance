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
    pnlDockMain: TRzPanel;
    urlPending: TRzURLLabel;
    urlAssessed: TRzURLLabel;
    urlApproved: TRzURLLabel;
    urlActive: TRzURLLabel;
    urlCancelled: TRzURLLabel;
    urlRejected: TRzURLLabel;
    urlClosed: TRzURLLabel;
    procedure grListDblClick(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure urlPendingClick(Sender: TObject);
    procedure urlAssessedClick(Sender: TObject);
    procedure urlApprovedClick(Sender: TObject);
    procedure urlActiveClick(Sender: TObject);
    procedure urlCancelledClick(Sender: TObject);
    procedure urlRejectedClick(Sender: TObject);
    procedure urlClosedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FilterList(const filterType: TLoanFilterType);
    procedure SetTitle(const title: string);
  end;

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
                        FieldByName('emp_add').AsString,nil);

      id := FieldByName('loan_id').AsString;

      ln := TLoan.Create;
      ln.Id := id;
      ln.Client := TLoanClient.Create(FieldByName('entity_id').AsString,
                        FieldByName('name').AsString, empl,
                        FieldByName('client_addr').AsString,
                        FieldByName('age').AsInteger,
                        FieldByName('net_pay').AsCurrency,
                        FieldByName('valid_ident_docs').AsInteger);
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

procedure TfrmLoanList.urlActiveClick(Sender: TObject);
begin
  inherited;
  FilterList(lftActive);
  SetTitle('Active loans');
end;

procedure TfrmLoanList.urlApprovedClick(Sender: TObject);
begin
  inherited;
  FilterList(lftApproved);
  SetTitle('Approved loans');
end;

procedure TfrmLoanList.urlAssessedClick(Sender: TObject);
begin
  inherited;
  FilterList(lftAssessed);
  SetTitle('Assessed loans');
end;

procedure TfrmLoanList.urlCancelledClick(Sender: TObject);
begin
  inherited;
  FilterList(lftCancelled);
  SetTitle('Cancelled loans');
end;

procedure TfrmLoanList.urlClosedClick(Sender: TObject);
begin
  inherited;
  FilterList(lftClosed);
  SetTitle('Closed loans');
end;

procedure TfrmLoanList.urlPendingClick(Sender: TObject);
begin
  inherited;
  FilterList(lftPending);
  SetTitle('Pending loans');
end;

procedure TfrmLoanList.urlRejectedClick(Sender: TObject);
begin
  inherited;
  FilterList(lftRejected);
  SetTitle('Rejected loans');
end;

end.
