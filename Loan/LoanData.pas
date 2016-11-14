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
    dstClients: TADODataSet;
    dscClients: TDataSource;
    dstLoanComaker: TADODataSet;
    dscLoanComaker: TDataSource;
    dstAlerts: TADODataSet;
    dscAlerts: TDataSource;
    dscComakers: TDataSource;
    dstComakers: TADODataSet;
    dstAppvMethod: TADODataSet;
    dscAppvMethod: TDataSource;
    dscFinInfo: TDataSource;
    dstFinInfo: TADODataSet;
    dscMonExp: TDataSource;
    dstMonExp: TADODataSet;
    procedure dstLoanBeforeOpen(DataSet: TDataSet);
    procedure dstLoanClassBeforeOpen(DataSet: TDataSet);
    procedure dstLoanBeforePost(DataSet: TDataSet);
    procedure dstLoanNewRecord(DataSet: TDataSet);
    procedure dstLoanAfterPost(DataSet: TDataSet);
    procedure dstLoanClassAfterScroll(DataSet: TDataSet);
    procedure dstLoanAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerBeforeOpen(DataSet: TDataSet);
    procedure dstLoanComakerNewRecord(DataSet: TDataSet);
    procedure dstLoanComakerAfterOpen(DataSet: TDataSet);
    procedure dstLoanComakerAfterPost(DataSet: TDataSet);
    procedure dstAlertsBeforeOpen(DataSet: TDataSet);
    procedure dstAlertsAfterOpen(DataSet: TDataSet);
    procedure dstFinInfoBeforeOpen(DataSet: TDataSet);
    procedure dstFinInfoAfterOpen(DataSet: TDataSet);
    procedure dstFinInfoAfterPost(DataSet: TDataSet);
    procedure dstMonExpAfterOpen(DataSet: TDataSet);
    procedure dstMonExpAfterPost(DataSet: TDataSet);
    procedure dstLoanClassAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLoan: TdmLoan;

implementation

uses
  AppData, Loan, DBUtil, IFinanceGlobal, LoanClassification, Comaker;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmLoan.dstAlertsAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
    while not Eof do
    begin
      ln.AddAlert(FieldByName('alert').AsString);
      Next;
    end;
end;

procedure TdmLoan.dstAlertsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstFinInfoAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssFinInfo';
  with DataSet do
  begin
    while not Eof do
    begin
      ln.AddCompetitor(FieldByName('comp_id').AsInteger);
      Next;
    end;
  end;
end;

procedure TdmLoan.dstFinInfoAfterPost(DataSet: TDataSet);
begin
  RefreshDataSet('','comp_id',Dataset);
end;

procedure TdmLoan.dstFinInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanAfterOpen(DataSet: TDataSet);
begin
  ln.Status := DataSet.FieldByName('status_id').AsString;
end;

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
      if ln.IsApproved then
        FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.X)
      else
        FieldByName('status_id').AsString :=
          TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.C);

      FieldByName('cancelled_date').AsDateTime := ifn.AppDate;
      FieldByName('cancelled_by').AsString := ifn.User.UserId;
    end
    else if ln.Action = laDenying then
    begin
      FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.D);
      FieldByName('denied_date').AsDateTime := ifn.AppDate;
      FieldByName('denied_by').AsString := ifn.User.UserId;
    end;
  end;
end;

procedure TdmLoan.dstLoanClassAfterOpen(DataSet: TDataSet);
begin
  if dstLoan.State = dsInsert then
    if DataSet.RecordCount > 0 then
      dstLoan.FieldByName('class_id').AsInteger := DataSet.FieldByName('class_id').AsInteger;
end;

procedure TdmLoan.dstLoanClassAfterScroll(DataSet: TDataSet);
var
  clId, term, comakers, groupId: integer;
  clName, loanType: string;
  interest, maxLoan: real;
  validFrom, validUntil: TDate;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    groupId := FieldByName('grp_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsFloat;
    term := FieldByName('term').AsInteger;
    loanType := FieldByName('loan_type').AsString;
    maxLoan := FieldByName('max_loan').AsFloat;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
  end;

  if not Assigned(ln.LoanClass) then
    ln.LoanClass := TLoanClassification.Create(clId, groupId, clName, interest,
        term, loanType, maxLoan, comakers, validFrom, validUntil)
  else
  begin
    with ln do
    begin
      LoanClass.ClassificationId := clId;
      LoanClass.GroupId := groupId;
      LoanClass.ClassificationName := clName;
      LoanClass.Interest := interest;
      LoanClass.Term := term;
      LoanClass.LoanType := loanType;
      LoanClass.MaxLoan := maxLoan;
      LoanClass.Comakers := comakers;
      LoanClass.ValidFrom := validFrom;
      LoanClass.ValidUntil := validUntil;
    end;
  end;
end;

procedure TdmLoan.dstLoanClassBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := ln.Client.Id;
end;

procedure TdmLoan.dstLoanComakerAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanComaker';
  with DataSet do
  begin
    while not Eof do
    begin
      ln.AddComaker(TComaker.Create(FieldByName('entity_id').AsString));
      Next;
    end;
  end;
end;

procedure TdmLoan.dstLoanComakerAfterPost(DataSet: TDataSet);
begin
  RefreshDataSet('','entity_id',Dataset);
end;

procedure TdmLoan.dstLoanComakerBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@loan_id').Value := ln.Id;
end;

procedure TdmLoan.dstLoanComakerNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('loan_id').AsString := ln.Id;
end;

procedure TdmLoan.dstLoanNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('orig_branch').AsString := ifn.LocationCode;
  DataSet.FieldByName('status_id').AsString :=
        TRttiEnumerationType.GetName<TLoanStatus>(TLoanStatus.P);
  DataSet.FieldByName('date_appl').AsDateTime := ifn.AppDate;
end;

procedure TdmLoan.dstMonExpAfterOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'LoanAssMonExp';
  with DataSet do
  begin
    while not Eof do
    begin
      ln.AddMonthlyExpense(FieldByName('exp_type').AsString);
      Next;
    end;
  end;
end;

procedure TdmLoan.dstMonExpAfterPost(DataSet: TDataSet);
begin
  RefreshDataSet('','exp_type',Dataset);
end;

end.
