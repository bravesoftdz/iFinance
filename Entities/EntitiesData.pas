unit EntitiesData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Rtti;

type
  TdmEntities = class(TDataModule)
    dstEntities: TADODataSet;
    dscEntities: TDataSource;
    dstLandlord: TADODataSet;
    dstLlPersonal: TADODataSet;
    dscLlPersonal: TDataSource;
    dstLlContact: TADODataSet;
    dscLlContact: TDataSource;
    dstImmHead: TADODataSet;
    dstIHPersonal: TADODataSet;
    dscIHPersonal: TDataSource;
    dstIHContact: TADODataSet;
    dscIHContact: TDataSource;
    dstGroups: TADODataSet;
    dscGroups: TDataSource;
    dstParGroup: TADODataSet;
    dscParGroup: TDataSource;
    dstEmployers: TADODataSet;
    dscEmployers: TDataSource;
    procedure dstLandlordBeforeOpen(DataSet: TDataSet);
    procedure dstLandlordBeforePost(DataSet: TDataSet);
    procedure dstLlPersonalBeforeOpen(DataSet: TDataSet);
    procedure dstLlPersonalBeforePost(DataSet: TDataSet);
    procedure dstLlContactBeforeOpen(DataSet: TDataSet);
    procedure dstLlContactBeforePost(DataSet: TDataSet);
    procedure dstImmHeadBeforeOpen(DataSet: TDataSet);
    procedure dstImmHeadBeforePost(DataSet: TDataSet);
    procedure dstIHPersonalBeforeOpen(DataSet: TDataSet);
    procedure dstIHPersonalBeforePost(DataSet: TDataSet);
    procedure dstIHContactBeforeOpen(DataSet: TDataSet);
    procedure dstIHContactBeforePost(DataSet: TDataSet);
    procedure dstGroupsBeforePost(DataSet: TDataSet);
    procedure dstGroupsNewRecord(DataSet: TDataSet);
    procedure dstEmployersBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEntities: TdmEntities;

implementation

uses
  AppData, Landlord, DBUtil, ImmediateHead, AppConstants,IFinanceGlobal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmEntities.dstLlContactBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := llord.Id;
end;

procedure TdmEntities.dstLlContactBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := llord.Id;
end;

procedure TdmEntities.dstEmployersBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEmployerId;
    DataSet.FieldByName('emp_id').AsString := id;
  end;
end;

procedure TdmEntities.dstGroupsBeforePost(DataSet: TDataSet);
var
  id: integer;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetGroupId;
    DataSet.FieldByName('grp_id').AsInteger := id;
  end;
end;

procedure TdmEntities.dstGroupsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('is_gov').AsInteger := 1;
  DataSet.FieldByName('is_active').AsInteger := 1;
end;

procedure TdmEntities.dstIHContactBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := immHead.Id;
end;

procedure TdmEntities.dstIHContactBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := immHead.Id;
end;

procedure TdmEntities.dstIHPersonalBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := immHead.Id;
end;

procedure TdmEntities.dstIHPersonalBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := immHead.Id;
end;

procedure TdmEntities.dstImmHeadBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := immHead.Id;
end;

procedure TdmEntities.dstImmHeadBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('entity_type').AsString :=
      TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.IH);
    DataSet.FieldByName('created_date').AsString :=
        FormatDateTime('yyyy-mm-dd',Date);;
    DataSet.FieldByName('created_by').AsString := ifn.User.UserId;

    immHead.Id := id;
  end;
end;

procedure TdmEntities.dstLandlordBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := llord.Id;
end;

procedure TdmEntities.dstLandlordBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('entity_type').AsString :=
      TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.LL);
    DataSet.FieldByName('created_date').AsString :=
        FormatDateTime('yyyy-mm-dd',Date);;
    DataSet.FieldByName('created_by').AsString := ifn.User.UserId;

    llord.Id := id;
  end;
end;

procedure TdmEntities.dstLlPersonalBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := llord.Id;
end;

procedure TdmEntities.dstLlPersonalBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := llord.Id;
end;

end.
