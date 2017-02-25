unit WarningBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DecisionBox, RzButton, JvExControls,
  JvLabel, Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmWarningBox = class(TfrmDecisionBox)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWarningBox: TfrmWarningBox;

implementation

{$R *.dfm}

end.
