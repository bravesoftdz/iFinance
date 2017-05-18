object dmAccounting: TdmAccounting
  OldCreateOrder = False
  Height = 202
  Width = 341
  object dstLedger: TADODataSet
    Connection = dmApplication.acMain
    CommandText = 'sp_acc_post_ledger;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 64
    Top = 24
  end
end
