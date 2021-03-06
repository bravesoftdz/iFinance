unit AccountTypeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, Vcl.DBCtrls, JvExControls, JvLabel;

type
  TfrmAccountTypeList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edTypeName: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    JvLabel2: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  end;

var
  frmAccountTypeList: TfrmAccountTypeList;

implementation

{$R *.dfm}

uses
  LoansAuxData, IFinanceDialogs;

procedure TfrmAccountTypeList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmLoansAux.Free;
  inherited;
end;

procedure TfrmAccountTypeList.FormCreate(Sender: TObject);
begin
  dmLoansAux := TdmLoansAux.Create(self);
  inherited;
end;

function TfrmAccountTypeList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmAccountTypeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('acct_type_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmAccountTypeList.BindToObject;
begin
  inherited;

end;

function TfrmAccountTypeList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmAccountTypeList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edTypeName.Text) = '' then  error := 'Please enter a type name.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

end.
