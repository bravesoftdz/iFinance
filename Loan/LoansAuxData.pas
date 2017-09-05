unit LoansAuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.Controls, Vcl.ImgList, JvImageList;

type
  TdmLoansAux = class(TDataModule)
    dscLoanClass: TDataSource;
    dstLoanClass: TADODataSet;
    dscClassCharges: TDataSource;
    dstClassCharges: TADODataSet;
    dscChargeType: TDataSource;
    dstChargeType: TADODataSet;
    dscCompetitors: TDataSource;
    dstCompetitors: TADODataSet;
    dscExpType: TDataSource;
    dstExpType: TADODataSet;
    dstAppvMethod: TADODataSet;
    dscAppvMethod: TDataSource;
    dstCancelReason: TADODataSet;
    dscCancelReason: TDataSource;
    dstRejectReason: TADODataSet;
    dscRejectReason: TDataSource;
    dstReleaseMethod: TADODataSet;
    dscReleaseMethod: TDataSource;
    dstPurpose: TADODataSet;
    dscPurpose: TDataSource;
    dstBranches: TADODataSet;
    dscBranches: TDataSource;
    dstLoanTypes: TADODataSet;
    dscLoanTypes: TDataSource;
    dstAcctTypes: TADODataSet;
    dscAcctTypes: TDataSource;
    dstRecommendation: TADODataSet;
    dscRecommendation: TDataSource;
    dstClassChargesclass_id: TIntegerField;
    dstClassChargescharge_type: TStringField;
    dstClassChargescharge_value: TBCDField;
    dstClassChargesvalue_type: TWordField;
    dstClassChargesratio_amt: TBCDField;
    dstClassChargesfor_new: TWordField;
    dstClassChargesfor_renew: TWordField;
    dstClassChargescharge_name: TStringField;
    dstClassChargescharge_value_f: TStringField;
    dstClassChargesratio_amt_f: TStringField;
    dstClassChargesfor_new_f: TStringField;
    dstClassChargesfor_renew_f: TStringField;
    dstClassChargesvalue_type_desc: TStringField;
    dstClassChargesfor_reloan: TWordField;
    dstClassChargesfor_restructure: TWordField;
    dstClassChargesfor_restructure_f: TStringField;
    dstClassChargesfor_reloan_f: TStringField;
    dstClassChargesmax_value: TBCDField;
    dstClassChargesmax_value_type: TWordField;
    dstClassChargesmax_value_f: TStringField;
    procedure dstLoanClassBeforePost(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstLoanClassAfterPost(DataSet: TDataSet);
    procedure dstClassChargesNewRecord(DataSet: TDataSet);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstClassChargesBeforePost(DataSet: TDataSet);
    procedure dstClassChargesAfterPost(DataSet: TDataSet);
    procedure dstClassChargesAfterOpen(DataSet: TDataSet);
    procedure dstClassChargesBeforeOpen(DataSet: TDataSet);
    procedure dstLoanTypesBeforePost(DataSet: TDataSet);
    procedure dstAcctTypesBeforePost(DataSet: TDataSet);
    procedure dstAcctTypesAfterPost(DataSet: TDataSet);
    procedure dstLoanTypesAfterPost(DataSet: TDataSet);
    procedure dstRecommendationAfterScroll(DataSet: TDataSet);
    procedure dstClassChargesCalcFields(DataSet: TDataSet);
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
  AppData, DBUtil, LoanClassification, LoanClassCharge, LoanType, Loan,
  Assessment, Group;

procedure TdmLoansAux.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  // close all datasets
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TADODataSet then
      (Components[i] as TADODataSet).Close;
end;

procedure TdmLoansAux.dstAcctTypesAfterPost(DataSet: TDataSet);
var
  id: integer;
begin
  with DataSet do
  begin
    id := FieldbyName('acct_type').AsInteger;
    RefreshDataSet(id,'acct_type',DataSet);
  end;
end;

procedure TdmLoansAux.dstAcctTypesBeforePost(DataSet: TDataSet);
begin
  with DataSet do
    if State = dsInsert then FieldByName('acct_type').AsInteger := GetAccountTypeId;
end;

procedure TdmLoansAux.dstClassChargesAfterOpen(DataSet: TDataSet);
var
  ct,cn: string;
  cv, ratio, max: real;
  vt: TValueType;
  maxType: TMaxValueType;
  forNew, forRenewal, forRestructure, forReloan: boolean;
begin
  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'LoanClassCharge';

  with DataSet do
  begin
    DisableControls;
    while not Eof do
    begin
      ct := FieldByName('charge_type').AsString;
      cn := FieldByName('charge_name').AsString;
      cv := FieldByName('charge_value').AsFloat;
      vt := TValueType(FieldByName('value_type').AsInteger);
      ratio := FieldByName('ratio_amt').AsFloat;
      max := FieldByName('max_value').AsFloat;
      maxType := TMaxValueType(FieldByName('max_value_type').AsInteger);
      forNew := FieldByName('for_new').AsInteger = 1;
      forRenewal := FieldByName('for_renew').AsInteger = 1;
      forRestructure := FieldByName('for_restructure').AsInteger = 1;
      forReloan := FieldByName('for_reloan').AsInteger = 1;

      lnc.AddClassCharge(TLoanClassCharge.Create(ct,cn,cv,vt,ratio,max,maxType,
        forNew,forRenewal,forRestructure,forReloan));

      Next;
    end;
    First;
    EnableControls;
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
  if Assigned(lnc) then
    (DataSet as TADODataSet).Parameters.ParamByName('@class_id').Value := lnc.ClassificationId;
end;

procedure TdmLoansAux.dstClassChargesBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('class_id').AsInteger := lnc.ClassificationId;
end;

procedure TdmLoansAux.dstClassChargesCalcFields(DataSet: TDataSet);
var
  desc: string;
begin
  with DataSet do
  begin
    if TValueType(FieldByName('value_type').AsInteger) = vtFixed  then
      desc := 'Fixed amount'
    else if TValueType(FieldByName('value_type').AsInteger) = vtPercentage  then
      desc := 'Percentage'
    else if TValueType(FieldByName('value_type').AsInteger) = vtRatio  then
      desc := 'Ratio';

    FieldByName('value_type_desc').AsString := desc;
  end;
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
  clId, term, comakers, age: integer;
  clName, groupId, intCompMethod: string;
  interest, maxLoan: real;
  validFrom, validUntil: TDate;
  lt: TLoanType;
  gp: TGroup;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    groupId := FieldByName('grp_id').AsString;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsFloat;
    term := FieldByName('term').AsInteger;
    maxLoan := FieldByName('max_loan').AsFloat;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
    age := FieldByName('max_age').AsInteger;
    intCompMethod := FieldByName('int_comp_method').AsString;

    lt := TLoanType.Create(FieldByName('loan_type').AsInteger,
        FieldByName('loan_type_name').AsString);

    gp := TGroup.Create;
    gp.GroupId := FieldByName('grp_id').AsString;
    gp.GroupName := FieldByName('grp_name').AsString;
  end;

  if not Assigned(lnc) then
    lnc := TLoanClassification.Create(clId, clName, interest,
        term, maxLoan, comakers, validFrom, validUntil, age,lt, gp, intCompMethod)
  else
  begin
    lnc.ClassificationId := clId;
    lnc.ClassificationName := clName;
    lnc.Interest := interest;
    lnc.Term := term;
    lnc.MaxLoan := maxLoan;
    lnc.Comakers := comakers;
    lnc.ValidFrom := validFrom;
    lnc.ValidUntil := validUntil;
    lnc.MaxAge := age;
    lnc.LoanType := lt;
    lnc.Group := gp;

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

procedure TdmLoansAux.dstLoanTypesAfterPost(DataSet: TDataSet);
var
  loanType: integer;
begin
  loanType := DataSet.FieldByName('loan_type').AsInteger;
  RefreshDataSet(loanType,'loan_type',DataSet);
end;

procedure TdmLoansAux.dstLoanTypesBeforePost(DataSet: TDataSet);
begin
  with DataSet do
    if State = dsInsert then FieldByName('loan_type').AsInteger := GetLoanTypeId;
end;

procedure TdmLoansAux.dstRecommendationAfterScroll(DataSet: TDataSet);
var
  rec: integer;
begin
  rec :=  DataSet.FieldbyName('value').AsInteger;

  if not Assigned(ln.Assessment) then ln.Assessment := TAssessment.Create(rec,0)
  else ln.Assessment.Recommendation := TRecommendation(rec);
end;

end.
