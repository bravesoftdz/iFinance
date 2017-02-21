object dmLoan: TdmLoan
  OldCreateOrder = False
  Height = 487
  Width = 502
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
    Left = 352
    Top = 72
  end
  object dscMonExp: TDataSource
    DataSet = dstMonExp
    Left = 416
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
    Left = 352
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
    Left = 55
    Top = 238
  end
  object dscLoanCancel: TDataSource
    DataSet = dstLoanCancel
    Left = 119
    Top = 238
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
    Left = 55
    Top = 294
  end
  object dscLoanReject: TDataSource
    DataSet = dstLoanReject
    Left = 119
    Top = 294
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
    Left = 47
    Top = 350
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
    Left = 111
    Top = 350
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
    Left = 47
    Top = 406
  end
  object dscLoanCharge: TDataSource
    DataSet = dstLoanCharge
    Left = 111
    Top = 406
  end
  object dscLoanClassCharges: TDataSource
    DataSet = dstLoanClassCharges
    Left = 272
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
    Left = 208
    Top = 184
  end
end
