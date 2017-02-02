unit ClientIntf;

interface

type
  IClient = interface(IInterface)
    ['{FB3C74FB-0E43-4CD4-9FD3-ED8860AAD6FB}']
  procedure SetClientName;
  procedure SetUnboundControls(const changeTab: boolean = true);
  procedure LoadPhoto;
  procedure SetLandLordControlsPres;
  procedure SetLandLordControlsProv;
  end;

implementation

end.
