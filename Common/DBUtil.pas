unit DBUtil;

interface

uses
  AppData, IFinanceGlobal, SysUtils, Vcl.ExtCtrls, DB;

type
  TSequenceObject = (soEntity,soGroup,soEmployer,soBankBranch,soDesignation,
                        soLoanClass,soLoan,soCompetitor,soPurpose, soLoanType,
                        soAcctType,soLoanCancelReason,soLoanRejectReason,
                        soPayment,soLedger,soInterest,soLoanCloseReason);

procedure RefreshDataSet(const key: integer; const keyField: string; DataSet: TDataSet); overload;
procedure RefreshDataSet(const key, keyField: string; DataSet: TDataSet); overload;
procedure SetCreatedFields(dataSet: TDataSet);
procedure ExecuteSQL(const sql: string);
procedure ExecuteSP(const sp: string);
procedure FixSequence;

function GetEntityId: string;
function GetGroupId: string;
function GetEmployerId: string;
function GetBankBranchId: string;
function GetDesignationId: integer;
function GetLoanClassId: integer;
function GetLoanId: string;
function GetCompetitorId: string;
function GetPurposeId: integer;
function GetLoanTypeId: integer;
function GetAccountTypeId: integer;
function GetLoanCancellationReasonId: integer;
function GetLoanRejectionReasonId: integer;
function GetPaymentId: string;
function GetGenericId: string;
function GetLedgerId: string;
function GetInterestId: string;
function GetLoanClosureReasonId: integer;

implementation

procedure RefreshDataSet(const key: integer; const keyField: string; DataSet: TDataSet);
begin
  with DataSet do
  begin
    DisableControls;
    Close;
    Open;
    Locate(keyField,key,[]);
    EnableControls;
  end;
end;

procedure RefreshDataSet(const key, keyField: string; DataSet: TDataSet);
begin
  with DataSet do
  begin
    DisableControls;
    Close;
    Open;
    Locate(keyField,key,[]);
    EnableControls;
  end;
end;

procedure SetCreatedFields(dataSet: TDataSet);
begin
  dataSet.FieldByName('created_date').AsDateTime := Now;
  dataSet.FieldByName('created_by').AsString := ifn.User.UserId;
end;

procedure ExecuteSQL(const sql: string);
begin
  with dmApplication.acMain do Execute(sql);
end;

procedure ExecuteSP(const sp: string);
begin
  with dmApplication.acMain do Execute('EXEC ' + sp);
end;

procedure FixSequence;
begin
  ExecuteSP('dbo.sp_dev_fix_sequence');
end;

function GetSequenceID(const seqObj: TSequenceObject): integer;
var
  parm: string;
begin
  case seqObj of
    soEntity: parm := 'ENT';
    soGroup: parm := 'GRP';
    soEmployer: parm := 'EML';
    soBankBranch: parm := 'BNK';
    soDesignation: parm := 'DSG';
    soLoanClass: parm := 'LNC';
    soLoan: parm := 'LON';
    soCompetitor: parm := 'CMP';
    soPurpose: parm := 'PRP';
    soLoanType: parm := 'LNT';
    soAcctType: parm := 'ACT';
    soPayment: parm := 'PAY';
    soLedger: parm := 'LDG';
    soInterest: parm := 'ITS';
    soLoanCancelReason: parm := 'LCR';
    soLoanRejectReason: parm := 'LRR';
    soLoanCloseReason: parm := 'LSR';
    else parm := '';
  end;

  with dmApplication.spGenId do
  try
    Parameters.ParamByName('@seq_object').Value := parm;
    Open;
    Result := FieldByName('last_id').AsInteger;
  finally
    Close;
  end;
end;

function GetEntityId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soEntity));
end;

function GetGroupId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soGroup));
end;

function GetEmployerId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soEmployer));
end;

function GetBankBranchId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soBankBranch));
end;

function GetDesignationId: integer;
begin
  Result := GetSequenceID(soDesignation);
end;

function GetLoanClassId: integer;
begin
  Result := GetSequenceId(soLoanClass);
end;

function GetLoanId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soLoan));
end;

function GetCompetitorId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soCompetitor));
end;

function GetPurposeId: integer;
begin
  Result := GetSequenceID(soPurpose);
end;

function GetLoanTypeId: integer;
begin
  Result := GetSequenceID(soLoanType);
end;

function GetAccountTypeId: integer;
begin
  Result := GetSequenceID(soAcctType);
end;

function GetLoanCancellationReasonId: integer;
begin
  Result := GetSequenceID(soLoanCancelReason);
end;

function GetLoanRejectionReasonId: integer;
begin
  Result := GetSequenceID(soLoanRejectReason);
end;

function GetPaymentId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soPayment));
end;

function GetGenericId: string;
begin
  Result := FormatDateTime('mmddyyyyhhmmsszzz',Now);
end;

function GetLedgerId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soLedger));
end;

function GetInterestId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soInterest));
end;

function GetLoanClosureReasonId: integer;
begin
  Result := GetSequenceID(soLoanCloseReason);
end;

end.
