unit Payment;

interface

uses
  ActiveClient, PaymentMethod, System.Classes, SysUtils;

type
  TPaymentDetail = class
  strict private
    FLoan: TLoan;
    FRemarks: string;
    FCancelled: boolean;
    FPrincipal: real;
    FInterest: real;

  private
    function GetTotalAmount: real;

  public
    property Loan: TLoan read FLoan write FLoan;
    property TotalAmount: real read GetTotalAmount;
    property Remarks: string read FRemarks write FRemarks;
    property Cancelled: boolean read FCancelled write FCancelled;
    property Principal: real read FPrincipal write FPrincipal;
    property Interest: real read FInterest write FInterest;
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

    procedure SaveDetails;
    procedure UpdateLoanBalance;

    function GetDetail(const i: integer): TPaymentDetail;
    function GetTotalAmount: real;
    function GetDetailCount: integer;
    function GetIsPosted: boolean;
    function GetIsNew: boolean;

  public
    property Client: TActiveClient read FClient write FClient;
    property PaymentId: string read FPaymentId write FPaymentId;
    property ReceiptNo: string read FReceiptNo write FReceiptNo;
    property Date: TDateTime read FDate write FDate;
    property Details[const i: integer]: TPaymentDetail read GetDetail;
    property TotalAmount: real read GetTotalAmount;
    property DetailCount: integer read GetDetailCount;
    property PostDate: TDateTime read FPostDate write FPostDate;
    property ReferenceNo: string read FReferenceNo write FReferenceNo;
    property IsPosted: boolean read GetIsPosted;
    property LocationCode: string read FLocationCode write FLocationCode;
    property IsNew: boolean read GetIsNew;
    property PaymentMethod: TPaymentMethod read FPaymentMethod write FPaymentMethod;

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
  PaymentData, IFinanceDialogs, DBUtil;

constructor TPayment.Create;
begin
  if pmt <> nil then pmt := self
  else inherited Create;
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
begin
  try
    with dmPayment do
    begin
      dstPayment.Post;

      SaveDetails;

      UpdateLoanBalance;

      dstPayment.UpdateBatch;
      dstPaymentDetail.UpdateBatch;
    end;
  except
    on E: Exception do begin
      dmPayment.dstPayment.CancelBatch;
      dmPayment.dstPaymentDetail.CancelBatch;
      
      ShowErrorBox('An error has occured during payment posting. Entry has been cancelled.');
    end;
  end;
end;

procedure TPayment.SaveDetails;
var
  i, cnt: integer;
begin
  with dmPayment.dstPaymentDetail do
  begin
    cnt := GetDetailCount - 1;

    Open;

    for i := 0 to cnt do
    begin
      Append;
      FieldByName('payment_id').AsString := FPaymentId;
      FieldByName('loan_id').AsString := FDetails[i].Loan.Id;
      FieldByName('payment_amt').AsFloat := FDetails[i].TotalAmount;
      FieldByName('remarks').AsString := FDetails[i].Remarks;
      Post;
    end;

  end;
end;

procedure TPayment.UpdateLoanBalance;
var
  detail: TPaymentDetail;
  sql: TStringList;
  balance: real;
begin
  sql := TStringList.Create;
  // sql.Delimiter := ';';
  
  try
    for detail in FDetails do
    begin
      balance := detail.Loan.Balance - detail.GetTotalAmount;          
      
      sql.Add(' UPDATE loan ' +
              '    SET balance = ' + FloatToStr(balance) +
              '  WHERE loan_id = ' + QuotedStr(detail.Loan.Id));
    end;
    
    ExecuteSQL(sql.Text);
  finally
    sql.Free;
  end;
end;

procedure TPayment.Retrieve;
var
  detail: TPaymentDetail;
  loan: TLoan;
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
      // loan details
      loan := TLoan.Create;
      loan.Id := FieldByName('loan_id').AsString;
      loan.LoanTypeName := FieldByName('loan_type_name').AsString;
      loan.AccountTypeName := FieldByName('acct_type_name').AsString;
      loan.Balance := FieldByName('balance').AsFloat;

      detail := TPaymentDetail.Create;
      detail.Loan := loan;
      detail.Remarks := FieldByName('remarks').AsString;
      detail.Cancelled := FieldByName('is_cancelled').AsInteger = 1;

      AddDetail(detail);

      Next;
    end;
  end;
end;

function TPayment.GetDetail(const i: Integer): TPaymentDetail;
begin
  Result := FDetails[i];
end;

function TPayment.GetTotalAmount: real;
var
  pd: TPaymentDetail;
begin
  Result := 0;

  for pd in FDetails do
    Result := Result + pd.Principal + pd.Interest;
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

function TPayment.GetIsNew: boolean;
begin
  Result := FPaymentId = '';
end;

function TPaymentDetail.GetTotalAmount: real;
begin
  Result := FPrincipal + FInterest;
end;

end.
