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
      DataSource = dmAux.dscLoanRejectReasons
      DataField = 'reason_name'
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
  end
end
