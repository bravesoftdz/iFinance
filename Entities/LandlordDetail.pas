unit LandlordDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel, RzButton, RzTabs, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLandlordDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    edMiddle: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
    JvLabel22: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLandlordDetail: TfrmLandlordDetail;

implementation

{$R *.dfm}

uses
  EntitiesData, Landlord, IFinanceDialogs;

procedure TfrmLandlordDetail.Cancel;
begin
  inherited;
  llord.Cancel;
end;

procedure TfrmLandlordDetail.Save;
begin
  llord.Save;
end;

function TfrmLandlordDetail.ValidEntry: boolean;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then error := 'Please enter a lastname.'
  else if Trim(edFirstname.Text) = '' then error := 'Please enter a firstname.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
