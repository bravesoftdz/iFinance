unit LoanList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, LoanListIntf, DockedFormIntf, AppConstants, ADODB, System.Rtti;

type
  TfrmLoanList = class(TfrmBaseDocked, ILoanListFilter, IDockedForm)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    procedure grListDblClick(Sender: TObject);
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
  AppData, FormsUtil, Loan, DockIntf, LoanClient;

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
begin
  with  grList.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      id := FieldByName('loan_id').AsString;

      ln := TLoan.Create;
      ln.Id := id;
      ln.Client := TLoanClient.Create(FieldByName('entity_id').AsString,
                        FieldByName('name').AsString);
      ln.Status := FieldByName('status_id').AsString;

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
