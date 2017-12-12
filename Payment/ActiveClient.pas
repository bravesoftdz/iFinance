unit ActiveClient;

interface

uses
  AppConstants, System.Rtti, SysUtils, DateUtils, Ledger;

type

  TLoan = class
  strict private
    FId: string;
    FLoanTypeName: string;
    FAccountTypeName: string;
    FBalance: currency;
    FInterestMethod: string;
    FPrincipalDue: currency;
    FInterestDue: currency;
    FIsScheduled: boolean;
    FLastTransactionDate: TDateTime;
    FInterestInDecimal: currency;
    FInterestBalance: currency;
    FInterestAdditional: currency;
    FInterestComputed: currency;
    FLedger: array of TLedger;
    FPayments: integer;
    FReleaseAmount: currency;
    FApprovedTerm: integer;
    FFullpaymentInterest: currency;

    function GetIsDiminishing: boolean;
    function GetIsFixed: boolean;

    function GetLedger(const i: integer): TLedger;
    function GetIsFirstPayment: boolean;
    function GetNextPayment: TDateTime;

    procedure GetInterestDue(const paymentDate: TDateTime); overload;
    procedure GetPrincipalDue(const paymentDate: TDateTime);

    function GetLedgerCount: integer;
    function GetHasInterestBalance: boolean;
    function GetHasInterestComputed: boolean;
    function GetHasInterestDue: boolean;
    function GetHasInterstAdditional: boolean;
    function GetInterestTotalDue: currency;
    function GetInterestDue: currency; overload;
    function GetLatestInterestDate(const paymentDate: TDateTime): TDateTime;
    function GetInterestMethodName: string;

  public
    property Id: string read FId write FId;
    property Balance: currency read FBalance write FBalance;
    property LoanTypeName: string read FLoanTypeName write FLoanTypeName;
    property AccountTypeName: string read FAccountTypeName write FAccountTypeName;
    property InterestMethod: string write FInterestMethod;
    property IsDiminishing: boolean read GetIsDiminishing;
    property IsFixed: boolean read GetIsFixed;
    property PrincipalDue: currency read FPrincipalDue;
    property InterestDue: currency read GetInterestDue;
    property IsScheduled: boolean read FIsScheduled write FIsScheduled;
    property LastTransactionDate: TDateTime read FLastTransactionDate write FLastTransactionDate;
    property InterestInDecimal: currency read FInterestInDecimal write FInterestInDecimal;
    property NextPayment: TDateTime read GetNextPayment;
    property InterestBalance: currency read FInterestBalance write FInterestBalance;
    property Ledger[const i: integer]: TLedger read GetLedger;
    property IsFirstPayment: boolean read GetIsFirstPayment;
    property LedgerCount: integer read GetLedgerCount;
    property InterestAdditional: currency read FInterestAdditional;
    property InterestComputed: currency read FInterestComputed;
    property HasInterestDue: boolean read GetHasInterestDue;
    property HasInterestBalance: boolean read GetHasInterestBalance;
    property HasInterestComputed: boolean read GetHasInterestComputed;
    property HasInterestAdditional: boolean read GetHasInterstAdditional;
    property InterestTotalDue: currency read GetInterestTotalDue;
    property ReleaseAmount: currency read FReleaseAmount write FReleaseAmount;
    property ApprovedTerm: integer read FApprovedTerm write FApprovedTerm;
    property FullPaymentInterest: currency read FFullPaymentInterest;
    property Payments: integer write FPayments;
    property InterestMethodName: string read GetInterestMethodName;

    procedure GetPaymentDue(const paymentDate: TDateTime);
    procedure RetrieveLedger;
    procedure ClearLedger;
    procedure AddLedger(const ALedger: TLedger);
  end;

  TActiveClient = class
  private
    FId: string;
    FName: string;
    FLoans: array of TLoan;

    function GetLoan(const i: integer): TLoan;
    function GetLoanCount: integer;

  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property ActiveLoans[const i: integer]: TLoan read GetLoan;
    property ActiveLoansCount: integer read GetLoanCount;

    procedure AddLoan(const ln: TLoan);
    procedure RetrieveActiveLoans;

    function IndexOf(const loan: TLoan): integer;

    constructor Create;
  end;

var
  activeCln: TActiveClient;

implementation

uses
  PaymentData, IFinanceGlobal, IFinanceDialogs;

constructor TActiveClient.Create;
begin
  if activeCln = nil then inherited Create
  else activeCln := self;
end;

procedure TActiveClient.AddLoan(const ln: TLoan);
begin
  SetLength(FLoans,Length(FLoans)+1);
  FLoans[Length(FLoans)-1] := ln;
end;

procedure TActiveClient.RetrieveActiveLoans;
var
  loan: TLoan;
begin
  // check if loans have been retrieved
  // retrieve only once
  if Length(FLoans) > 0 then Exit;

  try
    with dmPayment.dstActiveLoans do
    begin
      Open;
      while not Eof do
      begin
        loan := TLoan.Create;

        loan.Id := FieldByName('loan_id').AsString;
        loan.Balance := FieldByName('balance').AsCurrency;
        loan.LoanTypeName := FieldByName('loan_type_name').AsString;
        loan.AccountTypeName := FieldByName('acct_type_name').AsString;
        loan.InterestMethod := FieldByName('int_comp_method').AsString;
        loan.IsScheduled := FieldByName('is_scheduled').AsBoolean;
        loan.LastTransactionDate := FieldByName('last_transaction_date').AsDateTime;
        loan.InterestInDecimal := FieldByName('int_rate').AsCurrency / 100;
        loan.ApprovedTerm := FieldByName('terms').AsInteger;
        loan.ReleaseAmount := FieldByName('rel_amt').AsCurrency;
        loan.Payments := FieldByName('payments').AsInteger;

        AddLoan(loan);

        Next;
      end;
    end;
  finally
    dmPayment.dstActiveLoans.Close;
  end;
end;

function TActiveClient.GetLoan(const i: integer): TLoan;
begin
  Result := FLoans[i];
end;

function TActiveClient.GetLoanCount: integer;
begin
  Result := Length(FLoans);
end;

function TActiveClient.IndexOf(const loan: TLoan): integer;
var
  i: integer;
  l: TLoan;
begin

  for i := Low(FLoans) to High(FLoans) do
  begin
    l := FLoans[i];
    if l.Id = loan.Id then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

{ TLoan }

procedure TLoan.AddLedger(const ALedger: TLedger);
begin
  SetLength(FLedger,Length(FLedger)+1);
  FLedger[Length(FLedger)-1] := ALedger;
end;

procedure TLoan.ClearLedger;
var
  LLedger: TLedger;
  i: integer;
begin
  for i := Low(FLedger) to High(FLedger) do
  begin
    LLedger := FLedger[i];
    FreeAndNil(LLedger);
  end;
  SetLength(FLedger,0);
end;

function TLoan.GetHasInterestBalance: boolean;
begin
  Result := FInterestBalance > 0;
end;

function TLoan.GetHasInterestComputed: boolean;
begin
  Result := FInterestComputed > 0;
end;

function TLoan.GetHasInterestDue: boolean;
begin
  Result := FInterestDue > 0;
end;

function TLoan.GetHasInterstAdditional: boolean;
begin
  Result := FInterestAdditional > 0;
end;

procedure TLoan.GetInterestDue(const paymentDate: TDateTime);
var
  due, additional, balance, computed, full: currency;
  LLedger, debitLedger: TLedger;
  days: integer;
  py, pm, pd, vy, vm, vd: word;
begin
  due := 0;         // payment on schedule date
  additional := 0;  // payment after schedule date
  balance := 0;     // balance of previous interest
  computed := 0;    // payment before schedule date
  full := 0;        // full payment

  // will be used only for fixed accounts
  // or diminishing scheduled accounts
  DecodeDate(paymentDate,py,pm,pd);

  // get any open accounts in the ledger
  // can either be scheduled interest, balance of previous or both
  for LLedger in FLedger do
  begin
    if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR))
       and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS))then
    begin
      if (IsDiminishing) and (not IsScheduled) then
      begin
        if LLedger.ValueDate <= paymentDate then
        begin
          // if LLedger.ValueDate = NextPayment then due := LLedger.Debit
          if LLedger.HasPartial then balance := balance + LLedger.Debit
          else due := due + LLedger.Debit;
        end;
      end
      else
      begin
        DecodeDate(LLedger.ValueDate,vy,vm,vd);

        // only get the due for the month..
        if (vm = pm) and (vy = py) then due := LLedger.Debit
        else if (vm < pm) and (vy <= py) then balance := balance + LLedger.Debit;
      end;
    end;
  end;

  // additional interest
  // payment is made before or after schedule date
  if (IsDiminishing) and (not IsScheduled) then
  begin
    if (paymentDate <> NextPayment) and (paymentDate <> FLastTransactionDate) then
    begin
      debitLedger := TLedger.Create;

      debitLedger.EventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR);
      debitLedger.CaseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
      debitLedger.ValueDate := paymentDate;
      debitLedger.CurrentStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
      debitLedger.Credit := 0;

      if paymentDate < NextPayment then  // before schedule
      begin
        days := DaysBetween(paymentDate,FLastTransactionDate);

        // check if this is the first payment
        // check the rules for first payment
        if IsFirstPayment then
        begin
          if ((days >= ifn.Rules.FirstPayment.MinDaysHalfInterest) and
            (days <= ifn.Rules.FirstPayment.MaxDaysHalfInterest))  then
            computed := (FBalance * FInterestInDecimal * ifn.HalfMonth) / ifn.DaysInAMonth
          else computed := FBalance * FInterestInDecimal;
        end
        else computed := (FBalance * FInterestInDecimal * days) / ifn.DaysInAMonth;

        debitLedger.Debit := computed;
      end
      else // after schedule
      begin
        days := DaysBetween(NextPayment,paymentDate);
        additional := (FBalance * FInterestInDecimal * days) / ifn.DaysInAMonth;
        debitLedger.Debit := additional;
      end;

      AddLedger(debitLedger);
    end;
  end
  else // for full payment
  begin
    // note: set the FullpPayment property to true
    debitLedger := TLedger.Create;

    debitLedger.EventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR);
    debitLedger.CaseType := TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
    debitLedger.ValueDate := paymentDate;
    debitLedger.CurrentStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
    debitLedger.Credit := 0;
    debitLedger.FullPayment := true;

    days := DaysBetween(paymentDate,GetLatestInterestDate(paymentDate));
    full := (FBalance * FInterestInDecimal * days) / ifn.DaysInAMonth;
    debitLedger.Debit := full;

    AddLedger(debitLedger);
  end;;

  // set the different amounts
  FInterestDue := due;
  FInterestBalance := balance;
  FInterestAdditional := additional;
  FInterestComputed := computed;
  FFullPaymentInterest := full;
end;

function TLoan.GetInterestDue: currency;
begin
  if HasInterestComputed then Result := FInterestComputed
  else if HasInterestAdditional then Result := FInterestDue + FInterestAdditional
  else if HasInterestDue then Result := FInterestDue
  else Result := 0;
end;

function TLoan.GetInterestMethodName: string;
begin
  if (FInterestMethod = 'D') and (FIsScheduled) then Result := 'Diminishing*'
  else if FInterestMethod = 'D' then Result := 'Diminishing'
  else Result := 'Fixed';
end;

function TLoan.GetInterestTotalDue: currency;
begin
  Result := FInterestDue + FInterestBalance + FInterestAdditional + FInterestComputed;
end;

function TLoan.GetIsDiminishing: boolean;
begin
  Result := FInterestMethod = 'D';
end;

function TLoan.GetIsFirstPayment: boolean;
begin
  Result := FPayments = 0;
end;

function TLoan.GetIsFixed: boolean;
begin
  Result := FInterestMethod = 'F';
end;

function TLoan.GetLatestInterestDate(const paymentDate: TDateTime): TDateTime;
var
  LLedger: TLedger;
  interestDate: TDateTime;
begin
  interestDate := FLastTransactionDate;

  for LLedger in FLedger do
  begin
    if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR))
       and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS))then
      if LLedger.ValueDate <= paymentDate then
        if LLedger.ValueDate > interestDate then interestDate := LLedger.ValueDate;
  end;

  Result := interestDate;
end;

function TLoan.GetLedger(const i: integer): TLedger;
begin
  Result := FLedger[i];
end;

function TLoan.GetLedgerCount: integer;
begin
  Result := Length(FLedger);
end;

function TLoan.GetNextPayment: TDateTime;
begin
  Result := IncMonth(FLastTransactionDate);
end;

procedure TLoan.GetPaymentDue(const paymentDate: TDateTime);
var
  caseType: TCaseTypes;
begin
  // loop thru each case type
  for caseType := TCaseTypes.ITS to TCaseTypes.PRC do
  begin
    case caseType of
      ITS: GetInterestDue(paymentDate);
      PRC: GetPrincipalDue(paymentDate);
    end;
  end;
end;

procedure TLoan.GetPrincipalDue(const paymentDate: TDateTime);
var
  principal: currency;
  LLedger: TLedger;
  py, pm, pd, vy, vm, vd: word;
begin
  principal := 0;

  DecodeDate(paymentDate,py,pm,pd);

  for LLedger in FLedger do
  begin
    if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON))
       and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC))then
    begin
      DecodeDate(LLedger.ValueDate,vy,vm,vd);

      // only get the due for the month.. exclude balance
      if (vm = pm) and (vy = py) then principal := principal + LLedger.Debit;
    end;
  end;

  FPrincipalDue := principal;
end;

procedure TLoan.RetrieveLedger;
var
  LLedger: TLedger;
begin
  try
    ClearLedger;

    // loop thru the dataset
    with dmPayment.dstSchedule do
    begin
      try
        Parameters.ParamByName('@loan_id').Value := FId;
        Open;

        while not Eof do
        begin
          LLedger := TLedger.Create;
          LLedger.PostingId := FieldByName('posting_id').AsString;
          LLedger.EventObject := FieldByName('event_object').AsString;
          LLedger.PrimaryKey := FieldByName('pk_event_object').AsString;
          LLedger.ValueDate := FieldByName('value_date').AsDateTime;
          LLedger.Debit := FieldByName('payment_due').AsSingle;
          LLedger.CaseType := FieldByName('case_type').AsString;
          LLedger.CurrentStatus := FieldByName('status_code').AsString;
          LLedger.HasPartial := FieldByName('has_partial').AsInteger = 1;

          AddLedger(LLedger);

          Next;
        end;
      except
        on E: Exception do ShowErrorBox(E.Message);
      end;
  end;
  finally
    dmPayment.dstSchedule.Close;
  end;
end;

end.
