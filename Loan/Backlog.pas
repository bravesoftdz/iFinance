unit Backlog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel;

type
  TfrmBacklog = class(TfrmBasePopupDetail)
    JvLabel5: TJvLabel;
    edAppAmount: TRzDBNumericEdit;
    JvLabel7: TJvLabel;
    dteLastTransactionDate: TRzDBDateTimeEdit;
    JvLabel1: TJvLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    RzDBNumericEdit3: TRzDBNumericEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  end;

implementation

{$R *.dfm}

uses
  LoanData, IFinanceGlobal;

procedure TfrmBacklog.BindToObject;
begin
  inherited;

end;

procedure TfrmBacklog.Cancel;
begin
  inherited;

end;

procedure TfrmBacklog.FormCreate(Sender: TObject);
begin
  inherited;
  dteLastTransactionDate.Date := ifn.AppDate;
end;

procedure TfrmBacklog.Save;
begin
  inherited;

end;

function TfrmBacklog.ValidEntry: boolean;
begin
  Result := true;
end;

end.
