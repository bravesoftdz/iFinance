unit LoanLedger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid;

type
  TfrmLoanLedger = class(TfrmBasePopup)
    pnlLedger: TRzPanel;
    grLedger: TRzDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grLedgerDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; ASource: TDataSource); reintroduce; overload;

  end;

var
  frmLoanLedger: TfrmLoanLedger;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil;

constructor TfrmLoanLedger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TfrmLoanLedger.Create(AOwner: TComponent; ASource: TDataSource);
begin
  Create(AOwner);
  grLedger.DataSource := ASource;
end;

procedure TfrmLoanLedger.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  grLedger.DataSource.DataSet.Close;
end;

procedure TfrmLoanLedger.FormCreate(Sender: TObject);
begin
  inherited;
  grLedger.DataSource.DataSet.Open;
  ExtendLastColumn(grLedger);
end;

procedure TfrmLoanLedger.grLedgerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with grLedger do
  begin
    if DataSource.DataSet.FieldByName('event_object').AsString = 'PAY' then
    begin
      Canvas.Brush.Color := clMoneyGreen;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    else
    begin
      Canvas.Brush.Color := clWhite;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
  end;

end;

end.
