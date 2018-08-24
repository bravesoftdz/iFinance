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
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 23
      Width = 39
      Height = 14
      Caption = 'Reason'
    end
    inherited pnlAdd: TRzPanel
      ExplicitTop = 429
    end
    object edReason: TRzDBEdit
      Left = 60
      Top = 17
      Width = 204
      Height = 22
      DataSource = dmAux.dscLoanCloseReasons
      DataField = 'reason_name'
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
    object cbSystem: TRzDBCheckBox
      Left = 60
      Top = 48
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
      Left = 60
      Top = 73
      Width = 90
      Height = 16
      DataField = 'is_auto_post'
      DataSource = dmAux.dscLoanCloseReasons
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Auto-posting'
      TabOrder = 2
    end
  end
end
