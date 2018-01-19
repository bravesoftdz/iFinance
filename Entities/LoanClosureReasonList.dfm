inherited frmLoanCloseReasonList: TfrmLoanCloseReasonList
  Caption = 'frmLoanCloseReasonList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 150
      Caption = 'Loan closure reasons list'
      ExplicitWidth = 150
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscLoanCloseReasons
      Columns = <
        item
          Expanded = False
          FieldName = 'reason_name'
          Title.Alignment = taCenter
          Title.Caption = 'Closure reason'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 41
      Height = 14
      Caption = 'Reason'
      Transparent = True
    end
    object edReason: TRzDBEdit
      Left = 82
      Top = 33
      Width = 182
      Height = 22
      DataSource = dmAux.dscLoanCloseReasons
      DataField = 'reason_name'
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
    object cbSystem: TRzDBCheckBox
      Left = 82
      Top = 64
      Width = 59
      Height = 16
      DataField = 'is_system'
      DataSource = dmAux.dscLoanCloseReasons
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'System'
      TabOrder = 3
    end
    object cbAutoPosting: TRzDBCheckBox
      Left = 82
      Top = 89
      Width = 90
      Height = 16
      DataField = 'is_auto_post'
      DataSource = dmAux.dscLoanCloseReasons
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Auto-posting'
      TabOrder = 4
    end
  end
end
