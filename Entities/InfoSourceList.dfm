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
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 23
      Width = 40
      Height = 14
      Caption = 'Source'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      ExplicitTop = 429
    end
    object edSource: TRzDBEdit
      Left = 59
      Top = 17
      Width = 205
      Height = 22
      DataSource = dmAux.dscInfoSource
      DataField = 'source_name'
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
  end
end
