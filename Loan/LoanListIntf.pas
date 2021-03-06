unit LoanListIntf;

interface

type
  TLoanFilterType = (lftAll,lftPending,lftAssessed,lftApproved,lftActive,
    lftCancelled,lftRejected,lftClosed);

type
  ILoanListFilter = interface(IInterface)
    ['{50297F40-7CE9-4F35-AFC3-CEF0A9390904}']
    procedure FilterList(const filterType: TLoanFilterType);
  end;

implementation

end.
