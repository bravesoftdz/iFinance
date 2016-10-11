object dmRef: TdmRef
  OldCreateOrder = False
  Height = 338
  Width = 490
  object dstEntity: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'sp_cl_get_entity'
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
        Value = Null
      end>
    Left = 32
    Top = 72
  end
  object dstPersonalInfo: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstPersonalInfoBeforeOpen
    BeforePost = dstPersonalInfoBeforePost
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
    Top = 128
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
    Top = 184
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
    Top = 240
  end
  object dscAddressInfo: TDataSource
    DataSet = dstAddressInfo
    Left = 120
    Top = 240
  end
  object dscContactInfo: TDataSource
    DataSet = dstContactInfo
    Left = 120
    Top = 184
  end
  object dscPersonalInfo: TDataSource
    DataSet = dstPersonalInfo
    Left = 120
    Top = 128
  end
  object dstClients: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_get_clients;1'
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
        Name = '@filter_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@non_clients'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 232
    Top = 16
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
  object dscClients: TDataSource
    DataSet = dstClients
    Left = 304
    Top = 16
  end
end
