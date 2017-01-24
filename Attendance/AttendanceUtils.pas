unit AttendanceUtils;

interface

uses
  RzCmboBx, DateUtils, SysUtils;

procedure PopulateYear(const combo: TRzComboBox);

const
  BASE_YEAR = 2014;

implementation

procedure PopulateYear(const combo: TRzComboBox);

var
  mm: Word;
  yy: Word;
  dd: Word;
  i: integer;
begin
  DecodeDate(Date, yy, mm, dd);

  with combo do
  begin
    Clear;

    for i := yy downto BASE_YEAR do
        combo.Items.Add(IntToStr(i));

    ItemIndex := 0;
  end;
end;


end.
