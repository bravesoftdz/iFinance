unit LoanList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, LoanListIntf, DockedFormIntf;

type
  TfrmLoanList = class(TfrmBaseDocked, ILoanListFilter, IDockedForm)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
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

procedure TfrmLoanList.FilterList(const filterType: TLoanFilterType);
begin

end;

procedure TfrmLoanList.SetTitle(const title: string);
begin
  lblTitle.Caption := title;
end;

end.
