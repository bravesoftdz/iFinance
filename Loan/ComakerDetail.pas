unit ComakerDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  Vcl.DBCtrls, RzDBCmbo, RzDBEdit, Vcl.Mask, RzEdit, RzBtnEdt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid;

type
  TfrmComakerDetail = class(TfrmBasePopupDetail)
    edMiddlename: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
    dteBirthdate: TRzDBDateTimeEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    urlCopyAddress: TRzURLLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    bteEmployer: TRzButtonEdit;
    mmEmployerAddress: TRzMemo;
    RzDBEdit12: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzGroupBox5: TRzGroupBox;
    RzGroupBox6: TRzGroupBox;
    RzGroupBox7: TRzGroupBox;
    RzGroupBox8: TRzGroupBox;
    RzGroupBox9: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteEmployerButtonClick(Sender: TObject);
    procedure bteEmployerAltBtnClick(Sender: TObject);
    procedure urlCopyAddressClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure  SetUnboundControls;
    procedure ChangeControlState;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  end;

var
  frmComakerDetail: TfrmComakerDetail;

implementation

{$R *.dfm}

uses
  ComakerData, AuxData, FormsUtil, Comaker, EmployerSearch, Employer, IFinanceDialogs,
  Loan;

procedure TfrmComakerDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAux.Destroy;
  dmComaker.Destroy;

  inherited;
end;

procedure TfrmComakerDetail.FormCreate(Sender: TObject);
begin
  dmAux := TdmAux.Create(self);
  dmComaker := TdmComaker.Create(self);

  OpenDropdownDataSources(tsDetail);

  ChangeControlState;

  inherited;
end;

procedure TfrmComakerDetail.FormShow(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmComakerDetail.ChangeControlState;
begin
  edLastname.ReadOnly := (not ln.IsPending) and (ln.Action <> laCreating);
  edFirstname.ReadOnly := (not ln.IsPending) and (ln.Action <> laCreating);
  edMiddlename.ReadOnly := (not ln.IsPending) and (ln.Action <> laCreating);
end;

procedure TfrmComakerDetail.Save;
begin
  cm.Save;
end;

procedure TfrmComakerDetail.urlCopyAddressClick(Sender: TObject);
begin
  inherited;
  cm.CopyAddress;
end;

procedure TfrmComakerDetail.BindToObject;
begin
  inherited;

end;

procedure TfrmComakerDetail.bteEmployerAltBtnClick(Sender: TObject);
begin
  inherited;
  cm.Employer := nil;
  bteEmployer.Clear;
  mmEmployerAddress.Clear;
end;

procedure TfrmComakerDetail.bteEmployerButtonClick(Sender: TObject);
begin
  with TfrmEmployerSearch.Create(nil) do
  begin
    try
      emp := TEmployer.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        bteEmployer.Text := emp.Name;
        mmEmployerAddress.Text := emp.Address;
        cm.Employer := emp;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmComakerDetail.Cancel;
begin
  cm.Cancel;
end;

procedure TfrmComakerDetail.SetUnboundControls;
begin
  if Assigned(cm.Employer) then
  begin
    bteEmployer.Text := cm.Employer.Name;
    mmEmployerAddress.Text := cm.Employer.Address;
  end;
end;

function TfrmComakerDetail.ValidEntry;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then
    error := 'Please enter comaker lastname.'
  else if Trim(edFirstname.Text) = '' then
    error := 'Please enter comaker firstname.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

end.
