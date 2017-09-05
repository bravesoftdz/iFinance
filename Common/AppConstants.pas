unit AppConstants;

interface

type TForms = (fmClientMain, fmClientList, fmGroupList, fmEmployerList,
                fmBanksList, fmDesignationList, fmLoanClassList, fmLoanMain,
                fmLoanList, fmCompetitorList, fmPurposeList,fmLoanTypeList,
                fmAcctTypeList, fmLoanCancelReasonList, fmLoanRejectReasonList,
                fmSettings, fmPaymentMain, fmPaymentList, fmWithdrawalList);

{

Entity types

CL = CLIENT
LL = LANDLORD
IH = IMMEDIATE HEAD
RF = REFEREE
CK = COMAKER
RP = RECIPIENT

}

type TEntityTypes = (CL,LL,IH,RF,CK,RP);

{
Payment types

PRN = PRINCIPAL
INT = INTEREST
PEN = PENALTY

}

type TPaymentTypes = (PRN,INT,PEN);

{
Event objects

LON = LOAN
PAY = PAYMENT

}

type TEventObjects = (LON,PAY);

{

Ledger record status

OPN = OPEN
CLS = CLOSE
CNL = CANCEL

}

type TLedgerRecordStatus = (OPN,CLS,CNL);

{
 Case types

 ITS = INTEREST
 PRC = PRINCIPAL
 PNT = PENALTY
 RBT = REBATE
}

type TCaseTypes = (ITS,PRC,PNT,RBT);


implementation

end.
