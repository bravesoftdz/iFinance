unit LoanMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzDBEdit, JvLabel, JvExControls,
  JvGroupHeader, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, SaveIntf, Loan;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteClientButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeControlStatus(const loanStatus: TLoanStatus);
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
  LoanData, FormsUtil, LoanClient, ClientSearch, StatusIntf;

procedure TfrmLoanMain.ChangeControlStatus(const loanStatus: TLoanStatus);
var
  i, tag: integer;
begin
  tag := 0;

  // get corresponding TAG value
  case loanStatus of
    lsPending: tag := 1;
    lsApproved: tag := 2;
    lsCancelled: tag := 0;
    lsReleased: tag := 4;
  end;

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

            ChangeControlStatus(lsPending);
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
      begin
        error := 'No client selected.';
        st.ShowError(error);
      end;

      Result := error = '';

      if Result then
        ln.Save;
    end;
  finally

  end;

end;

end.
