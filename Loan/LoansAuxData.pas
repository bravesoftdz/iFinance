unit LoansAuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.Controls;

type
  TdmLoansAux = class(TDataModule)
    dscLoanClass: TDataSource;
    dstLoanClass: TADODataSet;
    dscClassCharges: TDataSource;
    dstClassCharges: TADODataSet;
    dscChargeType: TDataSource;
    dstChargeType: TADODataSet;
    procedure dstLoanClassBeforePost(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstLoanClassAfterPost(DataSet: TDataSet);
    procedure dstClassChargesNewRecord(DataSet: TDataSet);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstClassChargesBeforePost(DataSet: TDataSet);
    procedure dstClassChargesAfterPost(DataSet: TDataSet);
    procedure dstClassChargesAfterOpen(DataSet: TDataSet);
    procedure dstClassChargesBeforeOpen(DataSet: TDataSet);
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
  AppData, DBUtil, LoanClassification, LoanClassCharge;

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

procedure TdmLoansAux.dstClassChargesAfterOpen(DataSet: TDataSet);
var
  ct: string;
  cv: real;
  vt: TValueType;
begin
  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'LoanClassCharge';

  with DataSet do
    while not Eof do
    begin
      ct := FieldByName('charge_type').AsString;
      cv := FieldByName('charge_value').AsFloat;
      vt := TValueType(FieldByName('value_type').AsInteger);

      lnc.AddClassCharge(TLoanClassCharge.Create(ct,cv,vt));

      Next;
    end;
end;

procedure TdmLoansAux.dstClassChargesAfterPost(DataSet: TDataSet);
var
  ct: string;
  cv: real;
  vt: TValueType;
begin
  with DataSet do
  begin
    ct := FieldByName('charge_type').AsString;
    cv := FieldByName('charge_value').AsFloat;
    vt := TValueType(FieldByName('value_type').AsInteger);

    lnc.AddClassCharge(TLoanClassCharge.Create(ct,cv,vt));

    RefreshDataSet(ct,'charge_type',DataSet);
  end;
end;

procedure TdmLoansAux.dstClassChargesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@class_id').Value := lnc.ClassificationId;
end;

procedure TdmLoansAux.dstClassChargesBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('class_id').AsInteger := lnc.ClassificationId;
end;

procedure TdmLoansAux.dstClassChargesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('value_type').Value := LoanClassCharge.vtFixed;
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
  clId, term, comakers, groupId: integer;
  clName, loanType: string;
  interest, maxLoan: real;
  validFrom, validUntil: TDate;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    groupId := FieldByName('grp_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsFloat;
    term := FieldByName('term').AsInteger;
    loanType := FieldByName('loan_type').AsString;
    maxLoan := FieldByName('max_loan').AsFloat;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
  end;

  if not Assigned(lnc) then
    lnc := TLoanClassification.Create(clId, groupId, clName, interest,
        term, loanType, maxLoan, comakers, validFrom, validUntil)
  else
  begin
    lnc.ClassificationId := clId;
    lnc.GroupId := groupId;
    lnc.ClassificationName := clName;
    lnc.Interest := interest;
    lnc.Term := term;
    lnc.LoanType := loanType;
    lnc.MaxLoan := maxLoan;
    lnc.Comakers := comakers;
    lnc.ValidFrom := validFrom;
    lnc.ValidUntil := validUntil;

    lnc.EmptyClassCharges;
  end;

  // refresh charges dataset
  // TODO: find a better solution
  dstClassCharges.Close;
  dstClassCharges.Open;
end;

procedure TdmLoansAux.dstLoanClassBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('class_id').AsInteger := GetLoanClassId;
end;

end.
