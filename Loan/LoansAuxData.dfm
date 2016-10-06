object dmLoansAux: TdmLoansAux
  OldCreateOrder = False
  Height = 316
  Width = 455
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
    CommandText = 'sp_get_loan_class;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 24
  end
  object dscLoanType: TDataSource
    DataSet = dstLoanType
    Left = 112
    Top = 88
  end
  object dstLoanType: TADODataSet
    Active = True
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_loan_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 88
  end
  object dscLoanClassGroups: TDataSource
    DataSet = dstLoanClassGroups
    Left = 112
    Top = 152
  end
  object dstLoanClassGroups: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLoanClassGroupsBeforeOpen
    CommandText = 'sp_get_loan_class_groups;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 152
  end
end
