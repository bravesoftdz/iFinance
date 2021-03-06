object dmEntities: TdmEntities
  OldCreateOrder = False
  Height = 447
  Width = 771
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
    Left = 71
    Top = 22
  end
  object dscEntities: TDataSource
    DataSet = dstEntities
    Left = 159
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
    Left = 72
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
    Left = 72
    Top = 136
  end
  object dscLlPersonal: TDataSource
    DataSet = dstLlPersonal
    Left = 160
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
    Left = 72
    Top = 192
  end
  object dscLlContact: TDataSource
    DataSet = dstLlContact
    Left = 160
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
    Left = 248
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
    Left = 248
    Top = 136
  end
  object dscIHPersonal: TDataSource
    DataSet = dstIHPersonal
    Left = 336
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
    Left = 248
    Top = 192
  end
  object dscIHContact: TDataSource
    DataSet = dstIHContact
    Left = 336
    Top = 192
  end
  object dstGroups: TADODataSet
    Tag = 5
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    AfterOpen = dstGroupsAfterOpen
    BeforePost = dstGroupsBeforePost
    AfterPost = dstGroupsAfterPost
    OnNewRecord = dstGroupsNewRecord
    CommandText = 'sp_get_groups;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 72
    Top = 248
  end
  object dscGroups: TDataSource
    DataSet = dstGroups
    Left = 160
    Top = 248
  end
  object dstParGroup: TADODataSet
    Tag = 5
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_get_groups;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 72
    Top = 304
  end
  object dscParGroup: TDataSource
    DataSet = dstParGroup
    Left = 160
    Top = 304
  end
  object dstEmployers: TADODataSet
    Tag = 6
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    AfterOpen = dstEmployersAfterOpen
    BeforePost = dstEmployersBeforePost
    AfterPost = dstEmployersAfterPost
    AfterScroll = dstEmployersAfterScroll
    OnNewRecord = dstEmployersNewRecord
    CommandText = 'sp_get_employers;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 248
    Top = 248
  end
  object dscEmployers: TDataSource
    DataSet = dstEmployers
    Left = 336
    Top = 248
  end
  object dstRecipient: TADODataSet
    Tag = 7
    Connection = dmApplication.acMain
    BeforeOpen = dstRecipientBeforeOpen
    BeforePost = dstRecipientBeforePost
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
    Left = 424
    Top = 80
  end
  object dstRcpPersonal: TADODataSet
    Tag = 8
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
    Left = 424
    Top = 136
  end
  object dscRcpPersonal: TDataSource
    DataSet = dstRcpPersonal
    Left = 512
    Top = 136
  end
  object dstReferee: TADODataSet
    Tag = 9
    Connection = dmApplication.acMain
    BeforeOpen = dstRefereeBeforeOpen
    BeforePost = dstRefereeBeforePost
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
    Left = 592
    Top = 80
  end
  object dstRefPersonal: TADODataSet
    Tag = 10
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforeOpen = dstRefPersonalBeforeOpen
    BeforePost = dstRefPersonalBeforePost
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
    Left = 592
    Top = 136
  end
  object dscRefPersonal: TDataSource
    DataSet = dstRefPersonal
    Left = 680
    Top = 136
  end
  object dstRefContact: TADODataSet
    Tag = 10
    Connection = dmApplication.acMain
    BeforeOpen = dstRefContactBeforeOpen
    BeforePost = dstRefContactBeforePost
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
    Left = 592
    Top = 192
  end
  object dscRefContact: TDataSource
    DataSet = dstRefContact
    Left = 680
    Top = 192
  end
  object dstGroupAttribute: TADODataSet
    Tag = 5
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforePost = dstGroupAttributeBeforePost
    OnNewRecord = dstGroupAttributeNewRecord
    CommandText = 'sp_get_group_attributes;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 72
    Top = 368
  end
  object dscGroupAttribute: TDataSource
    DataSet = dstGroupAttribute
    Left = 160
    Top = 368
  end
end
