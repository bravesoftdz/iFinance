unit ActiveClient;

interface

uses
  AppConstants, System.Rtti, SysUtils, DateUtils, Ledger, Math, LoanClassification;

type

  TLoan = class
  strict private
    FId: string;
    FLoanTypeName: string;
    FAccountTypeName: string;
    FBalance: currency;
    FPrincipalDeficit: currency;
    FInterestMethod: string;
    FPrincipalAmortisation: currency;
    FInterestAmortisation: currency;
    FDiminishingType: TDiminishingType;
    FLastTransactionDate: TDateTime;
    FInterestInDecimal: currency;
    FInterestDeficit: currency;
    FInterestAdditional: currency;
    FInterestComputed: currency;
    FLedger: array of TLedger;
    FPayments: integer;
    FReleaseAmount: currency;
    FApprovedTerm: integer;
    FFullpaymentInterest: currency;
    FPaymentsAdvance: integer;
    FAmortization: currency;
    FReleaseDate: TDateTime;

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
    function GetHasInterstAdditional: boolean;
    function GetInterestTotalDue: currency;
    function GetLatestInterestDate(const paymentDate: TDateTime): TDateTime;
    function GetInterestMethodName: string;
    function GetHasAdvancePayment: boolean;
    function GetInterestDueOnPaymentDate: currency;

  public
    property Id: string read FId write FId;
    property Balance: currency read FBalance write FBalance;
    property PrincipalDeficit: currency read FPrincipalDeficit write FPrincipalDeficit;
    property LoanTypeName: string read FLoanTypeName write FLoanTypeName;
    property AccountTypeName: string read FAccountTypeName write FAccountTypeName;
    property InterestMethod: string write FInterestMethod;
    property IsDiminishing: boolean read GetIsDiminishing;
    property IsFixed: boolean read GetIsFixed;
    property DiminishingType: TDiminishingType read FDiminishingType write FDiminishingType;
    property LastTransactionDate: TDateTime read FLastTransactionDate write FLastTransactionDate;
    property InterestInDecimal: currency read FInterestInDecimal write FInterestInDecimal;
    property NextPayment: TDateTime read GetNextPayment;
    property InterestDeficit: currency read FInterestDeficit write FInterestDeficit;
    property Ledger[const i: integer]: TLedger read GetLedger;
    property IsFirstPayment: boolean read GetIsFirstPayment;
    property LedgerCount: integer read GetLedgerCount;
    property InterestAdditional: currency read FInterestAdditional;
    property InterestComputed: currency read FInterestComputed;
    property HasInterestBalance: boolean read GetHasInterestBalance;
    property HasInterestComputed: boolean read GetHasInterestComputed;
    property HasInterestAdditional: boolean read GetHasInterstAdditional;
    property InterestTotalDue: currency read GetInterestTotalDue;
    property ReleaseAmount: currency read FReleaseAmount write FReleaseAmount;
    property ApprovedTerm: integer read FApprovedTerm write FApprovedTerm;
    property FullPaymentInterest: currency read FFullPaymentInterest;
    property Payments: integer write FPayments;
    property InterestMethodName: string read GetInterestMethodName;
    property HasAdvancePayment: boolean read GetHasAdvancePayment;
    property PaymentsAdvance: integer write FPaymentsAdvance;
    property Amortization: currency read FAmortization write FAmortization;
    property InterestAmortisation: currency read FInterestAmortisation;
    property PrincipalAmortisation: currency read FPrincipalAmortisation;
    property InterestDueOnPaymentDate: currency read GetInterestDueOnPaymentDate;
    property ReleaseDate: TDateTime read FReleaseDate write FReleaseDate;

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
  PaymentData, IFinanceGlobal, IFinanceDialogs, Payment;

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
        loan.PrincipalDeficit := FieldByName('prc_deficit').AsCurrency;
        loan.InterestDeficit := FieldByName('int_deficit').AsCurrency;
        loan.LoanTypeName := FieldByName('loan_type_name').AsString;
        loan.AccountTypeName := FieldByName('acct_type_name').AsString;
        loan.InterestMethod := FieldByName('int_comp_method').AsString;
        loan.DiminishingType := TDiminishingType(FieldByName('dim_type').AsInteger);
        loan.LastTransactionDate := FieldByName('last_transaction_date').AsDateTime;
        loan.InterestInDecimal := FieldByName('int_rate').AsCurrency / 100;
        loan.ApprovedTerm := FieldByName('terms').AsInteger;
        loan.ReleaseAmount := FieldByName('rel_amt').AsCurrency;
        loan.Payments := FieldByName('payments').AsInteger;
        loan.PaymentsAdvance := FieldByName('payments_advance').AsInteger;
        loan.Amortization := FieldByName('amort').AsCurrency;
        loan.ReleaseDate := FieldByName('date_rel').AsDateTime;

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

function TLoan.GetHasAdvancePayment: boolean;
begin
  Result := FPaymentsAdvance > 0;
end;

function TLoan.GetHasInterestBalance: boolean;
begin
  Result := FInterestDeficit > 0;
end;

function TLoan.GetHasInterestComputed: boolean;
begin
  Result := FInterestComputed > 0;
end;

function TLoan.GetHasInterstAdditional: boolean;
begin
  Result := FInterestAdditional > 0;
end;

procedure TLoan.GetInterestDue(const paymentDate: TDateTime);
var
  amort, additional, computed, full, tmp: currency;
  LLedger, debitLedger: TLedger;
  days: integer;
  py, pm, pd, vy, vm, vd, ny, nm, nd: word;
  scheduleDate: TDateTime;
begin
  additional := 0;    // payment after schedule date
  computed := 0;      // payment before schedule date
  full := 0;          // full payment
  amort := 0;         // amortisation for the month of payment date
  tmp := 0;           // stores the first amount in the Ledger.. used when no amortisation is found as of payment date

  // will be used only for fixed accounts
  // or diminishing scheduled accounts
  DecodeDate(paymentDate,py,pm,pd);

  // get any open accounts in the ledger
  // can either be scheduled interest, balance of previous or both
  for LLedger in FLedger do
  begin
    if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR))
       and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS)) then
    begin
      if tmp = 0 then tmp := LLedger.Amortisation;

      DecodeDate(LLedger.ValueDate,vy,vm,vd);

      // amortisation and schedule date
      if (vm = pm) and (vy = py) then
      begin
        amort := LLedger.Amortisation;
        scheduleDate := LLedger.ValueDate;
      end;

      scheduleDate := LLedger.ValueDate;
    end;
  end;  // end for loop

  if amort = 0 then
  begin
    if ((IsDiminishing) and (DiminishingType = dtFixed)) then amort := (FBalance * FInterestInDecimal)
    else amort := FReleaseAmount * FInterestInDecimal;

    amort := RoundTo(amort,-2)
  end;

  // payment is made before or after schedule date
  if ((IsDiminishing) and (DiminishingType = dtFixed))
    or (IsFixed) then
  begin
    DecodeDate(NextPayment,ny,nm,nd);

    if ((paymentDate <> NextPayment) and (paymentDate <> FLastTransactionDate)) then
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
        // only applicable when no advance payment is made
        {if (IsFirstPayment) and (not HasAdvancePayment) then
        begin
          if ((days >= ifn.Rules.FirstPayment.MinDaysHalfInterest) and
            (days <= ifn.Rules.FirstPayment.MaxDaysHalfInterest))  then
            computed := (FBalance * FInterestInDecimal * ifn.HalfMonth) / ifn.DaysInAMonth
          else computed := FBalance * FInterestInDecimal;
        end
        else}

        computed := (FBalance * FInterestInDecimal) / ifn.DaysInAMonth;

        // round off to 2 decimal places
        computed := RoundTo(computed,-2) * days;

        debitLedger.Debit := computed;
      end
      else // after schedule
      begin
        // additional interest
        days := DaysBetween(scheduleDate,paymentDate);

        // if payment date is more than a month from scheduled payment date
        // divide the days with the days in a month and use the remainder

        additional := (FBalance * FInterestInDecimal) / ifn.DaysInAMonth;

        // round off to 2 decimal places before multiplying to number of days
        additional := RoundTo(additional,-2) * days;

        debitLedger.Debit := additional;
      end;

      if debitLedger.Debit > 0 then AddLedger(debitLedger);
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

    // round off to 2 decimal places
    full := RoundTo(full,-2);

    debitLedger.Debit := full;

    AddLedger(debitLedger);
  end;;

  // set the different amounts
  FInterestAdditional := additional;
  FInterestComputed := computed;
  FFullPaymentInterest := full;
  FInterestAmortisation := amort;
end;

function TLoan.GetInterestDueOnPaymentDate: currency;
begin
  Result := 0;
  if ((IsDiminishing) and (FDiminishingType = dtFixed))
    or (IsFixed) then
  begin
    if (pmt.Date <> NextPayment) and (pmt.Date <> FLastTransactionDate) then
    begin
      if HasInterestComputed then Result := FInterestComputed
      else if HasInterestAdditional then Result :=  FInterestAdditional
      else Result := FInterestAmortisation;
    end
    else if pmt.Date = NextPayment then Result := FInterestAmortisation
    else Result := 0;
  end
end;

function TLoan.GetInterestMethodName: string;
begin
  if (FInterestMethod = 'D') and (DiminishingType = dtScheduled) then Result := 'Diminishing Scheduled'
  else if FInterestMethod = 'D' then Result := 'Diminishing Fixed'
  else Result := 'Fixed';
end;

function TLoan.GetInterestTotalDue: currency;
begin
  if HasInterestAdditional then Result := FInterestDeficit + FInterestAdditional
  else Result := FInterestDeficit + InterestDueOnPaymentDate;
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
var
  LNextPayment: TDateTime;
  mm, dd, yy, fm, fd, fy: word;
begin
  if (IsFirstPayment) and (HasAdvancePayment) then
    LNextPayment := IncMonth(FLastTransactionDate,FPaymentsAdvance)
  else
  begin
    LNextPayment := IncMonth(FLastTransactionDate);

    DecodeDate(FLastTransactionDate,fy,fm,fd);
    DecodeDate(LNextPayment,yy,mm,dd);

    if fd <> dd then
      if DaysBetween(LNextPayment,FLastTransactionDate) < ifn.DaysInAMonth then
        LNextPayment := IncDay(FLastTransactionDate,ifn.DaysInAMonth);
    // if day falls on a 31 and succeeding date is not 31.. add 1 day
    // else if dd < fd then LNextPayment := IncDay(LNextPayment);
  end;

  Result := LNextPayment;
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
  amort, tmp: currency;
  LLedger: TLedger;
  py, pm, pd, vy, vm, vd: word;
begin
  amort := 0;
  tmp := 0; // check the GetInterestDue function for usage of this variable

  DecodeDate(paymentDate,py,pm,pd);

  for LLedger in FLedger do
  begin
    if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.LON))
       and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC))then
    begin
      if tmp = 0 then tmp := LLedger.Amortisation;

      DecodeDate(LLedger.ValueDate,vy,vm,vd);

      // only get the due for the month.. exclude balance
      if (vm = pm) and (vy = py) then amort := LLedger.Amortisation;
    end;
  end;

  if amort = 0 then amort := tmp;

  FPrincipalAmortisation := amort;
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
          LLedger.Amortisation := FieldByName('amortisation').AsCurrency;
          LLedger.Debit := FieldByName('payment_due').AsCurrency;
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
