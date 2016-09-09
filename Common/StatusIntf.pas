unit StatusIntf;

interface

type
  IStatus = Interface(IInterface)
    ['{5444FA40-507A-4F5E-BB65-89025E426405}']
    procedure ShowError(const error: string);
    procedure ShowConfirmation(const conf: string);
  End;

implementation

end.
