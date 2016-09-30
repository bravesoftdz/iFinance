unit ClientIntf;

interface

type
  IClient = interface(IInterface)
    ['{FB3C74FB-0E43-4CD4-9FD3-ED8860AAD6FB}']
  procedure ChangeIdentControlState;
  procedure SetIdentUnboundControls;
  end;

implementation

end.
