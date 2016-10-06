unit Client;

interface

uses
  SysUtils, ClientData, DB, Entity, ADODB, LandLord, ImmediateHead,
  Referee, Employer, Bank, IdentityDoc, Reference;

type
  TClient = class(TEntity)
  private
    FName: string;
    FBirthdate: TDate;
    FReferee: TReferee;
    FLandlordPres: TLandLord;
    FLandLordProv: TLandLord;
    FImmediateHead: TImmediateHead;
    FEmployer: TEmployer;
    FBank: TBank;
    FIdentityDocs: array of TIdentityDoc;
    FReferences: array of TReference;

    function CheckId: boolean;
    function GetIdentityDoc(const i: integer): TIdentityDoc;
    function GetReference(const i: integer): TReference;

  public
    procedure Add; override;
    procedure Save; override;
    procedure Edit; override;
    procedure Cancel; override;
    procedure Retrieve(const closeDataSources: boolean = false);
    procedure CopyAddress;
    procedure AddIdentityDoc(identDoc: TIdentityDoc);
    procedure AddReference(reference: TReference);

    function IdentityDocExists(const idType: string): boolean;

    property Name: string read FName write FName;
    property Birthdate: TDate read FBirthdate write FBirthdate;
    property Referee: TReferee read FReferee write FReferee;
    property LandlordPres: TLandLord read FLandlordPres write FLandlordPres;
    property LandLordProv: TLandLord read FLandLordProv write FLandLordProv;
    property ImmediateHead: TImmediateHead read FImmediateHead write FImmediateHead;
    property Employer: TEmployer read FEmployer write FEmployer;
    property Bank: TBank read FBank write FBank;
    property IdentityDocs[const i: integer]: TIdentityDoc read GetIdentityDoc;
    property References[const i: integer]: TReference read GetReference;
    property HasId: boolean read CheckId;

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
          (Components[i] as TADODataSet).Post;
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
      begin
        if closeDataSources then
          (Components[i] as TADODataSet).Close;

        (Components[i] as TADODataSet).Open;
      end;
    end;
  end;
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
    else
      dstAddressInfo2.Append;

    for i := 0 to FieldCount - 1 do
      if not dstAddressInfo2.Fields[i].ReadOnly then
        dstAddressInfo2.Fields[i].Value := Fields[i].Value;
  end;

end;

procedure TClient.AddIdentityDoc(identDoc: TIdentityDoc);
begin
  SetLength(FIdentityDocs,Length(FIdentityDocs) + 1);
  FIdentityDocs[Length(FIdentityDocs) - 1] := identDoc;
end;

function TClient.GetIdentityDoc(const i: Integer): TIdentityDoc;
begin
  Result := FIdentityDocs[i];
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

procedure TClient.AddReference(reference: TReference);
begin
  SetLength(FReferences,Length(FReferences) + 1);
  FReferences[Length(FReferences) - 1] := reference;
end;

function TClient.GetReference(const i: Integer): TReference;
begin
  Result := FReferences[i];
end;

end.
