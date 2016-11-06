unit DecisionBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, RzButton, JvExControls,
  JvLabel, Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmDecisionBox = class(TfrmBasePopup)
    lblMessage: TJvLabel;
    btnNo: TRzButton;
    btnYes: TRzButton;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const confMessage: string); reintroduce; overload;
  end;

var
  frmDecisionBox: TfrmDecisionBox;

implementation

{$R *.dfm}

constructor TfrmDecisionBox.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmDecisionBox.Create(AOwner: TComponent; const confMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := confMessage;
end;

end.
