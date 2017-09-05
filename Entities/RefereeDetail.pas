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
    edMiddleName: TRzDBEdit;
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
  EntitiesData, Referee, IFinanceDialogs, EntityUtils;

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
  duplicates: integer;
begin
  Result := false;

  if Trim(edLastname.Text) = '' then error := 'Please enter a lastname.'
  else if Trim(edFirstname.Text) = '' then error := 'Please enter a firstname.'
  else if Trim(edMiddlename.Text) = '' then error := 'Please enter a middlename.'
  else
  begin
    duplicates := CheckDuplicate(edLastname.Text,edFirstname.Text, edMiddlename.Text);
    if duplicates > 0 then  error := 'Duplicates found.'
    else if duplicates = -1 then // -1 means to abort the adding of the new record
    begin
      error := 'Abort';  // assign any value to the Result it's not going to displayed anyway
      Exit;
    end;
  end;

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
