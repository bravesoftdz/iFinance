object dmLoansAux: TdmLoansAux
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 151
  Width = 312
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
    CommandText = 'sp_get_loan_class;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 48
    Top = 24
    object dstLoanClassclass_id: TIntegerField
      FieldName = 'class_id'
    end
    object dstLoanClassgrp_id: TSmallintField
      FieldName = 'grp_id'
    end
    object dstLoanClassclass_name: TStringField
      FieldName = 'class_name'
      Size = 25
    end
    object dstLoanClassint_rate: TFloatField
      FieldName = 'int_rate'
      DisplayFormat = '0.00'
    end
    object dstLoanClassterm: TWordField
      FieldName = 'term'
    end
    object dstLoanClassloan_type: TStringField
      FieldName = 'loan_type'
      FixedChar = True
      Size = 2
    end
    object dstLoanClasscomakers: TWordField
      FieldName = 'comakers'
    end
    object dstLoanClassint_comp_method: TStringField
      FieldName = 'int_comp_method'
      FixedChar = True
      Size = 1
    end
    object dstLoanClassmax_loan: TBCDField
      FieldName = 'max_loan'
      DisplayFormat = '###,##0.00'
      Precision = 10
      Size = 2
    end
    object dstLoanClassgrp_name: TStringField
      FieldName = 'grp_name'
      Size = 25
    end
    object dstLoanClassloan_name: TStringField
      FieldName = 'loan_name'
      Size = 25
    end
    object dstLoanClasscomp_method: TStringField
      FieldName = 'comp_method'
      Size = 25
    end
  end
end
