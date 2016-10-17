object dmLoan: TdmLoan
  OldCreateOrder = False
  Height = 218
  Width = 515
  object dstLoan: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanBeforeOpen
    BeforePost = dstLoanBeforePost
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
      end>
    Left = 55
    Top = 70
  end
  object dscLoanClass: TDataSource
    DataSet = dstLoanClass
    Left = 119
    Top = 70
  end
  object dstLoanStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_loan_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 55
    Top = 126
  end
  object dscLoanStatus: TDataSource
    DataSet = dstLoanStatus
    Left = 119
    Top = 126
  end
  object dstClients: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_get_loan_clients;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 207
    Top = 14
  end
  object dscClients: TDataSource
    DataSet = dstClients
    Left = 271
    Top = 14
  end
end
