inherited frmPurposeList: TfrmPurposeList
  Caption = 'frmPurposeList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 72
      Caption = 'Purpose list'
      ExplicitWidth = 72
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscPurpose
      Columns = <
        item
          Expanded = False
          FieldName = 'purpose'
          Title.Alignment = taCenter
          Title.Caption = 'Purpose'
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
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 23
      Width = 46
      Height = 14
      Caption = 'Purpose'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      ExplicitTop = 429
    end
    object edPurpose: TRzDBEdit
      Left = 65
      Top = 17
      Width = 199
      Height = 22
      DataSource = dmAux.dscPurpose
      DataField = 'purpose'
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
  end
end
