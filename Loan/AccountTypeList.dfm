inherited frmAccountTypeList: TfrmAccountTypeList
  Caption = 'frmAccountTypeList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 105
      Caption = 'Account type list'
      ExplicitWidth = 105
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmLoansAux.dscAcctTypes
      Columns = <
        item
          Expanded = False
          FieldName = 'acct_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acct_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'max_tot_amt_f'
          Title.Alignment = taRightJustify
          Title.Caption = 'Maximum total'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'max_concurrent'
          Title.Caption = 'Concurrent'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 63
      Width = 62
      Height = 14
      Caption = 'Description'
      Transparent = True
    end
    object JvLabel5: TJvLabel [2]
      Left = 166
      Top = 111
      Width = 63
      Height = 14
      Caption = 'Concurrent'
      Transparent = True
    end
    object JvLabel14: TJvLabel [3]
      Left = 14
      Top = 111
      Width = 56
      Height = 14
      Caption = 'Max. total'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 4
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 5
    end
    object edTypeName: TRzDBEdit
      Left = 80
      Top = 33
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscAcctTypes
      DataField = 'acct_type_name'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 80
      Top = 57
      Width = 184
      Height = 46
      DataField = 'acct_type_desc'
      DataSource = dmLoansAux.dscAcctTypes
      TabOrder = 1
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edConcurrent: TRzDBEdit
      Left = 233
      Top = 105
      Width = 31
      Height = 22
      DataSource = dmLoansAux.dscAcctTypes
      DataField = 'max_concurrent'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
    end
    object edMaxTotal: TRzDBNumericEdit
      Left = 80
      Top = 105
      Width = 81
      Height = 22
      DataSource = dmLoansAux.dscAcctTypes
      DataField = 'max_tot_amt'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 2
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
  end
end
