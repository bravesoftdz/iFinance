unit PaymentData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmPayment = class(TDataModule)
    dstPayment: TADODataSet;
    dscPayment: TDataSource;
    dstPaymentDetail: TADODataSet;
    dscPaymentDetail: TDataSource;
    dstActiveLoans: TADODataSet;
    dscActiveLoans: TDataSource;
    procedure dstPaymentBeforeOpen(DataSet: TDataSet);
    procedure dstPaymentNewRecord(DataSet: TDataSet);
    procedure dstActiveLoansBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPayment: TdmPayment;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Payment, IFinanceGlobal;

procedure TdmPayment.dstActiveLoansBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value :=
        pmt.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@status').Value := 'R';
end;

procedure TdmPayment.dstPaymentBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payment_id').Value :=
        pmt.PaymentId;
end;

procedure TdmPayment.dstPaymentNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('payment_date').AsDateTime := ifn.AppDate;
end;

end.
