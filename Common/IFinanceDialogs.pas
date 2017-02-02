unit IFinanceDialogs;

interface

uses InfoBox, ErrorBox, ConfBox;

procedure ShowInfoBox(const info: string);
procedure ShowErrorBox(const error: string);
procedure ShowConfirmationBox(const conf: string = 'Record saved successfully.');

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

end.
