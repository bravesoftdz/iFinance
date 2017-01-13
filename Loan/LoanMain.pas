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
    JvLabel3: TJvLabel;
    btnAddComaker: TRzButton;
    btnRemoveComaker: TRzButton;
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
    RzDBEdit9: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    JvLabel4: TJvLabel;
    JvLabel8: TJvLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
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
    dteDateAssessed: TRzDBDateTimeEdit;
    JvLabel11: TJvLabel;
    edRecAmount: TRzDBNumericEdit;
    JvLabel13: TJvLabel;
    dteDateApproved: TRzDBDateTimeEdit;
    JvLabel14: TJvLabel;
    edAppvAmount: TRzDBNumericEdit;
    JvLabel16: TJvLabel;
    edAppvTerm: TRzDBNumericEdit;
    pcAssessment: TRzPageControl;
    tsFinInfo: TRzTabSheet;
    tsMonExp: TRzTabSheet;
    grFinInfo: TRzDBGrid;
    mmRemarks: TRzDBMemo;
    JvLabel24: TJvLabel;
    grMonExp: TRzDBGrid;
    imgAssessment: TImage;
    imgApproval: TImage;
    JvLabel17: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    imgRelease: TImage;
    imgCancellation: TImage;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel23: TJvLabel;
    RzDBMemo2: TRzDBMemo;
    dteDateCancelled: TRzDBDateTimeEdit;
    RzDBEdit1: TRzDBEdit;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    RzDBMemo3: TRzDBMemo;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBEdit2: TRzDBEdit;
    JvLabel27: TJvLabel;
    imgRejection: TImage;
    RzDBEdit3: TRzDBEdit;
    JvLabel28: TJvLabel;
    RzDBGrid1: TRzDBGrid;
    JvLabel1: TJvLabel;
    RzDBGrid2: TRzDBGrid;
    JvLabel15: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
    procedure btnAddComakerClick(Sender: TObject);
    procedure btnRemoveComakerClick(Sender: TObject);
    procedure lbxComakersDblClick(Sender: TObject);
    procedure imgAssessmentClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState(parentCtrl: TWinControl; const useState: boolean = true);
    procedure CallErrorBox(const error: string);
    procedure ShowAlerts;
    procedure ChangeComakersControlState;
    procedure PopulateComakers;
    procedure RetrieveLoan;
    procedure CollapsePanel(Sender: TObject);
    procedure ExpandPanel(Sender: TObject);
    procedure HideLoanStateDetails;
    procedure SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer);
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
    procedure DisplayLoanStateDetails;
  end;

var
  frmLoanMain: TfrmLoanMain;

const
  COLLAPSE = 0;
  EXPAND = 1;
  TOP_ANCHOR = 192;
  LEFT_ANCHOR = 17;
  PANEL_WIDTH = 850;
  SPACE = 6;
  COLLAPSED_HEIGHT = 19;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, DockIntf, IFinanceGlobal,
  Comaker, ComakerSearch, DecisionBox, ComakerDetail, FinInfoDetail, MonthlyExpenseDetail,
  LoansAuxData, LoanApprovalDetail, LoanAssessmentDetail, LoanCancellationDetail,
  LoanRejectionDetail, Alert, Alerts, LoanReleaseDetail;

procedure TfrmLoanMain.SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer);
begin
  // panel
  with panel do
  begin
    Left := LEFT_ANCHOR;
    Top  := tp;
    Height := COLLAPSED_HEIGHT;
    Width := PANEL_WIDTH;
    Visible := true;
    tp := Top + COLLAPSED_HEIGHT + SPACE;
  end;

  // image
  with image do
  begin
    Picture.LoadFromFile(ifn.AppImagesPath + 'expand.png');
    Hint := 'Expand';
    Tag := EXPAND;
  end;
end;

procedure TfrmLoanMain.HideLoanStateDetails;
begin
  pnlAssessment.Visible := false;
  pnlApproval.Visible := false;
  pnlRelease.Visible := false;
  pnlCancellation.Visible := false;
  pnlRejection.Visible := false;
end;

procedure TfrmLoanMain.DisplayLoanStateDetails;
var
  i, len, tp: integer;
  loanState: TLoanState;
begin
  HideLoanStateDetails;

  len := ln.LoanSatusCount - 1;

  tp := TOP_ANCHOR;

  for i := 0 to len do
  begin
    loanState := ln.LoanStatusHistory[i];

    case loanState of

      lsAssessed: SetCollapsePanelProperties(pnlAssessment,imgAssessment,tp);
      lsApproved: SetCollapsePanelProperties(pnlApproval,imgApproval,tp);
      lsActive: SetCollapsePanelProperties(pnlRelease,imgRelease,tp);
      lsCancelled: SetCollapsePanelProperties(pnlCancellation,imgCancellation,tp);
      lsRejected: SetCollapsePanelProperties(pnlRejection,imgRejection,tp);

    end;
  end;

  SetLoanId;
end;

procedure TfrmLoanMain.ApproveLoan;
begin
  with TfrmLoanAppvDetail.Create(self) do
  begin
    try
      ln.Action := laApproving;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then DisplayLoanStateDetails;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.AssessLoan;
begin

  with TfrmLoanAssessmentDetail.Create(self) do
  begin
    try
      ln.Action := laAssessing;
      ln.Retrieve;
      ln.SetDefaultValues;

      ShowModal;

      if ModalResult = mrOk then DisplayLoanStateDetails;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.RejectLoan;
begin
  with TfrmLoanRejectionDetail.Create(self) do
  begin
    try
      ln.Action := laRejecting;
      ShowModal;

      if ModalResult = mrOk then DisplayLoanStateDetails;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.CancelLoan;
begin
  with TfrmLoanCancellationDetail.Create(self) do
  begin
    try
      ln.Action := laCancelling;
      ShowModal;

      if ModalResult = mrOk then DisplayLoanStateDetails;

      Free;
    except
      on e: Exception do
        CallErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmLoanMain.ReleaseLoan;
begin
  with TfrmLoanReleaseDetail.Create(self) do
  begin
    try
      ln.Action := laReleasing;
      ShowModal;

      if ModalResult = mrOk then DisplayLoanStateDetails;

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

procedure TfrmLoanMain.ChangeControlState(parentCtrl: TWinControl; const useState: boolean);
var
  i: integer;
  tags: set of 0..11;
begin
  // control whose tag is in the tags array will be enabled
  if useState then
  begin
    if ln.IsPending then tags := [1,2];
  end
  else
  begin
    if ln.Action = laCreating then
    begin
      if Assigned(ln.Client) then tags := [0,1]
      else tags := [0];
    end;
  end;

  // enable controls
    for i := 0 to parentCtrl.ControlCount - 1 do
      if parentCtrl.Controls[i].Tag in [0..11] then
        parentCtrl.Controls[i].Enabled := parentCtrl.Controls[i].Tag in tags;

  ChangeComakersControlState;
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
            ln.Client := lnc;

            OpenDropdownDataSources(self.pnlApplication);

            ChangeControlState(self.pnlApplication,false);
            ChangeComakersControlState;
            ShowAlerts;
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
    ln.Client := nil;
  end
  else
    RetrieveLoan;

  ChangeControlState(pnlApplication,false);

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
end;

procedure TfrmLoanMain.imgAssessmentClick(Sender: TObject);
begin
  if (Sender as TImage).Tag = COLLAPSE then  CollapsePanel(Sender)
  else ExpandPanel(Sender);
end;

procedure TfrmLoanMain.RetrieveLoan;
begin
  ln.Retrieve;

  OpenDropdownDataSources(pnlApplication);

  SetUnboundControls;
  SetLoanId;
  ChangeControlState(pnlApplication);

  DisplayLoanStateDetails;
end;

procedure TfrmLoanMain.lbxComakersDblClick(Sender: TObject);
var
  obj: TObject;
begin
  obj := lbxComakers.Items.Objects[lbxComakers.IndexOf(lbxComakers.SelectedItem)];

  if obj is TComaker then
  with TfrmComakerDetail.Create(self) do
  begin
    cm := obj as TComaker;
    cm.Retrieve;
    ShowModal;
    Free;
    // cm.Free;
  end;
end;

procedure TfrmLoanMain.SetLoanId;
begin
  lblLoanId.Caption := 'LOAN ID: ' + ln.Id + ' ' + ln.StatusName;
end;

procedure TfrmLoanMain.SetUnboundControls;
begin
  bteClient.Text := ln.Client.Name;

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
//      else if Trim(edPurpose.Text) = '' then
//        error := 'Please enter a purpose.'
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
      ChangeControlState(pnlApplication);
      ChangeComakersControlState;
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

procedure TfrmLoanMain.ChangeComakersControlState;
begin
  
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

procedure TfrmLoanMain.CollapsePanel(Sender: TObject);
begin
  (Sender as TImage).Parent.Parent.Height := 19;
  (Sender as TImage).Picture.LoadFromFile(ifn.AppImagesPath + 'expand.png');
  (Sender as TImage).Hint := 'Expand';
  (Sender as TImage).Tag := EXPAND;

  DisplayLoanStateDetails;
end;

procedure TfrmLoanMain.ExpandPanel(Sender: TObject);
var
  ht, i, len, tp: integer;
  loanState: TLoanState;
begin
  ht := 0;

  loanState := lsNone;

  // get the expanded height and loan state
  if (Sender as TImage).Parent.Parent.Name = 'pnlAssessment' then
  begin
    ht := 165;
    loanState := lsAssessed;
  end
  else if (Sender as TImage).Parent.Parent.Name = 'pnlApproval' then
  begin
    ht := 120;
    loanState := lsApproved;
  end
  else if (Sender as TImage).Parent.Parent.Name = 'pnlCancellation' then
  begin
    ht := 120;
    loanState := lsCancelled;
  end
  else if (Sender as TImage).Parent.Parent.Name = 'pnlRejection' then
  begin
    ht := 120;
    loanState := lsRejected;
  end
  else if (Sender as TImage).Parent.Parent.Name = 'pnlRelease' then
  begin
    ht := 135;
    loanState := lsActive;
  end;

  // expand the panel
  // collapse other visible panels
  len := ln.LoanSatusCount - 1;

  tp := TOP_ANCHOR;

  for i := 0 to len do
  begin
    if ln.LoanStatusHistory[i] = loanState then
    begin
      (Sender as TImage).Parent.Parent.Top := tp;
      (Sender as TImage).Parent.Parent.Height := ht;
      (Sender as TImage).Picture.LoadFromFile(ifn.AppImagesPath + 'collapse.png');
      (Sender as TImage).Hint := 'Collapse';
      (Sender as TImage).Tag := COLLAPSE;

      tp := (Sender as TImage).Parent.Parent.Top + (Sender as TImage).Parent.Parent.Height + SPACE;
    end
    else
    begin

      case ln.LoanStatusHistory[i] of

        lsAssessed: SetCollapsePanelProperties(pnlAssessment,imgAssessment,tp);
        lsApproved: SetCollapsePanelProperties(pnlApproval,imgApproval,tp);
        lsActive: SetCollapsePanelProperties(pnlRelease,imgRelease,tp);
        lsCancelled: SetCollapsePanelProperties(pnlCancellation,imgCancellation,tp);
        lsRejected: SetCollapsePanelProperties(pnlRejection,imgRejection,tp);

      end;
    end;
  end;
end;

end.
