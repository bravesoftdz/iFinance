unit PaymentData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmPayment = class(TDataModule)
    dstPayment: TADODataSet;
    dscPayment: TDataSource;
    dstPaymentDetail: TADODataSet;
    dscPaymentDetail: TDataSource;
    dstActiveLoans: TADODataSet;
    dscActiveLoans: TDataSource;
    dstPaymentMethod: TADODataSet;
    dscPaymentMethod: TDataSource;
    dstWithdrawal: TADODataSet;
    dscWithdrawal: TDataSource;
    dstAcctInfo: TADODataSet;
    dscAcctInfo: TDataSource;
    dscSchedule: TDataSource;
    dstSchedule: TADODataSet;
    dstInterests: TADODataSet;
    dstLoans: TADODataSet;
    dscLedger: TDataSource;
    dstLedger: TADODataSet;
    dstLedgerdue: TDateTimeField;
    dstLedgerdebit_amt_p: TBCDField;
    dstLedgercredit_amt_p: TBCDField;
    dstLedgerbalance_p: TBCDField;
    dstLedgerdebit_amt_i: TBCDField;
    dstLedgercredit_amt_i: TBCDField;
    dstLedgerbalance_i: TBCDField;
    dstLedgersort_order: TSmallintField;
    dstLedgerdocument_no: TStringField;
    dstLedgerid: TStringField;
    dstLedgerprincipal_deficit: TBCDField;
    dstLedgerinterest_deficit: TBCDField;
    fmtPaymentDetail: TFDMemTable;
    dscDetail: TDataSource;
    procedure dstPaymentBeforeOpen(DataSet: TDataSet);
    procedure dstPaymentNewRecord(DataSet: TDataSet);
    procedure dstActiveLoansBeforeOpen(DataSet: TDataSet);
    procedure dstPaymentBeforePost(DataSet: TDataSet);
    procedure dstPaymentDetailBeforeOpen(DataSet: TDataSet);
    procedure dstPaymentDetailAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstWithdrawalNewRecord(DataSet: TDataSet);
    procedure dstAcctInfoBeforeOpen(DataSet: TDataSet);
    procedure dstWithdrawalAfterPost(DataSet: TDataSet);
    procedure dstLedgerBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure GetPaymentMethods;
  public
    { Public declarations }
  end;

var
  dmPayment: TdmPayment;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Payment, IFinanceGlobal, DBUtil, PaymentMethod, Withdrawal;

procedure TdmPayment.DataModuleCreate(Sender: TObject);
begin
  // get payment methods
  GetPaymentMethods;
end;

procedure TdmPayment.DataModuleDestroy(Sender: TObject);
begin
  pmtMethods := [];
end;

procedure TdmPayment.dstAcctInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := wd.Client.Id;
end;

procedure TdmPayment.dstActiveLoansBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value :=
        pmt.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@status').Value := 'R';
end;

procedure TdmPayment.dstLedgerBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value :=
    pmt.Details[pmt.DetailCount-1].Loan.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@as_of_date').Value := ifn.AppDate;
end;

procedure TdmPayment.dstPaymentBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payment_id').Value :=
        pmt.PaymentId;
end;

procedure TdmPayment.dstPaymentBeforePost(DataSet: TDataSet);
var
  id, refNo: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetPaymentId;
    refNo := FormatDateTime('mmddyyyyhhmmsszzz',Now);

    DataSet.FieldByName('payment_id').AsString := id;
    DataSet.FieldByName('entity_id').AsString := pmt.Client.Id;
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;
    DataSet.FieldByName('ref_no').AsString := refNo;
    DataSet.FieldByName('pmt_method').AsInteger := Integer(pmt.PaymentMethod.Method);
    DataSet.FieldByName('post_date').AsDateTime := Now;

    if pmt.PaymentMethod.Method = mdBankWithdrawal then
      DataSet.FieldByName('wd_id').AsString := pmt.WithdrawalId;

    SetCreatedFields(DataSet);

    pmt.PaymentId := id;
    pmt.ReferenceNo := refNo;
  end;
end;

procedure TdmPayment.dstPaymentDetailAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'PaymentDetail';
end;

procedure TdmPayment.dstPaymentDetailBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payment_id').Value :=
        pmt.PaymentId;
end;

procedure TdmPayment.dstPaymentNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('payment_date').AsDateTime := ifn.AppDate;
end;

procedure TdmPayment.dstWithdrawalAfterPost(DataSet: TDataSet);
var
  id: string;
begin
  id := DataSet.FieldByName('wd_id').AsString;
  RefreshDataSet(id,'wd_id',DataSet);
end;

procedure TdmPayment.dstWithdrawalNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('wd_id').AsString := GetGenericId;
  DataSet.FieldByName('wd_date').AsDateTime := ifn.AppDate;
end;

procedure TdmPayment.GetPaymentMethods;
var
  paymentMethod: TPaymentMethod;
begin
  with dstPaymentMethod do
  begin
    Open;

    while not Eof do
    begin
      paymentMethod := TPaymentMethod.Create;
      paymentMethod.Method := TMethod(FieldByName('pmt_method').AsInteger);
      paymentMethod.Name := FieldByName('pmt_method_name').AsString;
      paymentMethod.Charge := FieldByName('pmt_charge').AsCurrency;

      // add the method
      SetLength(pmtMethods,Length(pmtMethods) + 1);
      pmtMethods[Length(pmtMethods) - 1] := paymentMethod;

      Next;
    end;

    Close;
  end;
end;

end.
