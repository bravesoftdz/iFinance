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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfBox: TfrmConfBox;

implementation

{$R *.dfm}

end.
