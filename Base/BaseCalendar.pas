unit BaseCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Grids, RzGrids, RzCmboBx;

type
  TfrmBaseCalendar = class(TfrmBaseDocked)
    grCalendar: TRzStringGrid;
    RzLabel1: TRzLabel;
    cmbYear: TRzComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseCalendar: TfrmBaseCalendar;

implementation

{$R *.dfm}

end.
