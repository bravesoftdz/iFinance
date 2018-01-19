object dmLoansAux: TdmLoansAux
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 363
  Width = 861
  object dscLoanClass: TDataSource
    DataSet = dstLoanClass
    Left = 112
    Top = 24
  end
  object dstLoanClass: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    AfterOpen = dstLoanClassAfterOpen
    BeforePost = dstLoanClassBeforePost
    AfterPost = dstLoanClassAfterPost
    AfterScroll = dstLoanClassAfterScroll
    CommandText = 'sp_get_loan_class;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 24
  end
  object dscClassCharges: TDataSource
    DataSet = dstClassCharges
    Left = 112
    Top = 80
  end
  object dstClassCharges: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = dstClassChargesBeforeOpen
    AfterOpen = dstClassChargesAfterOpen
    BeforePost = dstClassChargesBeforePost
    AfterPost = dstClassChargesAfterPost
    OnCalcFields = dstClassChargesCalcFields
    OnNewRecord = dstClassChargesNewRecord
    CommandText = 'sp_get_loan_class_charges;1'
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
        Name = '@class_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 48
    Top = 80
    object dstClassChargesclass_id: TIntegerField
      FieldName = 'class_id'
    end
    object dstClassChargescharge_type: TStringField
      FieldName = 'charge_type'
      FixedChar = True
      Size = 2
    end
    object dstClassChargescharge_value: TBCDField
      FieldName = 'charge_value'
      Precision = 8
      Size = 2
    end
    object dstClassChargesvalue_type: TWordField
      FieldName = 'value_type'
    end
    object dstClassChargesratio_amt: TBCDField
      FieldName = 'ratio_amt'
      Precision = 8
      Size = 2
    end
    object dstClassChargesfor_new: TWordField
      FieldName = 'for_new'
    end
    object dstClassChargesfor_renew: TWordField
      FieldName = 'for_renew'
    end
    object dstClassChargescharge_name: TStringField
      FieldName = 'charge_name'
      Size = 25
    end
    object dstClassChargescharge_value_f: TStringField
      FieldName = 'charge_value_f'
      ReadOnly = True
      Size = 13
    end
    object dstClassChargesratio_amt_f: TStringField
      FieldName = 'ratio_amt_f'
      ReadOnly = True
      Size = 12
    end
    object dstClassChargesfor_new_f: TStringField
      FieldName = 'for_new_f'
      ReadOnly = True
      Size = 3
    end
    object dstClassChargesfor_renew_f: TStringField
      FieldName = 'for_renew_f'
      ReadOnly = True
      Size = 3
    end
    object dstClassChargesvalue_type_desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'value_type_desc'
      Size = 25
      Calculated = True
    end
    object dstClassChargesfor_reloan: TWordField
      FieldName = 'for_reloan'
    end
    object dstClassChargesfor_restructure: TWordField
      FieldName = 'for_restructure'
    end
    object dstClassChargesfor_restructure_f: TStringField
      FieldName = 'for_restructure_f'
      ReadOnly = True
      Size = 3
    end
    object dstClassChargesfor_reloan_f: TStringField
      FieldName = 'for_reloan_f'
      ReadOnly = True
      Size = 3
    end
    object dstClassChargesmax_value: TBCDField
      FieldName = 'max_value'
      Precision = 8
      Size = 2
    end
    object dstClassChargesmax_value_type: TWordField
      FieldName = 'max_value_type'
    end
    object dstClassChargesmax_value_f: TStringField
      FieldName = 'max_value_f'
      ReadOnly = True
      Size = 12
    end
  end
  object dscChargeType: TDataSource
    DataSet = dstChargeType
    Left = 264
    Top = 24
  end
  object dstChargeType: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_charge_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 24
  end
  object dscCompetitors: TDataSource
    DataSet = dstCompetitors
    Left = 264
    Top = 80
  end
  object dstCompetitors: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_competitors;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 80
  end
  object dscExpType: TDataSource
    DataSet = dstExpType
    Left = 264
    Top = 136
  end
  object dstExpType: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_exp_type;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 200
    Top = 136
  end
  object dstAppvMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_appv_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 22
  end
  object dscAppvMethod: TDataSource
    DataSet = dstAppvMethod
    Left = 431
    Top = 22
  end
  object dstCancelReason: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_cancel_reason;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 78
  end
  object dscCancelReason: TDataSource
    DataSet = dstCancelReason
    Left = 431
    Top = 78
  end
  object dstRejectReason: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_reject_reason;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 134
  end
  object dscRejectReason: TDataSource
    DataSet = dstRejectReason
    Left = 431
    Top = 134
  end
  object dstReleaseMethod: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_release_method;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 198
  end
  object dscReleaseMethod: TDataSource
    DataSet = dstReleaseMethod
    Left = 431
    Top = 198
  end
  object dstPurpose: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_purpose;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 199
    Top = 198
  end
  object dscPurpose: TDataSource
    DataSet = dstPurpose
    Left = 271
    Top = 198
  end
  object dstBranches: TADODataSet
    Connection = dmApplication.acCore
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 22
  end
  object dscBranches: TDataSource
    DataSet = dstBranches
    Left = 599
    Top = 22
  end
  object dstLoanTypes: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstLoanTypesBeforePost
    AfterPost = dstLoanTypesAfterPost
    CommandText = 'sp_get_loan_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 78
  end
  object dscLoanTypes: TDataSource
    DataSet = dstLoanTypes
    Left = 599
    Top = 78
  end
  object dstAcctTypes: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    BeforePost = dstAcctTypesBeforePost
    AfterPost = dstAcctTypesAfterPost
    CommandText = 'sp_get_acct_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 134
  end
  object dscAcctTypes: TDataSource
    DataSet = dstAcctTypes
    Left = 599
    Top = 134
  end
  object dstRecommendation: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = dstRecommendationAfterScroll
    CommandText = 'sp_dd_get_recommendation;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 527
    Top = 198
  end
  object dscRecommendation: TDataSource
    DataSet = dstRecommendation
    Left = 599
    Top = 198
  end
  object dstChargeTypes: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'sp_get_loan_class_charge_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 687
    Top = 22
  end
  object dscChargeTypes: TDataSource
    DataSet = dstChargeTypes
    Left = 759
    Top = 22
  end
  object dstCloseReason: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sp_dd_get_close_reason'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 359
    Top = 262
  end
  object dscCloseReason: TDataSource
    DataSet = dstCloseReason
    Left = 431
    Top = 262
  end
end
