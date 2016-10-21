unit DockIntf;

interface

uses
  AppConstants, Client, Loan;

type
  IDock = Interface(IInterface)
    ['{4D2068E2-715C-42F1-BA30-AC450E95F023}']
    procedure DockForm(const fm: TForms; const title: string = '');
    procedure AddRecentClient(ct: TClient);
    procedure AddRecentLoan(lln: TLoan);
  End;

implementation

end.
