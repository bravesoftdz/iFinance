unit LoanTypeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, JvExControls, JvLabel, RzDBCmbo;

type
  TfrmLoanTypeList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edTypeName: TRzDBEdit;
    JvLabel2: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    JvLabel3: TJvLabel;
    dbluAccountType: TRzDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  LoansAuxData, IFinanceDialogs;

procedure TfrmLoanTypeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('loan_type_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmLoanTypeList.BindToObject;
begin
  inherited;

end;

function TfrmLoanTypeList.EditIsAllowed: boolean;
begin
 Result := true;
end;

function TfrmLoanTypeList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edTypeName.Text) = '' then  error := 'Please enter a name.'
  else if Trim(dbluAccountType.Text) = '' then  error := 'Please select an account.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmLoanTypeList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmLoansAux.Free;
  inherited;
end;

procedure TfrmLoanTypeList.FormCreate(Sender: TObject);
begin
  dmLoansAux := TdmLoansAux.Create(self);
  inherited;
end;

function TfrmLoanTypeList.NewIsAllowed: boolean;
begin
  Result := true;
end;

end.
