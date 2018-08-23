unit LandlordDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, RzButton, RzTabs, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmLandlordDetail = class(TfrmBasePopupDetail)
    edMiddle: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  end;

var
  frmLandlordDetail: TfrmLandlordDetail;

implementation

{$R *.dfm}

uses
  EntitiesData, Landlord, IFinanceDialogs;

procedure TfrmLandlordDetail.BindToObject;
begin
  inherited;

end;

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
