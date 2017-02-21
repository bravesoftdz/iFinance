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
          Width = 250
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 46
      Height = 14
      Caption = 'Purpose'
      Transparent = True
    end
    object edPurpose: TRzDBEdit
      Left = 82
      Top = 33
      Width = 182
      Height = 22
      DataSource = dmAux.dscPurpose
      DataField = 'purpose'
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
