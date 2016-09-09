object dmAux: TdmAux
  OldCreateOrder = False
  Height = 324
  Width = 502
  object dscTowns: TDataSource
    DataSet = dstTowns
    Left = 112
    Top = 24
  end
  object dstTowns: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_towns;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 24
  end
  object dscBanks: TDataSource
    DataSet = dstBanks
    Left = 112
    Top = 88
  end
  object dstBanks: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_banks;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 88
  end
end
