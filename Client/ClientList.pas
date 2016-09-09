unit ClientList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, DockedFormIntf, Data.DB, Vcl.Mask, RzEdit, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid;

type
  TfrmClientList = class(TfrmBaseDocked, IDockedForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzDBGrid1: TRzDBGrid;
    Label1: TLabel;
    RzEdit1: TRzEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTitle(const title: string);
  end;

var
  frmClientList: TfrmClientList;

implementation

{$R *.dfm}

procedure TfrmClientList.SetTitle(const title: string);
begin
  lblTitle.Caption := title;
end;

end.
