unit TimelogMain;

interface

uses
  System.SysUtils, System.Classes, BaseCalendar, Vcl.Controls, Vcl.StdCtrls,
  RzCmboBx, Vcl.Grids, RzGrids, Vcl.ExtCtrls, RzPanel, RzLabel;

type
  TfrmTimelogMain = class(TfrmBaseCalendar)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitForm;
  public
    { Public declarations }
  end;

var
  frmTimelogMain: TfrmTimelogMain;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AttendanceUtils;

procedure TfrmTimelogMain.InitForm;
begin
  grCalendar.ColWidths[0] := 210;

  PopulateYear(cmbYear);
end;

procedure TfrmTimelogMain.FormCreate(Sender: TObject);
begin
  inherited;
  InitForm;
end;

end.
