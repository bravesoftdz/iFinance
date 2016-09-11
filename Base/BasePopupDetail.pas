unit BasePopupDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmBasePopupDetail = class(TfrmBasePopup)
    pcDetail: TRzPageControl;
    tsDetail: TRzTabSheet;
    btnSave: TRzButton;
    btnCancel: TRzButton;
    lblStatus: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure Save; virtual; abstract;
    procedure Cancel; virtual; abstract;
    function ValidEntry: boolean; virtual; abstract;
  public
    { Public declarations }
  end;

var
  frmBasePopupDetail: TfrmBasePopupDetail;

implementation

{$R *.dfm}

procedure TfrmBasePopupDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrCancel then
    Cancel;
end;

procedure TfrmBasePopupDetail.btnSaveClick(Sender: TObject);
begin
  inherited;
  if ValidEntry then
  begin
    try
      Save;
      ModalResult := mrOK;

    except
      on e: Exception do
      begin
        lblStatus.Caption := e.Message;
        lblStatus.Visible := true;
      end;
    end;
  end;
end;

end.
