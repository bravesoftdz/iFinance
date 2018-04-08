object dmAux: TdmAux
  OldCreateOrder = False
  Height = 552
  Width = 709
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
    CommandText = 'sp_get_banks;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 152
  end
  object dscDesignations: TDataSource
    DataSet = dstDesignations
    Left = 112
    Top = 216
  end
  object dstDesignations: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstDesignationsBeforePost
    CommandText = 'sp_get_designations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 216
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
  object dstRefType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_ref_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 88
  end
  object dscRefType: TDataSource
    DataSet = dstRefType
    Left = 272
    Top = 88
  end
  object dstGroups: TADODataSet
    Tag = 5
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_group;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 152
  end
  object dscGroups: TDataSource
    DataSet = dstGroups
    Left = 272
    Top = 152
  end
  object dscLoanType: TDataSource
    DataSet = dstLoanType
    Left = 272
    Top = 216
  end
  object dstLoanType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = dstLoanTypeAfterScroll
    CommandText = 'sp_dd_get_loan_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 216
  end
  object dscCompMethod: TDataSource
    DataSet = dstCompMethod
    Left = 432
    Top = 24
  end
  object dstCompMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_int_comp_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 368
    Top = 24
  end
  object dscLocation: TDataSource
    DataSet = dstLocation
    Left = 432
    Top = 88
  end
  object dstLocation: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_int_comp_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 368
    Top = 88
  end
  object dstCivilStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 368
    Top = 152
  end
  object dscCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 440
    Top = 152
  end
  object dstGender: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_gender;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 368
    Top = 216
  end
  object dscGender: TDataSource
    DataSet = dstGender
    Left = 440
    Top = 216
  end
  object dstAcctType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_acct_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 22
  end
  object dscAcctType: TDataSource
    DataSet = dstAcctType
    Left = 591
    Top = 22
  end
  object dstPaymentFreq: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_payment_frequency;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 86
  end
  object dscPaymentFreq: TDataSource
    DataSet = dstPaymentFreq
    Left = 591
    Top = 86
  end
  object dstCompetitors: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    BeforePost = dstCompetitorsBeforePost
    CommandText = 'sp_get_competitors;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 150
  end
  object dscCompetitors: TDataSource
    DataSet = dstCompetitors
    Left = 591
    Top = 150
  end
  object dstPurpose: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstPurposeBeforePost
    CommandText = 'sp_get_purpose;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 214
  end
  object dscPurpose: TDataSource
    DataSet = dstPurpose
    Left = 591
    Top = 214
  end
  object dstLoanCancelReasons: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstLoanCancelReasonsBeforePost
    CommandText = 'sp_get_loan_cancel_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 47
    Top = 278
  end
  object dscLoanCancelReasons: TDataSource
    DataSet = dstLoanCancelReasons
    Left = 111
    Top = 278
  end
  object dstLoanRejectReasons: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstLoanRejectReasonsBeforePost
    CommandText = 'sp_get_loan_reject_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 47
    Top = 342
  end
  object dscLoanRejectReasons: TDataSource
    DataSet = dstLoanRejectReasons
    Left = 111
    Top = 342
  end
  object dstBankBranches: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforePost = dstLoanRejectReasonsBeforePost
    CommandText = 'sp_dd_get_banks;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 207
    Top = 278
  end
  object dscBankBranches: TDataSource
    DataSet = dstBankBranches
    Left = 271
    Top = 278
  end
  object dstInfoSource: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'sp_get_info_sources;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 278
  end
  object dscInfoSource: TDataSource
    DataSet = dstInfoSource
    Left = 591
    Top = 278
  end
  object dstLoanCloseReasons: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstLoanCloseReasonsBeforePost
    CommandText = 'sp_get_loan_close_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 47
    Top = 414
  end
  object dscLoanCloseReasons: TDataSource
    DataSet = dstLoanCloseReasons
    Left = 111
    Top = 414
  end
end
