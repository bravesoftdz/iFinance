unit FormsUtil;

interface

uses
  Vcl.Controls, RzDBCmbo, RzDBGrid, DB, RzLstBox, RzChkLst, Vcl.ExtCtrls,
  System.Classes;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure ButtonDown(Sender: TObject);
procedure ButtonUp(Sender: TObject);
procedure ExtendLastColumn(grid: TRzDBGrid);

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

end.
