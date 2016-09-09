unit AuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmAux = class(TDataModule)
    dscTowns: TDataSource;
    dstTowns: TADODataSet;
    dscBanks: TDataSource;
    dstBanks: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAux: TdmAux;

implementation

uses
  AppData;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
