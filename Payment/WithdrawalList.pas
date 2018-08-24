unit WithdrawalList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, RzButton, Vcl.Mask, RzEdit, RzCmboBx,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzRadChk, NewIntf;

type
  TfrmWithdrawalList = class(TfrmBaseDocked, INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    RzCheckBox1: TRzCheckBox;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure PostWithdrawal;
  public
    { Public declarations }
    procedure New;
  end;

var
  frmWithdrawalList: TfrmWithdrawalList;

implementation

{$R *.dfm}

uses
  PaymentData, FormsUtil, WithdrawalDetail, Withdrawal, Payment, PaymentMethod,
  DockIntf, AppConstants, ActiveClient;

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

procedure TfrmWithdrawalList.grListDblClick(Sender: TObject);
begin
  inherited;
  PostWithdrawal;
end;

procedure TfrmWithdrawalList.New;
begin
  with TfrmWithdrawalDetail.Create(nil) do
  begin
    wd := TWithdrawal.Create;
    try
      wd.Append;

      ShowModal;

      if ModalResult <> mrOK then wd.Cancel;

    finally
      wd.Destroy;
    end;

    Free;
  end;
end;

procedure TfrmWithdrawalList.PostWithdrawal;
var
  intf: IDock;
  client: TActiveClient;
begin
  pmt := TPayment.Create;
  pmt.PaymentMethod.Method := mdBankWithdrawal;
  pmt.Withdrawn := grList.DataSource.DataSet.FieldByName('wd_amt').AsCurrency;
  pmt.WithdrawalId := grList.DataSource.DataSet.FieldByName('wd_id').AsString;

  // client
  client := TActiveClient.Create;
  client.Id := grList.DataSource.DataSet.FieldByName('entity_id').AsString;
  client.Name := grList.DataSource.DataSet.FieldByName('client').AsString;

  pmt.Client := client;

  if Supports(Application.MainForm,IDock,intf) then
      intf.DockForm(fmPaymentMain);
end;

procedure TfrmWithdrawalList.sbtnNewClick(Sender: TObject);
begin
  inherited;
  New;
end;

end.
