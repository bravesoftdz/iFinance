unit Duplicate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, RzButton;

type
  TfrmDuplicate = class(TfrmBasePopup)
    pnlDuplicate: TRzPanel;
    grDuplicate: TRzDBGrid;
    RzLabel2: TRzLabel;
    Image1: TImage;
    pnlSelect: TRzPanel;
    btnContinue: TRzShapeButton;
    procedure grDuplicateDblClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDuplicate: TfrmDuplicate;

implementation

{$R *.dfm}

uses
  AppData, ClientIntf, Client, AppConstants;

procedure TfrmDuplicate.btnContinueClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrIgnore;
end;

procedure TfrmDuplicate.grDuplicateDblClick(Sender: TObject);
var
  id, displayId, clientName: string;
  intf: IClient;
  dock: TComponent;
  dockControl: TWinControl;
begin
  with grDuplicate.DataSource.DataSet do
  begin
      id := FieldByName('entity_id').AsString;
      displayId := FieldByName('display_id').AsString;
      clientName := FieldByName('name').AsString;

      cln.Destroy;

      cln := TClient.Create;
      cln.Id := id;
      cln.DisplayId := displayId;
      cln.Name := clientName;
      cln.Retrieve(true);

      // find the dock panel
      dock := Application.MainForm.FindComponent('pnlDockMain');

      dockControl := dock as TWinControl;

      if Supports(dockControl.Controls[0] as TForm,IClient,intf) then
      begin
        intf.SetClientName;
        intf.SetUnboundControls;
        intf.LoadPhoto;
        intf.SetLandLordControlsPres;
        intf.SetLandLordControlsProv;
      end;

      ModalResult := mrOk;
  end;
end;

end.
