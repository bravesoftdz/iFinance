unit RefereeDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit, RzDBEdit, JvExControls, JvLabel;

type
  TfrmRefereeDetail = class(TfrmBasePopupDetail)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel22: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    edMiddle: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
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
  frmRefereeDetail: TfrmRefereeDetail;

implementation

{$R *.dfm}

uses
  EntitiesData, Referee, IFinanceDialogs;

procedure TfrmRefereeDetail.Cancel;
begin
  inherited;
  ref.Cancel;
end;

procedure TfrmRefereeDetail.Save;
begin
  ref.Save;
end;

function TfrmRefereeDetail.ValidEntry: boolean;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then error := 'Please enter a lastname.'
  else if Trim(edFirstname.Text) = '' then error := 'Please enter a firstname.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
