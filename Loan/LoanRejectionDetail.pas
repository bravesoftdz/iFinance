unit LoanRejectionDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, JvExControls, JvLabel, RzButton,
  RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmBasePopupDetail3 = class(TfrmBasePopupDetail)
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBDateTimeEdit3: TRzDBDateTimeEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBasePopupDetail3: TfrmBasePopupDetail3;

implementation

{$R *.dfm}

end.
