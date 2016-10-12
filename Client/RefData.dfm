object dmRef: TdmRef
  OldCreateOrder = False
  Height = 338
  Width = 490
  object dstPersonalInfo: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPersonalInfoBeforeOpen
    CommandText = 'sp_cl_get_ref_personal_info;1'
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
    Left = 32
    Top = 72
  end
  object dstContactInfo: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstContactInfoBeforeOpen
    BeforePost = dstContactInfoBeforePost
    CommandText = 'sp_cl_get_ref_contact_info;1'
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
    Left = 32
    Top = 128
  end
  object dstAddressInfo: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstAddressInfoBeforeOpen
    BeforePost = dstAddressInfoBeforePost
    CommandText = 'sp_cl_get_ref_address_info;1'
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
    Left = 32
    Top = 184
  end
  object dscAddressInfo: TDataSource
    DataSet = dstAddressInfo
    Left = 120
    Top = 184
  end
  object dscContactInfo: TDataSource
    DataSet = dstContactInfo
    Left = 120
    Top = 128
  end
  object dscPersonalInfo: TDataSource
    DataSet = dstPersonalInfo
    Left = 120
    Top = 72
  end
  object dstRefInfo: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstRefInfoBeforeOpen
    AfterOpen = dstRefInfoAfterOpen
    BeforePost = dstRefInfoBeforePost
    AfterPost = dstRefInfoAfterPost
    AfterDelete = dstRefInfoAfterDelete
    AfterScroll = dstRefInfoAfterScroll
    CommandText = 'sp_cl_get_ref_info;1'
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
    Left = 31
    Top = 14
  end
  object dscRefInfo: TDataSource
    DataSet = dstRefInfo
    Left = 119
    Top = 14
  end
  object dstEducCode: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_education_code;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 232
    Top = 72
  end
  object dscEducCode: TDataSource
    DataSet = dstEducCode
    Left = 304
    Top = 72
  end
  object dstRef: TADODataSet
    Tag = 3
    Connection = dmApplication.acMain
    BeforeOpen = dstRefBeforeOpen
    BeforePost = dstRefBeforePost
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
    Left = 232
    Top = 128
  end
  object dstRefPersonalInfo: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstRefPersonalInfoBeforeOpen
    BeforePost = dstRefPersonalInfoBeforePost
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
    Left = 232
    Top = 184
  end
  object dscRefPersonalInfo: TDataSource
    DataSet = dstRefPersonalInfo
    Left = 304
    Top = 184
  end
  object dstRefContactInfo: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    BeforeOpen = dstRefContactInfoBeforeOpen
    BeforePost = dstRefContactInfoBeforePost
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
    Left = 232
    Top = 240
  end
  object dscRefContactInfo: TDataSource
    DataSet = dstRefContactInfo
    Left = 304
    Top = 240
  end
  object dstEntities: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_get_entities;1'
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
        Name = '@entity_type'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = ''
      end>
    Left = 231
    Top = 14
  end
  object dscEntities: TDataSource
    DataSet = dstEntities
    Left = 303
    Top = 14
  end
end
