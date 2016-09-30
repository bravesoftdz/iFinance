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
  object dscBranches: TDataSource
    DataSet = dstBranches
    Left = 112
    Top = 88
  end
  object dstBranches: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    BeforePost = dstBranchesBeforePost
    OnNewRecord = dstBranchesNewRecord
    CommandText = 'sp_get_bank_branches;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 88
  end
  object dscBanks: TDataSource
    DataSet = dstBanks
    Left = 112
    Top = 152
  end
  object dstBanks: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = dstBanksAfterScroll
    CommandText = 'sp_get_banks;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 152
  end
  object dscDesignations: TDataSource
    DataSet = dstDesignations
    Left = 112
    Top = 208
  end
  object dstDesignations: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstDesignationsBeforePost
    CommandText = 'sp_get_designations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 208
  end
  object dscIdentType: TDataSource
    DataSet = dstIdentType
    Left = 272
    Top = 24
  end
  object dstIdentType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_ident_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 24
  end
end
