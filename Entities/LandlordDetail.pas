unit LandlordDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel;

type
  TfrmLandlordDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    edMiddle: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
  private
    { Private declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  public
    { Public declarations }
  end;

var
  frmLandlordDetail: TfrmLandlordDetail;

implementation

{$R *.dfm}

uses
  EntitiesData, Landlord;

{ TfrmLandlordDetail }

procedure TfrmLandlordDetail.Cancel;
begin
  inherited;

end;

procedure TfrmLandlordDetail.Save;
begin
  llord.Save;
end;

function TfrmLandlordDetail.ValidEntry: boolean;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then
    error := 'Please enter a lastname.'
  else if Trim(edFirstname.Text) = '' then
    error := 'Please enter a firstname.';

  Result := error = '';

  lblStatus.Caption := error;
  lblStatus.Visible := not Result;
end;

end.
