unit Alerts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzEdit,
  RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

type
  TfrmAlerts = class(TfrmBasePopup)
    mmAlerts: TRzMemo;
    pnlContinue: TRzPanel;
    btnContinue: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlerts: TfrmAlerts;

implementation

uses
  Alert;

{$R *.dfm}

procedure TfrmAlerts.btnContinueClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmAlerts.FormCreate(Sender: TObject);
var
  c, i: integer;
begin
  inherited;
  c := alrt.Count - 1;

  for i := 0 to c do mmAlerts.Lines.Add(IntToStr(i + 1) + '. ' + alrt.Items[i] + #13#10);
end;

end.
