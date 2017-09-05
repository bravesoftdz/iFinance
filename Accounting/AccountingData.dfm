object dmAccounting: TdmAccounting
  OldCreateOrder = False
  Height = 115
  Width = 262
  object dstLedger: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_acc_post_ledger;1'
    CommandType = cmdStoredProc
    Parameters = <>
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
      end
      item
        Name = '@entity_id'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
      end>
    Left = 160
    Top = 24
  end
end
