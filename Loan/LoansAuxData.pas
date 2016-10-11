unit LoansAuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.Controls;

type
  TdmLoansAux = class(TDataModule)
    dscLoanClass: TDataSource;
    dstLoanClass: TADODataSet;
    dscLoanType: TDataSource;
    dstLoanType: TADODataSet;
    dscLoanClassGroups: TDataSource;
    dstLoanClassGroups: TADODataSet;
    procedure dstLoanClassBeforePost(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstLoanClassAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLoansAux: TdmLoansAux;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, DBUtil, LoanClassification;

procedure TdmLoansAux.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  // open all datasets
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TADODataSet then
      (Components[i] as TADODataSet).Open;
end;

procedure TdmLoansAux.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  // close all datasets
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TADODataSet then
      (Components[i] as TADODataSet).Close;
end;

procedure TdmLoansAux.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'LoanClass';
end;

procedure TdmLoansAux.dstLoanClassAfterPost(DataSet: TDataSet);
var
  classId: integer;
begin
  classId := DataSet.FieldByName('class_id').AsInteger;
  RefreshDataSet(classId,'class_id',DataSet);
end;

procedure TdmLoansAux.dstLoanClassAfterScroll(DataSet: TDataSet);
var
  filterStr: string;
begin
  // filter groups
  if DataSet.State = dsBrowse then
    filterStr := 'class_id = ' + DataSet.FieldByName('class_id').AsString
  else
    filterStr := 'class_id = 0';

  with dstLoanClassGroups do
    Filter := filterStr;
end;

procedure TdmLoansAux.dstLoanClassBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('class_id').AsInteger := GetLoanClassId;
end;

end.
