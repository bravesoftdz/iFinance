unit Loan;

interface

uses
  SysUtils, Entity, LoanClient;

type
  TLoanStatus = (lsPending,lsApproved,lsCancelled,lsReleased);

type
  TLoan = class(TEntity)
  private
    FClient: TLoanClient;
    FStatus: TLoanStatus;
  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;

    property Client: TLoanClient read FClient write FClient;
    property Status: TLoanStatus read FStatus write FStatus;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

var
  ln: TLoan;

implementation

uses
  LoanData;

constructor TLoan.Create;
begin
  if ln <> nil then
    Abort
  else
    ln := self;
end;

destructor TLoan.Destroy;
begin
  if ln = self then
    ln := nil;
end;

procedure TLoan.Add;
begin
  with dmLoan.dstLoan do
  begin
    Open;
    Append;
  end;
end;

procedure TLoan.Save;
begin
  with dmLoan.dstLoan do
    Post;
end;

procedure TLoan.Edit;
begin

end;

procedure TLoan.Cancel;
begin

end;

end.
