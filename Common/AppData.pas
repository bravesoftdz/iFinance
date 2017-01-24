unit AppData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ConnUtil;

type
  TdmApplication = class(TDataModule)
    acMain: TADOConnection;
    spGenId: TADOStoredProc;
    dstUser: TADODataSet;
    acCore: TADOConnection;
    dstConfig: TADODataSet;
    dstClients: TADODataSet;
    dscClients: TDataSource;
    dstLoans: TADODataSet;
    dscLoans: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure acMainBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure acCoreBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmApplication: TdmApplication;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmApplication.acCoreBeforeConnect(Sender: TObject);
begin
  acCore.ConnectionString := GetConnection('','','',true);
end;

procedure TdmApplication.acMainBeforeConnect(Sender: TObject);
begin
  acMain.ConnectionString := GetConnection('','','');
end;

procedure TdmApplication.DataModuleCreate(Sender: TObject);
begin
  acCore.Open;
end;

procedure TdmApplication.DataModuleDestroy(Sender: TObject);
begin
  acMain.Close;
end;

end.
