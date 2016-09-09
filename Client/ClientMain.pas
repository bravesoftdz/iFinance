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
    edLastname: TRzDBEdit;
    edFirstname: TRzDBEdit;
    edMiddlename: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDateTimePicker1: TRzDateTimePicker;
    RzGroupBox1: TRzGroupBox;
    TabSheet4: TRzTabSheet;
    RzEdit1: TRzEdit;
    bteReferee: TRzButtonEdit;
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
    bteLandlord2: TRzButtonEdit;
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
    JvLabel27: TJvLabel;
    RzButtonEdit6: TRzButtonEdit;
    JvLabel28: TJvLabel;
    RzDBEdit12: TRzDBEdit;
    JvLabel29: TJvLabel;
    RzDBEdit13: TRzDBEdit;
    JvLabel30: TJvLabel;
    RzDBEdit14: TRzDBEdit;
    JvLabel31: TJvLabel;
    JvLabel32: TJvLabel;
    RzDBEdit15: TRzDBEdit;
    JvLabel33: TJvLabel;
    RzDBEdit16: TRzDBEdit;
    JvLabel34: TJvLabel;
    JvLabel36: TJvLabel;
    RzURLLabel2: TRzURLLabel;
    RzDBLookupComboBox8: TRzDBLookupComboBox;
    RzDBLookupComboBox9: TRzDBLookupComboBox;
    RzDBLookupComboBox10: TRzDBLookupComboBox;
    RzDBMemo1: TRzDBMemo;
    JvGroupHeader1: TJvGroupHeader;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImmHeadClick(Sender: TObject);
    procedure bteLandlordButtonClick(Sender: TObject);
    procedure bteLandlord2ButtonClick(Sender: TObject);
    procedure bteRefereeAltBtnClick(Sender: TObject);
    procedure bteRefereeButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetClientName;
  public
    { Public declarations }
    function Save: boolean;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  Client, ClientData, FormsUtil, LandlordSearch, ImmHeadSearch, Landlord,
  ImmediateHead, RefereeSearch, Referee, AuxData, StatusIntf;

{$R *.dfm}

{ TfrmClientMain }

procedure TfrmClientMain.bteLandlord2ButtonClick(Sender: TObject);
begin
  with TfrmLandlordSearch.Create(nil) do
  begin
    try
      llord := TLandLord.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        bteLandlord2.Text := llord.Name;
        edLandLordContact2.Text := llord.Contact;
        cln.LandlordProv := llord;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

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
        cln.LandlordPres := llord;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmClientMain.bteRefereeAltBtnClick(Sender: TObject);
begin
  inherited;
  cln.Referee := nil;
  bteReferee.Clear;
end;

procedure TfrmClientMain.bteRefereeButtonClick(Sender: TObject);
begin
  with TfrmRefereeSearch.Create(self) do
  begin
    try
      try
        ref := TReferee.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
          bteReferee.Text := ref.Name;
          cln.Referee := ref;
        end;
      except
        on e: Exception do
          ShowMessage(e.Message);
      end;
    finally
      Free;
    end;
  end;

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

procedure TfrmClientMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cln.Destroy;
  dmClient.Free;
  inherited;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmClient := TdmClient.Create(self);
  dmAux := TdmAux.Create(self);

  if not Assigned(cln) then
  begin
    cln := TClient.Create;
    cln.Add;
  end;
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
  inherited;

  // the 2 lines below are a hack to refresh the display
  // controls are not displayed properly initially
  pcClient.Repaint;

  OpenDropdownDataSources(tsClientInfo);
end;

function TfrmClientMain.Save: boolean;
var
  st: IStatus;
  error: string;
begin
  try
    if Supports(Application.MainForm,IStatus,st) then
    begin
      error := '';

      if Trim(edLastname.Text) = '' then
      begin
        error := 'Please enter client''s lastname.';
        st.ShowError(error);
        Exit;
      end;

      if Trim(edFirstname.Text) = '' then
      begin
        error := 'Please enter client''s firstname.';
        st.ShowError(error);
        Exit;
      end;

      Result := error = '';

      if Result then
      begin
        cln.Save;
        SetClientName;
      end;
    end;
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
