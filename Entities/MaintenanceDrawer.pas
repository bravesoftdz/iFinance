unit MaintenanceDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, RzLabel, Vcl.StdCtrls,
  Vcl.ExtCtrls, RzPanel, RzCmboBx, RzTabs, AppConstants;

type
  TfrmMaintenanceDrawer = class(TfrmBaseDocked)
    pnlDockMain: TRzPanel;
    DockPanel: TRzPanel;
    cmbType: TRzComboBox;
    lblDate: TLabel;
    pcType: TRzPageControl;
    tsEntities: TRzTabSheet;
    tsLoanRelated: TRzTabSheet;
    urlBanks: TRzURLLabel;
    urlEmployer: TRzURLLabel;
    urlGroups: TRzURLLabel;
    urlDesignation: TRzURLLabel;
    urlCompetitors: TRzURLLabel;
    urlInformationSources: TRzURLLabel;
    urlLoanTypes: TRzURLLabel;
    urlAccountTypes: TRzURLLabel;
    urlLoanClassification: TRzURLLabel;
    urlPurpose: TRzURLLabel;
    urlCancellationReasons: TRzURLLabel;
    urlRejectionReasons: TRzURLLabel;
    urlChargeTypes: TRzURLLabel;
    urlClosureReasons: TRzURLLabel;
    procedure cmbTypeClick(Sender: TObject);
    procedure urlLoanTypesClick(Sender: TObject);
    procedure urlAccountTypesClick(Sender: TObject);
    procedure urlLoanClassificationClick(Sender: TObject);
    procedure urlPurposeClick(Sender: TObject);
    procedure urlCancellationReasonsClick(Sender: TObject);
    procedure urlRejectionReasonsClick(Sender: TObject);
    procedure urlChargeTypesClick(Sender: TObject);
    procedure urlClosureReasonsClick(Sender: TObject);
    procedure urlGroupsClick(Sender: TObject);
    procedure urlEmployerClick(Sender: TObject);
    procedure urlBanksClick(Sender: TObject);
    procedure urlDesignationClick(Sender: TObject);
    procedure urlCompetitorsClick(Sender: TObject);
    procedure urlInformationSourcesClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TForms;
    procedure DockForm(const fm: TForms; const title: string = '');
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  GroupList, EmployerList, BanksList, DesignationList, LoanClassificationList,
  CompetitorList, FormsUtil, IFinanceGlobal, PurposeList, IFinanceDialogs, LoanTypeList,
  AccountTypeList, LoanCancellationReasonList, LoanRejectionReasonList,
  LoanClassChargeTypeList, InfoSourceList, LoanClosureReasonList;

procedure TfrmMaintenanceDrawer.cmbTypeClick(Sender: TObject);
begin
  inherited;
  pcType.ActivePageIndex := cmbType.ItemIndex;
end;

procedure TfrmMaintenanceDrawer.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
      begin
        (pnlDockMain.Controls[control] as TForm).Close;
        (pnlDockMain.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case fm of
      fmGroupList : frm := TfrmGroupList.Create(Application);
      fmEmployerList: frm := TfrmEmployerList.Create(Application);
      fmBanksList: frm := TfrmBanksList.Create(Application);
      fmDesignationList: frm := TfrmDesignationList.Create(Application);
      fmLoanClassList: frm := TfrmLoanClassificationList.Create(Application);
      fmCompetitorList: frm := TfrmCompetitorList.Create(Application);
      fmPurposeList: frm := TfrmPurposeList.Create(Application);
      fmLoanTypeList: frm := TfrmLoanTypeList.Create(Application);
      fmAcctTypeList: frm := TfrmAccountTypeList.Create(Application);
      fmLoanCancelReasonList: frm := TfrmLoanCancelReasonList.Create(Application);
      fmLoanRejectReasonList: frm := TfrmLoanRejectionReasonList.Create(Application);
      fmChargeTypeList: frm := TfrmLoanClassChargeTypeList.Create(Application);
      fmInfoSourceList: frm := TfrmInfoSourceList.Create(Application);
      fmLoanCloseReasonList: frm := TfrmLoanCloseReasonList.Create(Application);
      fmMaintenanceDrawer: frm := TfrmMaintenanceDrawer.Create(Application);
      else
        frm := nil;
    end;

    if Assigned(frm) then
    begin
      DOCKED_FORM := fm;

      lblTitle.Caption := title;

      frm.ManualDock(DockPanel);
      frm.Show;
    end;
  end;
end;

procedure TfrmMaintenanceDrawer.urlAccountTypesClick(Sender: TObject);
begin
  inherited;
  DockForm(fmAcctTypeList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlBanksClick(Sender: TObject);
begin
  inherited;
  DockForm(fmBanksList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlCancellationReasonsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmLoanCancelReasonList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlChargeTypesClick(Sender: TObject);
begin
  inherited;
  DockForm(fmChargeTypeList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlClosureReasonsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmLoanCloseReasonList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlCompetitorsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmCompetitorList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlDesignationClick(Sender: TObject);
begin
  inherited;
  DockForm(fmDesignationList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlEmployerClick(Sender: TObject);
begin
  inherited;
  DockForm(fmEmployerList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlGroupsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmGroupList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlInformationSourcesClick(Sender: TObject);
begin
  inherited;
  DockForm(fmInfoSourceList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlLoanClassificationClick(Sender: TObject);
begin
  inherited;
  DockForm(fmLoanClassList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlLoanTypesClick(Sender: TObject);
begin
  inherited;
  DockForm(fmLoanTypeList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlPurposeClick(Sender: TObject);
begin
  inherited;
  DockForm(fmPurposeList,(Sender as TRzURLLabel).Caption);
end;

procedure TfrmMaintenanceDrawer.urlRejectionReasonsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmLoanRejectReasonList,(Sender as TRzURLLabel).Caption);
end;

end.
