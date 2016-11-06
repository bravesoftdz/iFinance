object dmComaker: TdmComaker
  OldCreateOrder = False
  Height = 316
  Width = 391
  object dstEntity: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    BeforeOpen = dstEntityBeforeOpen
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
    BeforePost = dstPersonalInfoBeforePost
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
    BeforePost = dstAddressInfoBeforePost
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
    Top = 182
  end
  object dscAddressInfo: TDataSource
    DataSet = dstAddressInfo
    Left = 120
    Top = 182
  end
  object dstAddressInfo2: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAddressInfo2BeforeOpen
    BeforePost = dstAddressInfo2BeforePost
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
    Top = 238
  end
  object dscAddressInfo2: TDataSource
    DataSet = dstAddressInfo2
    Left = 120
    Top = 238
  end
  object dstCivilStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 224
    Top = 72
  end
  object dscCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 296
    Top = 72
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
    Left = 224
    Top = 128
  end
  object dscGender: TDataSource
    DataSet = dstGender
    Left = 296
    Top = 128
  end
  object dstEmplInfo: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstEmplInfoBeforeOpen
    AfterOpen = dstEmplInfoAfterOpen
    BeforePost = dstEmplInfoBeforePost
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
    Left = 224
    Top = 184
  end
  object dscEmplInfo: TDataSource
    DataSet = dstEmplInfo
    Left = 296
    Top = 184
  end
  object dstIdentInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstIdentInfoBeforeOpen
    BeforePost = dstIdentInfoBeforePost
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
    Left = 224
    Top = 240
  end
  object dscIdentInfo: TDataSource
    DataSet = dstIdentInfo
    Left = 296
    Top = 240
  end
end
