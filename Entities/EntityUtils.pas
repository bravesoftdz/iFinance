unit EntityUtils;

interface

uses
  ADODB, System.UITypes;

function CheckDuplicate(const lastName, firstName: string): integer;

implementation

uses
  AppData, Duplicate;

function CheckDuplicate(const lastName, firstName: string): integer;
begin
  with dmApplication.dstDuplicate as TADODataSet do
  begin
    try
      Parameters.ParamByName('@lastname').Value := lastName;
      Parameters.ParamByName('@firstname').Value := firstName;
      Open;

      Result := RecordCount;

      if Result > 0 then
      begin
        with TfrmDuplicate.Create(nil) do
        begin
          ShowModal;

          if ModalResult = mrOk then Result := -1
          else if ModalResult = mrIgnore then Result := 0;

          Free;
        end;
      end;
    finally
      Close;
    end;
  end;
end;


end.
