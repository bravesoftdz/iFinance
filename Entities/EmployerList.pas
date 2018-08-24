unit EmployerList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB,
  System.ImageList, Vcl.ImgList, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzRadChk, RzDBChk, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, Vcl.Imaging.pngimage,
  RzCmboBx, RzBtnEdt,  RzDBBnEd;

type
  TfrmEmployerList = class(TfrmBaseGridDetail)
    edEmployerName: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    cmbBranch: TRzComboBox;
    bteGroup: TRzButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbBranchChange(Sender: TObject);
    procedure bteGroupButtonClick(Sender: TObject);
    procedure grListCellClick(Column: TColumn);
    procedure grListKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure FilterList;
    procedure SetUnboundControls;
  public
    { Public declarations }
    procedure Cancel; override;
    procedure New; override;
  protected
    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;

    procedure SearchList; override;
    procedure BindToObject; override;
  end;

var
  frmEmployerList: TfrmEmployerList;

implementation

{$R *.dfm}

uses
  EntitiesData, IFinanceDialogs, FormsUtil, GroupSearch, Group, Employer;

procedure TfrmEmployerList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmEntities.Free;
  emp.Free;

  inherited;
end;

procedure TfrmEmployerList.SetUnboundControls;
begin
  if (Assigned(emp)) and (Assigned(emp.Group)) then
    bteGroup.Text := emp.Group.GroupName;
end;

procedure TfrmEmployerList.FormCreate(Sender: TObject);
begin
  dmEntities := TdmEntities.Create(self);

  PopulateBranchComboBox(cmbBranch);

  inherited;
end;

procedure TfrmEmployerList.FormShow(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmEmployerList.grListCellClick(Column: TColumn);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmEmployerList.grListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_UP, VK_DOWN] then SetUnboundControls;
end;

procedure TfrmEmployerList.BindToObject;
begin
  inherited;

end;

procedure TfrmEmployerList.bteGroupButtonClick(Sender: TObject);
begin
  inherited;
  with TfrmGroupSearch.Create(self) do
  begin
    try
      try
        grp := TGroup.Create;

        ShowModal;

        if ModalResult = mrOK then
        begin
          with grList.DataSource.DataSet do
          begin
            if State <> dsInsert then Edit;

            FieldByName('grp_id').AsString := grp.GroupId;

            bteGroup.Text := grp.GroupName;
          end;
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

procedure TfrmEmployerList.FilterList;
var
  filterStr: string;
begin
  if cmbBranch.ItemIndex > -1 then
    filterStr := 'loc_code = ''' + cmbBranch.Value + ''''
  else
    filterStr := '';

  grList.DataSource.DataSet.Filter := filterStr;

  SetUnboundControls;
end;

procedure TfrmEmployerList.cmbBranchChange(Sender: TObject);
begin
  inherited;
  FilterList;
end;

function TfrmEmployerList.EditIsAllowed: boolean;
begin
  Result := true;
end;

function TfrmEmployerList.EntryIsValid: boolean;
var
  error: string;
begin
  if Trim(edEmployerName.Text) = '' then error := 'Please enter an employer name.'
  else if Trim(bteGroup.Text) = '' then error := 'Please select a group.';

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

procedure TfrmEmployerList.SearchList;
begin
  grList.DataSource.DataSet.Locate('emp_name',edSearchKey.Text,
        [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmEmployerList.Cancel;
begin
  inherited Cancel;
  SetUnboundControls;
end;

procedure TfrmEmployerList.New;
begin
  if Assigned(emp) then emp.Group := nil;
  bteGroup.Clear;

  inherited New;
end;

function TfrmEmployerList.NewIsAllowed: boolean;
begin
  Result := true;
end;

end.
