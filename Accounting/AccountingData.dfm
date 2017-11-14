object dmAccounting: TdmAccounting
  OldCreateOrder = False
  Height = 187
  Width = 378
  object dstLedger: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_acc_post_ledger;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 64
    Top = 24
  end
  object dstSchedule: TADODataSet
    Connection = dmApplication.acMain
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_ln_get_payment_schedule;1'
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
        Value = Null
      end>
    Left = 160
    Top = 24
  end
  object dstScheduledInterest: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_ln_get_scheduled_interest;1'
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
        Name = '@date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 58
    Top = 96
  end
  object dstInterest: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_ln_get_interests;1'
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
        Size = 15
        Value = Null
      end>
    Left = 256
    Top = 27
  end
end
