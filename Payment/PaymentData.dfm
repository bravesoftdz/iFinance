object dmPayment: TdmPayment
  OldCreateOrder = False
  Height = 219
  Width = 396
  object dstPayment: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstPaymentBeforeOpen
    OnNewRecord = dstPaymentNewRecord
    CommandText = 'sp_pmt_get_payment;1'
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
    CommandText = 'sp_pmt_get_payment_detail;1'
    CommandType = cmdStoredProc
    Parameters = <>
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
    Left = 216
    Top = 16
  end
  object dscActiveLoans: TDataSource
    DataSet = dstActiveLoans
    Left = 284
    Top = 16
  end
end
