inherited frmBaseDocked: TfrmBaseDocked
  Align = alClient
  Caption = 'frmBaseDocked'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 28
    Align = alTop
    BorderOuter = fsNone
    BorderColor = clBlack
    BorderWidth = 1
    GradientColorStyle = gcsCustom
    GradientColorStart = 8806462
    GradientColorStop = 11110503
    TabOrder = 0
    VisualStyle = vsGradient
    object lblTitle: TRzLabel
      Left = 8
      Top = 7
      Width = 127
      Height = 14
      Caption = 'Change caption here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
end
