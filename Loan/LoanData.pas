unit LoanData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Rtti, StrUtils,
  System.Variants;

type
  TdmLoan = class(TDataModule)
    dstLoan: TADODataSet;
    dscLoan: TDataSource;
    dstLoanClass: TADODataSet;
    dscLoanClass: TDataSource;
    dstClients: TADODataSet;
    dscClients: TDataSource;
    dstLoanComaker: TADODataSet;
    dscLoanComaker: TDataSource;
    dstAlerts: TADODataSet;
    dscAlerts: TDataSource;
    dscComakers: TDataSource;
    dstComakers: TADODataSet;
    dscFinInfo: TDataSource;
    dstFinInfo: TADODataSet;
    dscMonExp: TDataSource;
    dstMonExp: TADODataSet;
    dstLoanAss: TADODataSet;
    dscLoanAss: TDataSource;
    dstLoanAppv: TADODataSet;
    dscLoanAppv: TDataSource;
    dstLoanCancel: TADODataSet;
    dscLoanCancel: TDataSource;
    dstLoanReject: TADODataSet;
    dscLoanReject: TDataSource;
    dstLoanRelease: TADODataSet;
    dscLoanRelease: TDataSource;
    dstLoanCharge: TADODataSet;
    dscLoanCharge: TDataSource;
    dscLoanClassCharges: TDataSource;
    dstLoanClassCharges: TADODataSet;
    dstLoanReleaseloan_id: TStringField;
    dstLoanReleaserecipient: TStringField;
    dstLoanReleaserel_method: TStringField;
    dstLoanReleaserel_amt: TBCDField;
    dstLoanReleasedate_rel: TDateTimeField;
    dstLoanReleaserel_by: TStringField;
    dstLoanReleaseloc_code: TStringField;
    dstLoanReleaserel_amt_f: TStringField;
    dstLoanReleasedate_rel_f: TStringField;
    dstLoanReleasemethod_name: TStringField;
    dstLoanReleaserecipient_name: TStringField;
    dstLoanReleaseloc_name: TStringField;
    dstClientLoans: TADODataSet;
    procedure dstLoanBeforeOpen(DataSet: TDataSet);
    procedure dstLoanClassBeforeOpen(DataSet: TDataSet);
    procedure dstLoanBeforePost(DataSet: TDataSet);
    procedure dstLoanNewRecord(DataSet: TDataSet);
    procedure dstLoanAfterPost(DataSet: TDataSet);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstLoanAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerBeforeOpen(DataSet: TDataSet);
    procedure dstLoanComakerAfterOpen(DataSet: TDataSet);
    procedure dstAlertsBeforeOpen(DataSet: TDataSet);
    procedure dstFinInfoBeforeOpen(DataSet: TDataSet);
    procedure dstFinInfoAfterOpen(DataSet: TDataSet);
    procedure dstMonExpAfterOpen(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure dstFinInfoBeforePost(DataSet: TDataSet);
    procedure dstLoanAssBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAppvBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAppvBeforePost(DataSet: TDataSet);
    procedure dstStatusesBeforeOpen(DataSet: TDataSet);
    procedure dstLoanAssBeforePost(DataSet: TDataSet);
    procedure dstMonExpBeforeOpen(DataSet: TDataSet);
    procedure dstMonExpBeforePost(DataSet: TDataSet);
    procedure dstLoanAssAfterOpen(DataSet: TDataSet);
    procedure dstLoanAppvAfterOpen(DataSet: TDataSet);
    procedure dstLoanCancelBeforeOpen(DataSet: TDataSet);
    procedure dstLoanCancelBeforePost(DataSet: TDataSet);
    procedure dstLoanCancelAfterOpen(DataSet: TDataSet);
    procedure dstLoanAssAfterPost(DataSet: TDataSet);
    procedure dstLoanAppvAfterPost(DataSet: TDataSet);
    procedure dstLoanCancelAfterPost(DataSet: TDataSet);
    procedure dstLoanRejectAfterOpen(DataSet: TDataSet);
    procedure dstLoanRejectAfterPost(DataSet: TDataSet);
    procedure dstLoanRejectBeforeOpen(DataSet: TDataSet);
    procedure dstLoanRejectBeforePost(DataSet: TDataSet);
    procedure dstAlertsAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerNewRecord(DataSet: TDataSet);
    procedure dstLoanReleaseAfterOpen(DataSet: TDataSet);
    procedure dstLoanReleaseBeforeOpen(DataSet: TDataSet);
    procedure dstLoanReleaseBeforePost(DataSet: TDataSet);
    procedure dstLoanChargeBeforeOpen(DataSet: TDataSet);
    procedure dstLoanChargeAfterOpen(DataSet: TDataSet);
    procedure dstLoanReleaseNewRecord(DataSet: TDataSet);
    procedure dstLoanClassChargesBeforeOpen(DataSet: TDataSet);
    procedure dstLoanReleaseCalcFields(DataSet: TDataSet);
    procedure dstClientLoansBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetLoanClassProperties;
    procedure AddLoanClassCharges;
  public
    { Public declarations }
  end;

var
  dmLoan: TdmLoan;

implementation

uses
  AppData, Loan, DBUtil, IFinanceGlobal, LoanClassification, Comaker, FinInfo,
  MonthlyExpense, Alert, ReleaseRecipient, Recipient, LoanCharge, LoanClassCharge,
  LoanType, Assessment, Location;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmLoan.SetLoanClassProperties;
begin
  with dstLoan do
  begin
    ln.Status := FieldByName('status_id').AsString;
    ln.AppliedAmount := FieldByName('amt_appl').AsCurrency;
    ln.DesiredTerm := FieldByName('des_term').AsInteger;
  end;
end;

procedure TdmLoan.AddLoanClassCharges;
var
  ct, cn: string;
  cv, ratio, max: real;
  vt: TValueType;
begin
  with dstLoanClassCharges, ln do
  begin
    Filter := 'class_id = ' + QuotedStr(IntToStr(ln.LoanClass.ClassificationId));
    First;
    while not Eof do
    begin
      ct := FieldByName('charge_type').AsString;
      cn := FieldByName('charge_name').AsString;
      cv := FieldByName('charge_value').AsFloat;
      vt := TValueType(FieldByName('value_type').AsInteger);
      ratio := FieldByName('ratio_amt').AsFloat;
      max := FieldByName('max_amt').AsFloat;

      LoanClass.AddClassCharge(TLoanClassCharge.Create(ct,cn,cv,vt,ratio,max));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstAlertsAfterOpen(DataSet: TDataSet);
begin
  try
    alrt := TAlert.Create;
    with DataSet, alrt do
    begin
      while not Eof do
      begin
        Add(FieldByName('alert').AsString);
        Next;
      end;
    end;
  finally
    DataSet.Close;
  end;

end;

procedure TdmLoan.dstAlertsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstClientLoansBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstFinInfoAfterOpen(DataSet: TDataSet);
var
  compId: string;
  compName, balance, monthly: string;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssFinInfo';

  ln.ClearFinancialInfo;

  with DataSet do
  begin
    while not Eof do
    begin
      compId := FieldByName('comp_id').AsString;
      compName := FieldByName('comp_name').AsString;
      balance := FieldByName('loan_bal_f').AsString;
      monthly := FieldByName('mon_due_f').AsString;

      ln.AddFinancialInfo(TFinInfo.Create(compId,compName,monthly,balance));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstFinInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstFinInfoBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstLoanAfterOpen(DataSet: TDataSet);
begin
  SetLoanClassProperties;
end;

procedure TdmLoan.dstLoanAfterPost(DataSet: TDataSet);
begin
  SetLoanClassProperties;
end;

procedure TdmLoan.dstLoanAppvAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then
  begin
    ln.AddLoanState(lsApproved);
    ln.ApprovedAmount := DataSet.FieldByName('amt_appv').AsFloat;
    ln.ApprovedTerm := DataSet.FieldByName('terms').AsInteger;
  end;
end;

procedure TdmLoan.dstLoanAppvAfterPost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not ln.HasLoanState(lsApproved) then
    begin
      ln.ChangeLoanStatus;
      ln.AddLoanState(lsApproved);
      ln.ApprovedAmount := FieldByName('amt_appv').AsFloat;
      ln.ApprovedTerm := FieldByName('terms').AsInteger;
    end;
  end;
end;

procedure TdmLoan.dstLoanAppvBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanAppvBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('appv_by').AsString := ifn.User.UserId;
  SetCreatedFields(DataSet);
end;

procedure TdmLoan.dstLoanAssAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then
  begin
    ln.AddLoanState(lsAssessed);
    ln.Assessment := TAssessment.Create(DataSet.FieldByName('rec_code').AsInteger,
                                DataSet.FieldByName('rec_amt').AsFloat);
  end;
end;

procedure TdmLoan.dstLoanAssAfterPost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not ln.HasLoanState(lsAssessed) then
    begin
      ln.ChangeLoanStatus;
      ln.AddLoanState(lsAssessed);
    end;

    ln.Assessment := TAssessment.Create(DataSet.FieldByName('rec_code').AsInteger,
                                DataSet.FieldByName('rec_amt').AsFloat);
  end;
end;

procedure TdmLoan.dstLoanAssBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanAssBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    if ln.Assessment.Recommendation = rcReject then
      DataSet.FieldByName('rec_amt').Value := null;

    DataSet.FieldByName('loan_id').AsString := ln.Id;
    DataSet.FieldByName('ass_by').AsString := ifn.User.UserId;
    SetCreatedFields(DataSet);
  end;
end;

procedure TdmLoan.dstLoanBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  with DataSet do
  begin
    if State = dsInsert then
    begin
      id := GetLoanId;
      FieldByName('loan_id').AsString := id;
      FieldByName('entity_id').AsString := ln.Client.Id;

      SetCreatedFields(DataSet);

      ln.Id := id;
    end
  end;
end;

procedure TdmLoan.dstLoanCancelAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsCancelled);
end;

procedure TdmLoan.dstLoanCancelAfterPost(DataSet: TDataSet);
begin
  if not ln.HasLoanState(lsCancelled) then
  begin
    ln.ChangeLoanStatus;
    ln.AddLoanState(lsCancelled);
  end;
end;

procedure TdmLoan.dstLoanCancelBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanCancelBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('cancelled_by').AsString := ifn.User.UserId;
end;

procedure TdmLoan.dstLoanChargeAfterOpen(DataSet: TDataSet);
var
 chargeType, chargeName: string;
 amt: real;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanCharge';

  ln.ClearLoanCharges;

  with DataSet do
  begin
    while not Eof do
    begin
      chargeType := FieldByName('charge_type').AsString;
      chargeName := FieldByName('charge_name').AsString;
      amt := FieldByName('charge_amt').AsFloat;

      ln.AddLoanCharge(TLoanCharge.Create(chargeType,chargeName,amt));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanChargeBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  // select the topmost loan class as default
  if ln.Action = laCreating then
    if DataSet.RecordCount > 0 then
      dstLoan.FieldByName('class_id').AsInteger := DataSet.FieldByName('class_id').AsInteger;
end;

procedure TdmLoan.dstLoanClassAfterScroll(DataSet: TDataSet);
var
  clId, term, comakers, groupId, age, concurrent, loanType: integer;
  clName, loanTypeName: string;
  interest, maxLoan, maxTotalAmount: real;
  validFrom, validUntil: TDate;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    groupId := FieldByName('grp_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsFloat;
    term := FieldByName('term').AsInteger;
    maxLoan := FieldByName('max_loan').AsFloat;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
    age := FieldByName('max_age').AsInteger;

    // loan type variables
    loanType := FieldByName('loan_type').AsInteger;
    loanTypeName := FieldByName('loan_type_name').AsString;
    concurrent := FieldByName('max_concurrent').AsInteger;
    maxTotalAmount := FieldByName('max_tot_amt').AsFloat;

    ltype := TLoanType.Create(loanType,loanTypeName,concurrent,maxTotalAmount);
  end;

  if not Assigned(ln.LoanClass) then
    ln.LoanClass := TLoanClassification.Create(clId, groupId, clName, interest,
        term, maxLoan, comakers, validFrom, validUntil, age, ltype)
  else
  begin
    with ln do
    begin
      LoanClass.ClassificationId := clId;
      LoanClass.GroupId := groupId;
      LoanClass.ClassificationName := clName;
      LoanClass.Interest := interest;
      LoanClass.Term := term;
      LoanClass.MaxLoan := maxLoan;
      LoanClass.Comakers := comakers;
      LoanClass.ValidFrom := validFrom;
      LoanClass.ValidUntil := validUntil;
      LoanClass.MaxAge := age;
      ln.LoanClass.LoanType := ltype;
    end;
  end;

  AddLoanClassCharges;
end;

procedure TdmLoan.dstLoanClassBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@new_loan').Value :=
        StrToInt(IfThen((ln.New) or (ln.IsPending),'1','0'));

  // open class charges
  dstLoanClassCharges.Close;
  dstLoanClassCharges.Open;
end;

procedure TdmLoan.dstLoanClassChargesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstLoanComakerAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanComaker';
  with DataSet do
  begin
    First;
    while not Eof do
    begin
      ln.AddComaker(TComaker.Create(FieldByName('name').AsString,
        FieldByName('entity_id').AsString));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanComakerBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanComakerNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstLoanNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('orig_branch').AsString := ifn.LocationCode;
  DataSet.FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
  DataSet.FieldByName('date_appl').AsDateTime := ifn.AppDate;
end;

procedure TdmLoan.dstLoanRejectAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsRejected);
end;

procedure TdmLoan.dstLoanRejectAfterPost(DataSet: TDataSet);
begin
  if not ln.HasLoanState(lsRejected) then
  begin
    ln.ChangeLoanStatus;
    ln.AddLoanState(lsRejected);
  end;
end;

procedure TdmLoan.dstLoanRejectBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanRejectBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('rejected_by').AsString := ifn.User.UserId;
end;

procedure TdmLoan.dstLoanReleaseAfterOpen(DataSet: TDataSet);
var
  amt: real;
  dt: TDate;
  relId, relName: string;
  recipientId, recipientName, locCode: string;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanRelease';

  if not DataSet.IsEmpty then ln.AddLoanState(lsActive);

  ln.ClearReleaseRecipients;

  with DataSet do
  begin
    while not Eof do
    begin
      amt := FieldByName('rel_amt').AsFloat;
      dt := FieldByName('date_rel').AsDateTime;
      locCode := FieldByName('loc_code').AsString;
      relId := FieldByName('rel_method').AsString;
      relName := FieldByName('method_name').AsString;
      recipientId := FieldByName('recipient').AsString;
      recipientName := FieldByName('recipient_name').AsString;

      ln.AddReleaseRecipient(TReleaseRecipient.Create(
          TRecipient.Create(recipientId,recipientName),
          TReleaseMethod.Create(relId,relName),
          locCode,ifn.GetLocationNameByCode(locCode),
          amt,dt));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanReleaseBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanReleaseBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
  DataSet.FieldByName('rel_by').AsString := ifn.User.UserId;
end;

procedure TdmLoan.dstLoanReleaseCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('loc_name').AsString :=
        ifn.GetLocationNameByCode(Trim(FieldByName('loc_code').AsString));
end;

procedure TdmLoan.dstLoanReleaseNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('date_rel').AsDateTime := ifn.AppDate;
    FieldByName('rel_by').AsString := ifn.User.UserId;
    FieldByName('loc_code').AsString := ifn.LocationCode;
  end;
end;

procedure TdmLoan.dstMonExpAfterOpen(DataSet: TDataSet);
var
  expType, expName, expAmount: string;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssMonExp';

  ln.ClearMonthlyExpenses;

  with DataSet do
  begin
    while not Eof do
    begin
      expType := FieldByName('exp_type').AsString;
      expName := FieldByName('exp_name').AsString;
      expAmount := FieldByName('monthly_f').AsString;

      ln.AddMonthlyExpense(TMonthlyExpense.Create(expType,expName,expAmount));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstMonExpBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstMonExpBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstStatusesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

end.
