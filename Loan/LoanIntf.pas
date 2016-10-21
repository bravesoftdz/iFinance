unit LoanIntf;

interface

type
  ILoan = interface(IInterface)
    ['{8D87D813-37AB-4257-B56C-F839963D376A}']
  procedure SetLoanId;
  procedure SetUnboundControls;
  procedure RefreshDropDownSources;
  end;

implementation

end.
