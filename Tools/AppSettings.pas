unit AppSettings;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit,
  RzDBEdit, RzButton, RzRadChk, System.UITypes, StrUtils, SaveIntf,
  Vcl.ComCtrls, RzDTP;

type
  TfrmAppSettings = class(TfrmBaseDocked,ISave)
    RzGroupBox1: TRzGroupBox;
    edBranchCode: TRzEdit;
    edBranchPrefix: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    RzEdit2: TRzEdit;
    cbxNew: TRzCheckBox;
    cbxEnableBacklog: TRzCheckBox;
    RzGroupBox3: TRzGroupBox;
    dteCutoff: TRzDateTimeEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SaveConfig;
    procedure SetControlValue;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

const
  // match the number at the right to the tag property of the control

  LOCATION_CODE = 'LOCATION_CODE';                    // 0
  LOCATION_PREFIX = 'LOCATION_PREFIX';                // 1
  BACKLOG_ENTRY_ENABLED = 'BACKLOG_ENTRY_ENABLED';    // 2
  CUT_OFF_DATE = 'CUT_OFF_DATE';                      // 3

  CONFIG: array [1..4] of string =
    (LOCATION_CODE,
     LOCATION_PREFIX,
     BACKLOG_ENTRY_ENABLED,
     CUT_OFF_DATE
    );

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData;

procedure TfrmAppSettings.Cancel;
begin
  SetControlValue;
end;

procedure TfrmAppSettings.FormCreate(Sender: TObject);
begin
  inherited;
  SetControlValue;
end;

function TfrmAppSettings.Save: boolean;
begin
  SaveConfig;
  Result := true;
end;

procedure TfrmAppSettings.SaveConfig;
var
  code: string;
begin
  with dmApplication.dstConfig do
  begin
    Open;

    for code in CONFIG do
    begin
      if Locate('sysconfig_code',code,[]) then Edit
      else
      begin
        Append;
        FieldByName('sysconfig_code').AsString := code;
        FieldByName('sysconfig_name').AsString := code;
      end;

      case AnsiIndexStr(code,CONFIG) of
        0: FieldbyName('sysconfig_value').AsString := edBranchCode.Text;
        1: FieldbyName('sysconfig_value').AsString := edBranchPrefix.Text;
        2: FieldbyName('sysconfig_value').AsInteger := Ord(cbxEnableBacklog.Checked);
        3: FieldByName('sysconfig_value').AsString := DateToStr(dteCutoff.Date);
      end;
    end;

    Post;

    Close;
  end;
end;

procedure TfrmAppSettings.SetControlValue;
var
  code, value: string;
  i, LTag: integer;
begin
  with dmApplication.dstConfig do
  begin
    Open;

    for code in CONFIG do
    begin
      if Locate('sysconfig_code',code,[]) then
      begin
        value := FieldByName('sysconfig_value').AsString;

        LTag := AnsiIndexStr(code,CONFIG);

        for i := 0 to self.ControlCount - 1 do
        begin
          if self.Controls[i].Tag = LTag then
          begin
            if self.Controls[i] is TRzEdit then (self.Controls[i] as TRzEdit).Text := value
            else if self.Controls[i] is TRzCheckBox then (self.Controls[i] as TRzCheckBox).Checked := StrToBool(value)
            else if self.Controls[i] is TRzDateTimeEdit then (self.Controls[i] as TRzDateTimeEdit).Date := StrToDate(value);
          end;
        end;
      end;
    end;

    Close;
  end;
end;

end.
