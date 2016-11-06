object dmLoansAux: TdmLoansAux
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 253
  Width = 457
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
end
