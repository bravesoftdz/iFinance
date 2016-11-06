unit ErrorBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmErrorBox = class(TfrmBasePopup)
    btnClose: TRzButton;
    lblMessage: TJvLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const errMessage: string); reintroduce; overload;
  end;

var
  frmErrorBox: TfrmErrorBox;

implementation

{$R *.dfm}

constructor TfrmErrorBox.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmErrorBox.Create(AOwner: TComponent; const errMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := errMessage;
end;


end.
