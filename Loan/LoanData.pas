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
    dscLedger: TDataSource;
    dstLedger: TADODataSet;
    dstLedgerdue: TDateTimeField;
    dstLedgerdebit_amt_p: TBCDField;
    dstLedgercredit_amt_p: TBCDField;
    dstLedgerbalance_p: TBCDField;
    dstLedgerdebit_amt_i: TBCDField;
    dstLedgercredit_amt_i: TBCDField;
    dstLedgerbalance_i: TBCDField;
    dstLedgersort_order: TSmallintField;
    dstLedgerdocument_no: TStringField;
    dstLoanClose: TADODataSet;
    dscLoanClose: TDataSource;
    dstAdvancePayment: TADODataSet;
    dstLoanClassAdvance: TADODataSet;
    dscPromissoryNotes: TDataSource;
    dstPromissoryNotes: TADODataSet;
    dstLedgerid: TStringField;
    dstLedgerprincipal_deficit: TBCDField;
    dstLedgerinterest_deficit: TBCDField;
    dstSchedule: TADODataSet;
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
    procedure dstLedgerBeforeOpen(DataSet: TDataSet);
    procedure dstLoanCloseAfterOpen(DataSet: TDataSet);
    procedure dstLoanCloseAfterPost(DataSet: TDataSet);
    procedure dstLoanCloseBeforeOpen(DataSet: TDataSet);
    procedure dstLoanCloseBeforePost(DataSet: TDataSet);
    procedure dstAdvancePaymentBeforeOpen(DataSet: TDataSet);
    procedure dstAdvancePaymentAfterOpen(DataSet: TDataSet);
    procedure dstLoanClassAdvanceBeforeOpen(DataSet: TDataSet);
    procedure dstPromissoryNotesBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetLoanClassProperties;
    procedure AddLoanClassCharges;
    procedure AddLoanClassAdvancePayment;
  public
    { Public declarations }
  end;

var
  dmLoan: TdmLoan;

implementation

uses
  AppData, Loan, DBUtil, IFinanceGlobal, LoanClassification, Comaker, FinInfo,
  MonthlyExpense, Alert, ReleaseRecipient, Recipient, LoanCharge, LoanClassCharge,
  LoanType, Assessment, Location, Group, AppConstants, LoanClassAdvance;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmLoan.SetLoanClassProperties;
begin
  with dstLoan do
  begin
    ln.Status := FieldByName('status_id').AsString;
    ln.AppliedAmount := FieldByName('amt_appl').AsCurrency;
    ln.DesiredTerm := FieldByName('des_term').AsInteger;
    ln.DateApplied := FieldByName('date_appl').AsDateTime;
    ln.Balance := FieldByName('balance').AsCurrency;
    ln.InterestDeficit := FieldByName('int_deficit').AsCurrency;
    ln.LastInterestPostDate := FieldByName('last_interest_post_date').AsDateTime;

    if FieldByName('last_trans_date').AsString = '' then ln.LastTransactionDate := ifn.AppDate
    else ln.LastTransactionDate := FieldByName('last_trans_date').AsDateTime;
  end;
end;

procedure TdmLoan.AddLoanClassAdvancePayment;
var
  LLoanClassAdvance: TLoanClassAdvance;
begin
  with dstLoanClassAdvance do
  begin
    ln.LoanClass.RemoveAdvancePayment;
    Filter := 'class_id = ' + QuotedStr(IntToStr(ln.LoanClass.ClassificationId));
    if RecordCount > 0 then
    begin
      LLoanClassAdvance := TLoanClassAdvance.Create;
      LLoanClassAdvance.Interest := FieldByName('int').AsInteger;
      LLoanClassAdvance.Principal := FieldByName('principal').AsInteger;
      LLoanClassAdvance.AdvanceMethod := TAdvanceMethod(FieldByName('advance_method').AsInteger);
      LLoanClassAdvance.IncludePrincipal := FieldByName('include_principal').AsBoolean;

      ln.LoanClass.AdvancePayment := LLoanClassAdvance;
    end;
  end;
end;

procedure TdmLoan.AddLoanClassCharges;
var
  ct, cn: string;
  cv, ratio, max: real;
  vt: TValueType;
  maxType: TMaxValueType;
  forNew, forRenewal, forRestructure, forReloan: boolean;
begin
  with dstLoanClassCharges, ln do
  begin
    Filter := 'class_id = ' + QuotedStr(IntToStr(ln.LoanClass.ClassificationId));
    First;
    while not Eof do
    begin
      ct := FieldByName('charge_type').AsString;
      cn := FieldByName('charge_name').AsString;
      cv := FieldByName('charge_value').AsCurrency;
      vt := TValueType(FieldByName('value_type').AsInteger);
      ratio := FieldByName('ratio_amt').AsCurrency;
      max := FieldByName('max_value').AsCurrency;
      maxType := TMaxValueType(FieldByName('max_value_type').AsInteger);
      forNew := FieldByName('for_new').AsInteger = 1;
      forRenewal := FieldByName('for_renew').AsInteger = 1;
      forRestructure := FieldByName('for_restructure').AsInteger = 1;
      forReloan := FieldByName('for_reloan').AsInteger = 1;

      LoanClass.AddClassCharge(TLoanClassCharge.Create(ct,cn,cv,vt,ratio,max,maxType,
        forNew, forRenewal, forRestructure, forReloan));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstAdvancePaymentAfterOpen(DataSet: TDataSet);
var
  adv: TAdvancePayment;
  paymentType: string;
begin
  try
    with DataSet do
    begin
      ln.ClearAdvancePayments;

      First;

      while not Eof do
      begin
        adv := TAdvancePayment.Create;

        // interest
        paymentType := FieldByName('payment_type').AsString;
        if paymentType = TRttiEnumerationType.GetName<TPaymentTypes>(TPaymentTypes.INT) then
          adv.Interest := FieldByName('payment_amt').AsCurrency;

        Next;

        // principal
        paymentType := FieldByName('payment_type').AsString;
        if paymentType = TRttiEnumerationType.GetName<TPaymentTypes>(TPaymentTypes.PRN) then
        begin
          adv.Principal := FieldByName('payment_amt').AsCurrency;
          Next;
        end;

        ln.AddAdvancePayment(adv);
      end;
    end;
  finally
    DataSet.Close;
  end;
end;

procedure TdmLoan.dstAdvancePaymentBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
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

procedure TdmLoan.dstLedgerBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@as_of_date').Value := ifn.AppDate;
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
    ln.ApprovedAmount := DataSet.FieldByName('amt_appv').AsCurrency;
    ln.ApprovedTerm := DataSet.FieldByName('terms').AsInteger;
  end;
end;

procedure TdmLoan.dstLoanAppvAfterPost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not ln.IsBacklog then
    begin
      if not ln.HasLoanState(lsApproved) then
      begin
        ln.ChangeLoanStatus;
        ln.AddLoanState(lsApproved);
      end;
    end;

    ln.ApprovedAmount := FieldByName('amt_appv').AsCurrency;
    ln.ApprovedTerm := FieldByName('terms').AsInteger;
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
                                DataSet.FieldByName('rec_amt').AsCurrency);
  end;
end;

procedure TdmLoan.dstLoanAssAfterPost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if not ln.IsBacklog then
    begin
      if not ln.HasLoanState(lsAssessed) then
      begin
        ln.ChangeLoanStatus;
        ln.AddLoanState(lsAssessed);
      end;

      ln.Assessment := TAssessment.Create(DataSet.FieldByName('rec_code').AsInteger,
                                  DataSet.FieldByName('rec_amt').AsCurrency);
    end;
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
    if not ln.IsBacklog then
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
      amt := FieldByName('charge_amt').AsCurrency;

      ln.AddLoanCharge(TLoanCharge.Create(chargeType,chargeName,amt));

      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanChargeBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanClassAdvanceBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
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
  clId, trm, cmakersMin, cmakersMax, age, loanType, idDocs: integer;
  clName, loanTypeName, intCompMethod: string;
  intrst, maxLn: currency;
  validFr, validUn: TDate;
  gp: TGroup;
  gpa: TGroupAttributes;
  dimType: TDiminishingType;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    intrst := FieldByName('int_rate').AsCurrency;
    trm := FieldByName('term').AsInteger;
    maxLn := FieldByName('max_loan').AsCurrency;
    cmakersMin := FieldByName('comakers_min').AsInteger;
    cmakersMax := FieldByName('comakers_max').AsInteger;
    validFr := FieldByName('valid_from').AsDateTime;
    validUn := FieldByName('valid_until').AsDateTime;
    age := FieldByName('max_age').AsInteger;
    intCompMethod := FieldByName('int_comp_method').Asstring;
    dimType := TDiminishingType(FieldByName('dim_type').AsInteger);

    // loan type variables
    loanType := FieldByName('loan_type').AsInteger;
    loanTypeName := FieldByName('loan_type_name').AsString;
    // concurrent := FieldByName('max_concurrent').AsInteger;
    // maxLoanTypeAmt := FieldByName('max_loantype_amount').AsCurrency;
    idDocs := FieldByName('ident_docs').AsInteger;

    ltype := TLoanType.Create(loanType,loanTypeName);

    // group
    gp := TGroup.Create;
    gp.GroupId := FieldByName('grp_id').AsString;
    gp.GroupName := FieldByName('grp_name').AsString;

    // group attributes
    gpa := TGroupAttributes.Create;
    gpa.MaxConcurrent := FieldByName('concurrent').AsInteger;
    gpa.MaxTotalAmount := FieldByName('max_group_amount').AsCurrency;
    gpa.IdentityDocs := idDocs;
    gp.Attributes := gpa;
  end;

  if not Assigned(ln.LoanClass) then
    ln.LoanClass := TLoanClassification.Create(clId, clName, intrst,
        trm, maxLn, cmakersMin, cmakersMax, validFr, validUn, age, ltype, gp,
        intCompMethod, dimType)
  else
  begin
    with ln.LoanClass do
    begin
      ClassificationId := clId;
      ClassificationName := clName;
      Interest := intrst;
      Term := trm;
      MaxLoan := maxLn;
      ComakersMin := cmakersMin;
      ComakersMax := cmakersMax;
      ValidFrom := validFr;
      ValidUntil := validUn;
      MaxAge := age;
      LoanType := ltype;
      Group := gp;
      InterestComputationMethod := intCompMethod;
      DiminishingType := dimType;
    end;
  end;

  AddLoanClassCharges;
  AddLoanClassAdvancePayment;
end;

procedure TdmLoan.dstLoanClassBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@new_loan').Value :=
        StrToInt(IfThen((ln.New) or (ln.IsPending),'1','0'));

  // open class charges
  dstLoanClassCharges.Close;
  dstLoanClassCharges.Open;

  // advance payment details
  dstLoanClassAdvance.Close;
  dstLoanClassAdvance.Open;
end;

procedure TdmLoan.dstLoanClassChargesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstLoanCloseAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then ln.AddLoanState(lsClosed);
end;

procedure TdmLoan.dstLoanCloseAfterPost(DataSet: TDataSet);
begin
  if not ln.HasLoanState(lsClosed) then
  begin
    ln.ChangeLoanStatus;
    ln.AddLoanState(lsClosed);
  end;
end;

procedure TdmLoan.dstLoanCloseBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanCloseBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
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
end;

procedure TdmLoan.dstLoanReleaseAfterOpen(DataSet: TDataSet);
var
  amt, total: currency;
  dt: TDate;
  relId, relName: string;
  recipientId, recipientName, locCode: string;
begin
  if not ln.IsBacklog then
  begin
    (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanRelease';

    if not DataSet.IsEmpty then ln.AddLoanState(lsActive);

    ln.ClearReleaseRecipients;

    total := 0;

    with DataSet do
    begin
      while not Eof do
      begin
        amt := FieldByName('rel_amt').AsCurrency;
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

        total := total + amt;
        Next;
      end;
    end;

    ln.ReleaseAmount := total;
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

procedure TdmLoan.dstPromissoryNotesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstStatusesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;


end.
