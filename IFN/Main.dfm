object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'i-Finance - Integrated Financial Managment Information System'
  ClientHeight = 592
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlNavbar: TPanel
    Left = 0
    Top = 30
    Width = 185
    Height = 543
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object npMain: TJvNavigationPane
      Left = 1
      Top = 1
      Width = 183
      Height = 541
      ActivePage = nppClient
      Align = alClient
      AutoHeaders = True
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Colors.ButtonColorFrom = 8806462
      Colors.ButtonColorTo = 12626063
      Colors.ButtonHotColorFrom = 4235263
      Colors.ButtonHotColorTo = 5220351
      Colors.ButtonSelectedColorFrom = 4235263
      Colors.ButtonSelectedColorTo = 5220351
      Colors.ButtonSeparatorColor = clBlack
      Colors.SplitterColorFrom = 5849128
      Colors.SplitterColorTo = 8677194
      Colors.HeaderColorFrom = 8806462
      Colors.HeaderColorTo = 11110503
      Colors.FrameColor = clBlack
      Colors.ToolPanelColorFrom = clBlack
      Colors.ToolPanelColorTo = clBlack
      Colors.ToolPanelHeaderColorFrom = 8806462
      Colors.ToolPanelHeaderColorTo = 11110503
      MaximizedCount = 5
      NavPanelFont.Charset = ANSI_CHARSET
      NavPanelFont.Color = clBlack
      NavPanelFont.Height = -11
      NavPanelFont.Name = 'Tahoma'
      NavPanelFont.Style = [fsBold]
      NavPanelHotTrackFont.Charset = ANSI_CHARSET
      NavPanelHotTrackFont.Color = clBlack
      NavPanelHotTrackFont.Height = -11
      NavPanelHotTrackFont.Name = 'Tahoma'
      NavPanelHotTrackFont.Style = [fsBold]
      NavPanelHotTrackFontOptions = [hoPreserveColor, hoPreserveStyle]
      object nppClient: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 181
        Height = 364
        Hint = ''
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = 'Clients'
        object lblRecentlyAdded: TRzURLLabel
          Left = 15
          Top = 40
          Width = 75
          Height = 13
          Caption = 'Recently added'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = lblRecentlyAddedClick
        end
        object RzURLLabel2: TRzURLLabel
          Left = 15
          Top = 59
          Width = 63
          Height = 13
          Caption = 'Active clients'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
      end
      object nppLoans: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 181
        Height = 364
        Hint = ''
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = 'Loans Management'
      end
      object nppExpense: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 181
        Height = 364
        Hint = ''
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = 'Expense Managment'
      end
      object nppInventory: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 181
        Height = 364
        Hint = ''
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = 'Inventory'
      end
      object nppReports: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 181
        Height = 364
        Hint = ''
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = 'Reports'
      end
    end
  end
  object pnlDockMain: TPanel
    Left = 185
    Top = 30
    Width = 889
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 573
    Width = 1074
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 2
    object spMain: TRzStatusPane
      Left = 0
      Top = 0
      Width = 553
      Height = 19
      FillColor = clMenu
      ParentFillColor = False
      Align = alLeft
      Color = clHighlight
      ParentColor = False
      Caption = ''
    end
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 553
      Top = 0
      Height = 19
      Align = alLeft
      Field = vifProductVersion
      ExplicitLeft = 1074
      ExplicitHeight = 20
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1074
    Height = 30
    BorderWidth = 1
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Images = imlToolbar
    TabOrder = 3
    object tbAddClient: TToolButton
      Left = 0
      Top = 0
      Hint = 'Add client'
      Caption = 'tbAddClient'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAddClientClick
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbSave: TToolButton
      Left = 54
      Top = 0
      Hint = 'Save changes to current window'
      Caption = 'tbSave'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSaveClick
    end
  end
  object mmMain: TMainMenu
    Left = 200
    Top = 504
    object File1: TMenuItem
      Caption = '&File'
    end
    object About1: TMenuItem
      Caption = '&About'
    end
  end
  object imlToolbar: TJvImageList
    ColorDepth = cd32Bit
    PixelFormat = pf32bit
    TransparentColor = clBlack
    Items = <>
    DrawingStyle = dsTransparent
    Left = 257
    Top = 504
    Bitmap = {
      494C0101030008002C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000009000000160000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A0000001A0000001600000009000000120000002C2C1F129F593F
      25C4593F25C4593F25C4593F25C4593F25C4593F25C4593F25C4593F25C4593F
      25C4593F25C42C1F129F0000002C000000120000000F000000170000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A0000001A000000170000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001200000033001300830032
      00BC013A00CC013A00CC013A00CC013A00CC013A00CC013A00CC013A00CC013A
      00CC003200BC00130083000000330000001200000009000000164F371FB5FDF4
      E1FFFBF2DDFFFBF2DCFFFAF1DCFFFAF1DBFFFAF0DBFFF9F0DAFFF9EFDAFFF9EE
      D9FFFCF2DFFF4F371FB500000016000000090000001E0000002E080005633C00
      28C60101018A0101018A0101018A0101018A0101018A0101018A3C0028C63C00
      28C63C0028C63C0028C61D00139E0000001E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000011600730D6D06DD1EC2
      0FF921D910FF21D910FF21D910FF21D910FF21D910FF21D910FF21D910FF21D9
      10FF1DC20EF90C6D05DD01160073000000000000000000000000422E19A2FBF2
      DDFFF6EED4FFF5EDD3FFF5ECD2FFF4EBD1FFF6C33AFFF4C138FFF1BE35FFEFBC
      33FFF8EDD8FF422E19A2000000000000000000000000050003413A0027BA883E
      70EFB9ABABFFB16498FFB16498FFB5A7A7FFB5A7A7FFB9ABABFFB16498FFC376
      AAFFC073A7FFD68ABDFF3A0027BA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000054200BA23C014F921D1
      10FF21D110FF21D110FF21D110FF21B610FF21B610FF21D110FF21D110FF21D1
      10FF21D110FF1EBE0EF9054200BA0000000000000000000000003B281597FBF2
      DCFFF5EDD3FFF5ECD2FFF4EBD1FFF4EAD0FFDAD1B1FFF9F3E6FFF9F2E5FFD5C9
      AAFFF8ECD7FF3B281597000000000000000000000000360024ADD488BBFFAD60
      94FFBAB1B1FFAD6094FFAD6094FFB1A8A8FFB1A8A8FFBAB1B1FFAD6094FFC376
      AAFFB86B9FFFD88CBFFF360024AD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000075400CC2ACC19FF21C8
      10FF21C810FF21C810FF21BC10FFE8E8E8FFECECECFF21BC10FF21C810FF21C8
      10FF21C810FF21C810FF075400CC00000000000000000000000038261492FAF1
      DCFFE1D9B8FFE0D7B7FFDED5B5FFDCD2B2FFE0D5B7FFD8CDAEFFD6CAABFFD4C8
      A8FFF7ECD6FF38261492000000000000000000000000350024A8D286B9FFA95C
      90FFC0BBBBFF95487BFF95487BFFB7B2B2FFB7B2B2FFC0BBBBFFA95C90FFC376
      AAFFB06397FFDA8EC1FF350024A8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000075700CC30C61FFF21BE
      10FF21BE10FF21BE10FF21B510FFE4E4E4FFE8E8E8FF21B510FF21BE10FF21BE
      10FF21BE10FF22BE11FF075700CC0000000000000000000000003424138DFAF1
      DBFFE0D8B8FFFAF5E8FFF9F4E7FFF9F3E6FFD9CEAEFFF8F2E5FFF8F1E4FFD3C7
      A8FFF7EBD5FF3424138D000000000000000000000000330023A4D589BCFFA558
      8CFFC8C7C7FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC8C7C7FFA5588CFFC376
      AAFFA85B8FFFDD91C4FF330023A4000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085A00CC40C32FFF22B4
      11FF21A810FF21A810FF21A410FFE0E0E0FFE4E4E4FF21A410FF21A810FF21A8
      10FF21B410FF24B513FF085A00CC00000000000000000000000031221288FAF0
      DBFFE0D7B7FFDFD5B5FFDDD2B2FFDBCFB0FFDED2B4FFD7CAABFFD4C7A8FFD3C5
      A6FFF7EAD4FF31221288000000000000000000000000320022A0D98DC0FFA255
      89FFA15488FFA15488FFA15488FFA15488FFA15488FFA15488FFA25589FFA255
      89FFA25589FFE195C8FF320022A0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000095D00CC51C940FF32AF
      21FFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4E4FFE8E8E8FFECEC
      ECFF21A610FF27AF16FF095D00CC0000000000000000000000002E1F1083F9F0
      DAFFE0D5B5FFF9F3E6FFF9F2E5FFF8F2E5FFD8CBACFFF7F0E3FFF7EFE2FFD1C1
      A2FFF5E7D1FF2E1F10830000000000000000000000003100219DDC90C3FFD387
      BAFFD387BAFFD387BAFFD387BAFFD387BAFFD387BAFFD387BAFFD387BAFFD387
      BAFFD387BAFFDC90C3FF3100219D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A5F00CC54CC43FF3BB3
      2AFFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4E4FFE8E8
      E8FF21A010FF2BAA1AFF0A5F00CC0000000000000000000000002C1E0F7FF9EF
      DAFFDFD4B4FFDED2B2FFDCCFB0FFD9CDADFFDDCFB2FFD5C7A8FFD2C2A4FFCEBD
      9EFFF4E4CEFF2C1E0F7F0000000000000000000000003000209AE094C7FFF0DD
      DEFFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4
      E4FFF0DDDEFFE094C7FF3000209A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B6200CC59D148FF46BE
      35FF3DB52CFF3DB52CFF36AE25FFEBEBEBFFE2E2E2FF249D13FF229B11FF229B
      11FF269F15FF38B127FF0B6200CC000000000000000000000000291C0E7AF9EE
      D9FFDED2B2FFF8F2E5FFF8F1E4FFF7F0E3FFD6C8A9FFF7EEE1FFF5EBDEFFCDB7
      99FFF3E2CCFF291C0E7A0000000000000000000000002F001F97E397CAFFF6F6
      E9FFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECEC
      DFFFF6F6E9FFE397CAFF2F001F97000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B6400CC5FD74EFF4DC5
      3CFF4DC53CFF4DC53CFF43BB32FFFFFFFFFFFFFFFFFF43BB32FF4DC53CFF4DC5
      3CFF4DC53CFF57CF46FF0B6400CC000000000000000000000000271A0D76F8EE
      D8FFFFCC43FFFECB42FFFBC83FFFF9C63DFFF6C33AFFF4C138FFF1BE35FFEFBC
      33FFF2E1CCFF271A0D760000000000000000000000002E011F94E69ACDFFF8F8
      EFFFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1
      E7FFF8F8EFFFE69ACDFF2E011F94000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B6800CC66DE55FF56CE
      45FF56CE45FF56CE45FF49C138FFFFFFFFFFFFFFFFFF49C138FF56CE45FF56CE
      45FF56CE45FF5FD74EFF0B6800CC00000000000000000000000024180C72F8ED
      D7FFF0E2C8FFEFE1C7FFEFDFC5FFEDDBC1FFEAD6BCFFE8D0B6FFE6CDB3FFE5CC
      B2FFF2E1CCFF24180C720000000000000000000000002D011E91EA9ED1FFFBFB
      F5FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6
      F0FFFBFBF5FFEA9ED1FF2D011E91000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A5700BA5FD44EF95ED6
      4DFF5ED64DFF5ED64DFF5ED64DFF4FC73EFF4FC73EFF5ED64DFF5ED64DFF5ED6
      4DFF5ED64DFF5BD04AF90A5700BA00000000000000000000000023170B6FF8EC
      D7FFC7BB99FFC5B897FFD1C1A1FFC6B595FFE8D0B6FFE6CDB3FFC2A485FFC2A4
      85FFC2A485FF432F1AA30000000000000000000000002C011E8FECA0D3FFFEFE
      FBFFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFB
      F8FFFEFEFBFFECA0D3FF2C011E8F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000422007329911ADD61D5
      4FF96DE55CFF6DE55CFF6DE55CFF6DE55CFF6CE45BFF6CE45BFF6CE45BFF6CE4
      5BFF5FD54EF9289019DD0422007300000000000000000000000021160B6CF7EB
      D6FFEFDFC5FFEDDBC1FFEAD6BCFFE8D0B6FFE6CDB3FFE5CCB2FFD2B69AFFFFF6
      E5FF21160B6C040201260000000000000000000000002B011D8DF2A6D9FFFFFF
      FFFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFFFFFFFFFF2A6D9FF2B011D8D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000C042200730A5A
      00BA0D6D00CC0D6D00CC0D6D00CC0D6D00CC0D6D00CC0D6D00CC0D6D00CC0D6D
      00CC0A5A00BA042200730000000C0000000000000000000000001F150A69FBF0
      DDFFF7E9D4FFF5E7D1FFF4E4CEFFF3E2CCFFF2E1CCFFF2E1CCFFDCC2A7FF1F15
      0A690302012500000000000000000000000000000000170010682A011C8B1414
      0D6614140D6614140D6614140D6614140D6614140D6614140D6614140D661414
      0D6614140D662A011C8B17001068000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000110B054D1E14
      0A671E140A671E140A671E140A671E140A671E140A671E140A671E140A670302
      0124000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
