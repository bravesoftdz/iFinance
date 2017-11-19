unit LoanMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzDBEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, SaveIntf,  RzButton, RzRadChk,
  LoanIntf, Loan, RzLstBox, RzDBList, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid,
  Vcl.Imaging.pngimage, RzDBLbl, RzTabs, Vcl.ComCtrls, Vcl.ToolWin, RzGrids, AlertIntf;

type
  TfrmLoanMain = class(TfrmBaseDocked, ISave, ILoan, IAlert)
    pnlMain: TRzPanel;
    lblHeader: TRzLabel;
    pnlApplication: TRzPanel;
    c: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel6: TJvLabel;
    edDesiredTerm: TRzDBNumericEdit;
    edAppAmount: TRzDBNumericEdit;
    dteDateApplied: TRzDBDateTimeEdit;
    edInterest: TRzDBNumericEdit;
    dbluLoanClass: TRzDBLookupComboBox;
    bteClient: TRzButtonEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    lblComakersDesc: TRzDBLabel;
    lbxComakers: TRzListBox;
    JvLabel20: TJvLabel;
    JvLabel4: TJvLabel;
    pnlAssessment: TRzPanel;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    pnlApproval: TRzPanel;
    RzPanel5: TRzPanel;
    RzLabel3: TRzLabel;
    pnlRelease: TRzPanel;
    RzPanel7: TRzPanel;
    RzLabel4: TRzLabel;
    pnlCancellation: TRzPanel;
    RzPanel9: TRzPanel;
    RzLabel5: TRzLabel;
    pnlRejection: TRzPanel;
    RzPanel11: TRzPanel;
    RzLabel6: TRzLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel28: TJvLabel;
    grRecipients: TRzDBGrid;
    grCharges: TRzDBGrid;
    mmAddress: TRzMemo;
    mmEmployer: TRzMemo;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    pnlToolbar: TRzPanel;
    pnlAssessmentBtn: TRzPanel;
    imgAssessment: TImage;
    pnlApproveLoan: TRzPanel;
    imgApproval: TImage;
    pnlReleaseLoan: TRzPanel;
    imgReleaseLoan: TImage;
    pnlRejectLoan: TRzPanel;
    imgRejectLoan: TImage;
    pnlCancelLoan: TRzPanel;
    imgCancelLoan: TImage;
    pnlReloan: TRzPanel;
    imgReloan: TImage;
    pnlAdd: TRzPanel;
    btnAddComaker: TRzShapeButton;
    pnlRemoveComaker: TRzPanel;
    btnRemoveComaker: TRzShapeButton;
    RzDBLabel1: TRzDBLabel;
    RzDBLabel2: TRzDBLabel;
    RzDBLabel3: TRzDBLabel;
    pnlEditAssessment: TRzPanel;
    btnEditAssessment: TRzShapeButton;
    pcStatus: TRzPageControl;
    tsAssessment: TRzTabSheet;
    tsApproval: TRzTabSheet;
    RzDBLabel4: TRzDBLabel;
    RzDBLabel5: TRzDBLabel;
    RzDBLabel6: TRzDBLabel;
    RzDBLabel7: TRzDBLabel;
    RzDBLabel8: TRzDBLabel;
    pnlEditApproval: TRzPanel;
    btnEditApproval: TRzShapeButton;
    pnlRestructure: TRzPanel;
    imgRestructure: TImage;
    tsReleased: TRzTabSheet;
    tsRejected: TRzTabSheet;
    tsCancelled: TRzTabSheet;
    RzDBLabel9: TRzDBLabel;
    RzDBLabel10: TRzDBLabel;
    RzDBLabel11: TRzDBLabel;
    JvLabel3: TJvLabel;
    RzDBLabel12: TRzDBLabel;
    RzDBLabel13: TRzDBLabel;
    RzDBLabel14: TRzDBLabel;
    JvLabel8: TJvLabel;
    JvLabel25: TJvLabel;
    pnlEditCancel: TRzPanel;
    btnEditCancel: TRzShapeButton;
    pnlEditRejection: TRzPanel;
    btnEditRejection: TRzShapeButton;
    RzGroupBox6: TRzGroupBox;
    RzGroupBox7: TRzGroupBox;
    RzPanel2: TRzPanel;
    RzShapeButton1: TRzShapeButton;
    tsPending: TRzTabSheet;
    pnlPending: TRzPanel;
    JvLabel1: TJvLabel;
    pnlClientRecord: TRzPanel;
    imgClientRecord: TImage;
    pnlAlerts: TRzPanel;
    imgAlerts: TImage;
    JvLabel15: TJvLabel;
    RzDBLabel15: TRzDBLabel;
    JvLabel26: TJvLabel;
    lblTotalCharges: TJvLabel;
    JvLabel27: TJvLabel;
    lblTotalReleased: TJvLabel;
    dbluPurpose: TRzDBLookupComboBox;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    JvLabel31: TJvLabel;
    JvLabel32: TJvLabel;
    JvLabel33: TJvLabel;
    pnlStatus: TRzPanel;
    JvLabel34: TJvLabel;
    edNetPay: TRzNumericEdit;
    pcAssessment: TRzPageControl;
    tsFinInfo: TRzTabSheet;
    tsMonExp: TRzTabSheet;
    grFinInfo: TRzDBGrid;
    grMonExp: TRzDBGrid;
    JvLabel35: TJvLabel;
    RzDBLabel16: TRzDBLabel;
    JvLabel36: TJvLabel;
    RzDBLabel17: TRzDBLabel;
    JvLabel37: TJvLabel;
    RzDBLabel18: TRzDBLabel;
    JvLabel38: TJvLabel;
    RzDBLabel19: TRzDBLabel;
    JvLabel39: TJvLabel;
    RzDBLabel20: TRzDBLabel;
    JvLabel40: TJvLabel;
    RzDBLabel21: TRzDBLabel;
    lblReleaseAmount: TJvLabel;
    JvLabel42: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
    procedure lbxComakersDblClick(Sender: TObject);
    procedure btnAddComakerClick(Sender: TObject);
    procedure imgAssessmentClick(Sender: TObject);
    procedure imgApprovalClick(Sender: TObject);
    procedure imgAssessmentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAssessmentMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlEditAssessmentClick(Sender: TObject);
    procedure btnEditApprovalClick(Sender: TObject);
    procedure btnRemoveComakerClick(Sender: TObject);
    procedure imgCancelLoanClick(Sender: TObject);
    procedure imgRejectLoanClick(Sender: TObject);
    procedure pnlEditRejectionClick(Sender: TObject);
    procedure btnEditCancelClick(Sender: TObject);
    procedure imgReleaseLoanClick(Sender: TObject);
    procedure btnEditAssessmentClick(Sender: TObject);
    procedure imgClientRecordClick(Sender: TObject);
    procedure imgAlertsClick(Sender: TObject);
    procedure imgRestructureClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState;
    procedure ShowAlerts;
    procedure PopulateComakers;
    procedure RetrieveLoan;
    procedure SetActiveTab(const index: integer); overload;
    procedure SetActiveTab; overload;

    procedure ApproveLoan;
    procedure AssessLoan;
    procedure RejectLoan;
    procedure CancelLoan;
    procedure ReleaseLoan;

    procedure ShowLedger;

    function LoanApplicationIsValid: boolean;
  public
    { Public declarations }
    procedure SetLoanHeaderCaption;
    procedure SetUnboundControls;
    procedure RefreshDropDownSources;
    procedure Cancel;
    procedure InitForm;
    procedure SelectClient;

    function Save: boolean;
  end;

const
  // tab index
  ASSESSED = 0;
  APPROVAL = 1;
  RELEASED = 2;
  REJECTION = 3;
  CANCELLATION = 4;
  NOINFO = 5;

  // finalised error message
  FINALISED_MSG = 'Changes have been restricted. Loan application has been finalised.';

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, DockIntf, IFinanceGlobal,
  Comaker, ComakerSearch, DecisionBox, ComakerDetail, FinInfoDetail, MonthlyExpenseDetail,
  LoansAuxData, LoanApprovalDetail, LoanAssessmentDetail, LoanCancellationDetail,
  LoanRejectionDetail, Alert, Alerts, LoanReleaseDetail, Client, AppConstants, Assessment,
  IFinanceDialogs, LoanLedger;

procedure TfrmLoanMain.SetActiveTab;
var
  index: integer;
begin
  index := 0;

  // this routine sets the active tab based on current loan status
  if (ln.IsPending) or (ln.New) then index := NOINFO
  else if ln.IsAssessed then index := ASSESSED
  else if ln.IsApproved then index := APPROVAL
  else if (ln.IsActive) or (ln.IsClosed) then index := RELEASED
  else if ln.IsRejected then index := REJECTION
  else if ln.IsCancelled then index := CANCELLATION;
       
  SetActiveTab(index);
end;

procedure TfrmLoanMain.SetActiveTab(const index: Integer);
begin
  if index = RELEASED then
  begin
    lblReleaseAmount.Caption := FormatFloat('###,###,##0.00',ln.TotalReleased + ln.TotalCharges);
    lblTotalReleased.Caption := FormatFloat('###,###,##0.00',ln.TotalReleased);
    lblTotalCharges.Caption := FormatFloat('###,###,##0.00',ln.TotalCharges);
  end;

  with pcStatus do
  begin
    ActivePageIndex := index;
    case ActivePageIndex of
      ASSESSED: pnlAssessment.Visible := ln.HasLoanState(lsAssessed);
      APPROVAL: pnlApproval.Visible := ln.HasLoanState(lsApproved);
      RELEASED: pnlRelease.Visible := ln.HasLoanState(lsActive);
      REJECTION: pnlRejection.Visible := ln.HasLoanState(lsRejected);
      CANCELLATION: pnlCancellation.Visible := ln.HasLoanState(lsCancelled);
    end;

  end;
end;

procedure TfrmLoanMain.ApproveLoan;
begin
  if not LoanApplicationIsValid then Exit
  else if ln.IsFinalised then
  begin
    ShowErrorBox(FINALISED_MSG);
    Exit;
  end
  else if ln.IsPending then
  begin
    ShowErrorBox('Approval restricted. Assessment details not found.');
    Exit;
  end
  else if Assigned(ln.Assessment) and (ln.Assessment.Recommendation = rcReject)
    and (not ln.LoanStateExists(lsApproved)) then
  begin
    if ShowDecisionBox('Application has been recommended for REJECTION.' +
        ' Do you wish to continue with the approval?') <> mrYes then Exit;
  end;

  with TfrmLoanAppvDetail.Create(self) do
  begin
    try
      ln.Action := laApproving;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then
      begin
        SetLoanHeaderCaption;
        ChangeControlState;
        SetActiveTab(APPROVAL);
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.AssessLoan;
begin
  if not LoanApplicationIsValid then Exit
  else if ln.IsFinalised then
  begin
    ShowErrorBox(FINALISED_MSG);
    Exit;
  end
  else if ln.IsApproved then
  begin
    ShowErrorBox('Assessment changes have been restricted. Loan has been approved.');
    Exit;
  end;

  with TfrmLoanAssessmentDetail.Create(self) do
  begin
    try
      ln.Action := laAssessing;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then
      begin
        SetLoanHeaderCaption;
        ChangeControlState;
        SetActiveTab(ASSESSED);
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.RejectLoan;
begin
  if not LoanApplicationIsValid then Exit
  else if ln.IsFinalised then
  begin
    ShowErrorBox(FINALISED_MSG);
    Exit;
  end
  else if Assigned(ln.Assessment) and (ln.Assessment.Recommendation = rcApprove)
    and (not ln.LoanStateExists(lsRejected)) then
  begin
    if ShowDecisionBox('Application has been recommended for APPROVAL.' +
        ' Do you wish to continue with the rejection?') <> mrYes then Exit;
  end;

  with TfrmLoanRejectionDetail.Create(self) do
  begin
    try
      ln.Action := laRejecting;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then
      begin
        SetLoanHeaderCaption;
        ChangeControlState;
        SetActiveTab(REJECTION);
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.CancelLoan;
begin
  if not LoanApplicationIsValid then Exit
  else if ln.IsActive then
  begin
    if ShowWarningBox('Loan is already ACTIVE. ' +
        'Do you wish to continue with the cancellation?') <> mrYes then
    begin
      SetActiveTab(CANCELLATION);
      Exit;
    end;
  end
  else if ln.IsFinalised then
  begin
    ShowErrorBox(FINALISED_MSG);
    Exit;
  end;

  with TfrmLoanCancellationDetail.Create(self) do
  begin
    try
      ln.Action := laCancelling;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then
      begin
        SetLoanHeaderCaption;
        ChangeControlState;
        SetActiveTab(CANCELLATION);
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.ReleaseLoan;
begin
  if not LoanApplicationIsValid then Exit
  else if ln.IsFinalised then
  begin
    ShowErrorBox(FINALISED_MSG);
    Exit;
  end
  else if not ln.HasLoanState(lsApproved) then
  begin
    ShowErrorBox('Releasing restricted. Approval details not found.');
    Exit;
  end;

  with TfrmLoanReleaseDetail.Create(self) do
  begin
    try
      ln.Action := laReleasing;
      ln.Retrieve;

      ShowModal;

      if ModalResult = mrOk then
      begin
        SetLoanHeaderCaption;
        ChangeControlState;
        SetActiveTab(RELEASED);
      end;

      Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.ChangeControlState;
var
  i: integer;
  tags: set of 0..1;
begin
  // control whose tag is in the tags array will be enabled
  if (ln.Action = laCreating) or (ln.IsPending) then
  begin
    if Assigned(ln.Client) then tags := [0,1]
    else tags := [0];
  end
  else tags := [];

  // enable controls
  for i := 0 to pnlApplication.ControlCount - 1 do
    if pnlApplication.Controls[i].Tag <> -1 then
      pnlApplication.Controls[i].Enabled := pnlApplication.Controls[i].Tag in tags;

  pnlToolbar.Enabled := not ln.New;
  pnlClientRecord.Visible := Assigned(ln.Client);
  pnlAlerts.Visible := (Assigned(ln.Client)) and (not ln.IsFinalised);
end;

procedure TfrmLoanMain.RefreshDropDownSources;
begin
  OpenDropdownDataSources(pnlMain);
end;

procedure TfrmLoanMain.SelectClient;
begin
  if (ln.Action = laCreating) or (ln.IsPending) then
  with TfrmClientSearch.Create(self) do
  begin
    try
      try
        ShowModal;

        if ModalResult = mrOK then
        begin
            bteClient.Text := lnc.Name;
            mmAddress.Text := lnc.Address;
            mmEmployer.Text := lnc.Employer.Name;
            edNetPay.Value := lnc.NetPay;

            ln.Client := lnc;
            ln.Client.GetLoans;

            OpenDropdownDataSources(self.pnlApplication);

            ChangeControlState;
            ShowAlerts;
        end;
      except
        on e: Exception do
          ShowErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmLoanMain.bteClientButtonClick(Sender: TObject);
begin
  SelectClient;
end;

procedure TfrmLoanMain.btnAddComakerClick(Sender: TObject);
begin
  if dbluLoanClass.Text = '' then
    ShowErrorBox('Please select a loan class.')
  else if ln.LoanClass.ComakersNotRequired then
    ShowErrorBox('No comakers required.')
  else if ln.ComakerCount >= ln.LoanClass.Comakers then
    ShowErrorBox('Number of comakers has already been met. ' +
        'If a comaker has been mistakenly declared, remove the comaker and add again.')
  else
  with TfrmComakerSearch.Create(self) do
  begin
    try
      cm := TComaker.Create;

      ShowModal;

      if ModalResult = mrOK then
      begin
        if Trim(ln.Client.Id) = Trim(cm.Id) then
          ShowErrorBox('Client cannot be declared as a comaker.')
        else if ln.ComakerExists(cm) then
          ShowErrorBox('Comaker already exists.')
        else if cm.ComakeredLoans >= ifn.MaxComakeredLoans then
          ShowErrorBox('Comaker has reached the maximum allowable comakered loans.')
        else
        begin
          lbxComakers.Items.AddObject(cm.Name,cm);
          ln.AddComaker(cm,true);
        end;
      end;

      Free;

      // cm.Free;
    except
      on e: Exception do
        ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.btnEditApprovalClick(Sender: TObject);
begin
  inherited;
  ApproveLoan;
end;

procedure TfrmLoanMain.btnEditAssessmentClick(Sender: TObject);
begin
  inherited;
  AssessLoan;
end;

procedure TfrmLoanMain.btnEditCancelClick(Sender: TObject);
begin
  inherited;
  CancelLoan;
end;

procedure TfrmLoanMain.btnRemoveComakerClick(Sender: TObject);
const
  CONF = 'Are you sure you want to remove the selected comaker?';
var
  obj: TObject;
  id: string;
begin
  if (lbxComakers.Items.Count > 0) and (lbxComakers.IndexOf(lbxComakers.SelectedItem) > -1) then
  begin
    obj := lbxComakers.Items.Objects[lbxComakers.IndexOf(lbxComakers.SelectedItem)];
    if Assigned(obj) then
    begin
      with TfrmDecisionBox.Create(nil,CONF) do
      begin
        try
          if lbxComakers.Items.Count > 0 then
          begin
            id := (obj as TComaker).Id;

            ShowModal;

            if ModalResult = mrYes then
            begin
              ln.RemoveComaker(TComaker(obj));
              lbxComakers.Items.Delete(lbxComakers.IndexOf(lbxComakers.SelectedItem));
            end;

            Free;
          end;
        except
          on e: Exception do
            ShowMessage(e.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmLoanMain.Cancel;
begin
  if ln.Action = laCreating then
  begin
    bteClient.Clear;
    mmAddress.Clear;
    mmEmployer.Clear;

    lbxComakers.Clear;

    ln.Client := nil;
    ln.ClearComakers;
    ln.LoanClass := nil;

    ln.Cancel;

    ln.Action := laCreating;
  end
  else
  begin
    ln.Cancel;
    RetrieveLoan;
  end;

  ChangeControlState;

end;

procedure TfrmLoanMain.InitForm;
begin
  ExtendLastColumn(grFinInfo);
  ExtendLastColumn(grMonExp);
  ExtendLastColumn(grRecipients);
  ExtendLastColumn(grCharges);

  ChangeControlState;

  SetActiveTab;
end;

procedure TfrmLoanMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  intf: IDock;
begin
  if ln.Action <> laCreating then
    if Supports(Application.MainForm,IDock,intf) then
      intf.AddRecentLoan(ln);

  dmLoan.Destroy;
  dmLoansAux.Destroy;

  ln.Destroy;

  inherited;
end;

procedure TfrmLoanMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmLoan := TdmLoan.Create(self);
  dmLoansAux := TdmLoansAux.Create(self);

  if not Assigned(ln) then
  begin
    ln := TLoan.Create;
    ln.Add;
  end
  else
    RetrieveLoan;

  InitForm;
end;

procedure TfrmLoanMain.imgAlertsClick(Sender: TObject);
begin
  inherited;
  ShowAlerts;
end;

procedure TfrmLoanMain.imgApprovalClick(Sender: TObject);
begin
  inherited;
  if (ln.HasLoanState(lsApproved)) or (ln.IsFinalised) then SetActiveTab(APPROVAL)
  else ApproveLoan;
end;

procedure TfrmLoanMain.imgAssessmentClick(Sender: TObject);
begin
  inherited;
  if (ln.HasLoanState(lsAssessed)) or (ln.IsFinalised) then SetActiveTab(ASSESSED)
  else AssessLoan;
end;

procedure TfrmLoanMain.imgAssessmentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonDown(Sender);
end;

procedure TfrmLoanMain.imgAssessmentMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButtonUp(Sender);
end;

procedure TfrmLoanMain.imgCancelLoanClick(Sender: TObject);
begin
  inherited;
  if (ln.HasLoanState(lsCancelled)) or (ln.IsClosed) then SetActiveTab(CANCELLATION)
  else CancelLoan;
end;

procedure TfrmLoanMain.imgClientRecordClick(Sender: TObject);
var
  id, displayId: string;
  intf: IDock;
begin
  if Assigned(ln.Client) then
  begin
    id := ln.Client.Id;
    displayId := ln.Client.Id;

    cln := TClient.Create;
    cln.Id := id;
    cln.DisplayId := displayId;

    if Supports(Application.MainForm,IDock,intf) then
      intf.DockForm(fmClientMain);
  end;
end;

procedure TfrmLoanMain.imgRejectLoanClick(Sender: TObject);
begin
  inherited;
  if (ln.HasLoanState(lsRejected)) or (ln.IsFinalised) then SetActiveTab(REJECTION)
  else RejectLoan;
end;

procedure TfrmLoanMain.imgReleaseLoanClick(Sender: TObject);
begin
  inherited;
  if (ln.HasLoanState(lsActive)) or (ln.IsFinalised) then SetActiveTab(RELEASED)
  else ReleaseLoan;
end;

procedure TfrmLoanMain.imgRestructureClick(Sender: TObject);
begin
  inherited;
  ShowLedger;
end;

procedure TfrmLoanMain.RetrieveLoan;
begin
  ln.Retrieve;

  OpenDropdownDataSources(pnlApplication);

  SetUnboundControls;
  SetLoanHeaderCaption;
  // ChangeControlState;
end;

procedure TfrmLoanMain.lbxComakersDblClick(Sender: TObject);
var
  obj: TObject;
  index: integer;
begin
  index := lbxComakers.IndexOf(lbxComakers.SelectedItem);

  if index > -1 then
  begin
    obj := lbxComakers.Items.Objects[index];
    if Assigned(obj) then
      if obj is TComaker then
      with TfrmComakerDetail.Create(self) do
      begin
        cm := obj as TComaker;
        cm.Retrieve;
        ShowModal;
        Free;
      end;
    end;
end;

procedure TfrmLoanMain.pnlEditAssessmentClick(Sender: TObject);
begin
  inherited;
  AssessLoan;
end;

procedure TfrmLoanMain.pnlEditRejectionClick(Sender: TObject);
begin
  inherited;
  RejectLoan;
end;

procedure TfrmLoanMain.SetLoanHeaderCaption;
begin
  lblHeader.Caption := 'LOAN ID: ' + ln.Id + ' ' + ln.StatusName + #10#10 +
                        'Balance : ' + FormatFloat('###,###0.00',ln.Balance);
end;

procedure TfrmLoanMain.SetUnboundControls;
begin
  bteClient.Text := ln.Client.Name;

  mmAddress.Text := ln.Client.Address;

  mmEmployer.Text := ln.Client.Employer.Name;

  PopulateComakers;
end;

function TfrmLoanMain.LoanApplicationIsValid: boolean;
var
  error: string;
begin
  try
    error := '';

    if (ln.Action in [laCreating, laAssessing]) or (ln.IsPending) then
    begin
      if not Assigned(ln.Client) then
        error := 'No client selected.'
      else if dbluLoanClass.Text = '' then
        error := 'Please select a loan class.'
      else if dteDateApplied.Text = '' then
        error := 'Please enter date applied.'
      else if edAppAmount.Value <= 0 then
        error := 'Invalid value for amount applied.'
      else if edDesiredTerm.Value <= 0 then
        error := 'Invalid value for desired term.'
      else if edAppAmount.Value > ln.LoanClass.MaxLoan then
        error := 'Amount applied exceeds the maximum loanable amount for the selected loan class.'
      else if edDesiredTerm.Value > ln.LoanClass.Term then
        error := 'Term applied exceeds the maximum allowed term for the selected loan class.'
      else if (ln.LoanClass.HasMaxAge) and ((edDesiredTerm.Value / 12) + ln.Client.Age > ln.LoanClass.MaxAge) then
        error := 'Term exceeds the maximum age limit for the selected loan class.'
      else if ln.ComakerCount < ln.LoanClass.Comakers then
        error := 'Number of required comakers has not been entered.'
      else if ln.ComakerCount > ln.LoanClass.Comakers then
        error := 'Declared comakers exceeds the required number.'
      else if ln.Client.ValidIdentityDocs < ln.LoanClass.Group.Attributes.IdentityDocs then
        error := 'Client has not submitted the required number of identity documents.'
      else if ln.LoanClass.Group.Attributes.HasConcurrent then // note: this else block should ALWAYS be at the bottom..
      begin
        if ln.Client.GetLoanClassCount(ln.LoanClass.ClassificationId) >= ln.LoanClass.Group.Attributes.MaxConcurrent then
          error := 'The selected loan class has already reached the maximum concurrent loans allowed.'
        // else if edAppAmount.Value + ln.Client.GetLoanClassBalance(ln.LoanClass.ClassificationId) > ln.LoanClass.LoanType.MaxTotalAmount then
        //  error := 'Amount applied exceeds the maximum total amount allowed for concurrent loans.'
        else if edAppAmount.Value + ln.Client.GetLoanClassBalance(ln.LoanClass.ClassificationId) > ln.LoanClass.Group.Attributes.MaxTotalAmount then
          error := 'Amount applied exceeds the maximum total amount allowed for concurrent loans.'
      end
    end;

    Result := error = '';

    if not Result then ShowErrorBox(error);

  finally

  end;
end;

function TfrmLoanMain.Save: Boolean;
begin
  Result := false;

  if (ln.New) or (ln.IsPending) then
  begin
    Result := LoanApplicationIsValid;

    if Result then
    begin
      ln.Save;
      SetLoanHeaderCaption;
      ChangeControlState;
      ln.Action := laNone;
    end;
  end;
end;

procedure TfrmLoanMain.ShowAlerts;
begin
  if Assigned(ln.Client) then
  begin
    ln.GetAlerts;

    if alrt.Count > 0 then
      with TfrmAlerts.Create(self) do
      begin
        ShowModal;
        Free;
      end
    else
      ShowInfoBox('No alerts found.');
  end;
end;

procedure TfrmLoanMain.ShowLedger;
begin
  if (ln.IsActive) or (ln.IsClosed) then
  begin
    with TfrmLoanLedger.Create(self) do
    begin
      Parent := self;
      Show;
      //Free;
    end
  end;
end;

procedure TfrmLoanMain.PopulateComakers;
var
  i, len: integer;
begin
  lbxComakers.Clear;

  len := ln.ComakerCount - 1;
  for i := 0 to len do
    lbxComakers.AddObject(ln.Comaker[i].Name,ln.Comaker[i]);
end;

end.
