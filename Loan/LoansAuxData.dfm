object dmLoansAux: TdmLoansAux
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 312
  Width = 595
  object dscLoanClass: TDataSource
    DataSet = dstLoanClass
    Left = 112
    Top = 24
  end
  object dstLoanClass: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    AfterOpen = dstLoanClassAfterOpen
    BeforePost = dstLoanClassBeforePost
    AfterPost = dstLoanClassAfterPost
    AfterScroll = dstLoanClassAfterScroll
    CommandText = 'sp_get_loan_class;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 24
  end
  object dscClassCharges: TDataSource
    DataSet = dstClassCharges
    Left = 112
    Top = 80
  end
  object dstClassCharges: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstClassChargesBeforeOpen
    AfterOpen = dstClassChargesAfterOpen
    BeforePost = dstClassChargesBeforePost
    AfterPost = dstClassChargesAfterPost
    OnNewRecord = dstClassChargesNewRecord
    CommandText = 'sp_get_loan_class_charges;1'
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
        Name = '@class_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 48
    Top = 80
  end
  object dscChargeType: TDataSource
    DataSet = dstChargeType
    Left = 264
    Top = 24
  end
  object dstChargeType: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_charge_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 24
  end
  object dscCompetitors: TDataSource
    DataSet = dstCompetitors
    Left = 264
    Top = 80
  end
  object dstCompetitors: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_competitors;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 80
  end
  object dscExpType: TDataSource
    DataSet = dstExpType
    Left = 264
    Top = 136
  end
  object dstExpType: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_exp_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 136
  end
  object dstAppvMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_appv_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 30
  end
  object dscAppvMethod: TDataSource
    DataSet = dstAppvMethod
    Left = 431
    Top = 30
  end
  object dstCancelReason: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_cancel_reason;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 78
  end
  object dscCancelReason: TDataSource
    DataSet = dstCancelReason
    Left = 431
    Top = 78
  end
  object dstRejectReason: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_reject_reason;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 134
  end
  object dscRejectReason: TDataSource
    DataSet = dstRejectReason
    Left = 431
    Top = 134
  end
  object dstReleaseMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_release_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 198
  end
  object dscReleaseMethod: TDataSource
    DataSet = dstReleaseMethod
    Left = 431
    Top = 198
  end
  object dstPurpose: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_purpose;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 199
    Top = 198
  end
  object dscPurpose: TDataSource
    DataSet = dstPurpose
    Left = 271
    Top = 198
  end
end
