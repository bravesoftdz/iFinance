unit FormsUtil;

interface

uses
  Vcl.Controls, RzDBCmbo, RzDBGrid, RzGrids, DB, RzLstBox, RzChkLst, Vcl.ExtCtrls,
  System.Classes;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure ButtonDown(Sender: TObject);
procedure ButtonUp(Sender: TObject);
procedure ExtendLastColumn(grid: TRzDBGrid); overload;
procedure ExtendLastColumn(grid: TRzStringGrid); overload;

implementation

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TRzDBLookupComboBox then
    begin
      if (parentCtrl.Controls[i] as TRzDBLookupComboBox).DataSource <> nil then
      begin
        ds := (parentCtrl.Controls[i] as TRzDBLookupComboBox).ListSource.DataSet;

        ds.Close;

        if open then
          ds.Open;
      end
    end
  end;
end;

procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TRzDBGrid then
    begin
      if (parentCtrl.Controls[i] as TRzDBGrid).DataSource <> nil then
      begin
        ds := (parentCtrl.Controls[i] as TRzDBGrid).DataSource.DataSet;

        ds.Close;

        if open then
          ds.Open;
      end
    end
  end;
end;

procedure ButtonDown(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left + 1;
  (Sender as TImage).Top := (Sender as TImage).Top + 1;
end;

procedure ButtonUp(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left - 1;
  (Sender as TImage).Top := (Sender as TImage).Top - 1;
end;

procedure ExtendLastColumn(grid: TRzDBGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.Columns.Count - 1 do widths := widths + grid.Columns[i].Width;

  // add extra column
  grid.Columns.Add;

  //extend to the size of the grid
  grid.Columns[grid.Columns.Count - 1].Width := grid.Width - widths + 5;
end;

procedure ExtendLastColumn(grid: TRzStringGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.ColCount - 1 do widths := widths + grid.ColWidths[i];

  // add extra column
  grid.ColCount := grid.ColCount + 1;

  //extend to the size of the grid
  grid.ColWidths[grid.ColCount - 1] := grid.Width - widths - 4;
end;

end.
