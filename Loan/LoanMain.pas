unit LoanMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzDBEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, SaveIntf, AppConstants, System.Rtti,
  RzButton, RzRadChk;

type
  TfrmLoanMain = class(TfrmBaseDocked, ISave)
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
    JvLabel3: TJvLabel;
    dbluLoanStatus: TRzDBLookupComboBox;
    JvGroupHeader2: TJvGroupHeader;
    JvLabel8: TJvLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBEdit1: TRzDBEdit;
    JvLabel11: TJvLabel;
    RzDBEdit2: TRzDBEdit;
    JvGroupHeader3: TJvGroupHeader;
    lblLoanId: TRzLabel;
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    RzCheckBox3: TRzCheckBox;
    JvLabel12: TJvLabel;
    edInterest: TRzDBNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlStatus(const loanStatus: TLoanStatus);
    procedure SetLoanId;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;
  end;

var
  frmLoanMain: TfrmLoanMain;

implementation

{$R *.dfm}

uses
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf, Loan;

procedure TfrmLoanMain.ChangeControlStatus(const loanStatus: TLoanStatus);
var
  i, tag: integer;
  st: string;
begin
  tag := 0;

  // get corresponding TAG value
  st := TRttiEnumerationType.GetName<TLoanStatus>(loanStatus);

  if st = 'P' then tag := 1
  else if st = 'A' then tag := 2
  else if st = 'C' then tag := 0
  else if st = 'R' then tag := 4;

  for i := 0 to pnlMain.ControlCount - 1 do
    pnlMain.Controls[i].Enabled := pnlMain.Controls[i].Tag = tag;
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

            ChangeControlStatus(TLoanStatus.P);
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

end;

procedure TfrmLoanMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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
  end;
end;

procedure TfrmLoanMain.SetLoanId;
begin
 lblLoanId.Caption := 'LOAN ID: ' + ln.Id;
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
      if not Assigned(ln.Client) then
        error := 'No client selected.'
      else if dbluLoanClass.Text = '' then
        error := 'Please select a loan class.'   
      else if dteDateApplied.Text = '' then
        error := 'Please enter date applied.'
      else if edAppAmount.Value <= 0 then
        error := 'Invalid value for amount.'
      else if edDesiredTerm.Text = '' then
        error := 'Invalid value for desired term.'
      else if Trim(edPurpose.Text) = '' then
        error := 'Please enter a purpose.';

      Result := error = '';

      if Result then
      begin
        ln.Save;
        SetLoanId;
      end
      else
        st.ShowError(error);
    end;
  finally

  end;

end;

end.
