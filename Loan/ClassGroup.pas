unit ClassGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLstBox,
  RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel;

type
  TfrmClassGroup = class(TfrmBasePopup)
    lbxAvailable: TRzListBox;
    btnOk: TButton;
    btnClose: TButton;
    lbxSelected: TRzListBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassGroup: TfrmClassGroup;

implementation

{$R *.dfm}

uses
  LoansAuxData;

end.
