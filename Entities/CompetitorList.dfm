inherited frmCompetitorList: TfrmCompetitorList
  Caption = 'frmCompetitorList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 92
      Caption = 'Competitor list'
      ExplicitWidth = 92
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscCompetitors
      Columns = <
        item
          Expanded = False
          FieldName = 'comp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Competitor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 350
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object edCompName: TRzDBEdit
      Left = 58
      Top = 33
      Width = 207
      Height = 22
      DataSource = dmAux.dscCompetitors
      DataField = 'comp_name'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
