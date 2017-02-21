inherited frmLoanCancelReasonList: TfrmLoanCancelReasonList
  Caption = 'frmLoanCancelReasonList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 179
      Caption = 'Loan cancellation reasons list'
      ExplicitWidth = 179
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscLoanCancelReasons
      Columns = <
        item
          Expanded = False
          FieldName = 'reason_name'
          Title.Alignment = taCenter
          Title.Caption = 'Cancellation reason'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
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
      DataSource = dmAux.dscLoanCancelReasons
      DataField = 'reason_name'
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
