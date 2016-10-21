unit LoanMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzDBEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, SaveIntf,  RzButton, RzRadChk,
  LoanIntf, Loan, RzLstBox, RzDBList;

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
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBEdit1: TRzDBEdit;
    JvLabel11: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    lblLoanId: TRzLabel;
    JvLabel12: TJvLabel;
    edInterest: TRzDBNumericEdit;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    cbxApproved: TRzCheckBox;
    cbxReleased: TRzCheckBox;
    cbxCancelled: TRzCheckBox;
    cbxDenied: TRzCheckBox;
    JvGroupHeader4: TJvGroupHeader;
    lbxComaker: TRzDBListBox;
    JvLabel3: TJvLabel;
    dbluAcctType: TRzDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
    procedure cbxCancelledClick(Sender: TObject);
    procedure cbxDeniedClick(Sender: TObject);
    procedure cbxApprovedClick(Sender: TObject);
    procedure cbxReleasedClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlState(const useState: boolean = true);
    procedure SetAction(const action: TLoanAction = laNone);
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
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, DockIntf, IFinanceGlobal;

procedure TfrmLoanMain.ChangeControlState(const useState: boolean);
var
  i: integer;
  tags: set of 0..7;

  procedure ChangeDisabledControlColor;
  var
    c: integer;
  begin
    if not ln.IsPending then
      tags := tags + [0,1];

    for c := 0 to pnlMain.ControlCount - 1 do
      if pnlMain.Controls[c].Tag <> -1 then
      begin
        if pnlMain.Controls[c].Tag in tags then
        begin
          if pnlMain.Controls[c] is TRzButtonEdit then
            (pnlMain.Controls[c] as TRzButtonEdit).DisabledColor := ifn.ControlDisabledColor
          else if pnlMain.Controls[c] is TRzDBLookupComboBox then
              (pnlMain.Controls[c] as TRzDBLookupComboBox).DisabledColor := ifn.ControlDisabledColor
          else if pnlMain.Controls[c] is TRzDBDateTimeEdit then
              (pnlMain.Controls[c] as TRzDBDateTimeEdit).DisabledColor := ifn.ControlDisabledColor
          else if pnlMain.Controls[c] is TRzDBNumericEdit then
              (pnlMain.Controls[c] as TRzDBNumericEdit).DisabledColor := ifn.ControlDisabledColor
          else if pnlMain.Controls[c] is TRzDBEdit then
              (pnlMain.Controls[c] as TRzDBEdit).DisabledColor := ifn.ControlDisabledColor;
        end;
      end;
  end;

begin
  if useState then
  begin
    if ln.IsPending then
      tags := [0,1,2,3,4]
    else if ln.IsApproved then
      tags := [2,6]
    else if ln.IsReleased then
      tags := [];
  end
  else
  begin
    if ln.Action = laCreating then
      tags := [0,1]
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

  // change color for readability
  ChangeDisabledControlColor;
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

            ChangeControlState(true);
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

procedure TfrmLoanMain.Cancel;
begin
  ln.Cancel;

  // clear the client box
  if ln.Action = laCreating then
  begin
    bteClient.Clear;
    ln.Client := nil;
  end;

  ChangeControlState;
end;

procedure TfrmLoanMain.cbxApprovedClick(Sender: TObject);
begin
  inherited;
  if (Sender as TRzCheckBox).Checked then
    SetAction(laApproving)
  else
    SetAction;
end;

procedure TfrmLoanMain.cbxCancelledClick(Sender: TObject);
begin
  inherited;
  if (Sender as TRzCheckBox).Checked then
    SetAction(laCancelling)
  else
    SetAction;
end;

procedure TfrmLoanMain.cbxDeniedClick(Sender: TObject);
begin
  inherited;
  if (Sender as TRzCheckBox).Checked then
    SetAction(laDenying)
  else
    SetAction;
end;

procedure TfrmLoanMain.cbxReleasedClick(Sender: TObject);
begin
  inherited;
  if (Sender as TRzCheckBox).Checked then
    SetAction(laReleasing)
  else
    SetAction;
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

  cbxCancelled.Checked := ln.IsCancelled;
  cbxDenied.Checked := ln.IsDenied;
  cbxApproved.Checked := (ln.IsApproved) or (ln.IsReleased);
  cbxReleased.Checked := ln.IsReleased;
end;

function TfrmLoanMain.Save: Boolean;
var
  st: IStatus;
  error: string;
begin
  Result := false;
  try
    if Supports(Application.MainForm,IStatus,st) then
    begin
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
        st.ShowError(error);
    end;
  finally

  end;

end;

end.
