unit LoanRejectionReasonList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit;

type
  TfrmLoanRejectionReasonList = class(TfrmBaseGridDetail)
    edReason: TRzDBEdit;
    Label2: TLabel;
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

implementation

{$R *.dfm}

uses
  AuxData, IFinanceDialogs;

procedure TfrmLoanRejectionReasonList.BindToObject;
begin
  inherited;

end;

function TfrmLoanRejectionReasonList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmLoanRejectionReasonList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edReason.Text) = '' then error := 'Please enter reason.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmLoanRejectionReasonList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Free;
  inherited;
end;

procedure TfrmLoanRejectionReasonList.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);
  inherited;
end;

function TfrmLoanRejectionReasonList.NewIsAllowed: boolean;
begin
  Result := true;
end;

procedure TfrmLoanRejectionReasonList.SearchList;
begin
  grList.DataSource.DataSet.Locate('reason_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

end.
