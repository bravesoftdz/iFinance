unit DBUtil;

interface

uses
  AppData, IFinanceGlobal, SysUtils, Vcl.ExtCtrls, DB;

type
  TSequenceObject = (soEntity,soGroup,soEmployer);

function GetEntityId: string;
function GetGroupId: integer;
function GetEmployerId: integer;

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
  Result := GetSequenceId(soGroup);
end;

function GetEmployerId: integer;
begin
  Result := GetSequenceId(soEmployer);
end;

end.
