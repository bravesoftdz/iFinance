unit LoanData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.Rtti;

type
  TdmLoan = class(TDataModule)
    dstLoan: TADODataSet;
    dscLoan: TDataSource;
    dstLoanClass: TADODataSet;
    dscLoanClass: TDataSource;
    dstAcctType: TADODataSet;
    dscAcctType: TDataSource;
    dstClients: TADODataSet;
    dscClients: TDataSource;
    procedure dstLoanBeforeOpen(DataSet: TDataSet);
    procedure dstLoanClassBeforeOpen(DataSet: TDataSet);
    procedure dstLoanBeforePost(DataSet: TDataSet);
    procedure dstLoanNewRecord(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
    procedure dstLoanAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLoan: TdmLoan;

implementation

uses
  AppData, Loan, DBUtil, IFinanceGlobal, AppConstants;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmLoan.dstLoanAfterPost(DataSet: TDataSet);
begin
  ln.Status := DataSet.FieldByName('status_id').AsString;
end;

procedure TdmLoan.dstLoanBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  with DataSet do
  begin
    if State = dsInsert then
    begin
      id := GetLoanId;
      FieldByName('loan_id').AsString := id;
      FieldByName('entity_id').AsString := ln.Client.Id;

      SetCreatedFields(DataSet);

      ln.Id := id;
    end
    else if ln.Action = laApproving then
    begin
      FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.A);
      FieldByName('appv_by').AsString := ifn.User.UserId;
    end
    else if ln.Action = laReleasing then
    begin
      FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.R);
        FieldByName('rel_by').AsString := ifn.User.UserId;
    end
    else if ln.Action = laCancelling then
    begin
      FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.C);
      FieldByName('cancelled_date').AsDateTime := ifn.AppDate;
      FieldByName('cancelled_by').AsString := ifn.User.UserId;
    end
    else if ln.Action = laDenying then
    begin
      FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.X);
      FieldByName('denied_date').AsDateTime := ifn.AppDate;
      FieldByName('denied_by').AsString := ifn.User.UserId;
    end;
  end;
end;

procedure TdmLoan.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  // set the loan class of the newly-added record
  if dstLoan.State = dsInsert then
    dstLoan.FieldByName('class_id').AsInteger := DataSet.FieldByName('class_id').AsInteger;
end;

procedure TdmLoan.dstLoanClassBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstLoanNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('orig_branch').AsString := ifn.LocationCode;
  DataSet.FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
  DataSet.FieldByName('date_appl').AsDateTime := ifn.AppDate;
end;

end.
