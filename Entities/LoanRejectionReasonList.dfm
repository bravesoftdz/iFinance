inherited frmLoanRejectionReasonList: TfrmLoanRejectionReasonList
  Caption = 'frmLoanRejectionReasonList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 136
      Caption = 'Loan reject reason list'
      ExplicitWidth = 136
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscLoanRejectReasons
      Columns = <
        item
          Expanded = False
          FieldName = 'reason_name'
          Title.Alignment = taCenter
          Title.Caption = 'Rejection reason'
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
      DataSource = dmAux.dscLoanRejectReasons
      DataField = 'reason_name'
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
