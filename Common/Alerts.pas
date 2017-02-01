unit Alerts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzEdit,
  RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmAlerts = class(TfrmBasePopup)
    mmAlerts: TRzMemo;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
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

procedure TfrmAlerts.FormCreate(Sender: TObject);
var
  c, i: integer;
begin
  inherited;
  c := alrt.Count - 1;

  for i := 0 to c do mmAlerts.Lines.Add(IntToStr(i + 1) + '. ' + alrt.Alerts[i] + #13#10);
end;

end.
