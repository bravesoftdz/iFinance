inherited frmInfoSourceList: TfrmInfoSourceList
  Caption = 'frmInfoSourceList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 92
      Caption = 'Info source list'
      ExplicitWidth = 92
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscInfoSource
      Columns = <
        item
          Expanded = False
          FieldName = 'source_name'
          Title.Alignment = taCenter
          Title.Caption = 'Source'
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
      Width = 40
      Height = 14
      Caption = 'Source'
      Transparent = True
    end
    inherited pnlDetailHead: TRzPanel
      ExplicitWidth = 275
    end
    object edSource: TRzDBEdit
      Left = 82
      Top = 33
      Width = 182
      Height = 22
      DataSource = dmAux.dscInfoSource
      DataField = 'source_name'
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
