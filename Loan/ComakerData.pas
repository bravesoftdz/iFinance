unit ComakerData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Rtti, Variants;

type
  TdmComaker = class(TDataModule)
    dstEntity: TADODataSet;
    dstPersonalInfo: TADODataSet;
    dscPersonalInfo: TDataSource;
    dstContactInfo: TADODataSet;
    dscContactInfo: TDataSource;
    dstAddressInfo: TADODataSet;
    dscAddressInfo: TDataSource;
    dstAddressInfo2: TADODataSet;
    dscAddressInfo2: TDataSource;
    dstCivilStatus: TADODataSet;
    dscCivilStatus: TDataSource;
    dstGender: TADODataSet;
    dscGender: TDataSource;
    dstEmplInfo: TADODataSet;
    dscEmplInfo: TDataSource;
    dstIdentInfo: TADODataSet;
    dscIdentInfo: TDataSource;
    procedure dstEntityBeforeOpen(DataSet: TDataSet);
    procedure dstEntityBeforePost(DataSet: TDataSet);
    procedure dstPersonalInfoBeforeOpen(DataSet: TDataSet);
    procedure dstPersonalInfoBeforePost(DataSet: TDataSet);
    procedure dstContactInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfo2BeforePost(DataSet: TDataSet);
    procedure dstEmplInfoBeforePost(DataSet: TDataSet);
    procedure dstContactInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfo2BeforeOpen(DataSet: TDataSet);
    procedure dstEmplInfoBeforeOpen(DataSet: TDataSet);
    procedure dstIdentInfoBeforeOpen(DataSet: TDataSet);
    procedure dstIdentInfoBeforePost(DataSet: TDataSet);
    procedure dstEmplInfoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmComaker: TdmComaker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Comaker, DBUtil, AppConstants, Employer, IFinanceGlobal;

procedure TdmComaker.dstAddressInfo2BeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstAddressInfo2BeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;

  DataSet.FieldByName('is_prov').AsInteger := 1;
end;

procedure TdmComaker.dstAddressInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstAddressInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;

  DataSet.FieldByName('is_prov').AsInteger := 0;
end;

procedure TdmComaker.dstContactInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstContactInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;
end;

procedure TdmComaker.dstEmplInfoAfterOpen(DataSet: TDataSet);
begin
  if (cm.HasId) and (DataSet.RecordCount > 0) then
  begin
    if DataSet.FieldByName('emp_id').AsString <> '' then
    begin
      cm.Employer := TEmployer.Create;
      cm.Employer.Id := DataSet.FieldByName('emp_id').AsString;
      cm.Employer.Name := DataSet.FieldByName('emp_name').AsString;
      cm.Employer.Address := DataSet.FieldByName('emp_add').AsString;
      cm.Employer.GroupId := DataSet.FieldByName('grp_id').AsString;
    end;
  end;
end;

procedure TdmComaker.dstEmplInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstEmplInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;

  if Assigned(cm.Employer) then
    DataSet.FieldByName('emp_id').AsString := cm.Employer.Id
  else
    DataSet.FieldByName('emp_id').Value := null;
end;

procedure TdmComaker.dstEntityBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstEntityBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('entity_type').AsString :=
      TRttiEnumerationType.GetName<TEntityTypes>(TEntityTypes.CK);
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

    cm.Id := id;
  end;
end;

procedure TdmComaker.dstIdentInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstIdentInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;
end;

procedure TdmComaker.dstPersonalInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cm.Id;
end;

procedure TdmComaker.dstPersonalInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cm.Id;
end;

end.
