object dmLoan: TdmLoan
  OldCreateOrder = False
  Height = 338
  Width = 779
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
    LockType = ltBatchOptimistic
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
  object dscFinInfo: TDataSource
    DataSet = dstFinInfo
    Left = 416
    Top = 72
  end
  object dstFinInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
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
    Left = 352
    Top = 72
  end
  object dscMonExp: TDataSource
    DataSet = dstMonExp
    Left = 416
    Top = 128
  end
  object dstMonExp: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
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
    Left = 352
    Top = 128
  end
  object dstLoanAss: TADODataSet
    Tag = 1
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
    Tag = 1
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
  object dstStatuses: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstStatusesBeforeOpen
    CommandText = 'sp_ln_get_loan_statuses;1'
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
    Top = 182
  end
  object dscStatuses: TDataSource
    DataSet = dstStatuses
    Left = 271
    Top = 182
  end
  object dstLoanCancel: TADODataSet
    Tag = 1
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
    Left = 55
    Top = 238
  end
  object dscLoanCancel: TDataSource
    DataSet = dstLoanCancel
    Left = 119
    Top = 238
  end
end
