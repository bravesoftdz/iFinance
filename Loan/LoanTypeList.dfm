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
          Width = 75
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
          Width = 170
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
    object JvLabel3: TJvLabel [2]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 3
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 4
      ExplicitWidth = 275
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
