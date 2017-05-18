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
    dstRecipient: TADODataSet;
    dstRcpPersonal: TADODataSet;
    dscRcpPersonal: TDataSource;
    dstReferee: TADODataSet;
    dstRefPersonal: TADODataSet;
    dscRefPersonal: TDataSource;
    dstRefContact: TADODataSet;
    dscRefContact: TDataSource;
    dstGroupAttribute: TADODataSet;
    dscGroupAttribute: TDataSource;
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
    procedure dstRecipientBeforeOpen(DataSet: TDataSet);
    procedure dstRecipientBeforePost(DataSet: TDataSet);
    procedure dstRefereeBeforeOpen(DataSet: TDataSet);
    procedure dstRefereeBeforePost(DataSet: TDataSet);
    procedure dstRefPersonalBeforeOpen(DataSet: TDataSet);
    procedure dstRefPersonalBeforePost(DataSet: TDataSet);
    procedure dstRefContactBeforeOpen(DataSet: TDataSet);
    procedure dstRefContactBeforePost(DataSet: TDataSet);
    procedure dstGroupsAfterPost(DataSet: TDataSet);
    procedure dstEmployersNewRecord(DataSet: TDataSet);
    procedure dstEmployersAfterOpen(DataSet: TDataSet);
    procedure dstEmployersAfterScroll(DataSet: TDataSet);
    procedure dstEmployersAfterPost(DataSet: TDataSet);
    procedure dstGroupAttributeBeforePost(DataSet: TDataSet);
    procedure dstGroupsAfterOpen(DataSet: TDataSet);
    procedure dstGroupAttributeNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEntities: TdmEntities;

implementation

uses
  AppData, Landlord, DBUtil, ImmediateHead, AppConstants,IFinanceGlobal,
  Recipient, Referee, Employer, Group;

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

procedure TdmEntities.dstEmployersAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'Employer';
end;

procedure TdmEntities.dstEmployersAfterPost(DataSet: TDataSet);
var
  grpId: string;
begin
  grpId := DataSet.FieldByName('grp_id').AsString;
  RefreshDataSet(grpId,'grp_id',DataSet);
end;

procedure TdmEntities.dstEmployersAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    grp := TGroup.Create;
    grp.GroupId := FieldByName('grp_id').AsString;
    grp.GroupName := FieldByName('grp_name').AsString;

    emp := TEmployer.Create;
    emp.Id := FieldByName('emp_id').AsString;
    emp.Name := FieldByName('emp_name').AsString;
    emp.Address := FieldByName('emp_add').AsString;
    emp.Group := grp;
  end;
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

procedure TdmEntities.dstEmployersNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('loc_code').AsString := ifn.LocationCode;
  end;
end;

procedure TdmEntities.dstGroupAttributeBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := dstGroups.FieldByName('grp_id').AsString;
    DataSet.FieldByName('grp_id').AsString := id;
  end;
end;

procedure TdmEntities.dstGroupAttributeNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('is_gov').AsInteger := 1;
  end;
end;

procedure TdmEntities.dstGroupsAfterOpen(DataSet: TDataSet);
begin
  // open the attributes dataset
  dstGroupAttribute.Open;
end;

procedure TdmEntities.dstGroupsAfterPost(DataSet: TDataSet);
begin
  // refresh the parent group
  dstParGroup.Requery;
end;

procedure TdmEntities.dstGroupsBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetGroupId;
    DataSet.FieldByName('grp_id').AsString := id;
  end;
end;

procedure TdmEntities.dstGroupsNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('is_active').AsInteger := 1;
    FieldByName('loc_code').AsString := ifn.LocationCode;
  end;
end;

procedure TdmEntities.dstIHContactBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := immHead.Id;
end;

procedure TdmEntities.dstIHContactBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then DataSet.FieldByName('entity_id').AsString := immHead.Id;
end;

procedure TdmEntities.dstIHPersonalBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := immHead.Id;
end;

procedure TdmEntities.dstIHPersonalBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then DataSet.FieldByName('entity_id').AsString := immHead.Id;
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
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

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
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

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

procedure TdmEntities.dstRecipientBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := rcp.Id;
end;

procedure TdmEntities.dstRecipientBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('entity_type').AsString :=
      TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.RP);
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

    rcp.Id := id;
  end;
end;

procedure TdmEntities.dstRefContactBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ref.Id;
end;

procedure TdmEntities.dstRefContactBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then DataSet.FieldByName('entity_id').AsString := ref.Id;
end;

procedure TdmEntities.dstRefereeBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ref.Id;
end;

procedure TdmEntities.dstRefereeBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('entity_type').AsString :=
      TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.RF);
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

    ref.Id := id;
  end;
end;

procedure TdmEntities.dstRefPersonalBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ref.Id;
end;

procedure TdmEntities.dstRefPersonalBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then DataSet.FieldByName('entity_id').AsString := ref.Id;
end;

end.
