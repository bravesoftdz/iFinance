object dmApplication: TdmApplication
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 276
  Width = 446
  object acMain: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=iFinance;Data Source=BRYAN\' +
      'DEVELOPMENT;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    BeforeConnect = acMainBeforeConnect
    Left = 56
    Top = 24
  end
  object spGenId: TADOStoredProc
    Connection = acMain
    ProcedureName = 'sp_gen_id;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@seq_object'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end>
    Left = 136
    Top = 24
  end
  object dstUser: TADODataSet
    Connection = acCore
    LockType = ltReadOnly
    CommandText = 'sec_get_user_by_username'
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
        Name = '@username'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = Null
      end>
    Left = 136
    Top = 80
  end
  object acCore: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=HRIS;Data Source=BRYAN\DEVE' +
      'LOPMENT;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    BeforeConnect = acCoreBeforeConnect
    Left = 56
    Top = 80
  end
  object dstConfig: TADODataSet
    Connection = acCore
    LockType = ltReadOnly
    CommandText = 'sysconfig'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 136
    Top = 136
  end
  object dstClients: TADODataSet
    Connection = acMain
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
        Value = Null
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
    Left = 224
    Top = 24
  end
  object dscClients: TDataSource
    DataSet = dstClients
    Left = 296
    Top = 24
  end
end
