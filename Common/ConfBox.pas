unit ConfBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmConfBox = class(TfrmBasePopup)
    lblMessage: TJvLabel;
    btnOk: TRzButton;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const confMessage: string); reintroduce; overload;
  end;

var
  frmConfBox: TfrmConfBox;

implementation

{$R *.dfm}

constructor TfrmConfBox.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmConfBox.Create(AOwner: TComponent; const confMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := confMessage;
end;

end.
