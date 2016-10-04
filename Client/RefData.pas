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
    procedure dstRefInfoAfterOpen(DataSet: TDataSet);
    procedure dstRefInfoBeforeOpen(DataSet: TDataSet);
    procedure dstRefInfoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRef: TdmRef;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Client, Reference;

procedure TdmRef.dstRefInfoAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'RefInfo';
end;

procedure TdmRef.dstRefInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmRef.dstRefInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

end.
