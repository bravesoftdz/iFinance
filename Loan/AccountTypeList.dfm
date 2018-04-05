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
          FieldName = 'acct_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end>
    end
  end
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 23
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 50
      Width = 62
      Height = 14
      Caption = 'Description'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 2
      ExplicitTop = 429
    end
    object edTypeName: TRzDBEdit
      Left = 80
      Top = 17
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscAcctTypes
      DataField = 'acct_type_name'
      CharCase = ecUpperCase
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 80
      Top = 44
      Width = 184
      Height = 46
      DataField = 'acct_type_desc'
      DataSource = dmLoansAux.dscAcctTypes
      TabOrder = 1
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
  end
end
