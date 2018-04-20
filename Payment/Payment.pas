unit Payment;

interface

uses
  ActiveClient, PaymentMethod, System.Classes, SysUtils, System.Rtti;

type
  TPaymentType = (ptPrincipal,ptInterest,ptPenalty);

  TPaymentDetail = class
  strict private
    FPaymentId: string;
    FPaymentDate: TDateTime;
    FLoan: TLoan;
    FRemarks: string;
    FCancelled: boolean;
    FPrincipal: currency;
    FInterest: currency;
    FPenalty: currency;
    FPaymentType: TPaymentType;
    FIsFullPayment: boolean;

    function GetTotalAmount: currency;
    function GetHasInterest: boolean;
    function GetHasPrincipal: boolean;
    function GetPenalty: boolean;
    function PostInterest(const interest: currency; const loanId: string;
      const ADate: TDateTime; const source, status: string): string;

    procedure SaveInterest;
    procedure UpdateInterestSchedule;

  public
    property Loan: TLoan read FLoan write FLoan;
    property TotalAmount: currency read GetTotalAmount;
    property Remarks: string read FRemarks write FRemarks;
    property Cancelled: boolean read FCancelled write FCancelled;
    property Principal: currency read FPrincipal write FPrincipal;
    property Interest: currency read FInterest write FInterest;
    property Penalty: currency read FPenalty write FPenalty;
    property HasPrincipal: boolean read GetHasPrincipal;
    property HasInterest: boolean read GetHasInterest;
    property HasPenalty: boolean read GetPenalty;
    property PaymentType: TPaymentType read FPaymentType write FPaymentType;
    property PaymentId: string read FPaymentId write FPaymentId;
    property PaymentDate: TDateTime read FPaymentDate write FPaymentDate;
    property IsFullPayment: boolean read FIsFullPayment write FIsFullPayment;

    function PaymentTypeToString(const payType: TPaymentType): string;
    function IsScheduled: boolean;
    function IsAdvanced: boolean;
    function IsLate: boolean;

    procedure Post;
  end;

  TPayment = class
  private
    FClient: TActiveClient;
    FPaymentId: string;
    FReceiptNo: string;
    FDate: TDateTime;
    FDetails: array of TPaymentDetail;
    FPostDate: TDateTime;
    FReferenceNo: string;
    FLocationCode: string;
    FPaymentMethod: TPaymentMethod;
    FWithdrawn: currency;
    FWithdrawalId: string;
    FIsAdvance: boolean;

    procedure SaveDetails;
    procedure UpdateLoanRecord;

    function GetDetail(const i: integer): TPaymentDetail;
    function GetTotalAmount: currency;
    function GetDetailCount: integer;
    function GetIsPosted: boolean;
    function GetIsNew: boolean;
    function GetIsWithdrawal: boolean;
    function GetIsLate: boolean;
    function GetChangeAmount: currency;

  public
    property Client: TActiveClient read FClient write FClient;
    property PaymentId: string read FPaymentId write FPaymentId;
    property ReceiptNo: string read FReceiptNo write FReceiptNo;
    property Date: TDateTime read FDate write FDate;
    property Details[const i: integer]: TPaymentDetail read GetDetail;
    property TotalAmount: currency read GetTotalAmount;
    property DetailCount: integer read GetDetailCount;
    property PostDate: TDateTime read FPostDate write FPostDate;
    property ReferenceNo: string read FReferenceNo write FReferenceNo;
    property IsPosted: boolean read GetIsPosted;
    property LocationCode: string read FLocationCode write FLocationCode;
    property IsNew: boolean read GetIsNew;
    property PaymentMethod: TPaymentMethod read FPaymentMethod write FPaymentMethod;
    property Withdrawn: currency read FWithdrawn write FWithdrawn;
    property WithdrawalId: string read FWithdrawalId write FWithdrawalId;
    property IsWithdrawal: boolean read GetIsWithdrawal;
    property IsAdvance: boolean read FIsAdvance write FIsAdvance;
    property IsLate: boolean read GetIsLate;
    property ChangeAmount: currency read GetChangeAmount;

    procedure Add;
    procedure AddDetail(const detail: TPaymentDetail);
    procedure RemoveDetail(const loan: TLoan);
    procedure Save;
    procedure Retrieve;

    function DetailExists(const loan: TLoan): boolean;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

var
  pmt: TPayment;

implementation

uses
  PaymentData, IFinanceDialogs, DBUtil, Posting, IFinanceGlobal, Ledger, AppConstants, LoanClassification;

constructor TPayment.Create;
begin
  if pmt <> nil then pmt := self
  else begin
    inherited Create;
    FPaymentMethod := TPaymentMethod.Create;
  end;
end;

destructor TPayment.Destroy;
begin
  if pmt = self then pmt := nil;
end;

procedure TPayment.Add;
begin
  with dmPayment do
  begin
    dstPayment.Open;
    dstPayment.Append;
  end;
end;

procedure TPayment.AddDetail(const detail: TPaymentDetail);
begin
  SetLength(FDetails,Length(FDetails)+1);
  FDetails[Length(FDetails)-1] := detail;
end;

procedure TPayment.RemoveDetail(const loan: TLoan);
var
  i, ii, len: integer;
  detail: TPaymentDetail;
begin
  len := Length(FDetails);

  ii := 0;
  for i := 0 to len - 1 do
  begin
    detail := FDetails[i];
    if detail.Loan.Id <> loan.Id then
    begin
      FDetails[ii] := detail;
      Inc(ii);
    end;
  end;

  SetLength(FDetails,Length(FDetails) - 1);
end;

procedure TPayment.Save;
var
  LPosting: TPosting;
begin
  LPosting := TPosting.Create;
  try
    try
      with dmPayment do
      begin
        // retrieve interest and loan records
        // this is for updating purposes
        dstInterests.Parameters.ParamByName('@entity_id').Value := FClient.Id;
        dstInterests.Open;

        dstLoans.Parameters.ParamByName('@entity_id').Value := FClient.Id;
        dstLoans.Open;

        dstPayment.Post;

        SaveDetails;
        UpdateLoanRecord;

        LPosting.Post(self);

        dstPayment.UpdateBatch;
        dstPaymentDetail.UpdateBatch;
        dstInterests.UpdateBatch;
        dstLoans.UpdateBatch;

      end;
    except
      on E: Exception do begin
        dmPayment.dstPayment.CancelBatch;
        dmPayment.dstPaymentDetail.CancelBatch;
        dmPayment.dstInterests.CancelBatch;
        dmPayment.dstLoans.CancelBatch;

        ShowErrorBox('An error has occured during payment posting. Entry has been cancelled.');
      end;
    end;
  finally
    LPosting.Free;

    // dmPayment.dstPayment.Close;
    // dmPayment.dstPaymentDetail.Close;
    dmPayment.dstInterests.Close;
    dmPayment.dstLoans.Close;
  end;
end;

procedure TPayment.SaveDetails;
var
  i, cnt: integer;
begin
  try
    with dmPayment.dstPaymentDetail do
    begin
      cnt := GetDetailCount - 1;

      Open;

      for i := 0 to cnt do
      begin
        FDetails[i].PaymentId := FPaymentId;
        FDetails[i].PaymentDate := FDate;

        // principal
        if FDetails[i].HasPrincipal then
        begin
          Append;
          FieldByName('payment_id').AsString := FPaymentId;
          FieldByName('loan_id').AsString := FDetails[i].Loan.Id;
          FieldByName('payment_amt').AsCurrency := FDetails[i].Principal;
          FieldByName('payment_type').AsString := FDetails[i].PaymentTypeToString(ptPrincipal);
          FieldByName('remarks').AsString := FDetails[i].Remarks;
          FieldByName('balance').AsCurrency := FDetails[i].Loan.Balance - FDetails[i].Principal;
          Post;
        end;

        // interest
        if FDetails[i].HasInterest then
        begin
          Append;
          FieldByName('payment_id').AsString := FPaymentId;
          FieldByName('loan_id').AsString := FDetails[i].Loan.Id;
          FieldByName('payment_amt').AsCurrency := FDetails[i].Interest;
          FieldByName('payment_type').AsString := FDetails[i].PaymentTypeToString(ptInterest);
          FieldByName('remarks').AsString := FDetails[i].Remarks;

          if FDetails[i].IsFullPayment then FieldByName('balance').AsCurrency := 0
          else FieldByName('balance').AsCurrency := FDetails[i].Loan.InterestDueOnPaymentDate - FDetails[i].Interest;

          Post;
        end;

        // penalty
        if FDetails[i].HasPenalty then
        begin
          Append;
          FieldByName('payment_id').AsString := FPaymentId;
          FieldByName('loan_id').AsString := FDetails[i].Loan.Id;
          FieldByName('payment_amt').AsCurrency := FDetails[i].Penalty;
          FieldByName('payment_type').AsString := FDetails[i].PaymentTypeToString(ptPenalty);
          FieldByName('remarks').AsString := FDetails[i].Remarks;
          Post;
        end;

        FDetails[i].Post;
      end;
    end;
  except
    on E: Exception do Abort;
  end;
end;

procedure TPayment.UpdateLoanRecord;
var
  detail: TPaymentDetail;
  balance, intDeficit, prcDeficit: currency;
begin
  // update the principal balance (field loan_balance)
  // update the last transaction date
  // update principal and interest deficits
  // update the loan status for full payment

  try
    for detail in FDetails do
    begin
      with dmPayment.dstLoans do
      begin
        if Locate('loan_id',detail.Loan.Id,[]) then
        begin
          balance := detail.Loan.Balance - detail.Principal;

          if FDate <> detail.Loan.NextPayment then prcDeficit := detail.Loan.PrincipalDeficit - detail.Principal
          else prcDeficit := detail.Loan.PrincipalDeficit + (detail.Loan.PrincipalAmortisation - detail.Principal);

          intDeficit := detail.Loan.InterestDeficit + (detail.Loan.InterestDueOnPaymentDate - detail.Interest);

          Edit;
          FieldByName('balance').AsCurrency := balance;
          FieldByName('prc_deficit').AsCurrency := prcDeficit;
          FieldByName('int_deficit').AsCurrency := intDeficit;
          FieldByName('last_trans_date').AsDateTime := FDate;

          if detail.IsFullPayment then FieldByName('status_id').AsString := 'X';

          Post;
        end;
      end;
    end;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;
end;

procedure TPayment.Retrieve;
var
  detail: TPaymentDetail;
  loan: TLoan;
  currentLoanId: string;
begin
  // head
  with dmPayment.dstPayment do
  begin
    Close;
    Open;
  end;

  // detail
  with dmPayment.dstPaymentDetail do
  begin
    Close;
    Open;

    while not Eof do
    begin
      // loan details..instantiate for every loan ID.. NOT for every row
      // Reason: each detail will contain the PRINCIPAL, INTEREST and PENALTY amounts
      if (not Assigned(loan)) or (loan.Id <> currentLoanId) then
      begin
        loan := TLoan.Create;
        loan.Id := FieldByName('loan_id').AsString;
        loan.LoanTypeName := FieldByName('loan_type_name').AsString;
        loan.AccountTypeName := FieldByName('acct_type_name').AsString;
        loan.Balance := FieldByName('balance').AsCurrency;

        detail := TPaymentDetail.Create;
        detail.Loan := loan;
        detail.Remarks := FieldByName('remarks').AsString;
        detail.Cancelled := FieldByName('is_cancelled').AsInteger = 1;
      end;

      // set principal, interest, penalty
      if FieldByName('payment_type').AsString = 'PRN' then
        detail.Principal := FieldByName('payment_amt').AsCurrency
      else if FieldByName('payment_type').AsString = 'INT' then
        detail.Interest := FieldByName('payment_amt').AsCurrency
      else if FieldByName('payment_type').AsString = 'PEN' then
        detail.Penalty := FieldByName('payment_amt').AsCurrency;

      Next;

      currentLoanId := FieldByName('loan_id').AsString;

      if (Eof) or (loan.Id <> currentLoanId) then AddDetail(detail);
    end;
  end;
end;

function TPayment.GetChangeAmount: currency;
begin
  if IsWithdrawal then Result := Withdrawn - TotalAmount
  else Result := 0;
end;

function TPayment.GetDetail(const i: Integer): TPaymentDetail;
begin
  Result := FDetails[i];
end;

function TPayment.GetTotalAmount: currency;
var
  pd: TPaymentDetail;
begin
  Result := 0;

  for pd in FDetails do Result := Result + pd.Principal + pd.Interest + pd.Penalty;
end;

function TPayment.DetailExists(const loan: TLoan): boolean;
var
  pd: TPaymentDetail;
begin
  Result := false;
  for pd in FDetails do
  begin
    if pd.Loan.Id = loan.Id then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TPayment.GetDetailCount: integer;
begin
  Result := Length(FDetails);
end;

function TPayment.GetIsPosted: boolean;
begin
  Result := FPostDate > 0;
end;

function TPayment.GetIsWithdrawal: boolean;
begin
  Result := FPaymentMethod.Method = mdBankWithdrawal;
end;

function TPayment.GetIsLate: boolean;
begin
  Result := FDate > ifn.AppDate;
end;

function TPayment.GetIsNew: boolean;
begin
  Result := FPaymentId = '';
end;

function TPaymentDetail.GetHasInterest: boolean;
begin
  Result := FInterest > 0;
end;

function TPaymentDetail.GetHasPrincipal: boolean;
begin
  Result := FPrincipal > 0;
end;

function TPaymentDetail.GetPenalty: boolean;
begin
  Result := FPenalty > 0;
end;

function TPaymentDetail.GetTotalAmount: currency;
begin
  Result := FPrincipal + FInterest + FPenalty;
end;

function TPaymentDetail.IsAdvanced: boolean;
begin
  Result := FPaymentDate < FLoan.NextPayment;
end;

function TPaymentDetail.IsLate: boolean;
begin
  Result := FPaymentDate > FLoan.NextPayment;
end;

function TPaymentDetail.IsScheduled: boolean;
begin
  Result := FPaymentDate = FLoan.NextPayment;
end;

function TPaymentDetail.PaymentTypeToString(
  const payType: TPaymentType): string;
begin
  case payType of
    ptPrincipal: Result := 'PRN';
    ptInterest: Result := 'INT';
    ptPenalty: Result := 'PEN';
  end;
end;

procedure TPaymentDetail.Post;
var
  debitLedger, creditLedger: TLedger;
  balance, payment: currency;
  i, cnt: integer;
  caseType: string;
  paymentType: TPaymentTypes;
begin
  payment := 0;

  //  post the payment in the ledger
  for paymentType := TPaymentTypes.PRN to TPaymentTypes.PEN do
  begin

    // get the amount and casetype to be posted
    case paymentType of
      PRN:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PRC);
          payment := FPrincipal;
        end;

      INT:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS);
          payment := FInterest;

          // update interest schedule
          if ((FLoan.IsDiminishing) and (FLoan.DiminishingType = dtFixed)) or (FIsFullPayment) then
            if ((FLoan.HasInterestComputed) or (FLoan.HasInterestAdditional)) or (FIsFullPayment) then
              UpdateInterestSchedule;

          // save unposted interest
          if (FIsFullPayment) or ((FLoan.IsDiminishing) and (FLoan.DiminishingType = dtFixed) and (FLoan.NextPayment <> FPaymentDate)) then
            SaveInterest;
        end;

      PEN:
        begin
          caseType :=  TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.PNT);
          payment := FPenalty;
        end;

    end;

    i := 0;
    cnt := FLoan.LedgerCount - 1;
    balance := payment;

    while (balance > 0) and (i <= cnt) do
    begin
      debitLedger := FLoan.Ledger[i];

      if (debitLedger.CaseType = caseType) and  (debitLedger.Debit > 0) then
      begin
        creditLedger := TLedger.Create;

        // set the amount and the status
        if debitLedger.Debit <= balance then
        begin
          creditLedger.Credit := debitLedger.Debit;
          debitLedger.NewStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.CLS);
        end
        else creditLedger.Credit := balance;

        creditLedger.RefPostingId := debitLedger.PostingId;
        creditLedger.EventObject := TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.PAY);
        creditLedger.PrimaryKey := FPaymentId;
        creditLedger.CaseType := caseType;
        creditLedger.ValueDate := FPaymentDate;
        creditLedger.CurrentStatus := TRttiEnumerationType.GetName<TLedgerRecordStatus>(TLedgerRecordStatus.OPN);
        creditLedger.Debit := 0;

        FLoan.AddLedger(creditLedger);

        balance := balance - creditLedger.Credit;
      end;

      Inc(i);
    end; // end while

    // for extra payment.. add the amount to the last credit ledger
    // this happens when payment is before payment date
    // normal practice is to collect the monthly amortization regardless of when payment is made
    // this is only applicable to diminishing fixed loans
    if balance > 0 then creditLedger.Credit := creditLedger.Credit + balance;

  end;

end;

function TPaymentDetail.PostInterest(const interest: currency; const loanId: string;
  const ADate: TDateTime; const source, status: string): string;
var
  interestId: string;
begin
  interestId := GetInterestId;

  with dmPayment.dstInterests do
  begin
    Append;
    FieldByName('interest_id').AsString := interestId;
    FieldByName('loan_id').AsString := loanId;
    FieldByName('interest_amt').AsCurrency := interest;
    FieldByName('interest_date').AsDateTime := ADate;
    FieldByName('interest_src').AsString := source;
    FieldByName('interest_status_id').AsString := status;
    Post;
  end;

  Result := interestId;
end;

procedure TPaymentDetail.SaveInterest;
var
  LLedger: TLedger;
  i, cnt: integer;
  interestId, loanId, source, status: string;
  interest: currency;
  interestDate: TDateTime;
begin
  try
    cnt := FLoan.LedgerCount - 1;

    for i := 0 to cnt do
    begin
      LLedger := FLoan.Ledger[i];

      if (LLedger.EventObject = TRttiEnumerationType.GetName<TEventObjects>(TEventObjects.ITR))
         and (LLedger.CaseType = TRttiEnumerationType.GetName<TCaseTypes>(TCaseTypes.ITS)) then
      begin
        if not LLedger.Posted then
        begin
          if (not FIsFullPayment)
             or ((FIsFullPayment) and ((LLedger.FullPayment) or ((FLoan.IsDiminishing) and (FLoan.DiminishingType = dtFixed)))) then
          begin
            interest := LLedger.Debit;
            loanId := FLoan.Id;
            interestDate := LLedger.ValueDate;
            source := TRttiEnumerationType.GetName<TInterestSource>(TInterestSource.PYT);
            status := TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.T);

            interestId := PostInterest(interest,loanId,interestDate,source,status);
            LLedger.PrimaryKey := interestId;
          end;
        end;
      end;
    end;
  finally
  end;
end;

procedure TPaymentDetail.UpdateInterestSchedule;
var
  newDate, interestDate: TDateTime;
  m, d, y, mm, dd, yy, pm, pd, py, nm, nd, ny: word;
  pending: boolean;
  i: integer;
  sameMonth: boolean;
begin
  DecodeDate(FLoan.NextPayment,ny,nm,nd);
  DecodeDate(FPaymentDate,py,pm,pd);

  sameMonth := (ny = py) and (nm = pm); // payment is the same as the month of the scheduled interest but not on the scheduled date

  if (FPaymentDate < Floan.NextPayment)and (sameMonth) then i := 0
  else i := 1;

  try
    with dmPayment.dstInterests do
    begin
      // filter the dataset
      Filter := 'loan_id = ' + QuotedStr(FLoan.Id);

      while not Eof do
      begin
        pending := FieldByName('interest_status_id').AsString =
          TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.P);

        if pending then
        begin
          newDate := IncMonth(FPaymentDate,i);
          interestDate := FieldByName('interest_date').AsDateTime;

          DecodeDate(newDate,y,m,d);
          DecodeDate(interestDate,yy,mm,dd);

          Edit;

          if ((py = yy) and (pm = mm)) or (FIsFullPayment) then // change the status of the PENDING interest of month of the payment date
            FieldByName('interest_status_id').AsString :=
              TRttiEnumerationType.GetName<TInterestStatus>(TInterestStatus.D)
          else if (y = yy) and (m = mm) and (d <> dd) then
            FieldByName('interest_date').AsDateTime := newDate;

          Post;
          Inc(i);
        end;

        Next;
      end;
    end;
  finally

  end;
end;

end.
