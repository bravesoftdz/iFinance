object dmApplication: TdmApplication
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 217
  Width = 536
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
    Connected = True
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
    Filtered = True
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
  object dstLoans: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_get_loans;1'
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
      end>
    Left = 224
    Top = 80
  end
  object dscLoans: TDataSource
    DataSet = dstLoans
    Left = 296
    Top = 80
  end
  object dstLocation: TADODataSet
    Connection = acCore
    LockType = ltReadOnly
    CommandText = 'hris_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 224
    Top = 136
  end
  object dstPayments: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sp_pmt_get_payments;1'
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
        Name = '@from_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@until_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 376
    Top = 24
    object dstPaymentspayment_id: TStringField
      FieldName = 'payment_id'
      FixedChar = True
      Size = 15
    end
    object dstPaymentsreceipt_no: TStringField
      FieldName = 'receipt_no'
      FixedChar = True
      Size = 8
    end
    object dstPaymentspayment_date: TDateTimeField
      FieldName = 'payment_date'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstPaymentsentity_id: TStringField
      FieldName = 'entity_id'
      FixedChar = True
      Size = 10
    end
    object dstPaymentsloc_code: TStringField
      FieldName = 'loc_code'
      FixedChar = True
      Size = 3
    end
    object dstPaymentscreated_date: TDateTimeField
      FieldName = 'created_date'
    end
    object dstPaymentscreated_by: TStringField
      FieldName = 'created_by'
      Size = 12
    end
    object dstPaymentsref_no: TStringField
      FieldName = 'ref_no'
      Size = 17
    end
    object dstPaymentspost_date: TDateTimeField
      FieldName = 'post_date'
    end
    object dstPaymentsname: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 102
    end
    object dstPaymentstotal_amount: TFMTBCDField
      FieldName = 'total_amount'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 38
      Size = 2
    end
  end
  object dscPayments: TDataSource
    DataSet = dstPayments
    Left = 448
    Top = 24
  end
  object dstDuplicate: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_get_duplicate_name;1'
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
        Name = '@lastname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@firstname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end>
    Left = 376
    Top = 80
  end
  object dscDuplicate: TDataSource
    DataSet = dstDuplicate
    Left = 448
    Top = 80
  end
end
