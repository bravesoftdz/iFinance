unit LoanReleaseDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, JvExControls,
  JvLabel, RzButton, RzTabs, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  RzPanel;

type
  TfrmBasePopupDetail2 = class(TfrmBasePopupDetail)
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    JvLabel13: TJvLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzDBGrid1: TRzDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBasePopupDetail2: TfrmBasePopupDetail2;

implementation

{$R *.dfm}

end.
