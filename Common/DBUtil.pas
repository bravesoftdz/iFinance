unit DBUtil;

interface

uses
  AppData, IFinanceGlobal, SysUtils, Vcl.ExtCtrls, DB;

type
  TSequenceObject = (soEntity,soGroup,soEmployer,soBankBranch);

function GetEntityId: string;
function GetGroupId: integer;
function GetEmployerId: string;
function GetBankBranchId: string;

implementation

function GetSequenceID(const seqObj: TSequenceObject): integer;
var
  parm: string;
begin
  case seqObj of
    soEntity: parm := 'ENT';
    soGroup: parm := 'GRP';
    soEmployer: parm := 'EML';
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

function GetGroupId: integer;
begin
  Result := GetSequenceID(soGroup);
end;

function GetEmployerId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soEmployer));
end;

function GetBankBranchId: string;
begin
  Result := ifn.LocationPrefix + '-' + IntToStr(GetSequenceID(soBankBranch));
end;

end.
