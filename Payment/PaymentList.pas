unit PaymentList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, RzCmboBx, JvExControls, JvLabel, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, ADODB, DockIntf, Vcl.Mask, RzEdit, RzButton;

type
  TfrmPaymentList = class(TfrmBaseDocked)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    JvLabel1: TJvLabel;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    cmbBranch: TRzComboBox;
    dteFrom: TRzDateTimeEdit;
    JvLabel2: TJvLabel;
    dteUntil: TRzDateTimeEdit;
    pnlGo: TRzPanel;
    btnGo: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure grListDblClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure RefreshDataSource;
    procedure FilterList;
    procedure InitialiseFilterControls;
  public
    { Public declarations }
  end;

var
  frmPaymentList: TfrmPaymentList;

implementation

{$R *.dfm}

uses
  AppData, FormsUtil, IFinanceGlobal, AppConstants, PaymentMain, Payment, ActiveClient,
  PaymentListParams, PaymentMethod;

procedure TfrmPaymentList.InitialiseFilterControls;
begin
  // initialise dates
  if not Assigned(plp) then plp := TPaymentListParams.Create;


  dteFrom.Date := plp.FromDate;
  dteUntil.Date := plp.UntilDate;

  cmbBranch.Value := plp.LocationCode;
end;

procedure TfrmPaymentList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // save latest params
  plp.FromDate := dteFrom.Date;
  plp.UntilDate := dteUntil.Date;
  plp.LocationCode := cmbBranch.Value;

  inherited;
end;

procedure TfrmPaymentList.FormCreate(Sender: TObject);
begin
  inherited;
  PopulateBranchComboBox(cmbBranch);

  InitialiseFilterControls;
  RefreshDataSource;
  FilterList;
end;

procedure TfrmPaymentList.grListDblClick(Sender: TObject);
var
  intf: IDock;
  activeCln: TActiveClient;
  paymentMethod: TPaymentMethod;
begin
  with  grList.DataSource.DataSet do
  begin
    if RecordCount > 0 then
    begin
      // client class
      activeCln := TActiveClient.Create;
      activeCln.Id := FieldByName('entity_id').AsString;
      activeCln.Name := FieldByName('name').AsString;

      // payment
      pmt := TPayment.Create;
      pmt.PaymentId := FieldByName('payment_id').AsString;
      pmt.Client := activeCln;
      pmt.Date := FieldByName('payment_date').AsDateTime;
      pmt.ReceiptNo := FieldByName('receipt_no').AsString;
      pmt.ReferenceNo := FieldByname('ref_no').AsString;
      pmt.PostDate := FieldByName('post_date').AsDateTime;
      pmt.LocationCode := FieldByName('loc_code').AsString;

      paymentMethod := TPaymentMethod.Create;
      paymentMethod.Method := TMethod(FieldByName('pmt_method').AsInteger);
      pmt.PaymentMethod := paymentMethod;

      if Supports(Application.MainForm,IDock,intf) then
        intf.DockForm(fmPaymentMain);
    end;
  end;
end;

procedure TfrmPaymentList.RefreshDataSource;
var
  frDate, utDate: TDateTime;
begin
  frDate := dteFrom.Date;
  utDate := dteUntil.Date;

  with grList.DataSource do
  begin
    DataSet.Close;
    (DataSet as TADODataSet).Parameters.ParamByName('@from_date').Value := frDate;
    (DataSet as TADODataSet).Parameters.ParamByName('@until_date').Value := utDate;
    DataSet.Open;
  end;
end;

procedure TfrmPaymentList.btnGoClick(Sender: TObject);
begin
  inherited;
  RefreshDataSource;
end;

procedure TfrmPaymentList.FilterList;
begin

end;

end.
