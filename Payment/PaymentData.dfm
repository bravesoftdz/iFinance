object dmPayment: TdmPayment
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 302
  Width = 622
  object dstPayment: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstPaymentBeforeOpen
    BeforePost = dstPaymentBeforePost
    OnNewRecord = dstPaymentNewRecord
    CommandText = 'sp_pmt_get_payment;1'
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
        Name = '@payment_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 16
        Value = '0'
      end>
    Left = 55
    Top = 14
  end
  object dscPayment: TDataSource
    DataSet = dstPayment
    Left = 119
    Top = 14
  end
  object dstPaymentDetail: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstPaymentDetailBeforeOpen
    AfterOpen = dstPaymentDetailAfterOpen
    CommandText = 'sp_pmt_get_payment_detail;1'
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
        Name = '@payment_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 16
        Value = '0'
      end>
    Left = 55
    Top = 78
  end
  object dscPaymentDetail: TDataSource
    DataSet = dstPaymentDetail
    Left = 119
    Top = 78
  end
  object dstActiveLoans: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstActiveLoansBeforeOpen
    CommandText = 'sp_cl_get_loans;1'
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
        Size = 16
        Value = '0'
      end
      item
        Name = '@status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = ''
      end>
    Left = 256
    Top = 16
  end
  object dscActiveLoans: TDataSource
    DataSet = dstActiveLoans
    Left = 324
    Top = 16
  end
  object dstPaymentMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_payment_methods;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 256
    Top = 80
  end
  object dscPaymentMethod: TDataSource
    DataSet = dstPaymentMethod
    Left = 324
    Top = 80
  end
  object dstWithdrawal: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    AfterPost = dstWithdrawalAfterPost
    OnNewRecord = dstWithdrawalNewRecord
    CommandText = 'sp_pmt_get_withdrawals;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 47
    Top = 142
  end
  object dscWithdrawal: TDataSource
    DataSet = dstWithdrawal
    Left = 111
    Top = 142
  end
  object dstAcctInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAcctInfoBeforeOpen
    CommandText = 'sp_cl_get_acct_info;1'
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
        Size = 9
        Value = ''
      end>
    Left = 40
    Top = 208
  end
  object dscAcctInfo: TDataSource
    DataSet = dstAcctInfo
    Left = 112
    Top = 208
  end
  object dscSchedule: TDataSource
    DataSet = dstSchedule
    Left = 324
    Top = 144
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
    Left = 256
    Top = 144
  end
  object dstInterests: TADODataSet
    Connection = dmApplication.acMain
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 'sp_pmt_get_interests;1'
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
    Top = 24
  end
  object dstLoans: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_pmt_get_loans;1'
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
    Left = 528
    Top = 24
  end
  object dscLedger: TDataSource
    DataSet = dstLedger
    Left = 528
    Top = 88
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
    Left = 456
    Top = 88
    object dstLedgerdue: TDateTimeField
      FieldName = 'due'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstLedgerreceipt_no: TStringField
      FieldName = 'receipt_no'
      FixedChar = True
      Size = 10
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
      DisplayFormat = '###,###,##0.00;-;-'
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
      DisplayFormat = '###,###,##0.00;-;-'
      Precision = 10
      Size = 2
    end
    object dstLedgerbalance_i: TBCDField
      FieldName = 'balance_i'
      DisplayFormat = '###,###,##0.00;-;-'
      Precision = 10
      Size = 2
    end
    object dstLedgersort_order: TSmallintField
      FieldName = 'sort_order'
    end
  end
end
