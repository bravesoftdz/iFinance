unit ClientListIntf;

interface

type
  TClientFilterType = (cftAll,cftActive,cftRecent);

type
  IClientFilter = interface(IInterface)
    ['{8EB2DE06-03CF-4BCE-B0A2-A75BA96D902D}']
    procedure FilterList(const filterType: TClientFilterType;
        const nonClients: boolean = false);
  end;

implementation

end.
