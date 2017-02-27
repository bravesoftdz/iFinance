unit AppSettings;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, JvExControls, JvGroupHeader, Vcl.Mask, RzEdit,
  RzDBEdit, JvLabel, RzButton, RzRadChk;

type
  TfrmAppSettings = class(TfrmBaseDocked)
    RzGroupBox1: TRzGroupBox;
    JvLabel1: TJvLabel;
    edSearchKey: TRzEdit;
    JvLabel2: TJvLabel;
    RzEdit1: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    JvLabel3: TJvLabel;
    RzEdit2: TRzEdit;
    cbxNew: TRzCheckBox;
    RzGroupBox3: TRzGroupBox;
    JvLabel4: TJvLabel;
    RzEdit3: TRzEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppSettings: TfrmAppSettings;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
