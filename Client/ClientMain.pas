unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls,
  Vcl.ExtCtrls, SaveIntf, RzLabel, RzPanel, RzTabs, Vcl.Mask,
  RzEdit, RzDBEdit, JvLabel, JvExControls, JvGroupHeader, Vcl.DBCtrls, RzDBCmbo,
  Vcl.ComCtrls, RzDTP, RzDBDTP, RzButton, RzRadChk, RzDBChk, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, RzBtnEdt;

type
  TfrmClientMain = class(TfrmBaseDocked, ISave)
    lblClientName: TRzLabel;
    pcClient: TRzPageControl;
    tsClientInfo: TRzTabSheet;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel7: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel35: TJvLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDateTimePicker1: TRzDateTimePicker;
    RzGroupBox1: TRzGroupBox;
    TabSheet4: TRzTabSheet;
    JvGroupHeader1: TJvGroupHeader;
    RzEdit1: TRzEdit;
    RzButtonEdit1: TRzButtonEdit;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel4: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    JvLabel5: TJvLabel;
    RzDBEdit5: TRzDBEdit;
    JvLabel6: TJvLabel;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzURLLabel1: TRzURLLabel;
    JvLabel14: TJvLabel;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    JvLabel15: TJvLabel;
    bteLandlord: TRzButtonEdit;
    edLandlordContact: TRzEdit;
    JvLabel16: TJvLabel;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    JvLabel11: TJvLabel;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    JvLabel17: TJvLabel;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    JvLabel18: TJvLabel;
    edLandlord2: TRzButtonEdit;
    JvLabel19: TJvLabel;
    edLandlordContact2: TRzEdit;
    JvGroupHeader5: TJvGroupHeader;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    JvLabel22: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    JvGroupHeader6: TJvGroupHeader;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    RzButtonEdit4: TRzButtonEdit;
    JvLabel25: TJvLabel;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    RzMemo1: TRzMemo;
    RzDBCheckBox1: TRzDBCheckBox;
    JvLabel26: TJvLabel;
    RzButtonEdit5: TRzButtonEdit;
    JvLabel27: TJvLabel;
    RzButtonEdit6: TRzButtonEdit;
    JvLabel28: TJvLabel;
    RzDBEdit12: TRzDBEdit;
    JvLabel29: TJvLabel;
    RzDBEdit13: TRzDBEdit;
    JvLabel30: TJvLabel;
    RzDBEdit14: TRzDBEdit;
    JvLabel31: TJvLabel;
    RzButtonEdit7: TRzButtonEdit;
    JvLabel32: TJvLabel;
    RzDBEdit15: TRzDBEdit;
    JvLabel33: TJvLabel;
    RzDBEdit16: TRzDBEdit;
    JvLabel34: TJvLabel;
    JvLabel36: TJvLabel;
    RzMemo2: TRzMemo;
    RzButtonEdit8: TRzButtonEdit;
    RzURLLabel2: TRzURLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLandlordClick(Sender: TObject);
    procedure btnImmHeadClick(Sender: TObject);
    procedure btnCameraClick(Sender: TObject);
    procedure bteLandlordButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetClientName;
  public
    { Public declarations }
    procedure Save;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead;

{$R *.dfm}

{ TfrmClientMain }

procedure TfrmClientMain.bteLandlordButtonClick(Sender: TObject);
begin
  with TfrmLandlordSearch.Create(nil) do
  begin
    try
      llord := TLandLord.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        bteLandlord.Text := llord.Name;
        edLandLordContact.Text := llord.Contact;
        cln.Landlord := llord;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.btnCameraClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Get photo');
end;

procedure TfrmClientMain.btnImmHeadClick(Sender: TObject);
begin
with TfrmImmHeadSearch.Create(nil) do
  begin
    try
      immHead := TImmediateHead.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        //edImmHead.Text := immHead.Name;
        cln.ImmediateHead := immHead;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.btnLandlordClick(Sender: TObject);
begin
  with TfrmLandlordSearch.Create(nil) do
  begin
    try
      llord := TLandLord.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        //edLandlord.Text := llord.Name;
        //edLandLordContact.Text := llord.Contact;
        cln.Landlord := llord;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cln.Destroy;
  dmClient.Free;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmClient := TdmClient.Create(nil);
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(tsClientInfo);
end;

procedure TfrmClientMain.Save;
begin
  try
    cln.Save;
    SetClientName;
  finally

  end;
end;

procedure TfrmClientMain.SetClientName;
begin
  with dmClient.dstPersonalInfo do
  begin
    lblClientName.Caption := UpperCase(FieldByName('lastname').AsString + ', ' +
        FieldByName('firstname').AsString + '   ' +
        FieldByName('entity_id').AsString);
  end;
end;

end.
