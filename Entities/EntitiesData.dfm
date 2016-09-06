object dmEntities: TdmEntities
  OldCreateOrder = False
  Height = 257
  Width = 382
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
      end>
    Left = 31
    Top = 22
  end
  object dscEntities: TDataSource
    DataSet = dstEntities
    Left = 119
    Top = 22
  end
  object dstLandlord: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    BeforeOpen = dstLandlordBeforeOpen
    BeforePost = dstLandlordBeforePost
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
    Top = 80
  end
  object dstLlPersonal: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstLlPersonalBeforeOpen
    BeforePost = dstLlPersonalBeforePost
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
    Top = 136
  end
  object dscLlPersonal: TDataSource
    DataSet = dstLlPersonal
    Left = 120
    Top = 136
  end
  object dstLlContact: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    BeforeOpen = dstLlContactBeforeOpen
    BeforePost = dstLlContactBeforePost
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
    Top = 192
  end
  object dscLlContact: TDataSource
    DataSet = dstLlContact
    Left = 120
    Top = 192
  end
  object dstImmHead: TADODataSet
    Tag = 3
    Connection = dmApplication.acMain
    BeforeOpen = dstImmHeadBeforeOpen
    BeforePost = dstImmHeadBeforePost
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
    Left = 208
    Top = 80
  end
  object dstIHPersonal: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstIHPersonalBeforeOpen
    BeforePost = dstIHPersonalBeforePost
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
    Left = 208
    Top = 136
  end
  object dscIHPersonal: TDataSource
    DataSet = dstIHPersonal
    Left = 296
    Top = 136
  end
  object dstIHContact: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    BeforeOpen = dstIHContactBeforeOpen
    BeforePost = dstIHContactBeforePost
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
    Left = 208
    Top = 192
  end
  object dscIHContact: TDataSource
    DataSet = dstIHContact
    Left = 296
    Top = 192
  end
end
