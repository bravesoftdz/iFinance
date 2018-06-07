unit FormsUtil;

interface

uses
  Vcl.Controls, RzDBCmbo, RzDBGrid, RzGrids, DB, RzLstBox, RzChkLst, Vcl.ExtCtrls,
  System.Classes, RzCmboBx, IFinanceGlobal, Location, PaymentMethod;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure ButtonDown(Sender: TObject);
procedure ButtonUp(Sender: TObject);
procedure ExtendLastColumn(grid: TRzDBGrid); overload;
procedure ExtendLastColumn(grid: TRzStringGrid); overload;
procedure PopulateBranchComboBox(comboBox: TRzComboBox);
procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string; const closeOpenSource: boolean = false); overload;
procedure PopulatePaymentMethodComboBox(comboBox: TRzComboBox; const bankWithdrawalOnly: boolean = false);

function FirstRow(grid: TRzStringGrid): boolean;

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

        // remove filters
        ds.Filter := '';

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

procedure PopulateBranchComboBox(comboBox: TRzComboBox);
var
  i, cnt: integer;
begin
  cnt := ifn.LocationCount - 1;
  for i := 0 to cnt do
    comboBox.AddItemValue(ifn.Locations[i].LocationName,ifn.Locations[i].LocationCode);

  // set default
  comboBox.FindItem(ifn.GetLocationNameByCode(ifn.LocationCode));
end;

procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string; const closeOpenSource: boolean); overload;
begin
  with source, comboBox do
  begin
    if closeOpenSource then source.Open;

    DisableControls;
    while not Eof do
    begin
      AddItemValue(FieldByName(nameField).AsString,FieldByName(codeField).AsString);
      Next;
    end;

    if closeOpenSource then source.Close;

    EnableControls;
  end;
end;

procedure PopulatePaymentMethodComboBox(comboBox: TRzComboBox; const bankWithdrawalOnly: boolean);
var
  i, cnt: integer;
begin
  cnt := Length(pmtMethods) - 1;
  for i := 0 to cnt do
  begin
    if not bankWithdrawalOnly then
    begin
      if pmtMethods[i].Method in [mdCash,mdCheck]  then
        comboBox.AddObject(pmtMethods[i].Name,TObject(pmtMethods[i]));
    end
    else begin
      if pmtMethods[i].Method = mdBankWithdrawal  then
        comboBox.AddObject(pmtMethods[i].Name,TObject(pmtMethods[i]));
    end;
  end;

  // set first item as default
  comboBox.ItemIndex := 0;
end;

function FirstRow(grid: TRzStringGrid): boolean;
begin
  with grid do
    Result := (RowCount = FixedRows + 1) and (not Assigned(Objects[0,1]));
end;

end.
