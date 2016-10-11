unit RefData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmRef = class(TDataModule)
    dstRefInfo: TADODataSet;
    dscRefInfo: TDataSource;
    dstEntity: TADODataSet;
    dstPersonalInfo: TADODataSet;
    dstContactInfo: TADODataSet;
    dstAddressInfo: TADODataSet;
    dscAddressInfo: TDataSource;
    dscContactInfo: TDataSource;
    dscPersonalInfo: TDataSource;
    dstClients: TADODataSet;
    dscClients: TDataSource;
    procedure dstRefInfoAfterOpen(DataSet: TDataSet);
    procedure dstRefInfoBeforeOpen(DataSet: TDataSet);
    procedure dstRefInfoBeforePost(DataSet: TDataSet);
    procedure dstRefInfoAfterPost(DataSet: TDataSet);
    procedure dstPersonalInfoBeforeOpen(DataSet: TDataSet);
    procedure dstContactInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfoBeforeOpen(DataSet: TDataSet);
    procedure dstPersonalInfoBeforePost(DataSet: TDataSet);
    procedure dstContactInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfoBeforePost(DataSet: TDataSet);
    procedure dstRefInfoAfterScroll(DataSet: TDataSet);
    procedure dstRefInfoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure RefreshAuxDataSets;
    procedure LocateAuxInfo;
  public
    { Public declarations }
  end;

var
  dmRef: TdmRef;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Client, Reference, DBUtil;

procedure TdmRef.RefreshAuxDataSets;
var
  i: integer;
begin
  // open auxiliary datasets TAG = 2
  // close every time to refresh
  with self do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag = 2 then
        begin
          (Components[i] as TADODataSet).Close;
          (Components[i] as TADODataSet).Open;
        end;
    end;
  end;
end;

procedure TdmRef.LocateAuxInfo;
var
  refId: string;
  i: integer;
begin
  refId := dstRefInfo.FieldByName('ref_entity_id').AsString;

  with self do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag = 2 then
          if not (Components[i] as TADODataSet).Locate('entity_id',refId,[]) then
            (Components[i] as TADODataSet).Append;
    end;
  end;
end;

procedure TdmRef.dstAddressInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmRef.dstAddressInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString :=
        dstRefInfo.FieldByName('ref_entity_id').AsString;
end;

procedure TdmRef.dstContactInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmRef.dstContactInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString :=
        dstRefInfo.FieldByName('ref_entity_id').AsString;
end;

procedure TdmRef.dstPersonalInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmRef.dstPersonalInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmRef.dstRefInfoAfterDelete(DataSet: TDataSet);
begin
  if DataSet.RecordCount > 0 then
    LocateAuxInfo
  else
    RefreshAuxDataSets;
end;

procedure TdmRef.dstRefInfoAfterOpen(DataSet: TDataSet);
var
  id, refName, refType: string;
  isDependent, isStudent: boolean;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'RefInfo';
  with DataSet do
  begin
    DisableControls;
    if RecordCount > 0 then
    begin
      while not Eof do
      begin
        id := FieldByName('ref_entity_id').AsString;
        refName := FieldByName('name').AsString;
        refType := FieldByName('ref_type').AsString;
        isDependent := FieldByName('is_dependent').AsInteger = 1;
        isStudent := FieldByName('is_student').AsInteger = 1;

        cln.AddReference(TReference.Create(id,refName,refType,isDependent,isStudent));

        Next;
      end;
      First;
    end;
    EnableControls;
  end;

  LocateAuxInfo;
end;

procedure TdmRef.dstRefInfoAfterPost(DataSet: TDataSet);
var
  id, refName, refType: string;
  isDependent, isStudent: boolean;
begin
  with DataSet do
  begin
    id := FieldByName('ref_entity_id').AsString;
    refName := FieldByName('name').AsString;
    refType := FieldByName('ref_type').AsString;
    isDependent := FieldByName('is_dependent').AsInteger = 1;
    isStudent := FieldByName('is_student').AsInteger = 1;

    cln.AddReference(TReference.Create(id,refName,refType,isDependent,isStudent));
  end;
  RefreshDataSet(id,'ref_entity_id',DataSet);
end;

procedure TdmRef.dstRefInfoAfterScroll(DataSet: TDataSet);
begin
  LocateAuxInfo;
end;

procedure TdmRef.dstRefInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
  RefreshAuxDataSets;
end;

procedure TdmRef.dstRefInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

end.
