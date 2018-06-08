unit Rights;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzLstBox, RzChkLst, RzCmboBx, System.Rtti, StrUtils;

type
  TfrmRights = class(TfrmBaseDocked)
    chlRights: TRzCheckList;
    lblDate: TLabel;
    cmbModule: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cmbModuleChange(Sender: TObject);
    procedure chlRightsChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
  private
    { Private declarations }
    FRights: array of string;
    procedure GetRights;
    procedure PopulateRights;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  Right, SecurityData, DBUtil, IFinanceDialogs;

{ TfrmRights }

procedure TfrmRights.chlRightsChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
  sql: string;
  LRight: TRight;
begin
  LRight := chlRights.Items.Objects[Index] as TRight;

  // insert
  if NewState = cbChecked then
  begin
    try
      sql := 'INSERT INTO SYSPRIVILEGE VALUES (' +
             QuotedStr(LRight.Code) + ',' +
             QuotedStr(LRight.Name) + ',' +
             QuotedStr(LRight.Name) + ',' +
             IntToStr(1) +
             ')';

      ExecuteSQL(sql,true);

      chlRights.ItemEnabled[Index] := false;
    finally
      LRight.Free;
    end;
  end
  else // delete
  begin
    Exit;

    if ShowWarningBox('Unchecking this right will delete it from the active rights and will be removed from all ROLES using it. Do you wish to proceed?') = mrYes then
    begin
      sql := 'DELETE FROM SYSPRIVILEGE WHERE SYSPRIVILEGE_CODE = ' + QuotedStr(LRight.Code);
      ExecuteSQL(sql,true);
    end;
  end;
end;

procedure TfrmRights.cmbModuleChange(Sender: TObject);
begin
  inherited;
  PopulateRights;
end;

procedure TfrmRights.FormCreate(Sender: TObject);
begin
  inherited;
  GetRights;
  PopulateRights;
end;

procedure TfrmRights.GetRights;
var
  len: integer;
begin
  with dmSecurity.dstRights do
  begin
    Open;

    while not Eof do
    begin
      len := Length(FRights);
      SetLength(FRights, len + 1);
      FRights[len] := FieldByName('privilege_code').AsString;
      Next;
    end;

    Close;
  end;
end;

procedure TfrmRights.PopulateRights;
const
  //  MODULE INDICES
  //
  //      A = Client
  //      B = Loans
  //      C = Payment
  //      S = Administrator functions
  //      Z = Security
  ADMINISTRATOR = 0;
  CLIENT        = 1;
  LOANS         = 2;
  PAYMENT       = 3;
  SECURITY      = 4;
var
  LRights: TRights;
  LRight: TRight;
  sl: TStringList;
  module: string;
begin
  // clear the list
  chlRights.Clear;

  case cmbModule.ItemIndex of
    ADMINISTRATOR: module := 'S';
    CLIENT:        module := 'A';
    LOANS:         module := 'B';
    PAYMENT:       module := 'C';
    SECURITY:      module := 'Z';
    else module := 'X';
  end;

  for LRights := Low(TRights) to High(TRights) do
  begin
    sl := TStringList.Create;
    sl.Delimiter := '9';
    sl.DelimitedText := TRttiEnumerationType.GetName<TRights>(LRights);

    if sl[0] = module then
    begin
      LRight := TRight.Create;
      LRight.Code := sl[1];
      LRight.Name := StringReplace(sl[2],'_',' ',[rfReplaceAll]);

      chlRights.AddItem(LRight.Name,LRight);
      chlRights.ItemChecked[chlRights.Items.Count-1] := MatchStr(LRight.Code,FRights);
      chlRights.ItemEnabled[chlRights.Items.Count-1] := not MatchStr(LRight.Code,FRights);
    end;

    sl.Free;
  end;
end;

end.
