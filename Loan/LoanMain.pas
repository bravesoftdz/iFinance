unit LoanMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzDBEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, SaveIntf,  RzButton, RzRadChk,
  LoanIntf, Loan, RzLstBox, RzDBList, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid,
  Vcl.Imaging.pngimage;

type
  TfrmLoanMain = class(TfrmBaseDocked, ISave, ILoan)
    pnlMain: TRzPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel1: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    dteDateApplied: TRzDBDateTimeEdit;
    edAppAmount: TRzDBNumericEdit;
    edDesiredTerm: TRzDBEdit;
    edPurpose: TRzDBEdit;
    bteClient: TRzButtonEdit;
    dbluLoanClass: TRzDBLookupComboBox;
    JvLabel2: TJvLabel;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel8: TJvLabel;
    dteDateApproved: TRzDBDateTimeEdit;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    edAppvAmount: TRzDBNumericEdit;
    edAppvInterest: TRzDBEdit;
    JvLabel11: TJvLabel;
    edAppvTerm: TRzDBEdit;
    lblLoanId: TRzLabel;
    JvLabel12: TJvLabel;
    edInterest: TRzDBNumericEdit;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    edRelAmount: TRzDBNumericEdit;
    dteDateReleased: TRzDBDateTimeEdit;
    cbxApproved: TRzCheckBox;
    cbxReleased: TRzCheckBox;
    cbxCancelled: TRzCheckBox;
    cbxDenied: TRzCheckBox;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel3: TJvLabel;
    dbluAcctType: TRzDBLookupComboBox;
    btnAddComaker: TRzButton;
    btnRemoveComaker: TRzButton;
    grComakers: TRzDBGrid;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    Image1: TImage;
    mmAlerts: TRzMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
    procedure cbxCancelledClick(Sender: TObject);
    procedure cbxDeniedClick(Sender: TObject);
    procedure cbxApprovedClick(Sender: TObject);
    procedure cbxReleasedClick(Sender: TObject);
    procedure btnAddComakerClick(Sender: TObject);
    procedure btnRemoveComakerClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState(const useState: boolean = true);
    procedure SetAction(const action: TLoanAction = laNone);
    procedure CallErrorBox(const error: string);
  public
    { Public declarations }
    procedure SetLoanId;
    procedure SetUnboundControls;
    procedure RefreshDropDownSources;
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmLoanMain: TfrmLoanMain;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, DockIntf, IFinanceGlobal,
  Comaker, ComakerSearch, DecisionBox;

procedure TfrmLoanMain.CallErrorBox(const error: string);
var
  intf: IStatus;
begin
  if Supports(Application.MainForm,IStatus,intf) then
    intf.ShowError(error);
end;

procedure TfrmLoanMain.ChangeControlState(const useState: boolean);
var
  i: integer;
  tags: set of 0..7;
begin
  if useState then
  begin
    if ln.IsPending then
      tags := [0,1,2,3,4]
    else if ln.IsApproved then
      tags := [2,6]
    else if ln.IsReleased then
      tags := []
    else if ln.IsCancelled then
      tags := []
    else if ln.IsDenied then
      tags := []
    else if ln.IsApprovedCancelled then
      tags := [];
  end
  else
  begin
    if ln.Action = laCreating then
    begin
      if Assigned(ln.Client) then tags := [0,1]
      else tags := [0];
    end
    else if ln.Action = laApproving then
      tags := [4,5]
    else if ln.Action = laReleasing then
      tags := [6,7]
    else if ln.Action = laCancelling then
      tags := [2]
    else if ln.Action = laDenying then
      tags := [3];
  end;

  // enable or disable controls
  for i := 0 to pnlMain.ControlCount - 1 do
    if pnlMain.Controls[i].Tag <> -1 then
      pnlMain.Controls[i].Enabled := pnlMain.Controls[i].Tag in tags;
end;

procedure TfrmLoanMain.RefreshDropDownSources;
begin
  OpenDropdownDataSources(pnlMain);
end;

procedure TfrmLoanMain.SetAction(const action: TLoanAction);
begin
  ln.Action := action;

  if action = laNone then
    ChangeControlState
  else
    ChangeControlState(false);

  ln.SetDefaultValues;
end;

procedure TfrmLoanMain.bteClientButtonClick(Sender: TObject);
begin
  with TfrmClientSearch.Create(self) do
  begin
    try
      try
        ShowModal;

        if ModalResult = mrOK then
        begin
            bteClient.Text := lnc.Name;
            ln.Client := lnc;

            OpenDropdownDataSources(self.pnlMain);

            ChangeControlState(false);

            ln.GetAlerts;
            mmAlerts.Text := ln.Alerts;
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

procedure TfrmLoanMain.btnAddComakerClick(Sender: TObject);
begin
  if ln.LoanClass.ComakersNotRequired then
    CallErrorBox('No comakers required.')
  else if ln.ComakerCount >= ln.LoanClass.Comakers then
    CallErrorBox('Number of comakers has already been met. ' +
        'If a comaker has been mistakenly declared, remove the comaker and add again.')
  else
  with TfrmComakerSearch.Create(nil) do
  begin
    try
      ShowModal;

      if ModalResult = mrOK then
      begin
        if Trim(ln.Client.Id) = Trim(cm.Id) then
          CallErrorBox('Client cannot be declared as a comaker.')
        else if ln.ComakerExists(cm) then
          CallErrorBox('Comaker already exists.')
        else
        begin
          ln.AddComaker(cm);
          cm.Free;
        end;
      end;

      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.btnRemoveComakerClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected comaker?';
var
  id: string;
begin
  with TfrmDecisionBox.Create(nil,CONF) do
  begin
    try
      if grComakers.DataSource.DataSet.RecordCount > 0 then
      begin
        id := grComakers.DataSource.DataSet.FieldByName('entity_id').AsString;

        ShowModal;

        if ModalResult = mrYes then
        begin
          grComakers.DataSource.DataSet.Delete;
          ln.RemoveComaker(TComaker.Create(id));
        end;

        Free;
      end;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.Cancel;
begin
  ln.Cancel;

  // clear the client box
  if ln.Action = laCreating then
  begin
    bteClient.Clear;
    ln.Client := nil;
  end;

  ChangeControlState(false);
end;

procedure TfrmLoanMain.cbxApprovedClick(Sender: TObject);
begin
  inherited;
  if ln.IsPending then
  begin
    if (Sender as TRzCheckBox).Checked then
      SetAction(laApproving)
    else
      SetAction;
  end;
end;

procedure TfrmLoanMain.cbxCancelledClick(Sender: TObject);
begin
  inherited;
  if (ln.IsPending) or (ln.IsApproved) then
  begin
    if (Sender as TRzCheckBox).Checked then
      SetAction(laCancelling)
    else
      SetAction;
  end;
end;

procedure TfrmLoanMain.cbxDeniedClick(Sender: TObject);
begin
  inherited;
  if ln.IsPending then
  begin
    if (Sender as TRzCheckBox).Checked then
      SetAction(laDenying)
    else
      SetAction;
  end;
end;

procedure TfrmLoanMain.cbxReleasedClick(Sender: TObject);
begin
  inherited;
  if ln.IsApproved then
  begin
    if (Sender as TRzCheckBox).Checked then
      SetAction(laReleasing)
    else
      SetAction;
  end;
end;

procedure TfrmLoanMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  intf: IDock;
begin
  if ln.Action <> laCreating then
    if Supports(Application.MainForm,IDock,intf) then
      intf.AddRecentLoan(ln);

  dmLoan.Destroy;

  ln.Destroy;

  inherited;
end;

procedure TfrmLoanMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmLoan := TdmLoan.Create(self);

  if not Assigned(ln) then
  begin
    ln := TLoan.Create;
    ln.Add;
  end
  else
  begin
    ln.Retrieve;
    OpenDropdownDataSources(pnlMain);

    SetUnboundControls;
    SetLoanId;
    ChangeControlState;
  end;
end;

procedure TfrmLoanMain.SetLoanId;
begin
 lblLoanId.Caption := 'LOAN ID: ' + ln.Id;
end;

procedure TfrmLoanMain.SetUnboundControls;
begin
  bteClient.Text := ln.Client.Name;

  cbxCancelled.Checked := (ln.IsCancelled) or (ln.IsApprovedCancelled);
  cbxDenied.Checked := ln.IsDenied;
  cbxApproved.Checked := (ln.IsApproved) or (ln.IsReleased) or (ln.IsApprovedCancelled);
  cbxReleased.Checked := ln.IsReleased;
end;

function TfrmLoanMain.Save: Boolean;
var
  error: string;
begin
  Result := false;
  try
    error := '';

    if ln.Action = laCreating then
    begin
      if not Assigned(ln.Client) then
        error := 'No client selected.'
      else if dbluLoanClass.Text = '' then
        error := 'Please select a loan class.'
      else if dbluAcctType.Text = '' then
        error := 'Please select an account type.'
      else if dteDateApplied.Text = '' then
        error := 'Please enter date applied.'
      else if edAppAmount.Value <= 0 then
        error := 'Invalid value for amount.'
      else if edDesiredTerm.Text = '' then
        error := 'Invalid value for desired term.'
      else if Trim(edPurpose.Text) = '' then
        error := 'Please enter a purpose.';
    end
    else if ln.Action = laApproving then
    begin
      if dteDateApproved.Text = '' then
        error := 'Please enter date applied.'
      else if edAppAmount.Value <= 0 then
        error := 'Invalid value for amount.'
      else if edAppvInterest.Text = '' then
        error := 'Please enter interest.'
      else if edAppvTerm.Text = '' then
        error := 'Please enter term.'
      else if ln.ComakerCount < ln.LoanClass.Comakers then
        error := 'Number of required comakers has not been met.'
      else if ln.ComakerCount > ln.LoanClass.Comakers then
        error := 'Declared comakers exceeds the required number.';
    end
    else if ln.Action = laReleasing then
    begin
      if dteDateReleased.Text = '' then
        error := 'Please enter date released.'
      else if edRelAmount.Value <= 0 then
        error := 'Invalid value for amount.';
    end;

    Result := error = '';

    if Result then
    begin
      ln.Save;
      SetLoanId;
      ChangeControlState;
      ln.Action := laNone;
    end
    else
      CallErrorBox(error);
  finally

  end;

end;

end.
