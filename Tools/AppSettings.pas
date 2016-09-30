unit AppSettings;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, JvExControls, JvGroupHeader, Vcl.Mask, RzEdit,
  RzDBEdit, JvLabel;

type
  TfrmAppSettings = class(TfrmBaseDocked)
    pnlList: TRzPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    edLastname: TRzDBEdit;
    JvLabel2: TJvLabel;
    RzDBEdit1: TRzDBEdit;
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
