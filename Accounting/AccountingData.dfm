object dmAccounting: TdmAccounting
  OldCreateOrder = False
  Height = 187
  Width = 282
  object dstSchedule: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'sp_ln_get_payment_schedule;1'
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
    Left = 176
    Top = 96
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
    Left = 176
    Top = 23
  end
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
      end>
    Left = 56
    Top = 24
  end
end
