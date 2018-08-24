unit LoanClassChargeTypeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit;

type
  TfrmLoanClassChargeTypeList = class(TfrmBaseGridDetail)
    edType: TRzDBEdit;
    edName: TRzDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
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

implementation

{$R *.dfm}

uses
  LoansAuxData, IFinanceDialogs;

{ TfrmLoanClassChargeTypeList }

procedure TfrmLoanClassChargeTypeList.BindToObject;
begin
  inherited;

end;

function TfrmLoanClassChargeTypeList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmLoanClassChargeTypeList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edType.Text) = '' then  error := 'Please enter a type.'
  else if Trim(edName.Text) = '' then  error := 'Please enter a name.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmLoanClassChargeTypeList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmLoansAux.Free;
  inherited;
end;

procedure TfrmLoanClassChargeTypeList.FormCreate(Sender: TObject);
begin
  dmLoansAux := TdmLoansAux.Create(self);
  inherited;
end;

function TfrmLoanClassChargeTypeList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmLoanClassChargeTypeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('charge_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
