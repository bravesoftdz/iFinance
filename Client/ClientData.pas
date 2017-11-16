unit ClientData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ImgList,
  Vcl.Controls, Variants;

type
  TdmClient = class(TDataModule)
    dstPersonalInfo: TADODataSet;
    dscPersonalInfo: TDataSource;
    dstEntity: TADODataSet;
    dstContactInfo: TADODataSet;
    dscContactInfo: TDataSource;
    dstAddressInfo: TADODataSet;
    dscAddressInfo: TDataSource;
    dstResStatus: TADODataSet;
    dscResStatus: TDataSource;
    dstEmpStatus: TADODataSet;
    dscEmpStatus: TDataSource;
    dstEmplInfo: TADODataSet;
    dscEmplInfo: TDataSource;
    dstIdentInfo: TADODataSet;
    dscIdentInfo: TDataSource;
    dstAddressInfo2: TADODataSet;
    dscAddressInfo2: TDataSource;
    dstAcctInfo: TADODataSet;
    dscAcctInfo: TDataSource;
    dstLoans: TADODataSet;
    dscLoans: TDataSource;
    dstComakers: TADODataSet;
    dscComakers: TDataSource;
    dstGroups: TADODataSet;
    procedure dstPersonalInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEntityBeforeOpen(DataSet: TDataSet);
    procedure dstContactInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEntityBeforePost(DataSet: TDataSet);
    procedure dstPersonalInfoBeforePost(DataSet: TDataSet);
    procedure dstContactInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfoAfterPost(DataSet: TDataSet);
    procedure dstAddressInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfoBeforePost(DataSet: TDataSet);
    procedure dstEmplInfoBeforeOpen(DataSet: TDataSet);
    procedure dstEmplInfoBeforePost(DataSet: TDataSet);
    procedure dstIdentInfoBeforeOpen(DataSet: TDataSet);
    procedure dstIdentInfoBeforePost(DataSet: TDataSet);
    procedure dstAddressInfo2AfterPost(DataSet: TDataSet);
    procedure dstAddressInfo2BeforeOpen(DataSet: TDataSet);
    procedure dstAddressInfo2BeforePost(DataSet: TDataSet);
    procedure dstAcctInfoBeforeOpen(DataSet: TDataSet);
    procedure dstAcctInfoBeforePost(DataSet: TDataSet);
    procedure dstPersonalInfoAfterOpen(DataSet: TDataSet);
    procedure dstPersonalInfoAfterPost(DataSet: TDataSet);
    procedure dstEntityAfterOpen(DataSet: TDataSet);
    procedure dstAddressInfoAfterOpen(DataSet: TDataSet);
    procedure dstAddressInfo2AfterOpen(DataSet: TDataSet);
    procedure dstEmplInfoAfterOpen(DataSet: TDataSet);
    procedure dstEmplInfoAfterPost(DataSet: TDataSet);
    procedure dstAcctInfoAfterOpen(DataSet: TDataSet);
    procedure dstIdentInfoAfterOpen(DataSet: TDataSet);
    procedure dstIdentInfoAfterPost(DataSet: TDataSet);
    procedure dstLoansAfterScroll(DataSet: TDataSet);
    procedure dstComakersBeforeOpen(DataSet: TDataSet);
    procedure dstLoansBeforeOpen(DataSet: TDataSet);
    procedure dstClientLoanClass2BeforeOpen(DataSet: TDataSet);
    procedure dstGroupsBeforeOpen(DataSet: TDataSet);
    procedure dstClientLoanClass2AfterScroll(DataSet: TDataSet);
    procedure dstAcctInfoAfterPost(DataSet: TDataSet);
    procedure dstAcctInfoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClient: TdmClient;

implementation

uses
  AppData, DBUtil, Client, IFinanceGlobal, AppConstants, Referee, Landlord,
  Employer, ImmediateHead, BankAccount, IdentityDoc, LoanClassification, Bank,
  Group;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmClient.dstAcctInfoAfterOpen(DataSet: TDataSet);
var
  acct: TBankAccount;
  bk: TBank;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'AcctInfo';
  with DataSet do
  begin
    cln.ClearBankAccounts;

    while not Eof do
    begin
      bk := TBank.Create;
      bk.Id := FieldByName('bank_id').AsString;
      bk.BankName := FieldByName('bank_name').AsString;
      bk.BankCode := FieldByName('bank_code').AsString;
      bk.Branch := FieldByName('branch').AsString;

      acct := TBankAccount.Create;
      acct.Bank := bk;
      acct.AccountNo := FieldByName('acct_no').AsString;
      acct.CardNo := FieldByName('card_no').AsString;
      acct.CardExpiry := FieldByName('card_expiry').AsDateTime;

      cln.AddBankAccount(acct);

      Next;
    end;
  end;
end;

procedure TdmClient.dstAcctInfoAfterPost(DataSet: TDataSet);
var
  bankId: string;
begin
  bankId := DataSet.FieldByName('bank_id').AsString;
  RefreshDataSet(bankId,'bank_id',DataSet);
end;

procedure TdmClient.dstAcctInfoBeforeDelete(DataSet: TDataSet);
begin
  cln.RemoveBankAccountByAccountNo(DataSet.FieldByName('acct_no').AsString);
end;

procedure TdmClient.dstAcctInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAcctInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstAddressInfo2AfterOpen(DataSet: TDataSet);
begin
  if (cln.HasId) and (DataSet.FieldByName('landlord').AsString <> '') then
  begin
    cln.LandlordProv := TLandlord.Create;
    cln.LandlordProv.Id := DataSet.FieldByName('landlord').AsString;
    cln.LandlordProv.Name := DataSet.FieldByName('landlord_name').AsString;
    cln.LandlordProv.Mobile := DataSet.FieldByName('landlord_mobile').AsString;
    cln.LandlordProv.Telephone := DataSet.FieldByName('landlord_homephone').AsString;
  end
end;

procedure TdmClient.dstAddressInfo2AfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmClient.dstAddressInfo2BeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAddressInfo2BeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;

  DataSet.FieldByName('is_prov').AsInteger := 1;

  if Assigned(cln.LandlordProv) then
    DataSet.FieldByName('landlord').AsString := cln.LandlordProv.Id
  else
    DataSet.FieldByName('landlord').Value := null;
end;

procedure TdmClient.dstAddressInfoAfterOpen(DataSet: TDataSet);
begin
  if (cln.HasId) and (DataSet.FieldByName('landlord').AsString <> '') then
  begin
    cln.LandlordPres := TLandlord.Create;
    cln.LandlordPres.Id := DataSet.FieldByName('landlord').AsString;
    cln.LandlordPres.Name := DataSet.FieldByName('landlord_name').AsString;
    cln.LandlordPres.Mobile := DataSet.FieldByName('landlord_mobile').AsString;
    cln.LandlordPres.Telephone := DataSet.FieldByName('landlord_homephone').AsString;
  end
end;

procedure TdmClient.dstAddressInfoAfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmClient.dstAddressInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstAddressInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;

  DataSet.FieldByName('is_prov').AsInteger := 0;

  if Assigned(cln.LandlordPres) then
    DataSet.FieldByName('landlord').AsString := cln.LandlordPres.Id
  else
    DataSet.FieldByName('landlord').Value := null;
end;

procedure TdmClient.dstClientLoanClass2AfterScroll(DataSet: TDataSet);
var
  clId, term, comakers, age: integer;
  clName: string;
  interest, maxLoan: currency;
  validFrom, validUntil: TDate;
begin
  with DataSet do
  begin
    clId := FieldByName('class_id').AsInteger;
    clName := FieldByName('class_name').AsString;
    interest := FieldByName('int_rate').AsCurrency;
    term := FieldByName('term').AsInteger;
    maxLoan := FieldByName('max_loan').AsCurrency;
    comakers := FieldByName('comakers').AsInteger;
    validFrom := FieldByName('valid_from').AsDateTime;
    validUntil := FieldByName('valid_until').AsDateTime;
    age := FieldByName('max_age').AsInteger;
  end;

  if not Assigned(lnc) then
    lnc := TLoanClassification.Create(clId, clName, interest,
        term, maxLoan, comakers, validFrom, validUntil, age, nil, nil,'',false)
  else
  begin
    lnc.ClassificationId := clId;
    lnc.ClassificationName := clName;
    lnc.Interest := interest;
    lnc.Term := term;
    lnc.MaxLoan := maxLoan;
    lnc.Comakers := comakers;
    lnc.ValidFrom := validFrom;
    lnc.ValidUntil := validUntil;
    lnc.MaxAge := age;
  end;
end;

procedure TdmClient.dstClientLoanClass2BeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstComakersBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstContactInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstContactInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstEmplInfoAfterOpen(DataSet: TDataSet);
var
  gp: TGroup;
begin
  if (cln.HasId) and (DataSet.RecordCount > 0) then
  begin
    if DataSet.FieldByName('emp_id').AsString <> '' then
    begin
      gp := TGroup.Create;
      gp.GroupId := DataSet.FieldByName('grp_id').AsString;
      gp.GroupName := DataSet.FieldByName('grp_name').AsString;

      cln.Employer := TEmployer.Create;
      cln.Employer.Id := DataSet.FieldByName('emp_id').AsString;
      cln.Employer.Name := DataSet.FieldByName('emp_name').AsString;
      cln.Employer.Address := DataSet.FieldByName('emp_add').AsString;
      cln.Employer.Group := gp;
    end;

    if DataSet.FieldByName('imm_head').AsString <> '' then
    begin
      cln.ImmediateHead := TImmediateHead.Create;
      cln.ImmediateHead.Id := DataSet.FieldByName('imm_head').AsString;
      cln.ImmediateHead.Name := DataSet.FieldByName('imm_head_name').AsString;
    end;

  end
end;

procedure TdmClient.dstEmplInfoAfterPost(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TdmClient.dstEmplInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstEmplInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;

  if Assigned(cln.ImmediateHead) then
    DataSet.FieldByName('imm_head').AsString := cln.ImmediateHead.Id
  else
    DataSet.FieldByName('imm_head').Value := null;

  if Assigned(cln.Employer) then
    DataSet.FieldByName('emp_id').AsString := cln.Employer.Id
  else
    DataSet.FieldByName('emp_id').Value := null;
end;

procedure TdmClient.dstEntityAfterOpen(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('ref_entity_id').IsNull then
  begin
    cln.Referee := TReferee.Create;
    cln.Referee.Id := DataSet.FieldByName('ref_entity_id').AsString;
    cln.Referee.Name := DataSet.FieldByName('referee').AsString;
  end;

  cln.Photo := DataSet.FieldByName('photo').AsString;
end;

procedure TdmClient.dstEntityBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstEntityBeforePost(DataSet: TDataSet);
var
  id: string;
begin
  if DataSet.State = dsInsert then
  begin
    id := GetEntityId;
    DataSet.FieldByName('entity_id').AsString := id;
    DataSet.FieldByName('loc_code').AsString := ifn.LocationCode;

    SetCreatedFields(DataSet);

    cln.Id := id;
  end;

  if Assigned(cln.Referee) then
    DataSet.FieldByName('ref_entity_id').AsString := cln.Referee.Id
  else
    DataSet.FieldByName('ref_entity_id').Value := null;

  // photo
  DataSet.FieldByName('photo').AsString := cln.Photo;
end;

procedure TdmClient.dstIdentInfoAfterOpen(DataSet: TDataSet);
var
  idType, idNo: string;
  expiry: TDate;
  hasExpiry: boolean;
begin
  (DataSet as TADODataSet).Properties['Unique table'].Value := 'IdentityInfo';
  with DataSet do
  begin
    DisableControls;
    if RecordCount > 0 then
    begin
      while not Eof do
      begin
        idType := FieldByName('ident_type').AsString;
        idNo := FieldByName('ident_no').AsString;
        expiry := FieldByName('exp_date').AsDateTime;
        hasExpiry := FieldByName('has_expiry').AsInteger = 1;

        cln.AddIdentityDoc(TIdentityDoc.Create(idType,idNo,expiry,hasExpiry));

        Next;
      end;
      First;
    end;
    EnableControls;
  end;
end;

procedure TdmClient.dstIdentInfoAfterPost(DataSet: TDataSet);
var
  idType, idNo: string;
  expiry: TDate;
  hasExpiry: boolean;
begin
  with DataSet do
  begin
    idType := FieldByName('ident_type').AsString;
    idNo := FieldByName('ident_no').AsString;
    expiry := FieldByName('exp_date').AsDateTime;
    hasExpiry := FieldByName('has_expiry').AsInteger = 1;

    cln.AddIdentityDoc(TIdentityDoc.Create(idType,idNo,expiry,hasExpiry));
  end;

  RefreshDataSet(idType,'ident_type',DataSet);
end;

procedure TdmClient.dstIdentInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstIdentInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

procedure TdmClient.dstGroupsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstLoansAfterScroll(DataSet: TDataSet);
begin
  // filter comakers
  dstComakers.Filter := 'loan_id = ' + QuotedStr(DataSet.FieldByName('loan_id').AsString);
end;

procedure TdmClient.dstLoansBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstPersonalInfoAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if cln.HasId then
    begin
      cln.Name := FieldByName('lastname').AsString + ', ' +
        FieldByName('firstname').AsString;
    end;
  end;
end;

procedure TdmClient.dstPersonalInfoAfterPost(DataSet: TDataSet);
begin
  with DataSet do
    cln.Name := FieldByName('lastname').AsString + ', ' +
      FieldByName('firstname').AsString;
end;

procedure TdmClient.dstPersonalInfoBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@entity_id').Value := cln.Id;
end;

procedure TdmClient.dstPersonalInfoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
    DataSet.FieldByName('entity_id').AsString := cln.Id;
end;

end.
