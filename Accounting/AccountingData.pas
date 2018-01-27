unit AccountingData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmAccounting = class(TDataModule)
    dstSchedule: TADODataSet;
    dstScheduledInterest: TADODataSet;
    dstInterest: TADODataSet;
    dstLedger: TADODataSet;
    dstPayment: TADODataSet;
    dstPaymentDetail: TADODataSet;
    dstScheduleAdvance: TADODataSet;
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
