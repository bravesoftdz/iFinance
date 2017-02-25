unit IFinanceDialogs;

interface

uses InfoBox, ErrorBox, ConfBox, DecisionBox, WarningBox;

procedure ShowInfoBox(const info: string);
procedure ShowErrorBox(const error: string);
procedure ShowConfirmationBox(const conf: string = 'Record saved successfully.');
function ShowDecisionBox(const confMessage: string): integer;
function ShowWarningBox(const confMessage: string): integer;

implementation

procedure ShowInfoBox(const info: string);
begin
  with TfrmInfoBox.Create(nil,info) do
  try
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowErrorBox(const error: string);
begin
  with TfrmErrorBox.Create(nil,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure ShowConfirmationBox(const conf: string);
begin
  with TfrmConfBox.Create(nil,conf) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

function ShowDecisionBox(const confMessage: string): integer;
begin
  with TfrmDecisionBox.Create(nil,confMessage) do
  try
    ShowModal;
    Result := Integer(ModalResult);
  finally
    Free;
  end;
end;

function ShowWarningBox(const confMessage: string): integer;
begin
  with TfrmWarningBox.Create(nil,confMessage) do
  try
    ShowModal;
    Result := Integer(ModalResult);
  finally
    Free;
  end;
end;

end.
