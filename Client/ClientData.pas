unit ClientData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ImgList,
  Vcl.Controls, Variants;

type
  TdmClient = class(TDataModule)
    dstPersonalInfo: TADODataSet;
    dscPersonalInfo: TDataSource;
    dstEntity: TADODataSet;
    dstContactInfo: TADODataSet;
    dscContactInfo: TDataSource;
    dstCivilStatus: TADODataSet;
    dscCivilStatus: TDataSource;
    dstGender: TADODataSet;
    dscGender: TDataSource;
    dstAddressInfo: TADODataSet;
    dscAddressInfo: TDataSource;
    dstResStatus: TADODataSet;
    dscResStatus: TDataSource;
    dstEmpStatus: TADODataSet;
    dscEmpStatus: TDataSource;
    dstEmplInfo: TADODataSet;
    dscEmplInfo: TDataSource;
    dstIdentInfo: TADODataSet;
    dscIdentInfo: TDataSource;
    dstAddressInfo2: TADODataSet;
    dscAddressInfo2: TDataSource;
    dstAcctInfo: TADODataSet;
    dscAcctInfo: TDataSource;
    procedure dstPersonalInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEntityBeforeOpen(DataSet: TDataSet);
    procedure dstContactInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEntityBeforePost(DataSet: TDataSet);
    procedure dstPersonalInfoBeforePost(DataSet: TDataSet);
    procedure dstContactInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfoAfterPost(DataSet: TDataSet);
    procedure dstAddressInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfoBeforePost(DataSet: TDataSet);
    procedure dstEmplInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEmplInfoBeforePost(DataSet: TDataSet);
    procedure dstIdentInfoBeforeOpen(DataSet: TDataSet);
    procedure dstIdentInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfo2AfterPost(DataSet: TDataSet);
    procedure dstAddressInfo2BeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfo2BeforePost(DataSet: TDataSet);
    procedure dstEmplInfoNewRecord(DataSet: TDataSet);
    procedure dstAcctInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAcctInfoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClient: TdmClient;

implementation

uses
  AppData, DBUtil, Client;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmClient.dstAcctInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAcctInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstAddressInfo2AfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmClient.dstAddressInfo2BeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAddressInfo2BeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    DataSet.FieldByName('entity_id').AsString := cln.Id;
    DataSet.FieldByName('is_prov').AsInteger := 1;
  end;

  if Assigned(cln.LandlordPres) then
    DataSet.FieldByName('landlord').AsString := cln.LandlordProv.Id
  else
    DataSet.FieldByName('landlord').Value := null;
end;

procedure TdmClient.dstAddressInfoAfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmClient.dstAddressInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAddressInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    DataSet.FieldByName('entity_id').AsString := cln.Id;
    DataSet.FieldByName('is_prov').AsInteger := 0;
  end;

  if Assigned(cln.LandlordPres) then
    DataSet.FieldByName('landlord').AsString := cln.LandlordPres.Id
  else
    DataSet.FieldByName('landlord').Value := null;
end;

procedure TdmClient.dstContactInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstContactInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstEmplInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstEmplInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;

  if Assigned(cln.ImmediateHead) then
    DataSet.FieldByName('imm_head').AsString := cln.ImmediateHead.Id
  else
    DataSet.FieldByName('imm_head').Value := null;
end;

procedure TdmClient.dstEmplInfoNewRecord(DataSet: TDataSet);
begin
  // set default value of is_gov field
  // set to 1 as most of the clients are public employees
  DataSet.FieldByName('is_gov').AsInteger := 1;
end;

procedure TdmClient.dstEntityBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstEntityBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  id := GetEntityId;
  DataSet.FieldByName('entity_id').AsString := id;

  if Assigned(cln.Referee) then
    DataSet.FieldByName('ref_entity_id').AsString := cln.Referee.Id;

  cln.Id := id;
end;

procedure TdmClient.dstIdentInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstIdentInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstPersonalInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstPersonalInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;

  // reformat birthdate to get around exception
  if not DataSet.FieldByName('birth_date').IsNull then
    DataSet.FieldByName('birth_date').AsString :=
      FormatDateTime('yyyy-mm-dd',DataSet.FieldByName('birth_date').AsDateTime);
end;

end.
