unit DockIntf;

interface

uses
  AppConstants, Client;

type
  IDock = Interface(IInterface)
    ['{4D2068E2-715C-42F1-BA30-AC450E95F023}']
    procedure DockForm(const fm: TForms; const title: string = '');
    procedure AddRecentClient(ct: TClient);
  End;

implementation

end.
