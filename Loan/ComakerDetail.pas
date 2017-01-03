unit ComakerDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  Vcl.DBCtrls, RzDBCmbo, RzDBEdit, Vcl.Mask, RzEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid;

type
  TfrmComakerDetail = class(TfrmBasePopupDetail)
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    edMiddlename: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edLastname: TRzDBEdit;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel7: TJvLabel;
    dteBirthdate: TRzDBDateTimeEdit;
    JvLabel12: TJvLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    JvLabel8: TJvLabel;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    JvGroupHeader5: TJvGroupHeader;
    JvLabel22: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    JvLabel6: TJvLabel;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    urlCopyAddress: TRzURLLabel;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    JvGroupHeader6: TJvGroupHeader;
    JvLabel23: TJvLabel;
    bteEmployer: TRzButtonEdit;
    JvLabel24: TJvLabel;
    mmEmployerAddress: TRzMemo;
    JvLabel28: TJvLabel;
    RzDBEdit12: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteEmployerButtonClick(Sender: TObject);
    procedure bteEmployerAltBtnClick(Sender: TObject);
    procedure urlCopyAddressClick(Sender: TObject);
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
  frmComakerDetail: TfrmComakerDetail;

implementation

{$R *.dfm}

uses
  ComakerData, AuxData, FormsUtil, Comaker, EmployerSearch, Employer;

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
  inherited;
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

function TfrmComakerDetail.ValidEntry;
var
  error: string;
begin
  if Trim(edLastname.Text) = '' then
    error := 'Please enter comaker lastname.'
  else if Trim(edFirstname.Text) = '' then
    error := 'Please enter comaker firstname.';

  Result := error = '';

  if not Result then CallErrorBox(error);
end;

end.
