unit LoanClassChargeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, RzButton, RzRadChk;

type
  TfrmLoanClassChargeList = class(TfrmBasePopup)
    pnlCharges: TRzPanel;
    grCharges: TRzDBGrid;
    RzPanel1: TRzPanel;
    btnAddCharge: TRzShapeButton;
    RzPanel2: TRzPanel;
    btnRemoveCharge: TRzShapeButton;
    cbxNew: TRzCheckBox;
    cbxRenewal: TRzCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnRemoveChargeClick(Sender: TObject);
    procedure btnAddChargeClick(Sender: TObject);
    procedure cbxNewClick(Sender: TObject);
    procedure cbxRenewalClick(Sender: TObject);
  private
    { Private declarations }
    procedure FilterCharges;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmLoanClassChargeList }

uses
  FormsUtil, LoanClassification, DecisionBox, LoanClassChargeDetail;

procedure TfrmLoanClassChargeList.btnAddChargeClick(Sender: TObject);
begin
  inherited;
  with TfrmLoanClassChargeDetail.Create(nil) do
  begin
    try
      grCharges.DataSource.DataSet.Append;
      ShowModal;
      Free;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanClassChargeList.btnRemoveChargeClick(Sender: TObject);
const
  CONF = 'Are you sure you want to delete the selected loan class charge?';
var
  cgType: string;
begin

  with TfrmDecisionBox.Create(nil, CONF) do
  begin
    try
      if grCharges.DataSource.DataSet.RecordCount > 0 then
      begin
        cgType := grCharges.DataSource.DataSet.FieldByName('charge_type').AsString;

        ShowModal;

        if ModalResult = mrYes then
        begin
          grCharges.DataSource.DataSet.Delete;
          lnc.RemoveClassCharge(cgType);
        end;

        Free;
      end;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmLoanClassChargeList.cbxNewClick(Sender: TObject);
begin
  inherited;
  FilterCharges;
end;

procedure TfrmLoanClassChargeList.cbxRenewalClick(Sender: TObject);
begin
  inherited;
  FilterCharges;
end;

procedure TfrmLoanClassChargeList.FilterCharges;
var
  filter: string;
  filters: TStringList;
  i, cnt: integer;
begin
  filters := TStringList.Create;

  if cbxNew.Checked then filters.Add('(for_new = 1)');
  if cbxRenewal.Checked then filters.Add('(for_renew = 1)');

  cnt := filters.Count - 1;

  for i := 0 to cnt do
  begin
    filter := filter + filters[i];

    if i < filters.Count - 1 then filter := filter + ' or ';
  end;

  grCharges.DataSource.DataSet.Filter := filter;

  filters.Free;

end;

procedure TfrmLoanClassChargeList.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(pnlCharges);
end;

end.
