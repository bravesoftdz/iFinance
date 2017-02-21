inherited frmLoanTypeList: TfrmLoanTypeList
  Caption = 'frmLoanTypeList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 84
      Caption = 'Loan type list'
      ExplicitWidth = 84
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmLoansAux.dscLoanTypes
      Columns = <
        item
          Expanded = False
          FieldName = 'loan_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acct_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Account'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loan_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'max_tot_amt_f'
          Title.Caption = 'Maximum Total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'max_concurrent'
          Title.Alignment = taCenter
          Title.Caption = 'Concurrent'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 75
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 63
      Width = 48
      Height = 14
      Caption = 'Account'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 87
      Width = 32
      Height = 14
      Caption = 'Desc.'
      Transparent = True
    end
    object JvLabel14: TJvLabel [2]
      Left = 14
      Top = 135
      Width = 56
      Height = 14
      Caption = 'Max. total'
      Transparent = True
    end
    object JvLabel5: TJvLabel [3]
      Left = 166
      Top = 135
      Width = 63
      Height = 14
      Caption = 'Concurrent'
      Transparent = True
    end
    object JvLabel3: TJvLabel [4]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 5
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 6
    end
    object edTypeName: TRzDBEdit
      Left = 80
      Top = 33
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscLoanTypes
      DataField = 'loan_type_name'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 80
      Top = 81
      Width = 184
      Height = 46
      DataField = 'loan_type_desc'
      DataSource = dmLoansAux.dscLoanTypes
      TabOrder = 2
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edMaxTotal: TRzDBNumericEdit
      Left = 80
      Top = 129
      Width = 81
      Height = 22
      DataSource = dmLoansAux.dscLoanTypes
      DataField = 'max_tot_amt'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
    object edConcurrent: TRzDBEdit
      Left = 233
      Top = 129
      Width = 31
      Height = 22
      DataSource = dmLoansAux.dscLoanTypes
      DataField = 'max_concurrent'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 4
    end
    object dbluAccountType: TRzDBLookupComboBox
      Tag = 1
      Left = 80
      Top = 57
      Width = 184
      Height = 22
      DataField = 'acct_type'
      DataSource = dmLoansAux.dscLoanTypes
      KeyField = 'acct_type'
      ListField = 'acct_type_name'
      ListSource = dmLoansAux.dscAcctTypes
      TabOrder = 1
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
  end
end
