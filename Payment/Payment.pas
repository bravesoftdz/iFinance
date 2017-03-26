unit Payment;

interface

uses
  ActiveClient;

type
  TPaymentDetail = class
  strict private
    FLoan: TLoan;
    FAmount: real;
    FRemarks: string;
  public
    property Loan: TLoan read FLoan write FLoan;
    property Amount: real read FAmount write FAmount;
    property Remarks: string read FRemarks write FRemarks;
  end;

type
  TPayment = class
  private
    FClient: TActiveClient;
    FPaymentId: string;
    FReceiptNo: string;
    FDate: TDateTime;
    FDetails: array of TPaymentDetail;

    function GetDetail(const i: integer): TPaymentDetail;
    function GetTotalAmount: real;
    function GetDetailCount: integer;

  public
    property Client: TActiveClient read FClient write FClient;
    property PaymentId: string read FPaymentId write FPaymentId;
    property ReceiptNo: string read FReceiptNo write FReceiptNo;
    property Date: TDateTime read FDate write FDate;
    property Details[const i: integer]: TPaymentDetail read GetDetail;
    property TotalAmount: real read GetTotalAmount;
    property DetailCount: integer read GetDetailCount;

    procedure Add;
    procedure AddDetail(const detail: TPaymentDetail);
    procedure RemoveDetail(const loan: TLoan);
    procedure Save;

    function DetailExists(const loan: TLoan): boolean;

    constructor Create;
  end;

var
  pmt: TPayment;

implementation

uses
  PaymentData;

constructor TPayment.Create;
begin
  if pmt <> nil then pmt := self
  else inherited Create;
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

  for pd in FDetails do Result := Result + pd.Amount;
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

end.
