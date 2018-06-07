unit SecurityData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB;

type
  TdmSecurity = class(TDataModule)
    dscUser: TDataSource;
    dscRole: TDataSource;
    dstUsers: TADODataSet;
    dstRoles: TADODataSet;
    dstRoleRights: TADODataSet;
    dstRights: TADODataSet;
    dstUserRoles: TADODataSet;
    procedure fdtUserBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSecurity: TdmSecurity;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData, SecurityUtil;

procedure TdmSecurity.fdtUserBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('PASSKEY').AsString := Encrypt(DataSet.FieldByName('PASSKEY').AsString);
end;

end.
