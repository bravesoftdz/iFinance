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
  object fdtRight: TFDTable
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'RIGHT_CODE'
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SYSRIGHT'
    UpdateOptions.AutoIncFields = 'PROJECT_ID'
    TableName = 'SYSRIGHT'
    Left = 352
    Top = 48
  end
  object dscRight: TDataSource
    DataSet = fdtRight
    Left = 272
    Top = 48
  end
  object dstUsers: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
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
    CommandText = 'sec_get_privileges_by_role;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 264
    Top = 120
  end
end
