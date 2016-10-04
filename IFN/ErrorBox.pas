unit ErrorBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmErrorBox = class(TfrmBasePopup)
    btnOk: TRzButton;
    lblMessage: TJvLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErrorBox: TfrmErrorBox;

implementation

{$R *.dfm}

end.
