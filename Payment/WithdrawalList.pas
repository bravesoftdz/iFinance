unit WithdrawalList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, RzButton, Vcl.Mask, RzEdit, RzCmboBx,
  JvExControls, JvLabel, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzRadChk, NewIntf;

type
  TfrmWithdrawalList = class(TfrmBaseDocked, INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    RzCheckBox1: TRzCheckBox;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure New;
  end;

var
  frmWithdrawalList: TfrmWithdrawalList;

implementation

{$R *.dfm}

uses
  PaymentData, FormsUtil, WithdrawalDetail, Withdrawal;

procedure TfrmWithdrawalList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPayment.Destroy;

  inherited;
end;

procedure TfrmWithdrawalList.FormCreate(Sender: TObject);
begin
  inherited;
  dmPayment := TdmPayment.Create(self);

  OpenGridDataSources(pnlList);
end;

procedure TfrmWithdrawalList.New;
begin
  with TfrmWithdrawalDetail.Create(nil) do
  begin
    wd := TWithdrawal.Create;
    wd.Append;

    ShowModal;

    if ModalResult = mrOk then

    wd.Destroy;

    Free;
  end;
end;

procedure TfrmWithdrawalList.sbtnNewClick(Sender: TObject);
begin
  inherited;
  New;
end;

end.
