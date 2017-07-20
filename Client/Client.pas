unit Client;

interface

uses
  SysUtils, ClientData, DB, Entity, ADODB, LandLord, ImmediateHead,
  Referee, Employer, BankAccount, IdentityDoc, Reference, RefData,
  DBUtil;

type
  TClientGroup = class
  strict private
    FId: string;
    FName: string;
    FEmployerGroup: boolean;
  public
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property EmployerGroup: boolean read FEmployerGroup write FEmployerGroup;
  end;


  TClient = class(TEntity)
  private
    FDisplayId: string;
    FName: string;
    FBirthdate: TDate;
    FReferee: TReferee;
    FLandlordPres: TLandLord;
    FLandLordProv: TLandLord;
    FImmediateHead: TImmediateHead;
    FEmployer: TEmployer;
    FIdentityDocs: array of TIdentityDoc;
    FReferences: array of TReference;
    FPhoto: string;
    FBankAccounts: array of TBankAccount;
    FGroups: array of TClientGroup;

    function CheckId: boolean;
    function GetIdentityDoc(const i: integer): TIdentityDoc;
    function GetReference(const i: integer): TReference;
    function GetBankAccount(const i: integer): TBankAccount;
    function GetAdding: boolean;
    function GetGroup(const i: integer): TClientGroup;
    function GetGroupCount: integer;
    function GetIdentityDocsCount: integer;
    function GroupExists(const groupId: string): boolean;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve(const closeDataSources: boolean = false);
    procedure CopyAddress;
    procedure AddIdentityDoc(identDoc: TIdentityDoc);
    procedure AddReference(reference: TReference);
    procedure RemoveIdentityDoc(const idType: string);
    procedure RemoveReference(const id: string);
    procedure AddBankAccount(const bkAcct: TBankAccount);
    procedure RemoveBankAccountByAccountNo(const acctNo: string);
    procedure ClearBankAccounts;
    procedure GetGroups;
    procedure RemoveGroup(const group: TClientGroup; const removeFromDb: boolean = false);

    function IdentityDocExists(const idType: string): boolean;
    function ReferenceExists(const reference: TReference): boolean;
    function AccountNoExists(const accountNo: string): boolean;
    function CardNoExists(const cardNo: string): boolean;
    function AddGroup(const group: TClientGroup; const saveToDb: boolean = false): boolean;

    property DisplayId: string read FDisplayId write FDisplayId;
    property Name: string read FName write FName;
    property Birthdate: TDate read FBirthdate write FBirthdate;
    property Referee: TReferee read FReferee write FReferee;
    property LandlordPres: TLandLord read FLandlordPres write FLandlordPres;
    property LandLordProv: TLandLord read FLandLordProv write FLandLordProv;
    property ImmediateHead: TImmediateHead read FImmediateHead write FImmediateHead;
    property Employer: TEmployer read FEmployer write FEmployer;
    property IdentityDocs[const i: integer]: TIdentityDoc read GetIdentityDoc;
    property References[const i: integer]: TReference read GetReference;
    property HasId: boolean read CheckId;
    property Photo: string read FPhoto write FPhoto;
    property BankAccounts[const i: integer]: TBankAccount read GetBankAccount;
    property Adding: boolean read GetAdding;
    property Groups[const i: integer]: TClientGroup read GetGroup;
    property GroupCount: integer read GetGroupCount;
    property IdentityDocsCount: integer read GetIdentityDocsCount;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

var
  cln: TClient;

implementation

{ TClient }

constructor TClient.Create;
begin
  if cln <> nil then
    Abort
  else
    cln := self;
end;

destructor TClient.Destroy;
begin
  if cln = self then
    cln := nil;
end;

procedure TClient.Add;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Tag <> 0 then
        begin
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).Append;
        end;
      end;
    end;
  end;
end;

procedure TClient.Cancel;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Active then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
  end;

  with dmRef do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Active then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel;
  end;
end;

procedure TClient.Edit;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        (Components[i] as TADODataSet).Open;
        if (Components[i] as TADODataSet).Tag in [1,2] then
          if (Components[i] as TADODataSet).RecordCount > 0 then
            (Components[i] as TADODataSet).Edit;
      end;
    end;
  end;
end;

procedure TClient.Save;
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
        begin
          (Components[i] as TADODataSet).Post;

          if (Components[i] as TADODataSet).Tag = 1 then
            (Components[i] as TADODataSet).Edit; // set to edit mode to trigger BeforePost event during save routine
        end;

  end;

  with dmRef do
  begin
    for i:=0 to ComponentCount - 1 do
      if Components[i] is TADODataSet then
        if ((Components[i] as TADODataSet).State in [dsInsert,dsEdit]) then
          if ((Components[i] as TADODataSet).Modified) then
            (Components[i] as TADODataSet).Post
          else
            (Components[i] as TADODataSet).Cancel;
  end;
end;

procedure TClient.Retrieve(const closeDataSources: boolean = false);
var
  i: integer;
begin
  with dmClient do
  begin
    for i:=0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
       if (Components[i] as TADODataSet).Tag in [1,2] then
        begin
          if closeDataSources then
            (Components[i] as TADODataSet).Close;

          (Components[i] as TADODataSet).DisableControls;
          (Components[i] as TADODataSet).Open;
          (Components[i] as TADODataSet).EnableControls;

          if (Components[i] as TADODataSet).RecordCount > 0 then
            (Components[i] as TADODataSet).Edit;
        end;
    end;
  end;
end;

procedure TClient.AddBankAccount(const bkAcct: TBankAccount);
begin
  if not AccountNoExists(bkAcct.AccountNo) then
  begin
    SetLength(FBankAccounts,Length(FBankAccounts) + 1);
    FBankAccounts[Length(FBankAccounts) - 1] := bkAcct;
  end;
end;

procedure TClient.RemoveBankAccountByAccountNo(const acctNo: string);
var
  i, len: integer;
  acct: TBankAccount;
begin
  len := Length(FBankAccounts);

  for i := 0 to len - 1 do
  begin
    acct := FBankAccounts[i];
    if acct.AccountNo <> acctNo then
      FBankAccounts[i] := acct;
  end;

  SetLength(FBankAccounts,Length(FBankAccounts) - 1);
end;

procedure TClient.RemoveGroup(const group: TClientGroup;
  const removeFromDb: boolean);
var
  i, len: integer;
  gp: TClientGroup;
begin
  len := Length(FGroups);

  for i := 0 to len - 1 do
  begin
    gp := FGroups[i];
    if gp.Id <> group.Id then
      FGroups[i] := gp;
  end;

  SetLength(FGroups,Length(FGroups) - 1);

  if removeFromDb then
    ExecuteSql('DELETE FROM ENTITYGROUP WHERE'
        + ' ENTITY_ID = ''' + cln.Id + ''''
        + ' AND GRP_ID = ''' + group.Id + '''');
end;

function TClient.CheckId: boolean;
begin
  Result := FId <> '';
end;

procedure TClient.CopyAddress;
var
  i: integer;
begin
  with dmClient, dmClient.dstAddressInfo do
  begin
    if dstAddressInfo2.RecordCount > 0 then
      dstAddressInfo2.Edit
    else if dstAddressInfo2.State <> dsInsert then
      dstAddressInfo2.Append;

    for i := 0 to FieldCount - 1 do
      if dstAddressInfo2.Fields.FindField(Fields[i].FieldName) <> nil then
        if not dstAddressInfo2.Fields[i].ReadOnly then
          dstAddressInfo2.FieldByName(Fields[i].FieldName).Value := FieldByName(Fields[i].FieldName).Value;
  end;

end;

procedure TClient.AddIdentityDoc(identDoc: TIdentityDoc);
begin
  if not IdentityDocExists(identDoc.IdType) then
  begin
    SetLength(FIdentityDocs,Length(FIdentityDocs) + 1);
    FIdentityDocs[Length(FIdentityDocs) - 1] := identDoc;
  end;
end;

function TClient.GetIdentityDoc(const i: Integer): TIdentityDoc;
begin
  Result := FIdentityDocs[i];
end;

function TClient.GetIdentityDocsCount: integer;
begin
  Result := Length(FIdentityDocs);
end;

function TClient.IdentityDocExists(const idType: string): boolean;
var
  i, len: integer;
  doc: TIdentityDoc;
begin
  Result := false;

  len := Length(FIdentityDocs);

  for i := 0 to len - 1 do
  begin
    doc := FIdentityDocs[i];
    if doc.IdType = idType then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TClient.ReferenceExists(const reference: TReference): boolean;
var
  i, len: integer;
  rf: TReference;
begin
  Result := false;

  len := Length(FReferences);

  for i := 0 to len - 1 do
  begin
    rf := FReferences[i];
    if rf.Id = reference.Id then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

procedure TClient.AddReference(reference: TReference);
begin
  if not ReferenceExists(reference) then
  begin
    SetLength(FReferences,Length(FReferences) + 1);
    FReferences[Length(FReferences) - 1] := reference;
  end;
end;

procedure TClient.ClearBankAccounts;
begin
  FBankAccounts := [];
end;

function TClient.GetReference(const i: Integer): TReference;
begin
  Result := FReferences[i];
end;

function TClient.GroupExists(const groupId: string): boolean;
var
  i, len: integer;
  group: TClientGroup;
begin
  Result := false;

  len := Length(FGroups);

  for i := 0 to len - 1 do
  begin
    group := FGroups[i];
    if group.Id = groupId then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

procedure TClient.RemoveIdentityDoc(const idType: string);
var
  i, len: integer;
  idoc: TIdentityDoc;
begin
  len := Length(FIdentityDocs);

  for i := 0 to len - 1 do
  begin
    idoc := FIdentityDocs[i];
    if idoc.IdType <> idType then
      FIdentityDocs[i] := idoc;
  end;

  SetLength(FIdentityDocs,Length(FIdentityDocs) - 1);
end;

procedure TClient.RemoveReference(const id: string);
var
  i, len: integer;
  rf: TReference;
begin
  len := Length(FReferences);

  for i := 0 to len - 1 do
  begin
    rf := FReferences[i];
    if rf.Id <> id then
      FReferences[i] := rf;
  end;

  SetLength(FReferences,Length(FReferences) - 1);
end;

function TClient.AccountNoExists(const accountNo: string): boolean;
var
  i, len: integer;
  acct: TBankAccount;
begin
  Result := false;

  if dmClient.dstAcctInfo.State = dsInsert then
  begin
    len := Length(FBankAccounts);

    for i := 0 to len - 1 do
    begin
      acct := FBankAccounts[i];
      if acct.AccountNo = accountNo then
      begin
        Result := true;
        Exit;
      end;
    end;
  end;
end;

function TClient.CardNoExists(const cardNo: string): boolean;
var
  i, len: integer;
  acct: TBankAccount;
begin
  Result := false;

  if dmClient.dstAcctInfo.State = dsInsert then
  begin
    len := Length(FBankAccounts);

    for i := 0 to len - 1 do
    begin
      acct := FBankAccounts[i];
      if acct.CardNo = cardNo then
      begin
        Result := true;
        Exit;
      end;
    end;
  end;
end;

function TClient.GetAdding: boolean;
begin
  Result := not CheckId;
end;

function TClient.GetBankAccount(const i: integer): TBankAccount;
begin
  Result := FBankAccounts[i];
end;

function TClient.GetGroup(const i: integer): TClientGroup;
begin
  Result := FGroups[i];
end;

function TClient.GetGroupCount: integer;
begin
  Result := Length(FGroups);
end;

procedure TClient.GetGroups;
var
  group: TClientGroup;
begin
  FGroups := [];

  with dmClient.dstGroups do
  begin
    Open;
    while not Eof do
    begin
      group := TClientGroup.Create;
      group.Id := FieldByName('grp_id').AsString;
      group.Name := FieldByName('grp_name').AsString;
      group.EmployerGroup := FieldByName('emp_id').AsString <> '';

      AddGroup(group);

      Next;
    end;
    Close;
  end;
end;

function TClient.AddGroup(const group: TClientGroup; const saveToDb: boolean): boolean;
begin
  Result := false;

  if not GroupExists(group.Id) then
  begin
    SetLength(FGroups,Length(FGroups) + 1);
    FGroups[Length(FGroups) - 1] := group;

    if saveToDb then
      ExecuteSql('INSERT INTO ENTITYGROUP VALUES ('''
        + cln.Id + ''','''
        + group.Id + ''')');

    Result := true;
  end;
end;

end.
