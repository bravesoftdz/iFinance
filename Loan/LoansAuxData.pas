unit LoansAuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

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
    procedure dstLoanClassGroupsBeforeOpen(DataSet: TDataSet);
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

procedure TdmLoansAux.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'LoanClass';
end;

procedure TdmLoansAux.dstLoanClassBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('class_id').AsInteger := GetLoanClassId;
end;

procedure TdmLoansAux.dstLoanClassGroupsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@class_id').Value :=
        dstLoanClass.FieldByName('class_id').AsInteger;
end;

end.
