object dmAccounting: TdmAccounting
  OldCreateOrder = False
  Height = 236
  Width = 338
  object dstLedger: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'sp_acc_post_ledger;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 64
    Top = 24
  end
end
