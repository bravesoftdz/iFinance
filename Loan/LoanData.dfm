object dmLoan: TdmLoan
  OldCreateOrder = False
  Height = 278
  Width = 515
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
    Left = 207
    Top = 14
  end
  object dscClients: TDataSource
    DataSet = dstClients
    Left = 271
    Top = 14
  end
  object dstLoanComaker: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanComakerBeforeOpen
    AfterOpen = dstLoanComakerAfterOpen
    AfterPost = dstLoanComakerAfterPost
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
    Left = 207
    Top = 70
  end
  object dscLoanComaker: TDataSource
    DataSet = dstLoanComaker
    Left = 271
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
    Left = 207
    Top = 126
  end
  object dscAlerts: TDataSource
    DataSet = dstAlerts
    Left = 271
    Top = 126
  end
  object dscComakers: TDataSource
    DataSet = dstComakers
    Left = 416
    Top = 16
  end
  object dstComakers: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = dstLoanClassAfterOpen
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
    Left = 352
    Top = 16
  end
  object dstAppvMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_appv_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 47
    Top = 126
  end
  object dscAppvMethod: TDataSource
    DataSet = dstAppvMethod
    Left = 119
    Top = 126
  end
end
