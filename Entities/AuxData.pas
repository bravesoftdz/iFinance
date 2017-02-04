unit AuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmAux = class(TDataModule)
    dscTowns: TDataSource;
    dstTowns: TADODataSet;
    dscBranches: TDataSource;
    dstBranches: TADODataSet;
    dscBanks: TDataSource;
    dstBanks: TADODataSet;
    dscDesignations: TDataSource;
    dstDesignations: TADODataSet;
    dscIdentType: TDataSource;
    dstIdentType: TADODataSet;
    dstRefType: TADODataSet;
    dscRefType: TDataSource;
    dstGroups: TADODataSet;
    dscGroups: TDataSource;
    dscLoanType: TDataSource;
    dstLoanType: TADODataSet;
    dscCompMethod: TDataSource;
    dstCompMethod: TADODataSet;
    dscLocation: TDataSource;
    dstLocation: TADODataSet;
    dstCivilStatus: TADODataSet;
    dscCivilStatus: TDataSource;
    dstGender: TADODataSet;
    dscGender: TDataSource;
    dstAcctType: TADODataSet;
    dscAcctType: TDataSource;
    dstPaymentFreq: TADODataSet;
    dscPaymentFreq: TDataSource;
    dstCompetitors: TADODataSet;
    dscCompetitors: TDataSource;
    dstPurpose: TADODataSet;
    dscPurpose: TDataSource;
    procedure dstBranchesBeforePost(DataSet: TDataSet);
    procedure dstBanksAfterScroll(DataSet: TDataSet);
    procedure dstBranchesNewRecord(DataSet: TDataSet);
    procedure dstDesignationsBeforePost(DataSet: TDataSet);
    procedure dstCompetitorsBeforePost(DataSet: TDataSet);
    procedure dstPurposeBeforePost(DataSet: TDataSet);
    procedure dstAcctTypeAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAux: TdmAux;

implementation

uses
  AppData, DBUtil, AccountType;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmAux.dstAcctTypeAfterScroll(DataSet: TDataSet);
var
  typeCode, typeName: string;
  concurrent: integer;
  maxTotal: real;
begin
  with DataSet do
  begin
    atype := TAccountType.Create;

    typeCode := FieldByName('acct_type').AsString;
    typeName := FieldByName('acct_type_name').AsString;
    concurrent := FieldByName('max_concurrent').AsInteger;
    maxTotal := FieldByName('max_tot_amt').AsFloat;

    atype.TypeCode := typeCode;
    atype.Name := typeName;
    atype.MaxConcurrent := concurrent;
    atype.MaxTotalAmount := maxTotal;
  end;
end;

procedure TdmAux.dstBanksAfterScroll(DataSet: TDataSet);
begin
  dstBranches.Filter := 'bank_code = ' +
        QuotedStr(DataSet.FieldByName('bank_code').AsString);
end;

procedure TdmAux.dstBranchesBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetBankBranchId;
    DataSet.FieldByName('bank_id').AsString := id;
  end;
end;

procedure TdmAux.dstBranchesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('bank_code').AsString :=
        dstBanks.FieldByName('bank_code').AsString;
end;

procedure TdmAux.dstCompetitorsBeforePost(DataSet: TDataSet);
var
  id: integer;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetCompetitorId;
    DataSet.FieldByName('comp_id').AsInteger := id;
  end;
end;

procedure TdmAux.dstDesignationsBeforePost(DataSet: TDataSet);
var
  id: integer;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetDesignationId;
    DataSet.FieldByName('des_id').AsInteger := id;
  end;
end;

procedure TdmAux.dstPurposeBeforePost(DataSet: TDataSet);
var
  id: integer;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetPurposeId;
    DataSet.FieldByName('purp_id').AsInteger := id;
  end;
end;

end.
