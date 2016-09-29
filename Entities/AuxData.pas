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
    procedure dstBranchesBeforePost(DataSet: TDataSet);
    procedure dstBanksAfterScroll(DataSet: TDataSet);
    procedure dstBranchesNewRecord(DataSet: TDataSet);
    procedure dstDesignationsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAux: TdmAux;

implementation

uses
  AppData, DBUtil;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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

end.
