object dmClient: TdmClient
  OldCreateOrder = False
  Height = 316
  Width = 669
  object dstEntity: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    BeforeOpen = dstEntityBeforeOpen
    AfterOpen = dstEntityAfterOpen
    BeforePost = dstEntityBeforePost
    CommandText = 'sp_cl_get_entity'
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
        Size = 9
        Value = Null
      end>
    Left = 32
    Top = 16
  end
  object dstPersonalInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstPersonalInfoBeforeOpen
    AfterOpen = dstPersonalInfoAfterOpen
    BeforePost = dstPersonalInfoBeforePost
    AfterPost = dstPersonalInfoAfterPost
    CommandText = 'sp_cl_get_personal_info'
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
        Size = 9
        Value = ''
      end>
    Left = 32
    Top = 72
  end
  object dscPersonalInfo: TDataSource
    DataSet = dstPersonalInfo
    Left = 120
    Top = 72
  end
  object dstContactInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    BeforeOpen = dstContactInfoBeforeOpen
    BeforePost = dstContactInfoBeforePost
    CommandText = 'sp_cl_get_contact_info'
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
        Size = 9
        Value = ''
      end>
    Left = 32
    Top = 128
  end
  object dscContactInfo: TDataSource
    DataSet = dstContactInfo
    Left = 120
    Top = 128
  end
  object dstAddressInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAddressInfoBeforeOpen
    AfterOpen = dstAddressInfoAfterOpen
    BeforePost = dstAddressInfoBeforePost
    AfterPost = dstAddressInfoAfterPost
    CommandText = 'sp_cl_get_address_info_pres;1'
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
        Size = 9
        Value = ''
      end>
    Left = 32
    Top = 184
  end
  object dscAddressInfo: TDataSource
    DataSet = dstAddressInfo
    Left = 120
    Top = 184
  end
  object dstResStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_residence_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 360
    Top = 16
  end
  object dscResStatus: TDataSource
    DataSet = dstResStatus
    Left = 432
    Top = 16
  end
  object dstEmpStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_employment_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 360
    Top = 72
  end
  object dscEmpStatus: TDataSource
    DataSet = dstEmpStatus
    Left = 432
    Top = 72
  end
  object dstEmplInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstEmplInfoBeforeOpen
    AfterOpen = dstEmplInfoAfterOpen
    BeforePost = dstEmplInfoBeforePost
    AfterPost = dstEmplInfoAfterPost
    CommandText = 'sp_cl_get_empl_info;1'
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
        Size = 9
        Value = ''
      end>
    Left = 216
    Top = 16
  end
  object dscEmplInfo: TDataSource
    DataSet = dstEmplInfo
    Left = 288
    Top = 16
  end
  object dstIdentInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstIdentInfoBeforeOpen
    AfterOpen = dstIdentInfoAfterOpen
    BeforePost = dstIdentInfoBeforePost
    AfterPost = dstIdentInfoAfterPost
    CommandText = 'sp_cl_get_ident_info;1'
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
        Size = 9
        Value = ''
      end>
    Left = 216
    Top = 72
  end
  object dscIdentInfo: TDataSource
    DataSet = dstIdentInfo
    Left = 288
    Top = 72
  end
  object dstAddressInfo2: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAddressInfo2BeforeOpen
    AfterOpen = dstAddressInfo2AfterOpen
    BeforePost = dstAddressInfo2BeforePost
    AfterPost = dstAddressInfo2AfterPost
    CommandText = 'sp_cl_get_address_info_prov;1'
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
        Size = 9
        Value = ''
      end>
    Left = 32
    Top = 240
  end
  object dscAddressInfo2: TDataSource
    DataSet = dstAddressInfo2
    Left = 120
    Top = 240
  end
  object dstAcctInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAcctInfoBeforeOpen
    AfterOpen = dstAcctInfoAfterOpen
    BeforePost = dstAcctInfoBeforePost
    AfterPost = dstAcctInfoAfterPost
    BeforeDelete = dstAcctInfoBeforeDelete
    CommandText = 'sp_cl_get_acct_info;1'
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
        Size = 9
        Value = ''
      end>
    Left = 216
    Top = 128
  end
  object dscAcctInfo: TDataSource
    DataSet = dstAcctInfo
    Left = 288
    Top = 128
  end
  object dstLoans: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstLoansBeforeOpen
    AfterScroll = dstLoansAfterScroll
    CommandText = 'sp_cl_get_loans;1'
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
    Left = 360
    Top = 128
  end
  object dscLoans: TDataSource
    DataSet = dstLoans
    Left = 432
    Top = 128
  end
  object dstComakers: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = dstComakersBeforeOpen
    CommandText = 'sp_cl_get_loans_comakers;1'
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
        Value = ''
      end>
    Left = 360
    Top = 184
  end
  object dscComakers: TDataSource
    DataSet = dstComakers
    Left = 432
    Top = 184
  end
  object dstClientLoanClass: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstClientLoanClassBeforeOpen
    AfterScroll = dstClientLoanClassAfterScroll
    CommandText = 'sp_cl_get_loan_class_access;1'
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
        Value = ''
      end>
    Left = 528
    Top = 72
  end
  object dscClientLoanClass: TDataSource
    DataSet = dstClientLoanClass
    Left = 592
    Top = 72
  end
  object dstLoanClassAvail: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstLoanClassAvailBeforeOpen
    CommandText = 'sp_cl_get_loan_class_avail;1'
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
    Left = 528
    Top = 16
  end
  object dscLoanClassAvail: TDataSource
    DataSet = dstLoanClassAvail
    Left = 592
    Top = 16
  end
end
