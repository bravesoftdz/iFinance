unit LoanClassChargeTypeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, JvExControls, JvLabel;

type
  TfrmLoanClassChargeTypeList = class(TfrmBaseGridDetail)
    JvLabel3: TJvLabel;
    edType: TRzDBEdit;
    JvLabel1: TJvLabel;
    edName: TRzDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function EntryIsValid: boolean; override;
    procedure SearchList; override;
  end;

implementation

{$R *.dfm}

uses
  LoansAuxData, IFinanceDialogs;

{ TfrmLoanClassChargeTypeList }

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

procedure TfrmLoanClassChargeTypeList.SearchList;
begin
  grList.DataSource.DataSet.Locate('charge_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
