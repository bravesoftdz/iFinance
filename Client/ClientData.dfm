object dmClient: TdmClient
  OldCreateOrder = False
  Height = 330
  Width = 518
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
  object dstCivilStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 16
  end
  object dscCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 280
    Top = 16
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
    Left = 208
    Top = 72
  end
  object dscGender: TDataSource
    DataSet = dstGender
    Left = 280
    Top = 72
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
    Left = 208
    Top = 128
  end
  object dscEmplInfo: TDataSource
    DataSet = dstEmplInfo
    Left = 280
    Top = 128
  end
  object dstIdentInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstIdentInfoBeforeOpen
    AfterOpen = dstIdentInfoAfterOpen
    BeforePost = dstIdentInfoBeforePost
    AfterPost = dstIdentInfoAfterPost
    AfterScroll = dstIdentInfoAfterScroll
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
    Left = 208
    Top = 184
  end
  object dscIdentInfo: TDataSource
    DataSet = dstIdentInfo
    Left = 280
    Top = 184
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
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAcctInfoBeforeOpen
    AfterOpen = dstAcctInfoAfterOpen
    BeforePost = dstAcctInfoBeforePost
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
    Left = 208
    Top = 240
  end
  object dscAcctInfo: TDataSource
    DataSet = dstAcctInfo
    Left = 280
    Top = 240
  end
end
