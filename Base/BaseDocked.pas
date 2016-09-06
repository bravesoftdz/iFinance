unit BaseDocked;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel;

type
  TfrmBaseDocked = class(TfrmBase)
    pnlTitle: TRzPanel;
    lblTitle: TRzLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseDocked: TfrmBaseDocked;

implementation

{$R *.dfm}

end.
