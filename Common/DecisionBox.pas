unit DecisionBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, RzButton, Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmDecisionBox = class(TfrmBasePopup)
    Image1: TImage;
    pnlNo: TRzPanel;
    btnNo: TRzShapeButton;
    pnlYes: TRzPanel;
    btnYes: TRzShapeButton;
    lblMessage: TLabel;
    procedure btnNoClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const confMessage: string); reintroduce; overload;
  end;

implementation

{$R *.dfm}

constructor TfrmDecisionBox.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmDecisionBox.btnNoClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNo;
end;

procedure TfrmDecisionBox.btnYesClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrYes;
end;

constructor TfrmDecisionBox.Create(AOwner: TComponent; const confMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := confMessage;
end;

end.
