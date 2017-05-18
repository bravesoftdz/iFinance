unit AccountingData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmAccounting = class(TDataModule)
    dstLedger: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAccounting: TdmAccounting;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData;

end.
