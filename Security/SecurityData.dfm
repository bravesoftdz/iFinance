object dmSecurity: TdmSecurity
  OldCreateOrder = False
  Height = 276
  Width = 524
  object dscUser: TDataSource
    DataSet = dstUsers
    Left = 72
    Top = 48
  end
  object dscRole: TDataSource
    DataSet = dstRoles
    Left = 72
    Top = 120
  end
  object dstUsers: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
    Filtered = True
    CommandText = 'sec_get_users;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 152
    Top = 48
  end
  object dstRoles: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
    CommandText = 'sec_get_roles;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 152
    Top = 120
  end
  object dstRoleRights: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_privileges_by_role;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@role_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = ''
      end
      item
        Name = '@app_code'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 1
      end>
    Left = 264
    Top = 120
  end
  object dstRights: TADODataSet
    Connection = dmApplication.acCore
    LockType = ltReadOnly
    CommandText = 'sec_get_privileges;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@app_code'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 1
      end>
    Left = 360
    Top = 48
  end
  object dstUserRoles: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_user_roles;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 360
    Top = 120
  end
end
