unit LoanClosureReasonList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, JvExControls, JvLabel, RzRadChk, RzDBChk;

type
  TfrmLoanCloseReasonList = class(TfrmBaseGridDetail)
    JvLabel1: TJvLabel;
    edReason: TRzDBEdit;
    cbSystem: TRzDBCheckBox;
    cbAutoPosting: TRzDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  AuxData, IFinanceDialogs;

{ TfrmLoanCloseReasonList }

function TfrmLoanCloseReasonList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edReason.Text) = '' then error := 'Please enter reason.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmLoanCloseReasonList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Free;
  inherited;
end;

procedure TfrmLoanCloseReasonList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);
  inherited;
end;

procedure TfrmLoanCloseReasonList.SearchList;
begin
  grList.DataSource.DataSet.Locate('reason_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
