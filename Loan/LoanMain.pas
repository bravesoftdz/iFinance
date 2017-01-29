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
    lblLoanId: TRzLabel;
    pnlApplication: TRzPanel;
    c: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel6: TJvLabel;
    edPurpose: TRzDBEdit;
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
    RzGroupBox4: TRzGroupBox;
    grFinInfo: TRzDBGrid;
    RzGroupBox5: TRzGroupBox;
    grMonExp: TRzDBGrid;
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
  private
    { Private declarations }
    procedure ChangeControlState;
    procedure CallErrorBox(const error: string);
    procedure ShowAlerts;
    procedure PopulateComakers;
    procedure RetrieveLoan;
    procedure SetActiveTab(const index: integer);
  public
    { Public declarations }
    procedure SetLoanId;
    procedure SetUnboundControls;
    procedure RefreshDropDownSources;
    function Save: boolean;
    procedure Cancel;
    procedure ApproveLoan;
    procedure AssessLoan;
    procedure RejectLoan;
    procedure CancelLoan;
    procedure ReleaseLoan;
  end;

var
  frmLoanMain: TfrmLoanMain;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, DockIntf, IFinanceGlobal,
  Comaker, ComakerSearch, DecisionBox, ComakerDetail, FinInfoDetail, MonthlyExpenseDetail,
  LoansAuxData, LoanApprovalDetail, LoanAssessmentDetail, LoanCancellationDetail,
  LoanRejectionDetail, Alert, Alerts, LoanReleaseDetail;

procedure TfrmLoanMain.SetActiveTab(const index: Integer);
begin
  pcStatus.ActivePageIndex := index;
end;

procedure TfrmLoanMain.ApproveLoan;
begin
  if ln.IsFinalised then
  begin
    CallErrorBox('Loan has been finalised.');
    Exit;
  end;

  with TfrmLoanAppvDetail.Create(self) do
  begin
    try
      ln.Action := laApproving;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      // if ModalResult = mrOk then DisplayLoanStateDetails;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.AssessLoan;
begin
  if ln.IsFinalised then
  begin
    CallErrorBox('Loan has been finalised.');
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
        SetLoanId;
        ChangeControlState;
      end;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.RejectLoan;
begin
  if ln.IsFinalised then
  begin
    CallErrorBox('Loan has been finalised.');
    Exit;
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
        SetLoanId;
        ChangeControlState;
      end;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.CancelLoan;
begin
  if ln.IsFinalised then
  begin
    CallErrorBox('Loan has been finalised.');
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
        SetLoanId;
        ChangeControlState;
      end;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.ReleaseLoan;
begin
  if ln.IsFinalised then
  begin
    CallErrorBox('Loan has been finalised.');
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
        SetLoanId;
        ChangeControlState;
      end;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.CallErrorBox(const error: string);
var
  intf: IStatus;
begin
  if Supports(Application.MainForm,IStatus,intf) then
    intf.ShowError(error);
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

  pcStatus.Visible := not ln.New;
end;

procedure TfrmLoanMain.RefreshDropDownSources;
begin
  OpenDropdownDataSources(pnlMain);
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
            mmAddress.Text := lnc.Address;
            mmEmployer.Text := lnc.Employer.Name;

            ln.Client := lnc;

            OpenDropdownDataSources(self.pnlApplication);

            ChangeControlState;
            ShowAlerts;
        end;
      except
        on e: Exception do
          CallErrorBox(e.Message);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmLoanMain.btnAddComakerClick(Sender: TObject);
begin
  if dbluLoanClass.Text = '' then
    CallErrorBox('Please select a loan class.')
  else if ln.LoanClass.ComakersNotRequired then
    CallErrorBox('No comakers required.')
  else if ln.ComakerCount >= ln.LoanClass.Comakers then
    CallErrorBox('Number of comakers has already been met. ' +
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
          CallErrorBox('Client cannot be declared as a comaker.')
        else if ln.ComakerExists(cm) then
          CallErrorBox('Comaker already exists.')
        else if cm.ComakeredLoans >= ifn.MaxComakeredLoans then
          CallErrorBox('Comaker has reached the maximum allowable comakered loans.')
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
        CallErrorBox(e.Message);
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
              lbxComakers.Items.Delete(lbxComakers.IndexOf(lbxComakers.SelectedItem));
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
  end;
end;

procedure TfrmLoanMain.Cancel;
begin
  ln.Cancel;

  // clear the client box
  if ln.Action = laCreating then
  begin
    bteClient.Clear;
    mmAddress.Clear;
    mmEmployer.Clear;

    ln.Client := nil;
  end
  else
    RetrieveLoan;

  ChangeControlState;

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

  ExtendLastColumn(grFinInfo);
  ExtendLastColumn(grMonExp);
  ExtendLastColumn(grRecipients);
  ExtendLastColumn(grCharges);

  ChangeControlState;
end;

procedure TfrmLoanMain.imgApprovalClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(1);
end;

procedure TfrmLoanMain.imgAssessmentClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(0);
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
  SetActiveTab(4);
end;

procedure TfrmLoanMain.imgRejectLoanClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(3);
end;

procedure TfrmLoanMain.imgReleaseLoanClick(Sender: TObject);
begin
  inherited;
  SetActiveTab(2);
end;

procedure TfrmLoanMain.RetrieveLoan;
begin
  ln.Retrieve;

  OpenDropdownDataSources(pnlApplication);

  SetUnboundControls;
  SetLoanId;
  // ChangeControlState;
end;

procedure TfrmLoanMain.lbxComakersDblClick(Sender: TObject);
var
  obj: TObject;
begin
  obj := lbxComakers.Items.Objects[lbxComakers.IndexOf(lbxComakers.SelectedItem)];

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

procedure TfrmLoanMain.SetLoanId;
begin
  lblLoanId.Caption := 'LOAN ID: ' + ln.Id + ' ' + ln.StatusName;
end;

procedure TfrmLoanMain.SetUnboundControls;
begin
  bteClient.Text := ln.Client.Name;

  mmAddress.Text := ln.Client.Address;

  mmEmployer.Text := ln.Client.Employer.Name;

  PopulateComakers;
end;

function TfrmLoanMain.Save: Boolean;
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
      else if ln.ComakerCount < ln.LoanClass.Comakers then
        error := 'Number of required comakers has not been entered.'
      else if ln.ComakerCount > ln.LoanClass.Comakers then
        error := 'Declared comakers exceeds the required number.';
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
      end;
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
