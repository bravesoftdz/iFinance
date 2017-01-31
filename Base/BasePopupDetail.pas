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
    pnlDetail: TRzPanel;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    pnlSave: TRzPanel;
    btnSave: TRzShapeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CallErrorBox(const error: string);
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

uses
  ErrorBox;

procedure TfrmBasePopupDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ModalResult in [mrClose,mrCancel] then Cancel;
end;

procedure TfrmBasePopupDetail.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBasePopupDetail.btnYesClick(Sender: TObject);
begin
  inherited;
  if ValidEntry then
  begin
    try
      Save;
      ModalResult := mrOK;

    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmBasePopupDetail.CallErrorBox(const error: string);
begin
  with TfrmErrorBox.Create(self,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
