object dmLoan: TdmLoan
  OldCreateOrder = False
  Height = 444
  Width = 744
  object dstLoan: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanBeforeOpen
    AfterOpen = dstLoanAfterOpen
    BeforePost = dstLoanBeforePost
    AfterPost = dstLoanAfterPost
    OnNewRecord = dstLoanNewRecord
    CommandText = 'sp_ln_get_loan;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 14
  end
  object dscLoan: TDataSource
    DataSet = dstLoan
    Left = 119
    Top = 14
  end
  object dstLoanClass: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstLoanClassBeforeOpen
    AfterOpen = dstLoanClassAfterOpen
    AfterScroll = dstLoanClassAfterScroll
    CommandText = 'sp_dd_get_loan_class;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end
      item
        Name = '@new_loan'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end>
    Left = 55
    Top = 70
  end
  object dscLoanClass: TDataSource
    DataSet = dstLoanClass
    Left = 119
    Top = 70
  end
  object dstClients: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_get_loan_clients;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 455
    Top = 14
  end
  object dscClients: TDataSource
    DataSet = dstClients
    Left = 519
    Top = 14
  end
  object dstLoanComaker: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstLoanComakerBeforeOpen
    AfterOpen = dstLoanComakerAfterOpen
    OnNewRecord = dstLoanComakerNewRecord
    CommandText = 'sp_ln_get_loan_comakers;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 455
    Top = 70
  end
  object dscLoanComaker: TDataSource
    DataSet = dstLoanComaker
    Left = 519
    Top = 70
  end
  object dstAlerts: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstAlertsBeforeOpen
    AfterOpen = dstAlertsAfterOpen
    CommandText = 'sp_ln_get_alerts;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 455
    Top = 126
  end
  object dscAlerts: TDataSource
    DataSet = dstAlerts
    Left = 519
    Top = 126
  end
  object dscComakers: TDataSource
    DataSet = dstComakers
    Left = 664
    Top = 16
  end
  object dstComakers: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_get_comakers;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 600
    Top = 16
  end
  object dscFinInfo: TDataSource
    DataSet = dstFinInfo
    Left = 664
    Top = 72
  end
  object dstFinInfo: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstFinInfoBeforeOpen
    AfterOpen = dstFinInfoAfterOpen
    BeforePost = dstFinInfoBeforePost
    CommandText = 'sp_ln_get_fin_info;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 600
    Top = 72
  end
  object dscMonExp: TDataSource
    DataSet = dstMonExp
    Left = 664
    Top = 128
  end
  object dstMonExp: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstMonExpBeforeOpen
    AfterOpen = dstMonExpAfterOpen
    BeforePost = dstMonExpBeforePost
    CommandText = 'sp_ln_get_mon_exp;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 600
    Top = 128
  end
  object dstLoanAss: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanAssBeforeOpen
    AfterOpen = dstLoanAssAfterOpen
    BeforePost = dstLoanAssBeforePost
    AfterPost = dstLoanAssAfterPost
    CommandText = 'sp_ln_get_loan_ass;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 126
  end
  object dscLoanAss: TDataSource
    DataSet = dstLoanAss
    Left = 127
    Top = 126
  end
  object dstLoanAppv: TADODataSet
    Tag = 3
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanAppvBeforeOpen
    AfterOpen = dstLoanAppvAfterOpen
    BeforePost = dstLoanAppvBeforePost
    AfterPost = dstLoanAppvAfterPost
    CommandText = 'sp_ln_get_loan_appv;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 182
  end
  object dscLoanAppv: TDataSource
    DataSet = dstLoanAppv
    Left = 119
    Top = 182
  end
  object dstLoanCancel: TADODataSet
    Tag = 5
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanCancelBeforeOpen
    AfterOpen = dstLoanCancelAfterOpen
    BeforePost = dstLoanCancelBeforePost
    AfterPost = dstLoanCancelAfterPost
    CommandText = 'sp_ln_get_loan_cancel;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 255
    Top = 14
  end
  object dscLoanCancel: TDataSource
    DataSet = dstLoanCancel
    Left = 319
    Top = 14
  end
  object dstLoanReject: TADODataSet
    Tag = 6
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanRejectBeforeOpen
    AfterOpen = dstLoanRejectAfterOpen
    BeforePost = dstLoanRejectBeforePost
    AfterPost = dstLoanRejectAfterPost
    CommandText = 'sp_ln_get_loan_reject;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 255
    Top = 70
  end
  object dscLoanReject: TDataSource
    DataSet = dstLoanReject
    Left = 319
    Top = 70
  end
  object dstLoanRelease: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstLoanReleaseBeforeOpen
    AfterOpen = dstLoanReleaseAfterOpen
    BeforePost = dstLoanReleaseBeforePost
    OnCalcFields = dstLoanReleaseCalcFields
    OnNewRecord = dstLoanReleaseNewRecord
    CommandText = 'sp_ln_get_loan_release;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 246
    object dstLoanReleaseloan_id: TStringField
      FieldName = 'loan_id'
      FixedChar = True
      Size = 13
    end
    object dstLoanReleaserecipient: TStringField
      FieldName = 'recipient'
      FixedChar = True
      Size = 10
    end
    object dstLoanReleaserel_method: TStringField
      FieldName = 'rel_method'
      FixedChar = True
      Size = 1
    end
    object dstLoanReleaserel_amt: TBCDField
      FieldName = 'rel_amt'
      Precision = 10
      Size = 2
    end
    object dstLoanReleasedate_rel: TDateTimeField
      FieldName = 'date_rel'
    end
    object dstLoanReleaserel_by: TStringField
      FieldName = 'rel_by'
      Size = 12
    end
    object dstLoanReleaseloc_code: TStringField
      FieldName = 'loc_code'
      FixedChar = True
      Size = 3
    end
    object dstLoanReleaserel_amt_f: TStringField
      FieldName = 'rel_amt_f'
      ReadOnly = True
      Size = 12
    end
    object dstLoanReleasedate_rel_f: TStringField
      FieldName = 'date_rel_f'
      ReadOnly = True
      Size = 10
    end
    object dstLoanReleasemethod_name: TStringField
      FieldName = 'method_name'
      Size = 25
    end
    object dstLoanReleaserecipient_name: TStringField
      FieldName = 'recipient_name'
      ReadOnly = True
      Size = 102
    end
    object dstLoanReleaseloc_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'loc_name'
      Size = 50
      Calculated = True
    end
  end
  object dscLoanRelease: TDataSource
    DataSet = dstLoanRelease
    Left = 119
    Top = 246
  end
  object dstLoanCharge: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstLoanChargeBeforeOpen
    AfterOpen = dstLoanChargeAfterOpen
    CommandText = 'sp_ln_get_loan_charges;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 302
  end
  object dscLoanCharge: TDataSource
    DataSet = dstLoanCharge
    Left = 119
    Top = 302
  end
  object dscLoanClassCharges: TDataSource
    DataSet = dstLoanClassCharges
    Left = 520
    Top = 184
  end
  object dstLoanClassCharges: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = dstLoanClassChargesBeforeOpen
    CommandText = 'sp_ln_get_loan_class_charges;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end>
    Left = 456
    Top = 184
  end
  object dstClientLoans: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstClientLoansBeforeOpen
    CommandText = 'sp_ln_get_client_loans;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end>
    Left = 455
    Top = 238
  end
  object dscLedger: TDataSource
    DataSet = dstLedger
    Left = 664
    Top = 184
  end
  object dstLedger: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstLedgerBeforeOpen
    CommandText = 'sp_ln_get_ledger;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end
      item
        Name = '@as_of_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 600
    Top = 184
    object dstLedgerdue: TDateTimeField
      FieldName = 'due'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstLedgerdocument_no: TStringField
      FieldName = 'document_no'
      FixedChar = True
      Size = 25
    end
    object dstLedgerdebit_amt_p: TBCDField
      FieldName = 'debit_amt_p'
      DisplayFormat = '###,###,##0.00;-;-'
      Precision = 10
      Size = 2
    end
    object dstLedgercredit_amt_p: TBCDField
      FieldName = 'credit_amt_p'
      DisplayFormat = '###,###,##0.00;-;-'
      Precision = 10
      Size = 2
    end
    object dstLedgerbalance_p: TBCDField
      FieldName = 'balance_p'
      DisplayFormat = '###,###,##0.00;(###,###,##0.00);-'
      Precision = 10
      Size = 2
    end
    object dstLedgerdebit_amt_i: TBCDField
      FieldName = 'debit_amt_i'
      DisplayFormat = '###,###,##0.00;-;-'
      Precision = 10
      Size = 2
    end
    object dstLedgercredit_amt_i: TBCDField
      FieldName = 'credit_amt_i'
      DisplayFormat = '###,###,##0.00;(###,###,##0.00);-'
      Precision = 10
      Size = 2
    end
    object dstLedgerbalance_i: TBCDField
      FieldName = 'balance_i'
      DisplayFormat = '###,###,##0.00;(###,###,##0.00);-'
      Precision = 10
      Size = 2
    end
    object dstLedgersort_order: TSmallintField
      FieldName = 'sort_order'
    end
    object dstLedgerid: TStringField
      FieldName = 'id'
    end
    object dstLedgerprincipal_deficit: TBCDField
      FieldName = 'principal_deficit'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object dstLedgerinterest_deficit: TBCDField
      FieldName = 'interest_deficit'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
  end
  object dstLoanClose: TADODataSet
    Tag = 7
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanCloseBeforeOpen
    AfterOpen = dstLoanCloseAfterOpen
    BeforePost = dstLoanCloseBeforePost
    AfterPost = dstLoanCloseAfterPost
    CommandText = 'sp_ln_get_loan_close'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 255
    Top = 134
  end
  object dscLoanClose: TDataSource
    DataSet = dstLoanClose
    Left = 319
    Top = 134
  end
  object dstAdvancePayment: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstAdvancePaymentBeforeOpen
    AfterOpen = dstAdvancePaymentAfterOpen
    CommandText = 'sp_ln_get_advance_payment;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 55
    Top = 366
  end
  object dstLoanClassAdvance: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = dstLoanClassAdvanceBeforeOpen
    CommandText = 'sp_ln_get_loan_class_advance'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end>
    Left = 599
    Top = 238
  end
  object dscPromissoryNotes: TDataSource
    DataSet = dstPromissoryNotes
    Left = 520
    Top = 296
  end
  object dstPromissoryNotes: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPromissoryNotesBeforeOpen
    CommandText = 'sp_cl_get_promissory_notes;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = #39#39
      end
      item
        Name = '@available_only'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 1
      end>
    Left = 456
    Top = 296
  end
  object dstSchedule: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_ln_get_payment_due;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@loan_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = ''
      end>
    Left = 248
    Top = 192
  end
end
