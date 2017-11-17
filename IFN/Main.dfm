object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'i-Finance - Integrated Financial Management Information System'
  ClientHeight = 620
  ClientWidth = 1190
  Color = 14273211
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 1190
    Height = 21
    Align = alTop
    BorderOuter = fsNone
    BorderColor = clBlack
    BorderWidth = 1
    Color = 14273211
    GradientColorStyle = gcsCustom
    GradientColorStart = 6572079
    GradientColorStop = 8675134
    GradientDirection = gdVerticalEnd
    TabOrder = 0
    VisualStyle = vsGradient
    OnMouseDown = pnlTitleMouseDown
    DesignSize = (
      1190
      21)
    object imgClose: TImage
      Left = 1169
      Top = 2
      Width = 16
      Height = 16
      Hint = 'Exit i-Finance'
      Anchors = [akTop, akRight]
      DragCursor = crHandPoint
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF610000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C000002224944415478DAA5923F4C1361
        18C69FEB9FA3D2620CA45D2C31426249970E771D6AAA1D30C574301D9C98088B
        092BB39B8B038B4313191C4C4A1C1B1207454835C412AB890E588980C4D2DC95
        5C5B4FE538AE96FADE7D47539B001ADFE4BDFBBEE7EEF97DEFE51EAEDD6EE37F
        8A7B625E001FF51D5A4E500F9EE1A9533FA3631F52FFB40054B397C2E199B158
        2CC8F7F7F32739CD690D4D334A85C26EB954CA9034C765D9B3E7135353898366
        93C75F940B3056B2D997B44C728F99F6F6E6F4B450ABD5ACCD582E874FE9F41F
        A66ECDEBF522BFB0F08E9622F7C806DC989C146459467479B9632A8E8F5BF75E
        CDE7F3616D719101E66DC0F5745A9024098AA2E0F6E626745D87AAAAD0340DAD
        560B0E87032BA208B7DB0DBFDF8FCAFA3A03646C403C9512AAD52A5ACD26A44A
        0591A525389D4ECBC0F33C5E45A370DA53786982BD7299011E1C03924941DAD9
        8156AFA34D2786F2F98ED9ECB548A4F3197C5F1FBECA3203CCD980ABA228D4B6
        B7CD7F85E11EB3CBE5B2FA4D2864BDECA0C94A8AC200F76D40626444D01A0D0C
        75993FD0D8665DDBD8B00066BD1F1DA5E47128D6EB0C70CF06A48241C1D8DFC7
        1E6DC2C5223E9239608F6C6AF1AD2DAC92F9587BD16830C05D3B48B70281046F
        07A9427DB1273CDDDAC1D191F15455599086E94AF198BDE2F1CCC43C9EE000C7
        9D9AC61F647EADEBBB9F0F0F333933CAA40D9E072EC7893304C4687FE18C247F
        A3BC165681DC77E08B0938473DC022FE4FF5CB1CE83770D0D05478554C580000
        000049454E44AE426082}
      ShowHint = True
      OnClick = imgCloseClick
      ExplicitLeft = 522
    end
    object lblCaption: TRzLabel
      Left = 8
      Top = 4
      Width = 51
      Height = 13
      Caption = 'i-Finance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 21
    Width = 1190
    Height = 599
    Align = alClient
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderColor = 6572079
    BorderWidth = 1
    Color = 12955288
    TabOrder = 1
    DesignSize = (
      1190
      599)
    object lblWelcome: TRzLabel
      Left = 1036
      Top = 7
      Width = 133
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Welcome back, Bryan '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 1026
    end
    object Label1: TLabel
      Left = 17
      Top = 571
      Width = 89
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'F2 - Add client'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 651
    end
    object Label2: TLabel
      Left = 145
      Top = 571
      Width = 82
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'F3 - Add loan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 611
    end
    object lblDate: TLabel
      Left = 601
      Top = 571
      Width = 144
      Height = 14
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'Today is January 01, 2017'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 591
      ExplicitTop = 651
    end
    object lblVersion: TLabel
      Left = 1085
      Top = 571
      Width = 84
      Height = 14
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'Version 1.0.0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1075
      ExplicitTop = 651
    end
    object lblLocation: TLabel
      Left = 859
      Top = 571
      Width = 118
      Height = 14
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'Location: Dumaguete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 849
      ExplicitTop = 651
    end
    object Label3: TLabel
      Left = 265
      Top = 571
      Width = 111
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'F4 - New payment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 651
    end
    object urlChangeDate: TRzURLLabel
      Tag = 1
      Left = 1091
      Top = 37
      Width = 78
      Height = 14
      Alignment = taRightJustify
      Caption = 'Change date..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlChangeDateClick
    end
    object pnlNavBar: TRzPanel
      Left = 17
      Top = 86
      Width = 193
      Height = 470
      Anchors = [akLeft, akTop, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object npMain: TJvNavigationPane
        Left = 1
        Top = 1
        Width = 191
        Height = 468
        ActivePage = nppClient
        Align = alClient
        BorderWidth = 0
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Colors.ButtonColorFrom = 8675134
        Colors.ButtonColorTo = 8675134
        Colors.ButtonHotColorFrom = 4235263
        Colors.ButtonHotColorTo = 5220351
        Colors.ButtonSelectedColorFrom = 4235263
        Colors.ButtonSelectedColorTo = 5220351
        Colors.ButtonSeparatorColor = clBlack
        Colors.SplitterColorFrom = 5849128
        Colors.SplitterColorTo = 8677194
        Colors.HeaderColorFrom = 6572079
        Colors.HeaderColorTo = 6572079
        Colors.FrameColor = clBlack
        Colors.ToolPanelColorFrom = clBlack
        Colors.ToolPanelColorTo = clBlack
        Colors.ToolPanelHeaderColorFrom = 6572079
        Colors.ToolPanelHeaderColorTo = 6572079
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
        OnChange = npMainChange
        object nppClient: TJvNavPanelPage
          Left = 0
          Top = 0
          Width = 191
          Height = 293
          Hint = ''
          Background.Stretch = False
          Background.Proportional = False
          Background.Center = False
          Background.Tile = False
          Background.Transparent = False
          Color = 14273211
          Caption = 'Clients'
          object lblRecentlyAdded: TRzURLLabel
            Left = 15
            Top = 15
            Width = 109
            Height = 14
            Caption = 'Newly-added clients'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblRecentlyAddedClick
          end
          object lblActiveClients: TRzURLLabel
            Left = 15
            Top = 34
            Width = 72
            Height = 14
            Caption = 'Active clients'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblActiveClientsClick
          end
          object lblAllClients: TRzURLLabel
            Left = 15
            Top = 53
            Width = 50
            Height = 14
            Caption = 'All clients'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblAllClientsClick
          end
          object RzLabel1: TRzLabel
            Left = 15
            Top = 87
            Width = 43
            Height = 14
            Caption = 'Recent'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbxRecent: TRzListBox
            Left = 15
            Top = 107
            Width = 146
            Height = 230
            BorderStyle = bsNone
            Color = 14273211
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
            OnDblClick = lbxRecentDblClick
          end
        end
        object nppLoans: TJvNavPanelPage
          Left = 0
          Top = 0
          Width = 191
          Height = 293
          Hint = ''
          Background.Stretch = False
          Background.Proportional = False
          Background.Center = False
          Background.Tile = False
          Background.Transparent = False
          Color = 14273211
          Caption = 'Loans and Payments'
          DesignSize = (
            191
            293)
          object urlCancelled: TRzURLLabel
            Left = 15
            Top = 114
            Width = 51
            Height = 14
            Caption = 'Cancelled'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlCancelledClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlPendingLoans: TRzURLLabel
            Left = 15
            Top = 39
            Width = 44
            Height = 14
            Caption = 'Pending'
            Color = 14273211
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            OnClick = urlPendingLoansClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlApprovedLoans: TRzURLLabel
            Left = 15
            Top = 76
            Width = 53
            Height = 14
            Caption = 'Approved'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlApprovedLoansClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlActiveLoans: TRzURLLabel
            Left = 15
            Top = 95
            Width = 34
            Height = 14
            Caption = 'Active'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlActiveLoansClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlDenied: TRzURLLabel
            Left = 15
            Top = 133
            Width = 49
            Height = 14
            Caption = 'Rejected'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlDeniedClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlAssessedLoans: TRzURLLabel
            Left = 15
            Top = 58
            Width = 49
            Height = 14
            Caption = 'Assessed'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlAssessedLoansClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlPayments: TRzURLLabel
            Left = 15
            Top = 205
            Width = 53
            Height = 14
            Caption = 'Payments'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlPaymentsClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlWithdrawals: TRzURLLabel
            Left = 15
            Top = 224
            Width = 66
            Height = 14
            Caption = 'Withdrawals'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlWithdrawalsClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object urlClosed: TRzURLLabel
            Left = 15
            Top = 152
            Width = 35
            Height = 14
            Caption = 'Closed'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = urlClosedClick
            FlyByColor = clBlack
            FlyByEnabled = True
          end
          object lbxRecentLoans: TRzListBox
            Left = 15
            Top = 275
            Width = 156
            Height = 78
            BorderStyle = bsNone
            Color = 14273211
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
            OnDblClick = lbxRecentLoansDblClick
          end
          object RzGroupBox3: TRzGroupBox
            Tag = -1
            Left = 15
            Top = 15
            Width = 156
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            BorderColor = 6572079
            BorderSides = []
            BorderWidth = 1
            Caption = 'Loans'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 6572079
            CaptionFont.Height = -12
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            Color = 14273211
            FlatColor = 6572079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientColorStyle = gcsCustom
            GroupStyle = gsUnderline
            ParentFont = False
            TabOrder = 1
          end
          object RzGroupBox1: TRzGroupBox
            Tag = -1
            Left = 15
            Top = 181
            Width = 156
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            BorderColor = 6572079
            BorderSides = []
            BorderWidth = 1
            Caption = 'Payments'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 6572079
            CaptionFont.Height = -12
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            Color = 14273211
            FlatColor = 6572079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientColorStyle = gcsCustom
            GroupStyle = gsUnderline
            ParentFont = False
            TabOrder = 2
          end
          object RzGroupBox2: TRzGroupBox
            Tag = -1
            Left = 15
            Top = 252
            Width = 156
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            BorderColor = 6572079
            BorderSides = []
            BorderWidth = 1
            Caption = 'Recent loans'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 6572079
            CaptionFont.Height = -12
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            Color = 14273211
            FlatColor = 6572079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientColorStyle = gcsCustom
            GroupStyle = gsUnderline
            ParentFont = False
            TabOrder = 3
          end
        end
        object nppExpense: TJvNavPanelPage
          Left = 0
          Top = 0
          Width = 191
          Height = 293
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
          Width = 191
          Height = 293
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
          Width = 191
          Height = 293
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
    object pnlDockMain: TRzPanel
      Left = 227
      Top = 86
      Width = 942
      Height = 470
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 1
    end
    object pnlAddClient: TRzPanel
      Left = 17
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 2
      object imgAddClient: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Add client'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D0000077A4944415478DAAD970B7054D519C7FF77F7EE6E927D
          67379BD03C346912485A2819A020B1100862253CB4C350C607034E55280C2005
          52A156A903882D52B003D82955DB196570D43640200402810481880123064402
          84BC7637D9EC2BFBBC8F7E776FA89484609DBD336776EEB9E73BE777BEF732A2
          28427A1886C1108F72E524D32E56A15820328C8681BC968118E604FE1FDB6ADD
          4BE895C7FFF9486733F70160168D37E626272ABF56A814B05AD5D01B54E03806
          C1B000BF2F823EAF00958287D3CFE5FFFDACE71B69DF7802687E33C512D22428
          51589004AD560BA5428D28CFC0E3E3E0EA0DA2CBD1076F6F04663DB0E5687702
          C984E305A05C5A6C7E43A755AD1A315C0D93D104059B0456A5812028E0EFE3D0
          E30AC2EEF0A1BDCD03939E01C747DFDC71D2B5F6BB9AE37E00DAD553AC3D3AA3
          4253986F8426D10056A38352499764D4F0F9A370B9FCE8E874A3ABCB03910BC1
          6264C29B8F382C24DB170F00CB9A525B774A9A02E9C38C647B33D404A0521B21
          3209F07AC374782FBABB5D70DA3DF0F9BCC8485561D3E14E2BC9F6C403C0B676
          5A9ADD9A2A20C56286C1608226C91803E8B0FB71E5F27524EAB5E8EAE8412428
          201CF4E381F4046C3CD4914AB28EF8004CB5D90D369616A910E504F27E053CDE
          20D2328661C613D3909D9B8E3E5F005B5EFB279CB7BA9093A58D2F00F940ABD6
          ACD4CC5BF8149C0E17140C45C3E80224691328040374EB1039A480E3358D38B4
          AF860074E4039D59F102B0BEF090696FB2992D5DF3DA5A98337F00CED7876020
          8850308C50288C7028029EE7D172AD131FFCF513E88DECB19DA77AE6936C773C
          000C330BB50BF2ADEC5BCFAF790EF9234790BA09806E1D0E47E4110983E77834
          5F6A45EDBFABD11DE25EDE77C1FF16C97AE201A0A191B16C82E1CC934BE659C7
          158F85D7E3976F1E0308231A913420E0CB8BDFE0F3E3A79DDB4EBA8A49E6168D
          503C00A409CBE41F6ACB963E5DF2EE9CA767C2DDEB8D9920D2AF816894032F0A
          387FE23CF656352D3C71D55B093904857800DCD642FA33A3B59B97AD7A66DE03
          F95908F405638747C251CA7C1CAE5C6AC1B10375FBF634B85FA2B5ED88632ABE
          AD05D3B3E374EF4E7B62D6ECFC820C30024FB6974D70ADA51D17BEB801CE61AF
          D87DBA6721AD75238EC58899B1B5F1314EAD5F1552594A37E57F8CC4DEAFD0D2
          D68D5E3285CFE7A36C4826D1E7A1E927EF40D1E7AA11037C79E5EAF4F3DF15E2
          5E004CE9A6D333141AE34716BD5AF3789105BF1C6B46C7676FC3DE7A19017242
          8FC707678F0B9E5E1734BA2C3CF9E27BD85E5F8753CD2F43E4CF7C7B03DA9211
          704208E1A5EA0D387B37D860006CC9E6C6639956EDA4E74B52316A58225AFD40
          B655054DC8819B4D87E17175C0EDBC49B5520F4665444ED17CEC6DFE3DEAAFBF
          8F5963E662E48393A0516963D60B4783B8D47A0E472E7C481934F0B7AA75588C
          3B2AE5DD00ECC31BCED54E1C6199B8AC341D1D3E0AAF5E4A694106AC02F8D568
          35A817418813636959E04528A0C61FABCAF0B5A30AAB666F43BBF72CBEECFA17
          EC7EB918A6EAB41899F60B649A8AB1B3F277E87276EFA95A8F176E43DC0D6028
          FEC3679EDDCF16E29A9BC305CA654A46F6423A2BF65B3E81A57AC02314E54990
          45535B2D361F29C3BAB9AFE34CDB5FE0F0B521CC013B66CA7B2E3FC040C31288
          3E13C5592BB1BDE215745DF74FAEDD8A53F2F9FF0B9032676BA3E3C5B21C1CBE
          298265E886FD6E21AD8852645B12815F172962E4612E11AB3F9E8409C31F4454
          75116DDECBB1858128B0BD4CDE73C54106492A3996320D85D08A0FE1FD9A3DF5
          47D6632ACD46EE06B04DDF78CEBEF4B15C9C6CE76387DF1917022D23CDC346E6
          5D3C4685B71B8D3858C760FDFC25A8BDB92BF68D92228204B06B96BCE792FD0C
          120940492694CC38257B39DEFC6807AACA61A2CF9E0100935F3D6D5FF4481E1A
          3AB90100B721247388A47E566941F3650516CC1A874BF6066C993674E4FDF628
          831FA591062A3FC5E172D868CA3900A068CD71FBA2470BD1E48890830DF5508F
          C058D072438D39D353D1EEB663E3D4A101D6D730C830A563FFD1761C2A47AC67
          180090BAB0C2BE7CEE585CEDE1200A43A57325AD4FA65E508BC93F934D439939
          E6272172C23F3F2AEFB9B28A4102392175F4149AB2194ED503956BEF0190F2D4
          87CDE346E524E765D9E026634628E404411C1480AA3502C1D9189E5B0F5B0A41
          F0B20F484EB8698A2CB3EEB8EC84311F20118713B8781E9F57BF8A9F0F660253
          42EEF41275D1739F64675A909E9A8C14AB1E2A9512E20006C94112A81E342014
          9E89893F95CB9F042169E0958765810D75B206A4C329A85047B9F04A35167CB5
          1F158339A19A7ED294E6EC02F598C52B448D71B8C8EA72C47B995654D28D8D28
          C8DB891F8F3880F163652EAAD0F4C7455E42EC50B188D17DDA401AB8818A136F
          6005CD740C168692D34BE5D74C436AADF5FDEF43FB2369B86435965BB250969F
          4B4987ACCBB2F2078E60EC76BAF5556A126EE160ED9F20956CCAE3F0619044F4
          AD8BCB076BFA8DCDDC07405A979CF70826668DC762B501A3FE5B724832E2C517
          AD67B1FB6A35EA20F70B52BB36682AC6F77C2448A9FA24F76B4ED73F87FE83A8
          9CC59A5417E47F4CF72C46DF17A0FFAE90922E256BA8EFD09AB4798446904614
          8394E3FF004494E1EEB0A4E1300000003674455874636F6D6D656E7400557365
          72206164642066726F6D2049636F6E2047616C6C65727920687474703A2F2F69
          636F6E67616C2E636F6D2F6E71F42A0000002574455874646174653A63726561
          746500323031312D30382D32315431343A31323A30372D30363A3030B0FC218E
          0000002574455874646174653A6D6F6469667900323031312D30382D32315431
          343A31323A30372D30363A3030C1A199320000001974455874536F6674776172
          650041646F626520496D616765526561647971C9653C0000000049454E44AE42
          6082}
        ShowHint = True
        OnClick = tbAddClientClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlSave: TRzPanel
      Left = 160
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 3
      object imgSave: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Save changes to current window'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D0000074E4944415478DAC5970B50545518C7FF77EFEE8205CB
          1A2C5BA024696AA58E953A252D028E89188602A2A588400FA8CCEC31659998AF
          5432B3199D1E12F6183373D2CC5563547CCF68354E35958E853282ED2E202FDD
          95BB776FDF39F7EEB6C8EE4C59339E99BB77EFB9E77EE777FEDF77BE738EA028
          0AAE671118802008ECBFC1BAC8DEE0556061753EE2A2FFFC7EAD88CCAA8E7EF4
          827A67FD888ABCDDB9283B8F5E79830158E78D65E352E21E1E1805268A475670
          BF55FC5F4679CC21235214C0C6B9FD7427D6EDDAFF8D7371CE6406E10730C756
          D82F1E99331E433E380383A883BB4B46D3E316B477F9B80AD752D8A84D461DE2
          DE77A197518424FBF0F3630390B2760F9A2BB24CD4A4C30F107FD3C29D8EFDCF
          8CC7984FEBE1A9DD0021B504178ACD68BDA2BA83E36BF1E2FF15B8C80859C79E
          4541813942875BAA5AA11CDC80C8B4121C989184F477F7A065D1C4786AE20A02
          B03BBE2D1F87895B1AE0AEAD82602BC6F9D9BDD1D6457D8B0608341C1FB55588
          460D5C053A9D8E7B9A3D77AFA3D8F1F920F864C41805F4ADBE08E550157AA515
          63677E221E5C57430059566AE6FC1BA0C2EED8F1D8584CDDD608F9F7E390FA8D
          C2D9D9B1E89445CC2D2D844E14919A9ACA0DFBC8705E5119E6144F477A7A06EF
          BC7B5D3ABC5E19B985A530E915F4AB6E86E1EC7188FD47E18B9C04647FB0172D
          155701500C38B6168FC5AC6FCEC34831D07E45C61FC537A3DD2B40A7670AE868
          F43EAE02F389729502082820F2770C14325300B8ADEA4F98224474510C6C7CA8
          0F72ABF6B218E809F0795106CA763550100A3CF84ECF4E408706C00C33A35CEE
          E089A9C188A49020E802EE608A300013010CFCA89107A344336BFD84444CABDE
          D713208E00AA6766E0C5BD8DD0D3C0DABB149C22804E9F88F2C20272819EBB80
          A9A004859E8F46F5C89373513E232FC84D32F52D637AE9538826170CE60002BC
          24CAAAB10928FA641F9A42016C989186D76A1D1035805F8A12030AD0E0A87368
          C126040094600582DAF85DC014B8B3BA8103102B96A45951F2696D6880F5D3D3
          B0ECA883672EE6829F8A923400518B6C757E515FBC33F6ECD33A14457502F248
          50B4B63E2F4C066068753D7701CBACF3475B51B62914C022BB636DFE18AC39D1
          C4E72F0338392B0997C80525050F233D2383CB5AF4F43C94164C21B9755C6EAF
          D78B595457323507196C46408D0199664161F973DC05C337AA00B22260EEC838
          CCD972004D0BAF02B010C05B7963F0DE0FCD94C1147410C07785B7A243E21945
          155C09524050D7095501CA7ABA6EB98ABB8235882605467E720ED104E0238027
          EE89C5F35F1E802B14C0CA5C1BAA7F6C0513BC43F2E17821B9801291AC045C0E
          7F520C4E813DEAB47AC61D1D018CFAB89E404801AA2E1A66C64B5B0F85065896
          63C3E65F5AF9871E0AD957475B302EB9D77F5A0B6AEADC587AD48548BD8E0FA4
          E04E33E66F0B03B09800B6FDD6C60158FD15FA42F229FF09C0403F117C251438
          40CEE0182C08075031C986DD67DAF93414A0ED05989FAF7147A083BA04331066
          814DC3CC0126547C1D066041B60DB5673BD4CD0354DF33052436DDFEE5CE4947
          3D93DBB902A206C00694D62F1A8B7784008827805726DA70EC7C270760859603
          E42701D387C73219D448F3475B20FF871D3E369D6CC6967A900BD42A06707F9F
          282CDF7908CE50002F67D9F0FD05158035BE4499E3AB4916FC78B6850CEA6130
          18A137E8B931AF2441A28BE7FCAB5DA4A8B20F4BBE0993B7BB70236536BFCD7B
          6F89C29BF630002F663D809F9C97D58C468D3B49FBADD9F1F8B9BE1DF1B126AC
          7D7B154E1CAEE12F47A464E0D9E75F81B3A503AA8DA0FE15956268520C727738
          1145BE1034370C8DBF01ABEC874303BC909582534D9E40003280CD132DF8B5F1
          126EEB6B424EE604DC71F7686EFCF26537D6BCBD1C750DED08B96D25BB772446
          A360A78B03F80371505C242AED474203CCCBB4A1AE9501280180CFB2E270EA82
          1BFD13A330257B120613804269CE7DD983D5956FA0AEB1332CC0A084283C6A0F
          0610906C8EC4EADD615C303733058DED570201C300364EB0E08CB30BC9D648E4
          4D9E82C1C3EFE369D6ED76A372E5429C7378B4BCDBB30CA06F66EDFA1B809504
          5304D6EC0EA3C0B304E0EA94F888781012C0879916D4B924F4B318919F97AF01
          28F078DC58B96C01EA5D5DA101E8FB646B044A77531006000458A20C78273C80
          0D6D1E89CB27D37549A21DCCB8389CBFE845626F3D0A0AA661D0B051FCBDC7E3
          C18A25AFA281DEF5385D297CA386BEB14694D5341100CB05EA148E896400215C
          605DB8E3D4BC4963CD5D920CFFC9882D4895A93170929BE3A380DCBC3C0CBC6B
          048F6899A6E08AA50BE0E8089D0ED86E319E76FE2F1C6CE30B91FF64643488A8
          DCB4F5A0AB72263B1D05B6E5667AB8DDFAFAD7358AA88F01CF82DA923C6D2007
          A14D3636AC5F5D6EEE6D1664AF8416CBD021CF4C4829F3CAA1133503604BF088
          CF4FF3BBA8CD53A5CD79D4B59AB6CF401D820E26B46AC3425722FB0E8010C2A6
          9BAE66EDCE721B6902061B817F5ED879F0225D17B4BBB7DBE194AE1BE93286F9
          58D23AF76A80AC5DA406F34F0B13CB1364A7DBE9F8BA94BF00AE8B325AE36FBD
          860000003774455874636F6D6D656E74004469736B20736176652066726F6D20
          49636F6E2047616C6C65727920687474703A2F2F69636F6E67616C2E636F6D2F
          A2F2C5F10000002574455874646174653A63726561746500323031312D30382D
          32315431343A31303A35302D30363A3030394EC1590000002574455874646174
          653A6D6F6469667900323031312D30382D32315431343A31303A35302D30363A
          3030481379E50000001974455874536F6674776172650041646F626520496D61
          6765526561647971C9653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgSaveClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlCancel: TRzPanel
      Left = 203
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 4
      object imgCancel: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Cancel changes to current window'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000007184944415478DA9D577B6C537514FEDA8EAD5D297BB3
          0D59642B4224C00820301E1A484C4097108908684402822183315C268A10C54C
          02CCC943C906C8365E4691185163C23F9A48903708C41181C136BA32D6D98D76
          6DB73EFD7EEDBDE5B6EBDCF02627F7F6DEDF7EDF77CEF9CEF99DA93080EB53E0
          6D157060206BE54B037CB90158DBDF3A557F0B7600AB92D2D377BD5E56A68B4B
          4CECBD201000FCFEE03DE0F3059FC5FD6475B5CBD4D4B4F73DA0EC7F13D806AC
          4EC9C8A85C5C5CAC733637C376FB766FF0E02D107A964C979989E43163F0735D
          9DEBBEC9B4F37DE0C32726B01D58933A74E88ED764F03B776282CBA0D124B482
          C4A851F8F9F06197C96CAE20898F064C80E0C504DFB668DD3A5D576323EC77EF
          8616AB548F3D5680F7454237742886188DF8E9E85197B9B5B59C24B6F64B8039
          5F9F969555BE70EDDA4401DE75EF9EB4326A690CC0F03B4913C14808122346E0
          E4D75FBBDADADA365398957D12A0E7A51959599FBC4A70E1B5A3A929042C9B32
          FCB1BC1602547E937E8B4824E5E4E0876FBE71B6B7B76FA43077F72240F0B2CC
          ECEC2D0BD6ACD1D91B1AD04570950CAC56431F17870CDAFD9E1EF8A240948452
          B946CFBF6976B9C8274440989E9A306467E3E4F1E32E8BD55ACA7454850950ED
          EF670D1BB679415151A2EDD62D38EEDF0F02CB04F48306219D1B38E7CE85F6BB
          EFD062B7C31F83400AD7E99F79061EE65D7DEA144CD2BA30898C0C0CE63E274F
          9C70591E3D2A66697C15244065044A3EFF1CD6AB57C3E0410292E769FC23EBA6
          4D08B00FE82E5F86AEAE2E4C420E796A7C3CF42347A2A3AC0C018D06FAEFBF87
          E6975FD0FCE85198808F640D4C47CA534F61DFFEFDD82827561058BF670F9A4E
          9C08794D609984915ED9962F876BC68CE03761DA4B97A0ADAD450B3717E948D5
          E9A067C9D94A4B83E041522498BD6E1DEE7475C1E9F586F5202C77EA5454EDDD
          FB1F0414A6A10D4F4E8673C50AB8274E0C93886724120E1D82C3E984FED967D1
          5552023F890B0095C381A46DDBF0805AB2F17B40910641246FCA14545555C520
          C0FC2A732F979F9A1BE7300DDDCB96C13D61C2631257AE20E1D75F615FBF1E01
          1135B19CE086CF3E83995AB2310A4A60F9396FF26454EFDB174560F7EE300119
          5C4944CD7B0EEBD9BD74293CE3C7879B52C44570FDCE9D30DFBC095B6767A4E7
          0A22C64993507DE0400C02C78F3F6E3AD14404097A397CF468F8162F86273F3F
          9204CB2E91516CB9760DB68E8E0850BFC7033F75204CFC1E450DEC63FA2209EC
          DA85C66FBF8DD4408C0E98C18662183B16AEA2A208021AE65B7BF830EACF9D43
          B7C502AFCD061F23E225B160F845FF926CDCAC593878FA741401864E10086B20
          1A9CCFA94F3F8D240AA8876950B13CA3CF071585892FBEC0F51F7F84875E2B41
          6563D7403E2BEAE0993391044A2A2B7BA7208C4D70D6781243E77EE30DBAAB09
          A643C5AEA862B87D14A8DCF5D414A6EAE041FCC9BD3C6E7704B0FC9C5F50809A
          B367A30854548408C4087F1A6B3C69E64CF42C5C18F45C80ABB9B98639D798CD
          F0B03A7C14A620214C7DFD3A70E408AE32CF1E92F44745217FDA34D432559104
          B66F4723AB203AFCE9E3C6C1307D3A7A162C808A9E6B84F7DC544DD1361C3B06
          1B3BE7B8952B1147125EF60341C0C789485D5F0F35FBCA45361C4142496002D3
          587BE1422481E2AD5BF10F59395A5A22C29F3B7F3EFC0C99F7B9E7429E73B3B8
          EA6A34D043EBDF7F0737D468B5C82F2E8666C912787916080201AB1543E8D01F
          8CAC83A294C1457B1FCF8656C76E1A26C0C368CF08A371E5DC458BB49D0C9F93
          610D0A4B6ACB39F3E64143E57A1966A1F406B6612B3D547AA5613B9EB06103D4
          8C942F351571F4FE2AC1ED7448099E4B2D75B9DD81538D8DAA8D4A572B78460F
          CFCB5B35B7B050DB4121D93988F8BABBE1652F0FB07E47B1EC92737371B3A606
          D61B3762AA5BC3C36AF2962DD01A0C385F5E0EBBC914FEAE66EAF2189D0E97CB
          FF5B73B3E85233399CDC8C1E487666A6A5BD5338678EAE8D39B27326903710CA
          8F4F4B03C79A5EC0D191502724A05B7442199CC23512DCE270F87F6F6EB6B881
          82CDC0BD5E139144A232332565F54BB367EB2CCC938D0369AC7A8E051ECB3404
          CF63153DB0D97C674D2633DF4DA7E7A6708923C6C5B9B0223D39B9A8F0F9E775
          16CE089D54FA93020B8BE3516E2478534787F782D97C8FC7D54CFE93D0A6C4EA
          732C2F6724862525AD7E79C60C5D1B85D929E573A0E08338A018796EDCB658BC
          975B5B6F5F015EE451D7128DD317013DCDF001F0B1D16078ABB0A040DBFAD75F
          E85428FA3FC1A9819104AF7FF8D07BF1E1C35B35C09B4D21CFED349B2CABBE08
          887706D94A810DA3070F5EF2CA0B2F24A844BB1533A0D4F11065F23BB1E67263
          A3E782C552CFC9B3A41D68578077F64720A879DA10DA6061EF725C4F0756E009
          2E27709EB37719513BF8D381D0DD2665B17F0D2888686522D273BC6483686AC5
          1E62632FCD2D9953F2BA8BD61D0D3C5002B1D6AB256232B80A9105E2C363ADF6
          7BFD0B0B77355D7451F8D70000003674455874636F6D6D656E740053746F7020
          67746B2066726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F
          6E67616C2E636F6D2FFBE22F6A0000002574455874646174653A637265617465
          00323031312D30382D32315431333A32303A30332D30363A3030A4D7B5F90000
          002574455874646174653A6D6F6469667900323031312D30382D32315431333A
          32303A30332D30363A3030D58A0D450000000049454E44AE426082}
        ShowHint = True
        OnClick = imgCancelClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlNewLoan: TRzPanel
      Left = 60
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 5
      object imgNewLoan: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Add loan'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000A3B69434350696363000078DA9D53775893F7
          163EDFF7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C5
          85880A561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1F
          DCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A00395285
          3C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74
          B03FFC01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01
          905200C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4
          493E0500D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C
          02C0C200A0AC40222E04C0AE018059B632470280BD0500768E58900F40600080
          99422CCC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB
          95CD974BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C97
          9B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE
          6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA9
          5B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A
          0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099AD
          C0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C
          2C158AF15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D
          00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010
          67343279F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC60800
          0044A0812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206
          E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C
          81EB70170660189EC218BC86090441C8081361213A8811628ED822CE0817998E
          04226148349280A420E988145122C5C872A402A9426A915D4823F22D7214398D
          5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D1
          74340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E66
          8CD9615C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF
          0824028B8013EC085E8410C26C82909047584C5843A825EC23B412BA08570983
          8431C2272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E
          135F9348240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C
          26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09
          A22452A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496D
          A076502F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA
          09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19
          A718B7192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591
          CA12953A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B3
          50E3A909D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630D
          B2868546A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D62
          5BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F0
          39D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72
          ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3E
          D363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690
          196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B8
          26EE8767E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE
          29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDB
          FC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7
          AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2
          148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C12
          1DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF3
          3517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB
          9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39D
          A79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B
          603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC
          9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F04
          9904A50735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC67
          2C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB6
          0888E0476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE4
          59FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB88178
          87F845F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463
          AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F18
          4FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B
          7D43FA68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D
          39949C949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CA
          F7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD48
          5AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB1623
          8B5317772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E
          5283D2A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B56
          7F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB
          48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A
          6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADAB
          B7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2
          EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDC
          AFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127
          DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA0
          3DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9
          E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774
          EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148
          AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79
          BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDA
          FDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387
          E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF
          79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723
          C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7
          A7D04FF73EE77CFEFC2FF784F3FB1FC7A9DB00000006624B474400FF00FF00FF
          A0BDA793000000097048597300000048000000480046C96B3E00000009767041
          6700000020000000200087FA9C9D000004594944415478DAED977F4C5B5514C7
          CF7BFDA161089806890289F10F0AD80862742C21F24681C5C4540D61FC0AD052
          329833D3610B0C28911102C41997E11244972DFBC7681C8B4B8CB1D8AE38A0E5
          0F068C0D8138B798608204423BB6D25FD4736FE90B4FC455A49B7FF84D4EDE7D
          7DF7DDF379F79C7BEE2DE3F7FBE1518AF91FE03F01909393F33CCBB22A8661F2
          C3E90C7D19D7D7D72F9BCDE69B0280DCDCDCE3EDEDEDCAB8B838653867646161
          C1DCDADAFA03AA530090979777A5B7B797F3F97CE0743A0129C302E0F57AA1A9
          A9C9323030B07F0B404F4F0F37373707F3F3F3E076BBC30220954AA1BFBFDFB2
          39143C40575717373A3A0A191919909A9A1A1680A01617174D35353526120A1E
          A0B3B3931B1A1A82AAAAAAB03A0FAAA0A080868207E8E8E81000D8EDF66D5F8E
          8E8E06A3D10829292990989808E3E3E3E4AB203F3F3FA477890A0B0B8500B80A
          B8E1E161D06834B483C3E1D87690A8A828989898A04E93939329040E06B1B1B1
          909E9EFEC077898A8A8A84006D6D6DDCC8C8080F106E1517176F052033A056AB
          1F0A406969A910000BC4439D81B2B23221404B4B0B67B55A053380CB8454497A
          2522EDED9E915C4848480819A0BCBC5C08D0DCDC4C012A2B2B431EC4643251C7
          F1F1F1B480CDCCCC8052A9A4CF2CD6AFE0DA8DEF05FD33140780DB7790B6D18F
          10004BE41680C9C949484B4BA38E820387AA8F3FD742EDD109F0FA03655DCCB0
          D07B3A1D8E559FA5F738D34280C6C6460A5051511192032CA32093C928206913
          C9E572989D9D25BB2B184EBE01DA863BE0F0FAE8B328B108BEF96C2FBC5BD547
          EFB55AAD10A0A1A1E12F018283079D85AAD3E70EC17E8D15965C0100D96322B8
          726E1F1CD50400AAABAB85007ABD9EB3D96C2439427240624E36AFA4A4249A03
          7D174E80DDF933B83D2E70BB5CB4CF41FD6D0180190182BA7EF3EA8A5FE46CE3
          01743A1D05C0E5C177B2582CF4CB97969680E3B8BF053A73E1301C3936C5C7DC
          E1F1C16FF73D60F70400A225227826420251780DE644EDDB0B161EA0AEAE8EEE
          8625252521CDC0E0E020646767D32B91EDA73E50EB6EF131F722C77D9F1F3C1B
          670B09CB42848801310B7C4E9CD0AD58186CB398E167EBEBEBD5A410A9542A08
          9E8AA6A7A761797919B2B2B2806C54E4BA9DCEF7D7C18143E3FC943F482424A7
          1AEF528088CCCC4CADC16068191B1B7B0ADBB09363D9D7031F80EA9D1B3B0290
          4546462A702BEDC6AF7F11772BE94E00A67F31C3ED799BE037E5915941084C67
          E4780663010FBF70E7D7A94012E2B327D19E53281455B8345EC6EDF4253C21B3
          FF98E04FFAE2DBE3905F735D9084C64F5F80D2D7BB60757575AABBBBFB3226B9
          8186002D1E4D8EEBFCCD989898BDD866FE2D803876F4D9F74E4AF66C5E86A774
          9E7B9EDF5FB985875FEBDADADA9718F2ABC491182D06ED69B43DBBE19CE8D502
          F844FFD113199B013E7CFFEEB51F2FC261BCBD87B688B6C26C3894A03DBE01B3
          2B00596F41AD5402AF6DFECDED81EF862E412F360915A9562E5A0718921501ED
          8AF310E5277AE4FF0DFF0088676B842717CD8C0000003674455874636F6D6D65
          6E7400416464206E6577732066726F6D2049636F6E2047616C6C657279206874
          74703A2F2F69636F6E67616C2E636F6D2F09FDE6130000002574455874646174
          653A63726561746500323031312D30382D32315431323A31373A34332D30363A
          303086351FFE0000002574455874646174653A6D6F6469667900323031312D30
          382D32315431323A31373A34332D30363A3030F768A7420000000049454E44AE
          426082}
        ShowHint = True
        OnClick = tbNewLoanClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlGroups: TRzPanel
      Left = 260
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 6
      object imgGroups: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Groups'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000002024944415478DA63FCFFFF3FC34002469003727373C1
          AE983C7932E3C87400A5E0FA048B3E209582263C47B3E044115D1C70B5D7FC93
          76DA2C5E863F1F21022CFC0C5767A57D063942BBF8245E4750250A2E779A7ED2
          F5B7E765F874116424C33F36B9FF4C52FE8C97E7377DC6A36D8E6EF9E922AA38
          E062ABF1277D47215E86378780F63333FC6316FECF246AC5C820E1CDC0C0A980
          A981959FE1E294A4CFFAD567F9A81205E71A0C3E19398AF232BC06398009EC08
          06165E06062E39A063F8FF83428581E13F90FCCFC8C8040C211E9DFF1736EF7B
          61D470418A2A0E385DA5FBC9D4518297E1E521701430300231D0DCFF603633C4
          51FF41BCBF60F5FFC5EC18CEEC7FFAC1B4EDB220D62820957FA254FB9385A314
          2FC3F3435027416312E41090E5D01060F8FF0F222E69C77062DF93CF16DD57F9
          A8E280A3F91A9FAC1D6579199E1E420B1BF424050D6D693B86A3FB1F7FB69E78
          833A69E050A6EA273B47055E86C78788D3206BC77068FF83CF76D36F53C701FB
          53943E393A2AF3323C22D20172760CFBF7DFFDEC38E71E1F55B2E1DE04854FCE
          8EAABC0C0F887480821DC3DEFDB73F3B2F7840BC03806A50F840B570F6EE1839
          6C45312130C775C9A322A2A3009F03280183C3019446C1D077003160503B80E2
          0609A551409706093E0750DC20A1340A867E8384D2EA78E837482805A30D128A
          1B2494028A1B2494024A1A2400B765EFD0975369180000003674455874636F6D
          6D656E740043617465676F72792066726F6D2049636F6E2047616C6C65727920
          687474703A2F2F69636F6E67616C2E636F6D2F49708D33000000257445587464
          6174653A63726561746500323031312D30382D32315431323A31353A31322D30
          363A30306C57CA130000002574455874646174653A6D6F646966790032303131
          2D30382D32315431323A31353A31322D30363A30301D0A72AF00000019744558
          74536F6674776172650041646F626520496D616765526561647971C9653C0000
          000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgGroupsClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlEmployer: TRzPanel
      Left = 303
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 7
      object imgEmployer: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Employer list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000008894944415478DAB5576B5094D7197EF6BECB4D81DDC5
          70D18046048C49ED4C1CC3D8C44B15C524421CD36270F136E3B415D380B109A8
          8820A290584D5A0D890A2893A417A385A4265AADA98E4E93B6DA511467944B45
          F6C6B2F7FB6EDFF37D0B0AB86A7EE4CC9CD93D673FBEF33CEFFBBCCF7B100010
          8FDBD6F6B9C32FC8F5FA030806F1830E8100908884881005DBFAB6E62EA125A2
          63B67C61316F5BF8C39E3C628CD9FA252C958B62180095A2AC55E7A8CAC5BF06
          F81F8582D17F301819C64024A667844020C0EFB3BDC75DFBFDC0B3314044791B
          9CD58BD5EC28B5FC9D56ADB33A17572CF472113D2C1A0D20E0E75FC07EFFEB91
          C3B018F518A35463F14A0D5A0F35C26CD03D721D1DAF42CEEB45C88A0014656D
          70ED589C300CC04D2770B0A60262B198877D1F7DBFCF87556F5770EC9BEBEB20
          9149E1F37AB1EAAD121CDC550FB144F2C8B5C7ED41614929D2246100743979F6
          2C5CA35210E0A3C0001C6F6A84C96840AC5285A5AB56E08F079B6032E81FB91E
          1BAFC4128D0649E23000B4EE7B790EA70106404620E903FED06419138E588B1E
          B0F6D1F4D08652140680C5CFB37F900803211052FAED68CB9FD0DF6F844A3D0E
          9A652FE3F0A7C7A0BF7B07B1B1B1D06896A3F170130C7A1D942A3534452B86D6
          711491D749132481E1006404C0450018C2ED15DB4803128A8280A630148E2009
          3088CD65BFC1957F9E45C386C580D70E01F10A525E2451B150CF2A842C2103BF
          5EBF0EBBEBDE858472EE250D6C2C7D7368EDF678B069630947484E00DC23013C
          6A5C3ED78AFDEB5FC2A4A989484E55D1E122586D4EF4761A48E516A42E5887F5
          5BF7A0A9F908B45A2DD46A8AC08A4234353543ABD341A552A148B3623480C114
          DC3F6E7E770607DF2E80B1AF8F2F4D7A52405FD449B1F8D1734F910822A93224
          B09A1DE8D71B71A7B307028A52ED59F36319D1700D94110032A2EBED57219246
          A0FDDC9FD1F65E2926658E43729A9A322082CDEEC6DD6E13CC660F329E4E4152
          DA24047C5258CC56E8FB74E8EBBA0597C500D52E3D5E4B34C2EBF3F3A2A5131A
          3B44284AF7C3CBB6827E4CC99C0A051991AB7A08401B015884DB37AF434AF9AC
          CB9F0075720C32A6A5412889A6FC13530B31D5F5A3B7FB2E294280B92FE7C068
          F0A0FDEA0D38EC76280456B84D5A8CAB37E267490C808F0320260D357608A199
          1C8037C0B414C0C4F44C02F00501C8E50190156B991557B775401E138FAE6225
          7E3C3B1DB1EA640230864A404E00424CBBBBE02643914647212D7D2216E6CD86
          A9DF86BD15EF433521154F949C81DB6686CF1F8A80904541003F9590CF4F8646
          20CA5FCA18B4E2E129E8241F90C980AA670498F1D34CC4C42593E3293130E0C3
          F56B1D1C53B9C04E79B7626FEB01D8FB8CB011300FB1DD57B90FD98565E899B0
          14F9D94954017CAEC5A49FCF4EB763D9DC0C2E05AC94531518918290087B0880
          9400EC5F360D92A00EDEA00C56AB17E953D3B1307F0E31B5634FC5EF31E9A904
          6CAC2EA5DAEE87C3E184D7E346E36F0F61E6CFDF414F4A1EF2678DBF07801CEB
          B35304601E01E0B382F18A304664F0B35E0D9C3D540FFBF54F51B07913603213
          4B1BEC563BB9980F7B2AF763DE82E731736E36CC0303703A5C9412172E7D7D1E
          F3CB8EE3AB0E375E7B31152109701168210005F3421160ED571CA60A7E77B21D
          62A902BA531F406968C3BA2D6FC1D24F00E87097CB4DAC3C38BCAF05337F3203
          335E9C0EEB80150EA70B76B319274F5C44EAC63308BA2C9C01F9FD8190068454
          C6A401CABF2FC02E3C41FC2227EBC12970B13E40B3AFBB1B276B9660E59B6B60
          32117BCABD9B00B8DD6E5C3AF31DE21313316DFA24188C264ACB00FE71E65BBC
          90578C0505BFC4916F6EA160561A3CA17A673DA3F96FED289C431118F4807056
          EC051F2229CDDD9A6C14FD2A171E4F80C4E780D3E986C36AC3579F5F40C9071F
          A3FD9B66E8B554156454AA8C1C5CBCE1855C2A46CA8C57A09997C5D93A099ECA
          907C8044A861220CF204593F19E684836578FFF8FBB146F45EFE03A6CF7C9A1A
          8F852AC18CF3E7FE8DEE7E05B67DD486D49404ECACDF87E20DEB71EDDA55BC57
          5BC33532892C125B3697E3C9092943EF6A3A7D0D2BE6660E7BFFB0328CDEFAA5
          D65291C3B75D9F17DB77D4202094A2746536DA2F7C02BDCE002D314DC85A848B
          1D01789C3694D321070E1CC0FAE26254576D47D7ED5B888C8C8694A260206B5E
          B37A255E983D27AC1587EE841C00D5D8F2BF7C6D97463F33D67A07337B4F2386
          D4E0F505B0B376373149464DDD5E6C78A318EDC4F4DD5D3BB9BE101F1F0F7542
          02F25F7D1555959574B01489492990CBE5888D8BC5E56F2FE154D473E8193311
          A2800F02121F4BAF30742B96BB07CEEB6A0BF21800BA22E2C9B9B39E2FC8C8C8
          DAA4888A82DDE5A1FAB760F2E4C9282F2F476D5D3D017803355555E8ECBC8528
          622A97338FB0219A1CD1643251F8855044441210197D1741153F16B7AFFE27B8
          BFF99345F47EEF88003089186876739A589A9FB7F689C4C4F7B3A63D0B0385DB
          E9A2167BA78794EF42D58E1D387EE204E6CF9F8F1DDBB79351C9424C1574E188
          C77FAF5CE69E637708B148822078BF4FA0567CF77F9DF8F0E0E1297486690400
          160C56744E0640B17AF56AC7E4F42930188C54AF7E52BE9B0CC6CE7D9F929989
          B8B838CAAB1E1D376E504D8B8698B2EF4A653CED5FA74305A1EBB7804C2840FF
          6C44C3E5B0A2E1A38F13E80C5D382D30007104C09894341E3A9D960B25BB0DF9
          7CCC4CBCDC4D883516311D26E44C45CCB16586C2334DC09DDE6E582C76EE7551
          5111B0D9ECDC0D2822428E868686470250AF5DB3462B8B88E21A8B582CE40E1D
          1CACB482742566D7B34000F7EDDFC7D4690F5D6405A1E8F29F76BBE3FCD1A347
          F368A17F3880B56BB50EF27466A14C5C2E12217B21EB5C126A0EFC1EB362FFD0
          FE03982E1C21B621A1D1B43E0C806AF9F2E5C7222323B2F9E5E8C1C22D187557
          BFC794805C68696929A28579C4039CD04260C20288A6399EA612BC757FDFF158
          4C1F06801DCAFA831CE142F0F0F1584CC38DFF03C1725A4B417A126600000040
          74455874636F6D6D656E7400526174652070617274696369706174696F6E2066
          726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F6E67616C2E
          636F6D2FE0373B110000002574455874646174653A6372656174650032303131
          2D30382D32315431343A31323A30392D30363A3030E0C35AD300000025744558
          74646174653A6D6F6469667900323031312D30382D32315431343A31323A3039
          2D30363A3030919EE26F0000001974455874536F6674776172650041646F6265
          20496D616765526561647971C9653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = tbEmployerClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlBank: TRzPanel
      Left = 346
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 8
      object imgBanks: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Banks'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000006BC4944415478DAED576D509455147E58966577D92F58
          0502CC4AC54C4D2ABF4DA2B11F216B426E6AD16061F81146426298247EA1D41A
          A3885F61A0A4998686895238E004D594D6A4D927235A38886FA62CBBCBEEC22E
          4BE7DE775999FAD14C8CF5A3EECC3BCBFB3EF79EF39C73EF79CEC5AFA7A707FF
          E6F0FB9FC0FF04BCBFD2F5EBD75748249299FF0421F271343737D7487FBA1901
          695E5EDEFB31313186C8C84891959F5FEFC43F33EE07D6FBDD62B1A0A1A1A16A
          CD9A35496C859A0858E2E3E3D947D8ED76747676F289818181080A0AF219E8E8
          E880D3E9FCDB18232093C9C07C555757830868188181948E5F0D06036A6B6BD1
          DDDDCD1705040440AD52A1C76BC46AB5C2E57271A3FDC1140A05264C988063C7
          8E213F3F3F941108CDC9C911929292505353037F7F7FC8E572043123C4984760
          B3F9A2EB0FA6A4ACB0001FB8FF7E545656A2A0A0208C13C8CECE16663D6E44DD
          A95A4A9D126AB51A6208A0086CE864E9F31AE98D8E0D1B3960DBC58CC828ED2A
          C2E0756E25AC8BB01EEF96B0751EC23C4460F4BD6370E4C861984C2691405656
          96307BCE6C9C397D0603F4C1BEC364B559E94C38D1EDF1D0DE0542AB55C35F22
          0183CD660B1C444C422F414A051157C1DDEDE198DDDEE125E60729ED3973CEE6
          310237DADA306EDC78BC77E8100A0B0B4502191919427272327EB97411CFE51F
          C1A821E1B0D81C68B96E83F1A1688C1F190515399049FDF1F2B68FC89007CBE7
          8E83CBDD4D512BB174CB49243F1A836963EFE2273C63F3496C79E1612C2D3E85
          F2BC27D0E1ECC4863DF518A0962169EA104C9E3C05FBF6EF435151914860497A
          BA90929282969666CC5F5B81DD2B1F83C3E144C3D9CB38DBF41B96CF8B8387B2
          F0ED0501951F9FA7E8BA9114370CD1B70F843E2418A96B2AA0520420DD381E03
          3501C8DC5A87DDAF18B060E37194AE7A0279BB6A10AA53C0F870341C9D2E4C18
          3F116FBF5D8EE2E26291C0A2458B84F9F35321B45E414ADE01244C1906BBC385
          2F7FB802E32331881B3B94EFF3E6773E46F4201DA5DE8DE66B36643D1DC7539B
          F2EA3B889F128D6F1A5BF1CA330FE27953350E6F9A87D9CBCB31244A8F36AB03
          B9F4BDC3D1057FCAE2E851A3505A5A869D3B778A04D2D2D284050B17E2E28546
          2C2E388A65C993E1F24870FAFB169C6B6CC1DEB54FE162B3809C6D1FA2382B1E
          DDF0C78B8555D89663446848108CCBF650C433B0B6B40163A26F43F5678DA82C
          4C4562E65B98F9D008D47CD184C4D8E19874EF60042A94888888C4EE92129494
          94880452535385F425E9F8F187EF90FE7A150E6C78922A418BCB576FE0F9FC43
          D8B76E2E0E9D3C8B139F36F283C4068B3C6EEC303C3BE33E3CB9F25DECCE9D89
          5FCD4E98F6D6C3EEECC2075B17227EF176BCB5EA717CFD630BDEACFC0AF94B0C
          081FA041686818766CDF8EB2B2329100EDBFB034339313485B7F04638647F15A
          FEF6422B62EFBB03CF3EF600320B8F2339611C12A68EE6A5F5C5379750505683
          CD5909B4E67D1CD8F834B41A2D8ED79FC7AE8A4F50619A87A497F660EF6A2302
          A97C4B8F7E859F2EB5A268C55C84E807A068CB669497978B04A80284ACEC6CFC
          DC74017A7D082F433F891FDADBDB61B775D0BB84044A8290103D2FC92EB71B2E
          3AD9569B05B20019DFD720152B517F22E781ABB30B16AB85DB61E5ABD66A0913
          4BFBFAF5360C193A146F984CD8BF7FBF4860CE9C3942CE8A1504DEF0A5B7DDD2
          0E2755829B84638621816B822250EED5071BD41A0DDC24B16C9E5C2627525D08
          0F0B231BD7491754A83D5547D22B23EDD0FA7A020BC8E17060E4C87BB071C306
          1C3C785024306BD62C21376F35CC24126CB49BCD3E09552A959834692297D0E6
          E666AE6E61E1E1089006E0EAD5AB50A955DC38139EA8A8288E3735355156A4E8
          72B96F3AEF6373C43D23B16EF52A541C3E2C12484C4C14D6E5E7D3A476B499DB
          78E45CBF1572E8B43A9C3B7F0E726FF40CB33BECDC68446404A412298FDE66B1
          E1DA6FD778C3D1EBF51831FC6E5F4332B79B7D3615A49A83070FC6AB2B57B27E
          201298613008AF9936E1178A90A5A8B779E8743A714B487ECDDE087A7B423061
          BD4DC7DC273A76E07494F6DEDEDF17E3EB4242A02169CE599E8D6355552281E9
          D3A70B45C5C568FCA9912B9E5C494634371DB0F431DD6793E51401CB4A8FC7E3
          73FE47CCD307F339F7DA64DFD51A35966664E0C489139CC0C069D3A655A42D58
          101B1135080A39351D5D3077C0DAA1D97C8352EEE40B95CC417F300A8835B333
          A73F47C99B25F5757575467E23A2E7CED8D8D81DD4362733039E3E572A5E927D
          AE5A3DFDC4588575B95C9FD5D7D72FA6D74BFC4E484F303DB7797FA5B8B58395
          062BB756F6EBBB15B303CAB60A376FCAB76AB054B083C14EBBFB563BFBCBF1EF
          FF63F29F27F03BCA3862CC82C7A0A40000003774455874636F6D6D656E740042
          616E6B20636172642066726F6D2049636F6E2047616C6C65727920687474703A
          2F2F69636F6E67616C2E636F6D2FAE7278BA0000002574455874646174653A63
          726561746500323031312D30382D32315431343A31323A31312D30363A30301F
          86142A0000002574455874646174653A6D6F6469667900323031312D30382D32
          315431343A31323A31312D30363A30306EDBAC960000001974455874536F6674
          776172650041646F626520496D616765526561647971C9653C0000000049454E
          44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = tbBanksClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlDesignationList: TRzPanel
      Left = 389
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 9
      object imgDesignationList: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Designation list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005234944415478DAAD976D4C536714C7CFBDB4A51418D6
          F1EEB6C4F1C5194396F18588930F285A0889B065261843025A2A630BE1455802
          A514C8CA6B0843846A498891C46503320275281F6083F005B310E3FA8599B917
          282255C152A4BD77E769B97D7F21CBBDCDE9BDF7C9EF3CF7FF9CFB9CF33C9782
          D08740D60EE33616726D0C001B04A4D0C268340A26F5D7E102DE5A43754E1D40
          4074761BBC1E2EBE056FADA800E820280322010D45435761BA16DEC1862D3E04
          C46569607DB0A81BA61F57DA1DFC39B1FB967DA21B4A872B61A60EE2F1F6391F
          02E2CF7C0BC6CECB15B0F8470F50541001F897FE610554DFE98187DF400236AD
          F322E02C0A505ECA87276B63411D8888E389F9A0BE3B060FF81490AD01636561
          1AFCF56AC9F1944021C0F6F763D2A07B6409A6EB7814206B03E3D5A258D8B26C
          78A601053EF7D1E258B835BC01FA5AFE04C465A9604C28810C96711BB09B27E5
          2682C224D933C3FC8C0AF281A749188DF6015A2C9AC0AD5D58256FD17769EB65
          78BDE7D64E721F4305CF80A734240F8D40137BF1D28AF21A434F5FC731BC36B9
          B5937858D076E07F1622517979F9AEBD27ECCA9176349EDD2B001BA42BD67576
          EBBDB7B7371C4F6F0F22405A5656B6D9DFDF9FE6155AEF4382DC2272E9786D0E
          C20971404B7D7D7D87BD22E5218052ABD5E9369B6DCF603088626262E6575656
          CE2527275B452251B84EA77BE467D844A801051CF3D7B13BA750280C0303037E
          B3820810B6B6B61AF1E15286714C73126E96753C8FA6EDB5FF27A55279B1B9B9
          F97B6CCFE338F78370E837D1D0D0F005C7B1FB6943E18F253FD6C94D22675FAC
          888043387A53A9A20CAC56DF392310086070A01F50C011E4FEE1386E7E70E740
          5C90FEEC8B151110AF52A98CF2D26BF0DBF2B2C7A42031F8383515B483370199
          E3684F78E4EC8B955340C91539ACAC3CB58F862B71647429294741775B4B1C52
          D19679E4EC73C229A0B8E40AACAD197D429698980043BADBCE8E79E43C0594C8
          4BE1A5C9E45C6BB8F321A91474DA41D7C8F8E35C029AD54DC6B22FBF02CB8ED9
          1E26CE83844F1C2181FE1BDF4183B23115B9653EB81BC829958D4E0171EABAAA
          B148494406C3B0B8A9A2804192464F1ABD689A8237E69D39A5A64B81DC0072A7
          BD39926414A6D7B6D932D7A4E9503421171580C30EE1B57977BE45D39ECF4D42
          EFC546582BBFAC6FD3DEE116196E7121C546CA23F78C4B430249628B35E9CCAE
          C5BABBBA22283C11FFF3C8E3F573E14929563A5C2CD818AA5B04471D1705E228
          71A4E885AE66211407C86D3A3833578884EFB5DC37EE31AC946149C830F01832
          CAFE0AF00EAF8534B5FE77FDF9A3C83D452EDE9BC320E3569C8630D636FE6F63
          6E21727F22171788A359DBE46A63AEAB1226A8F5A6EECF33C1C6303E85230CDF
          59E50FB3B0F3CBBD8C884F2FCE87E22C0BA327C5270B16427146A5CC5509E39A
          A68C5DE8A09A35026EEB9D69433E0354990950850E6F463BCF4416543F0CC98D
          7765455EA89A09C53D6FCC7155C27814509F770A7EFCFD95FDCB8673205F429F
          7D14032D13BFC2F668C7D9A8829A077C71EB8D39AE3A400454CB4EC1A33533BE
          73970366117C9228814E3D763CD6951D955F351D92DB17108AF31090A8D61BAB
          7332616367CFE79DC54608A1730A437B5F9B17795E3E118ADB9EBA991B95736D
          3214B7A694B90A5152EDC81844493318D677AB45B200B636E756DB2F95275DBF
          DB07D1874F07E16691FBFA887A728EA1E89880DCB6697EB5AD306021F23E48E1
          7881F692640CDABB41385260B6F61929F8DFF2F92D44FE76BDEE91B3EC5731E1
          0138F200B2011581FFC363D7FC1F8BD6474EF24FED9C0000004074455874636F
          6D6D656E74004F7267616E69736174696F6E2063686172742066726F6D204963
          6F6E2047616C6C65727920687474703A2F2F69636F6E67616C2E636F6D2F7CB1
          1C1E0000002574455874646174653A63726561746500323031312D30382D3231
          5431343A31303A35352D30363A30306B76EEFE0000002574455874646174653A
          6D6F6469667900323031312D30382D32315431343A31303A35352D30363A3030
          1A2B56420000001974455874536F6674776172650041646F626520496D616765
          526561647971C9653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = tbDesignationListClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlCompetitor: TRzPanel
      Left = 432
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 10
      object imgCompetitor: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Competitor list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000003E04944415478DAC5975B4F1B4714C7FF7BB1D7E00BE0
          6043409092A455BF43FBD08754AD543537458A220498373E1279E2A64849A4A4
          51A5E4A1AAAA7C8D2A49DD82B8D8102036C67BDF9C33DE5D4C335515E225C71A
          8F77B5DEF39BFFFCCFCCAE02405F595979A628CA4FBEEF23080224199407AAAA
          729EE773737337153A975F5D5D6DCCCCCC249AF8DFB1B6B686D9D9D902039496
          9797EB4483EADFEB44986C621678EA8B4990EAA8542A654E575E5A5AAAD101FE
          59DF1012290951F0F472BB3439011A34E6E7E7474E01AC6F6CD2FC242B81EF07
          989C1897036C6C6E414D780E7C5260627C4C0EB0B9B51DCBCFDFDD2C3C77BDA8
          0F9E82F1B18B7280ADED9D1840570183BE34EA3D1FB0DC005E8033FBC31723E8
          7860ECE2A81C6067A7D6A9533ADBA72B987E5843F5AD8DA90B693CB8370ADB57
          A0EB29A89A16CB1284A3EA8E0EE389997DCF83ED38F0A8E76B474747E400B55A
          3D06C8A5555C7F7C80FE94826327C0AF778BB0030D3FDFB8857CA1808C61C030
          32D40C643206D2F45B25B92CD384695970A8716FB6DB68369BF8E5E9133804C1
          8BDDC848590E50AFEF9E28905231FD600B7FEDDBB85C2405A6C784021A29A0FD
          9F02A10C91023C72A74B8172B92407D87DBBC7C2891B684461D034F4CA03D11A
          C09FD2856139C0DEFE3EA2DB731E3554834A5798A817DB04DF62B8589403EC1F
          1CC412460AE8D4BB44D02B05388A4343728083C3437141E481BBCBEB78BD67E1
          EAB081479549F2800A3D9512BB59F7983A1516482B40540119CFB66DE1018EA1
          C14139C0E1BB460C903354FCB0B28D2C81B41C1FBF55C884818E6BDFFF28AAA0
          2F63880A30A26AA0632E4F93AAC022F7DBA645BD298EB90A5EBC782E4A916907
          070A728046A3794A813B4B55BCD9B570A564E0C9FC14AC50012D5420E8522036
          88A2C455F05F0A140A793940B379F481077873F27BEC817C3E2707383A6AC57F
          48AA0A3872B9AC1CA0D53AFE400168D468E83635D7FF0405FCCE1AC091CDF6CB
          018ECDB698581E758696E29B8BAFF07AD7C4D55206CF16BE8213EE051F8BC069
          1DC7861B7AA03FD3270768937B5967F69891D6706DB18AACA1A16579F87DE132
          EB826FBEFD0EF98101F4451540EEE77D81F702ADBB0AAC4EDF6E731534F0F2E5
          1FC2880CC3FF9502880B1880CEA6A80A6EDFFF13AFEA16BE2C1B78BAF0359991
          4DA99D690A3CCF85E77AC25CE9745A0EC01B0603F0499DE65ED194D011347BE4
          01DE13CEFAD41A55017B2845A52C05705DF764458B7275F2F7EC898801745D97
          0344DB6592C100EC1529C079BE194901CE334E01D0AB59ED33BD9AC5006FA8CF
          459B45D2113ED21D11C0150618A436456D08F8E845EEACC146E3A79F2A274C51
          CB524B9F53F2286C6AADF767509ACCC1B317680000004474455874636F6D6D65
          6E74005465787420646664662062756C6C657473206C6973742066726F6D2049
          636F6E2047616C6C65727920687474703A2F2F69636F6E67616C2E636F6D2FA8
          42AD600000002574455874646174653A63726561746500323031312D30382D32
          315431343A31303A32322D30363A3030A414D969000000257445587464617465
          3A6D6F6469667900323031312D30382D32315431343A31303A32322D30363A30
          30D54961D50000001974455874536F6674776172650041646F626520496D6167
          65526561647971C9653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = tbCompetitorClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlLoanClass: TRzPanel
      Left = 575
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 11
      object imgLoanClass: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan class'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D0000077B4944415478DAAD976B705C6519C7FFE7BA7BB24976
          B309B934A5692EA660A9ED48A5021DC12233A074EC7829B5333AA3B60515D171
          143FD8D2A90ED2F18382CAD0998C422D569C307EB07E5067B0AD117A51B4306D
          A8A52D97246DB74BB2C9DECEFD1CFFEF391B890C2424F6EC3CB33B67CFFB3EBF
          F7B91F290C434C5F9224E13D5ECAEA5FBCB42769185B14AE09E27BB6559ADAF6
          F76DD73FC5DFC15C1B4CEB951600A0DDB8EFDFA3A9A4DE9AD06428B204B9B6CE
          0F42B85E8072B9F4F0C4F997770FEFDA58BCD200F2871E3DB42DD3D9F5785D42
          85A129501529828800B857E087B03C1FA6ED63A250DC7DECCB1FD82EFEBA5200
          C6DABDA74E34651AFAEB933180A6D20A6A6C859016F008E0D00AA6EBA36A7B98
          AA3A970E6FEA5BC2B5EE9500C8DCF2AB93479A9BD3D734D6690450A113405364
          4C2F0D10C27603B894AAE3A16C792856EDDCB31BFBAE9E09B15080ECBAFDC327
          5BB3E98E0643837083B080880522441002C0F5680502980488AC607AC8E7C79F
          78FE4BABB64EBB63A1002D1F1B7C3D7F555A432301EA29099E5E25842AC70062
          3B118CC20D9613BBA164BA98AC3A38F1CBDDED170EECC9FD3F00ADB70C5EC875
          A6156452024025808803891004A86DE50774012122005AA1542540C545EE62EE
          C923DB560B2B780B0658F3BB4AAE3B13229B52222BE8CC025D052DC05389F417
          FB515CDFA715E802CB8F2C305571909BACDA8737F7B7709FF27C00A433FB96DF
          904AE266A75ACD6E18BFEF7B7D699F003252BA8CA4D184BAE65550F506C8E95E
          411189CF54B41D3B0E449A7F8200F9490B0737F55EC527DE9C0B407A79EFFBD7
          641AB587F5847AABC47453E8EB463DC4C6A10AACD047739D847A0D7401A0CB1E
          B4D043E85990B36BA1B67E1C4AE766D8A106D3ACD002360A651B97264D1CBABB
          B78DFB5F9E0D401919BC6E4F5D7D628BA42A88847E5668E314FDFCE08B2E8E15
          02B4A724342463F31B84D0180092EFF1F40E93CD82F8896B1F879DB915E54A11
          85924980EA9C00CAB9A757FC2893D6BF2533C76300F1CD34E36F11F1A726037C
          F5980311884D868404A10C0A8D04550A08C144F41C389609B73C0EBFEFC7B0B2
          7761A23889CB04383807406AFCC0CAB294D011014410359028DDA8909AB60CD9
          18B543B4D5C9307401E66372E222421EDBD013686B6A814BFF5BE5126CDB85BB
          F28F9872528C81222DD0332B40CBF81F56E5E5A400D0DE06A04066AEEB9A8492
          2B61C3B316D2CC846460E28D57FFC19E10B027202AC7995413FABBAF85533651
          2917E0A46E4775E943C84F8CE3F0A6D9015A09907B0B601A4289DC20C971F7D3
          59F98E5C0CB1FD850AC6CE1F457D6489B82949618080E9974EB6E0EA453DB442
          19E5C2289C1B5FC7782187A14D4B6707C8FF7EE5986AE8AA502EEB3301940840
          341D4D15D6001E3BF21C7E7ABC4AE72B2C4A221E107746162097E9D7D1D28354
          3285CAD465B87D03989296E16F9BBB6605C8EE7FB0E7FE3B6E6ADA192BD766C4
          C27436288C7C1507CF0EE3CCC40895AA181A9330342A94874846C11832107D84
          568845EDEF636294E0F40E607C2A75E89F5FFFF06767AB0306BF969CDEB7E2E9
          B6B6E42A49D7FE2718C56F71FA4BE52206878F23C38E9864108A2C101DE6CF67
          431C1D0D59FF03D606D645F601780A5A5B3BE12F7DC4796EEB9D6BF8D8394AE9
          DD0068586428DDE77EB3E2996C4B72696C05610D9E5ED7A950C7DE13CFC3E2A7
          3EA14193451F403498303E2173BFC3AF05F8D32B3E46267CA4D981D72D6EC1C0
          4317D7D694BF39572FE07668169618FAF9353B97F7377C429C5C66C5D1986267
          0AE3F8CBC8699E5E8F8231524CB34BFC16CA43310D3213206602BAC02C3A3015
          1DF7DC5BECE13F74543C13CC558AB59A253ABEF199D69B777C71F1A3BAA16BC9
          4412032FBD408B0448B1136A3CB22284EB4450C6BD2814E76310B22557D90F4A
          0E94EB97215F707FF2C086D3DFC13CE6019E0B298A681EED833B7A3FB7A4CFFF
          CA5FF3637263830E23C14988CD48A9CD848A54EB433CBD28C33E27219B2D58EE
          EE023AB3B02A26B6AE7DB19E8F54DE2B40748B92A0340A881F1EB86E7F73602D
          5772E3505D137A32EE11B2307F6D69C89930E030E2543CE8CBFB21B537C16133
          B22C076F9C2BDDBBEB0B67072227CD731E50EEFEE6A20F7EF4D32DC7EB8C0474
          BA42B16C0417F208264B084B2588F065E0434AF2BFA634D4655D0899318EE3C6
          C28C2857ACDCFDB70F77733F73BE00EAF77FDDBFBD6389B15317A9C8F4D49919
          0AB34096E24014454AF8201463491057438F93B1E77A1C4CFC08C2B41DDCB7EE
          5496FB15E60B90DCB5BFFF918EC5C63D5A04C0F70199A28AF08F47F2996BC3E8
          FDC08F66439FDF2E015C82D804F8DA6DC373CE03EF74199FFF6EE7FA9BEECCFE
          5600A8620E14A3B81C2B8EDE8CFEBB36AC4D65B1257CB6674F40D01AA5A2F3EA
          B7D79F16C5283F5F0091961D3B9EEC7DACB3BBEE2E4594E49A7269C6E925C499
          F0962B62088F1066C52DFCEC81D73E75FEA4F92F3E31355F00A996098B57DFD6
          B8EA239F6C5EDFDE95B8C1A89317310B12EFB44C6C5B9AF4CE574ADE859157CC
          A34FFC60EC19DE1E11A7A7B80B998AA7EB42BA260D885354AE01BEFD123591F3
          194C4A49041EA558BBB7E0F702A9062214EB88CBF6BB2D121B8BAAE7D5943A98
          F1DA3EADF73FB85EEBEE32644B010000003774455874636F6D6D656E74004472
          75677320636F6D2066726F6D2049636F6E2047616C6C65727920687474703A2F
          2F69636F6E67616C2E636F6D2F540764D20000002574455874646174653A6372
          6561746500323031312D30382D32315431343A31323A34322D30363A3030668E
          00D30000002574455874646174653A6D6F6469667900323031312D30382D3231
          5431343A31323A34322D30363A303017D3B86F0000001974455874536F667477
          6172650041646F626520496D616765526561647971C9653C0000000049454E44
          AE426082}
        Proportional = True
        ShowHint = True
        OnClick = tbLoanClassClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlPurpose: TRzPanel
      Left = 618
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 12
      object imgPurpose: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Purpose list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000007DF4944415478DA9D977D5053571AC69F9B4042651570
          2C585002826895A0B3CB2AA5C51D05A4BB580411F1ABB0E83AED1F2ADAA2A276
          D76DF103FCA0D5B6A3EE6CA9CED895020E0AA2BB5A700B1A8A805B232004DC5D
          B2E034A80941880DF9B8FBDE9B040349ACF5CC9CC9CDB92F87DF79CE7B9EF386
          01E026FD9BFE9C51204A32C3B1091840281AAE684911A7472F6EF8DA64764B32
          3B091450A0F9C709158DD743D3B3AFE26B56802496758C63683E9850716C3152
          E9C9C87D1D3FAB981DD81D097013F301D6C64D20100079AD40FB5226607E5C73
          EFFB9B02298E751227407EC1206EC98202B2ABD19B1AF631CCF49F18089EC6D1
          8800429429B6E2582C26D0D0636E9A976716B37D1B238093ED2407C5337C30E1
          11D03BAF029F76001DC9CCAC79B1CD6DEB3303F1E5D93EB809999140A38945D6
          2A3F9C383E887FD507CDDA5C8DB6C4D05DF8A67B3FAFA0AD1137E224BB50D5B9
          1FC7E2E04B430FB8D7BEAF16B3AA2C29704109B8DB01180860A90428EAE41588
          981FD7244F5F198CAAAB5AB8B931BC0ADCEA8D461689F1DE38F38516B7EA8323
          08409E10928D26D55F211488609BD1641E46A4DF1FF08FAEA31C801F0DF6F100
          B405AA95E1405D1F2960474CF3228638CFDE03EE1240140124A68442D6A42305
          ECE24C4074A427CE7FA546B3CC02B028340B1DEA4A52C0DD4E0103664C7C0B35
          9D5F3A022413C09D7E4A383B005216521FA09C14B89B6C0158B464265A157A5A
          995D1C29353BCC03574AFAD044009403F29890E5E8D1DDE4F77C04807262CAB8
          79A8ED2A1B0D309B0012680B7A7416B19E260D30C513F8BB02682380D7E21AE5
          F3E3A5B8AF323A24A1BF9F08D72FF410C0341EE08DE9BF835A7F8F3B1F76339A
          31511C823AC5A5D100E10410FB4B4A498323C07852F09BBB402B6D41F4E226F9
          9CF85F6170C8F178791268F385FFA2F17A70C4160E60762CF4062DC6CE2876F7
          C2F5D66A7C126B07403ED06E16887CE0A231EEC3EA9654714CF86FFE791C1E01
          0B2C680E4E00FDE0506DE78D39EF6E3887139EDE58E0CA07746AD4FE250DCB6D
          A7C09B7AB0E7824C29AB1F32B1AC997D1A2C60180F4FE1D0B7A7EFD0D787D4B9
          B33B89BA9B1302A3354643DDE739E294361F7849DB80D2099E4874BE7C60C08C
          2A2F29D6B646059E1109906861644705112B9E30C24B1137FEB3C2BAF11E63F4
          B7DFD91FA93F81CD09D9DB1840C067F4CAE8C40A6911DA8D60A62140F19AA4D7
          F7FD0FC19A4CFCCC02D60C33634D32A1107D857B1026EBE61D0ECFD9B87926B1
          DFE301FC0B28250E721B6E074059E9B79D24D8012604B33AA202DBFCD66F41FF
          A94F796D9B12D660DEA5D330900D7B676DC60F454731A35EC93BDCCF01F02500
          155EC9A795965801AC5EC8017891A283B91C404447B4443E79C506E8AACA2032
          9BF0D5BB7B31ADB50151356510A7ACC5FDD22F3043D6CD67F7CF07F02780C15A
          1AB1B338962CEE1794F48F6D004172FF25ABA097D5406C34A268750E12162E40
          C7E78578D3C38CEE2BE7680B942F0A5008E8EF60AC71C0831C6AE03D0BC0EBC1
          F2C08549186EBB4D00C3F83CE91D6C599F813B8A2EF4569663F6D9C3086AEE7B
          41002E090D3D70B022D1144B1212403B018444C5C1D4ABE4010EC567E0EDE444
          A8D51A0C53F2FEFBC411A47E72F2050124A5B4E07EC70821D9C4A3348B026F84
          C8C3E6C6D05651921BF42888494146F212B4B4B4607A5818BAFFD783EF64F5E5
          B9DBDE4B0357763C2F80BE996917B9B13EAE228645508B6722A66EDEB4E3BE62
          867742915E87B35979C858BA045D9D5D9C1320747A081A9B9BA1E850946FCF79
          3E881127CC4C83744847179BF9A9C3D0E9623CC74178BA14CE9CD03DFFB39397
          D7A4BC0565B792EC83E12102255371B3A1111D9D8AF2DCED393F09C13B6111B4
          A5624C48645D04E83150B50E5EABAC433687F3293872AC7D655A0A7E50A97800
          5B7B65F2647CD7D080AEAE7BE53B776C7B2604EF84656007E61EB51AA1DD2160
          B91A91D6FA7D36E8E660C63A9C6FC1C123AAB4B454F4F76B474DCAD5873E3E3E
          B874F932346A75F9AE9D3B5C42F04E48000F22F6010AB202819D119AC987C272
          01F96E1EE065EB368C001CC83F4400CBA0D33DB14CC6F01718B9B2904A3637BE
          5FBD5A8D870F1F5412C432582E22C724240095340FE82DB602588D9003085849
          95D21F7980B1C7CB77DFFE02D5725280BB330C0603DCDDDD3130F018172F56F1
          CF9C121C0CF7B92D67ABD33B620420E2235ADE358BE4235B40BC931692027F72
          0E90B7F7802A3D7D05744343A8B9760D52A914128904F5F5F5282D2DD973B1B2
          426695FE11F56EEA5A9700730FB0D0DE76CC01AF3994033B1997000909F1BCCC
          BD3D3D572441418BD6AE5EE576B7A313D5D5D56D07F67FF45B58AE5ED2125C1D
          35EC14A09400220FB3D0718C639C781C95E54D390CD29C00ECDD97AF32D3B9D5
          68D4DF7E5C78F8C34D9BB77E909999B1C8CBCB0B151595385756324526BBD18B
          67B41105A24FD13E6A1D03A88483ECF7AE15D06834370A8F1CDC44DF359191BF
          966EDC945DB1382E164DB76EA1AEAEEED4A183F91B9C25DF288012E8DB0510F9
          B8F2010D7A6A37602A5FC3D9BDE29C73AAF5F93EF541EA7EBB3FD87373DDBA2C
          5F02C3F9F317B037EFCFE3ADEF5C02788B312E6419725F3790E58C6D1EF0C419
          ECAAB126917D16733F795EB26C145F5E71C93671F59AB7B786874B772B95CABA
          478F1E9E2F2D292EA2F1FE670170078FA3A4C29AFF15C18E796FB4AE60F05952
          5A1B07E40F8B5DDB8ACF3E2BA04B00DBA700A353D0D658EBEA58FC74B315A362
          AB32B6136076F507FF078091524EC40350990000003D74455874636F6D6D656E
          7400436F6C6F722062792073656C6563742066726F6D2049636F6E2047616C6C
          65727920687474703A2F2F69636F6E67616C2E636F6D2F39E2317A0000002574
          455874646174653A63726561746500323031312D30382D32315431343A31303A
          33392D30363A30306AB98D0D0000002574455874646174653A6D6F6469667900
          323031312D30382D32315431343A31303A33392D30363A30301BE435B1000000
          1974455874536F6674776172650041646F626520496D616765526561647971C9
          653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgPurposeClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlAcctType: TRzPanel
      Left = 532
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 13
      object imgAcctType: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Account type'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005A34944415478DAC5970B4C13771CC7BFBD2BD0E25BA6
          806E481F44658618B765669AAACB34648F6C6E9A65CB66CC147060838484CD64
          89114C9C2CCC073065E07C91A1E2E696CDC46C8B4CF031DDC4B989D3D1528B51
          18D40796F65A7AEDEDF7BFD6DA3204849A5D72B9EBDDEFFFFF7CFFBFD7FFAA90
          2409FFE7A16002140A4524E652AE5DBBF6105D5FF5F97CE11076721CBBFD76E3
          C68D4BE82A465A005F5050509B9898B83837770DECDDF6FF18442995A8A8A840
          5B5BDBE1E2E2E2A5F4C81B2901323C21216171664606AE98CC703A04F03C179C
          57F24950C7AA90A2D7A1B2B212EDEDEDDF6FDAB46931F3C4700504E1190437B7
          5820082E224AF8B3E912BABABA64A3D163C6202D753A62478E805EA745797939
          68DC687A651F8E8030B8E5AA154EA70B4A258FA64B9760B3DDFA273FCFB89C19
          966C2EDD1D17372EFEC9D4544C9BAA4751D106501826D2ABCEA10A08835B5BAF
          115C90E75152AC7F3DD788CC15CBE790DD8D80FDA4CFAB769D7CFAA9594849D1
          614351112804F1F4BC632802C2E0D76EB491DB05964CF23C2CF6BF5FB88865EF
          BCA521DBEB813193F754D75866A6CD804EAB250F140E594010BE3223136D9D36
          08A2CF5F671E0FE5B5084A3DB4B65A617738AE8E8C5567B041DD4EA172D48811
          C9494949D069A6A070881EB8BFF2CC4CB4DB6E4350F0B0CD9B0A363CEEF81540
          7040218A607352B99167DCF240B53A068909093247AB494661E1FA871620C3E3
          59A911BCE3D61DB89451689B3B15F3F7D5CA063FBFBB14934E9008A7838ACBE3
          6F3E816959B365FD96A30709F113191CD490062D20008F2778166C5D77E1E2A3
          717D4E0AE67DB613373FFE40368AFBB018C7B3DFC3E3A79A0147372412814047
          64F373D409D52A156A6B0FC26AB5D66FDDBA75C960AAC00F8F277856166EDA1D
          70D3CA5B67EB60F8E453DCA9DC4C0D58E9B724D78FCDC84343413E924E9B28F0
          76BF085A3BCFF15051186A0F1C84C964AAA73E60A417160CD007EEC369E55D94
          E96E3E062DCF26C3F0D13AD8BFDA0B89C4C0DFE3E5D52ABC1E8C7E63191AD6AF
          83E6643324C129BB5D15138DFD076AEEC1F3C8BA95CE3BE8A71306E12CE1EC6E
          0F3CD131689EF5040C6BF2E0A83B02895706E0F7C7723E2F788F1B67FF30417F
          C60CCEE5421495E5FE9A2F61329B43E1B7D1CF5E1002CF8283DC2846A9F1D7CC
          C930AC5C01D7F95F20914B832BBF076703C903A7CF5FC6F4C6567094074A727F
          75F53E981F00EF4B4058CC05D10B4F8C1A4D698930BCFD267A4C572029B807C2
          4FFC7611332E5C074795C09337F6EDDDD32FBCB78030B89B125854C7E242EA04
          CC7FED15889DEDF03178AF70F9E122EA4F3722ADA983E0DDB2983DBB770F080F
          15A024F86182BFCC62CEFA993736168DD31EC38285F3E1EDE921B8222CDE41B8
          4F445DFD19CCBADC49702735220F767DB1132D2D2D03C243058CDAB265CB5DD6
          DB45AF8F621E8373B4F2E7172DA034E5E1EB63A01FEEC5B1BA063CF3B78DE0D4
          F544377656550D1A1E2A600209E8600298A59732FE6CCA782C7C7111449E04F4
          FA6CE414CCED5EFCF8C331CC6EBE09AEC703C9ED42157D6C3C0C3C4C80D1683C
          949C9C6C602278951A5294120DFA38A4BF940E2FC7444801B8425EF9D1234731
          D744704A546F8F1B953B763C343C2C0474AFC9C9C929D56AB50696844ACA0189
          60C775E3914E4908567AEC60F06FBE83C17C8BEA9E086E0115DBB70F091E9684
          743F96CE2412B159432256AD5A852826821ED6E9C6217DC9EBF280A387BEC602
          F36D391D45B71BDBCBCA60B15886040F15C0EED912C70545683486F7B3B3A987
          ABE524FC69CA2879C00B56BB9C803D5419E5A5A5C382F716D0A788EC1C23ED62
          D1C14A6070377D7C946DDB366C785F02FA14919B9B2B7FEBB143A45D8FB6D288
          C01F24A04F11F9F9F9F28B92929288C1FB13102662F5EAD5A57ABDFE39F690B6
          D453656565C648C00712102A6252E08A00F44624E08311C00E167C359DAAC06F
          FAEB0301217F301FB580477AFC0B6923324B252469490000003574455874636F
          6D6D656E7400526564207461672066726F6D2049636F6E2047616C6C65727920
          687474703A2F2F69636F6E67616C2E636F6D2F7109F3E8000000257445587464
          6174653A63726561746500323031312D30382D32315431343A31333A30342D30
          363A30306ED6502D0000002574455874646174653A6D6F646966790032303131
          2D30382D32315431343A31333A30342D30363A30301F8BE89100000019744558
          74536F6674776172650041646F626520496D616765526561647971C9653C0000
          000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgAcctTypeClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlLoanType: TRzPanel
      Left = 489
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 14
      object imgLoanType: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan type'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005A44944415478DAC5970B50545518C7FF77EF5D77577C
          E4988BD028C2924A66A53139653199C3F4182787491675121FA4335934016AE3
          A40C01CD3834622363429A141A8A128699F822CBD419CBCC279AC1123B892DAE
          A22CCBBEF7F69DC392BB08082B4E77E6CEBD7BEE39E7F73BDFF9CEB977055996
          F17F1E02131004A13FFA92F2F3F3CBE93AB3AB41291402A8B8323D3D7D16FD74
          F7B780989797B72B3434342139791E2C9656B477D9D1AF0C491A809D3BCB6032
          9976AF58B122910A3DFD25E0836B131213F5B874F90F58AD3688A282FA55F00A
          5EAF1721211A8C1FF72849EC62127B49228145E27E05385CABD526E8F57A5CB9
          520B9BDD0E16EBF3176B70FBF66D5E69C890A198382186244230766C344A4B4B
          91929232841E59EE4720005E5B6B409BCD46A19670B1A60666F34D53465AEA02
          5671EDBA822F870F1F16FA584C0C62C68F43515121962D5BA6A547D78315F083
          27C2606880B5CDC6138D09FCFADB692C49593095EA35FAEA877FBEB9F8F8D393
          2763FC581D0A8B8A909191114AE54DC10804C08D0D461E76EA85279E288A3873
          F60292DF9C134975AFFADA3CF2D5B6EDF54F4E9C80689D8E47205881FFE04904
          BF76F52A3C4E076FEFA49C76D3EA63F70D46232C56EB5F83066A16B346AD6DB6
          4D834342C68C1A3D1AD15111282C0C2E0277464ED9DE646A84E87262D4E63ABE
          DAFE7E2B1A563270C93C07D178ED1A6C36076FA8D1A81036722458459D6E0C0A
          376EECB380DFC8F530379920791C082BBC8263A9F1BCC2F30587F0CFDBE3D04A
          062C121D53C20E994BB573C2C3C2B065CB66A4A5A5F75A2020EC37CD6628BD4E
          68375CC2FE25D39055DDC02B654D8FC02B9B8EA069690C97707965787D1B22EB
          9F9D03351A54571F86D1683C9A999939AB37AB20007EEBC64D2865271E2EB888
          9DF3E3B0E1974648BEA66CD4EF3C130E7DC951DC487D1C2D4E2F5C1E19CC41A1
          50D034A8517DF8302DD7DAA3393939A9545C8F7BEC0301F096E666A8650F86AE
          3F8B2F664FC5F673D7419B1D14BEA66CB41E2F30F7092D16ED388EA67727F29C
          A01A50530E1C3C78A0039E4685463A6FA1879DD02FE112D16669818ADE1F83D7
          9EC6A76F3C8B037F364314EEC03B0E36EF6E5940D5B94B30BF3F09365A19D200
          250EEEBF0BDE8C1EDE050170BBB5151AC10D4DDE29E4BE3E05278D2D1CDC19CE
          FAF010BCF24C0DECCB6361719190A84455D5BE6EE15D09042C3597CD0AB5E081
          6ACD49AC7C391697CD562838AC6B78C5E91AB83E98020BBD6CBD8288EFF7ED25
          785DB7F0CE02EDF0112312929292E076D8A1517821E51E47EAF44930B53AF8CB
          B5F364B1B65E2A2D3B79019E0FA772B84C9A95DFED415D5DCF707F0189E0BB69
          E43358D83DB4C10C12A93CFB67A4C43D05BBCBCD6718DDC04B4F9C879CF90225
          1D6823A269D853D92BB8BFC0E09292929644823B9D4EA8A95B55CE4F984F70C8
          5E74F585C3E02CE94A8E9D85FCD18BB0B9DB9762C5EE6F7B0DF7171841024D4C
          C0ED724143A397328F60D1B449144C997F50F81F0A36723AB7FC7806F2C7D3E1
          605B3021BEA9A8E8133C40202B2BAB3C2222228E6DB592428692761861E5212C
          7E6932141405AF2F0A1DF04D3FFC0E794D3C4D17E0A00D60577939C10D7D8207
          4C01DD47AE5EBDBA202A2A2A8E6D3C6A4984A02489E555581A1F0BC197032CEC
          9F1D3A05F993572113DCEE76A38C3EB30C86BEC3039290EE1FA2733449AC6312
          B393F450AB947CC10B197BF1DE6BB1BCC1FA7D045F3B836F7D76A71B3B769405
          0DF71760F7229DC3FC25E6CC4E824AAD6AAF985ED91E81FC99FCEA7438E9DB6E
          3B0CF5F541C33B0BDC2D1119193777EE1C0C50A9A9A8231105B868E4DBBEDE86
          7A36F2DCDCA0E15D090448AC5AB58A472279DE3C8892C41F7A68CE4BB66EE561
          CFBD4F7877025D4A2C5CB8903F282E2EEE37784F020112F4F150A0D3E99E6385
          B4CE4F646767A7F607FC5E02FE12E1BE2B7CD0C6FE80F746801D6CF23574AA7D
          BFE9AF0F6CF0FB83F9A0051EE8F12FF6483C4BA7AC407B000000367445587463
          6F6D6D656E740054616720626C75652066726F6D2049636F6E2047616C6C6572
          7920687474703A2F2F69636F6E67616C2E636F6D2F1293EDAF00000025744558
          74646174653A63726561746500323031312D30382D32315431343A31323A3433
          2D30363A3030C0F90B670000002574455874646174653A6D6F64696679003230
          31312D30382D32315431343A31323A34332D30363A3030B1A4B3DB0000001974
          455874536F6674776172650041646F626520496D616765526561647971C9653C
          0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgLoanTypeClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlLoanCancellationReasonList: TRzPanel
      Left = 661
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 15
      object imgLoanCancellationReasonList: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan cancellation reason list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005844944415478DAC5977B5054551CC7BFF7DE85DD7551
          3347F03149B0A490E338D81F36D930FD6135CD381593CB02E92A91DA1F9101E6
          8C0F1842B4194ACD8192551343C3070CF8885006A7C9199BC61EE6A4660E2E41
          89A224CF65DFF7F63B875DDBAB88B0E27466EEECBDE7F5F9FE7EBF737EE7ACA0
          280AFECF22300182208CC65C9AAD5BB756D3EF6B8319258A02A8FA684E4ECE22
          FAF48EB600A9B8B8B82A2A2A2AD9625982DEDE3E0C4C1998578146138EC3870F
          A1BDBDBD76CD9A3526AAF48D96003F3C32D9644AC1EF97FF80DDEE80248934AF
          C83BC8B20C83418FF8994F91882A26E26B1291CC3CF1B002383C323232392525
          0557AE34C1E17482F9FAB78B97D0DDDDCD3B8D1B371EB3672590080366CC8843
          656525323333C75153EFC30850C19B9A6CE87738C8D51A5CBC74091D1DB7DB73
          B3B396B18E5BB695EC9D387142D4D3090948889F09ABB50CAB57AF8EA4A65BA1
          0A08829B60B3B5C0DEEFE00B8D09F8F1E75FB02273D97CEAD7E6EF3F75E7EEF2
          33CFCC9D8BF819469459ADC8CDCD8DA2FA9BA1085059DEDAF217FA99DBA1F085
          2749127E3D7F0196C569315479CD3F66DA97FB0F34CF993D0B714623F740A802
          54F0EB7FDF84DB2D70B0577641563C7CAE96D616F4DAED7F468CD12F6783FAFA
          1DBBC61A0C4F3E317D3AE262A35156169A07FE839B5271E34607148F166F544E
          E28D356F76C0E5EB868F44288A8CB6EBD7E170B8789B5EAFC594C993C1B6A5D1
          F824CA76EC18B1803B70738A99B6512704AF0EAF563C8E93D9D5BCC3CBDB16E1
          F8D24E38B908F79D90B0C2F252803375CA14ECD9B31BD9D939C316A0827774F4
          90BF7558B8673C8E64ED44C3B915BCD34B893BF17AE90AD4BDD503A7B70B3E1E
          1299B7B1F9D93346AFC7A9538D686D6D3D9D9F9FCF32E203774150CCCDE8FC87
          329C4F8F577647E0E03B9B70FAF2FAE06487A4F84D48B3AE47FDDB7D70783AE1
          915DBC4114450A830EA71A1B69BB369DDEB87163163534E301792028E666F474
          D921CA1178D1AAC3DEE5EFE3ACED53CE0E76332BF3E25661D9AEEDA8CBBC4D9E
          E8E5ED3A5A030D0D2703F06CEAD64A4F1786C8842A785F8F132222B0E0B3307C
          9E918E0B6D9503AEBD6B10A501B0EC5B7202A85FD90DB7DC87B070090D27EE81
          776288B3E00E9CE57687DD0B8D1281174A446CB12C80ED56E3A0B1222F736B4B
          EB806FB3145A8CB721480AEAEBEBEE0B1F4C4010DC0CB7C347700392B60B285A
          3C076DDDE779AC830B0F8338F0941E05BE5BA5D076A4852AFA50F7CDF121E177
          0B18804F22B79BCDF038E90815F478FE1301EBD2A7A1ABFF1A06BBBB8801780D
          702697596EA70A2F8E1D3F82AB57AF0E090F16A021782D59BE3085DCEEF1D0C2
          21F8B3C50272D3245AD13EF87794CAF440CC4BAB801F3E20B8ECA4ADE7C6D163
          B5C382070B185B5151D1633299E0727B1046319FFFB188F7D2E92CF7B2F3FC3E
          964B043F009C5DCB2C7743860BB5B535C386070B9844026E32015EB2364C3460
          DE6601AB2C04F7F90504DC1FB09CC1F7013FE5B1987BF9595053533D22B84A40
          41414175747474124B3892100E2D9D6A891F0AC85A4A6C9A221002C16F79C95E
          E05C8102B74F26B81355D5552386AB4240EF3179797925B1B1B15C8456A307DD
          AA90982FE0DD4CB580D22F085EA850BA055C5E07BFEBD96CB611C3558B90DE1F
          A3673A89D8C644A49A53A10DD7716B13D791889503034AAD04DFAC70AF383D2E
          1C3A78206478B000F64E284C5089484D834EABE5719FB37620579CFF48E1EBC1
          ED76F3BB9DAD3974F8DD02EE111113139B949E9E0EAD365C35C8E3F662FF57FB
          D0CC2C2F2A0A193E980095880D1B36704F589658206924DEE8F3FA50B1AF82BB
          BDE821E1F71330A8888C8C0CDE505E5E3E6AF0A104A844D0E5A1C468343EC72A
          69AB7D5F585898351AF00709081631D5FF0B3FB46D34E0C311C00ADBA27A7A74
          FE6F76077720E80FE6A316F048CBBF5D4C2A4BCA752238000000377445587463
          6F6D6D656E7400477265656E207461672066726F6D2049636F6E2047616C6C65
          727920687474703A2F2F69636F6E67616C2E636F6D2FF9EF2706000000257445
          5874646174653A63726561746500323031312D30382D32315431343A31323A35
          362D30363A30305E6B245E0000002574455874646174653A6D6F646966790032
          3031312D30382D32315431343A31323A35362D30363A30302F369CE200000019
          74455874536F6674776172650041646F626520496D616765526561647971C965
          3C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgLoanCancellationReasonListClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlRejectionReasonList: TRzPanel
      Left = 704
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 16
      object imgRejectionReasonList: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan rejection reason list'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005804944415478DAC597FB4F145714C7BFF358F681620D
          55C0B6C82EBB606D639A3E7EE983F60FD034F491B66AAA496555708B9684D698
          68041FC58428B2A8148C18F0898D3135ED0FFDA195849AD4D6D4F8A8985D56B0
          02E25A05F63DB3B33D7776855D5D41614D2799CCECCCB9E7F3BDE7DC73EE2C17
          8944F07F1E1C13C0715C2A7C89EBD7AF3F41D7F715454984B093E7D9EDA9EDDB
          B77F445739D50284CACACAF69C9C9CE2F2F2B518F18C3C64A01145343636A2BF
          BFFFE48E1D3B3EA647E1540950E1D9D9D9C5D6921274399CF079FD10047ED46F
          4489406FD0C162CE475353130606064ED7D4D414B3484C55C028BC84E0CE6E17
          FCFE001123B878F90A86868654A38C1933B060FE8B304C4B8739DF84868606D0
          B80C7A353215010970D7F51EF87C0188A280CB57AEC0EDFEF756C53ADB726658
          BBB3BE25337366D64BF3E7635EA119D5D55B4069984DAF6E4F564002BCA7F706
          C1FDAA1F91727DEECFF3B07EB1FC2DB2EB8BD9CFF9AEF940E7EBAFBD0A8B251F
          5BAAAB4129C8A2E78393119000BF71B39FC24E7044FDB0DCFF75E1123E5FFA99
          916C6FC6C63C77B0ED88EB95052F23DF64A208544D5AC0287C4589157D836EF8
          42D192E3C2123845064FBE7A7B7B30E2F55E9F66D097B0771E9FBF697A7A7A5E
          6E6E2EF28D735135C9088CCDDC6A45FFE05D781501199B0BD53A1FDAD40521E4
          A5B292C17C52B9516482EA40BD5E8B9CEC6C956332E6A1AA6AF3130B50E159AC
          D4087ECB7D0FBE8808FDC64298AB7E500D1C1B1721507D0D3C13A148D1E61373
          CB9A2DEBB72C3AD959B3191CD4901E5B40149E95556C5DB912EEBBC3F04634D0
          6EB0C0BCE110707A53D46AE16638B62E4168AB834478A8CD48AC0144D343FE79
          EA847A9D0EEDEDC7D1D3D3D3515757C73AE284553006B7127CD88B003410BE31
          C152B10738B39BA625462D29FF78F74B386ACB207FEB041F18898AE022107801
          3A4A43FBB1E370381C1DD4076C34C28509FAC028BC84E0431E3FFCD002957361
          29DB06FCD146CE3524808F09A0D952FEF1C65238ED5F03DB1CE0249F1A769D36
          0D478F1DB90F5F47D6BD74DEC3389D300E6EC5B05F4290D322FCD50BB0AC20E7
          7FFF48703196E4F8B1D4DE2321383A2F41A8E986100E208DCAF2E891C370389D
          F1F0BB18672F4898B9272821C4E9115C3B0705CB5653E0CED228816D6F899255
          1712AE9DB908DDCE1B10250F3414FEB6B656381F014F262061C1F9826184043D
          7CB61C147CBA18B87595ADE547C37FB900435D9F0A17A1A0B5F5E0B8F0070524
          C003B47E42A2019ED2D928F87021303C1085834B029771EDE7F398B667300A8F
          4838D8D232213C5E8048F093045FC8722E293C648D01F756CE42C1A277484928
          06C7C3704E46D74FE730B3F136C17D6A473C70603FBABBBB2784C70B98BE6BD7
          AE61D6DB255981CC6B71673583B3FD84F2AD24A9123E3AF3AED3BF23B389C183
          D48082D8DFDCFCD8F07801B348C020132053CB0A0B5ADC5E918982E2B7695553
          A9290F8E8ACDFCD459CC6A71430C51BEE4009AE963E349E009026C36DB89BCBC
          BC2226824FD323AC11D1BFEC59147EC0A2208E89B83FF3EF3B91D3EA862085A1
          D0EC9B1AF73D313C2105746F2C2B2BAB37994C456C118A5A036491C33F4B3331
          EF93228A44ACE3D1CCAF1EEBC0F36D772052DF0987FC68DCB77752F0844548F7
          CFD0994B22761A8DA6A255AB5641936E503F5F7B979088C5EFA903AE1EFE15B9
          87084EA9928341EC6DB0C3E5724D0A1E2F00D1D5869963228C45AB4B4BA1D5EB
          556FAEC519EA00E3E161D5500A86D060AF9F12FC410149459496D9A0D3A58D7A
          6506215A74F6FADD538627139054447979B9FAADA72E3F59066DA529813F4A40
          5211151515EA8BDADADA94C1C713902062CD9A35F566B3F94DF690B6D4DFEC76
          BB2D15F08904C48B9813BB2206ED4B05FC7104B083255F4FA72EF69BFEFAD0B7
          49DC1FCCA72DE0A91EFF01ADCC164BBF66A55C0000003874455874636F6D6D65
          6E74004F72616E6765207461672066726F6D2049636F6E2047616C6C65727920
          687474703A2F2F69636F6E67616C2E636F6D2FDCBF32D8000000257445587464
          6174653A63726561746500323031312D30382D32315431343A31333A30382D30
          363A3030A9763A590000002574455874646174653A6D6F646966790032303131
          2D30382D32315431343A31333A30382D30363A3030D82B82E500000019744558
          74536F6674776172650041646F626520496D616765526561647971C9653C0000
          000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgRejectionReasonListClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlSettings: TRzPanel
      Left = 761
      Top = 11
      Width = 40
      Height = 40
      Hint = 'S'
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 17
      object imgSettings: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Settings'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000009164944415478DAAD570B5094D715FEF6BDECF25C58D6
          5D60850202828215E21223029AFA608252939A4ED5344DFA1AC7676A27B58082
          4CA635C9C4461D6792B449ED6B344D1553101A11A36851B180125184F01081E5
          BDBC16F6F16FCFFD77C18510ADD3DC9933FBFFF7BFF79EEF9CF39D73CF0AF0BF
          0FF18AFCE2D39C4098C1710F278502402484E95CF66A35BD5A9FE03C7E089E60
          AD577A41E9D0EE75F1B0DB3938265191F6E3E5777172FB723F7A1DFCA60088D3
          F38B4E0985A2656E96A95714947607050762DC629D02E02115C3D43F84C2DDA9
          1A7AED2691AC2C2831B26FB457F338AFCC064094925BF8F1C2705D9683B4D4B5
          F4B47FBE7F6D8461E7EFB77AA8746FDB945EB4C90181C0B995A33522B319B691
          FE6315BFD9B87BF9FEE286B8507508FB4C7BBB2EEC5BAB7F1408C16CCAE3C2B4
          59A9F121BC958D1D0328BED68C85A16A2C890EC4F986017498CC147B82410B6C
          84E0874B74A8BC6BC4CDE65EAC7D2A0C113A3FFEE00BB5F771BBADF79120DC01
          88D3F69F391317AE5D939EA0C79F2BEFC36CE5B0619116522120978971BB7318
          955F0E82E39807C003B4D3734AA43FE66B3D619EB0C14204FDA4BA131E122136
          194270BEA60DB75BFB06CBB25707CE06C21D80D78A03250FE2C2D45E3D76097A
          86C6C1544884422CD6FBA0AACD44D672109166A1F0E13616023BCD8B695D22AD
          BB41EBAC7C9A08A0F696432DB2A2AEB9DB5496B3662E4D9A1E05C09B24222DB7
          F0ACD45F1D2891CB79000E87837735B398C57D36D2304FCC5CC78EB68E8FC3D2
          D7D35D9EBF2E8326EE3D0E8084319D247445FED9CB3E5A0DF98BACFDCA0EC114
          01E152CC6B761B1C7F9803A64E23CA72D72CA5D76692DEC785800D19B1FDC053
          8BE3F768B401B8DE62C294B75D8A9955B6B131F2BB9D282B8258A100F3963B10
          1696A4501F183B7B71ED46ED9B95875EC9A1E989AF2321E57CF1690784192C96
          8C542FAF8A47E9BD41FE79128080626CEEEF8779B0CF78BFF2CC3B132383C332
          4F5FAF1043E62E0F5F7F8D874A0587AB44F2A9491B5745FAE2C3D25AFE99650D
          FD1217A6574C76BC575A7EC950F6E6A761B5D9F980DEEA18412559CF36F2D1A4
          5FEBD838061EB419CFE7AD7F9EA67A5C16C958D8D2F79DFEBB5F905E23519027
          48FB647618C80B0B749ECE14236FBD5F548313DB53A6554C017F407E49F7E2C5
          D118B3D8F88981512B6C0E4CB37EA8CB88A60B27B7D59F39729AA6FA486CEC5C
          12FF98CC6D59E1A92FBCEB3D47C303E0E0AC1122DAAF524AF8F028A4223435B5
          E1D48E94C98A39052070E58112A3263282C26AE7E3C8622D74670701E86FEF40
          CBA54FD6D717BEFB2F9A31BB7D95072767252D78FEB58BAA601D59CEFC2B2611
          F1DE14C24E8424C388CDBDED469CFF45F257013C4BB53B383A6A0AC0CCA19493
          A1FDDDA8BC58F662F5477BFF3183CDE2A8578E7D774EACE184DF9C008824326C
          AFDF88796A317F7C43AF0DBF8B3E0105370C49EB557CF8CBEFCF06A0D4181A37
          9F2A1CE7CA67C714A11C2E522DD58AF0D7CF6EDEBF7820336AA6076AB3A31ABC
          7DBD432A04069CD4EEC511D3ABD06FCAE18FAF7DE307C889BF829D8D9B11221F
          866968B43329BF76EEA4113C0796BFFEB753524FBFA54EC50E84CC8B80582E9B
          0261270069E1BEA8BAD5849A7B1D6D9C75ECC7768BE5CE84CC3FFAB878E7FB3E
          B1A9FA908C97D159721CA35DF721F55142AF2CA762E085FAB64514820928347A
          E8566F414BD11FD1555FD5979C775DCB40F05940C22E8B00C6EA253F3FFC336D
          6C6296461F028E85C4E50139D5F6E7627CD1D8DE8FEA7B5D18B791B764BEC8EB
          7B09113F3948A9731888DA4A0121D60BA57417AF047C1380C4B7C88D1652350A
          DC3D022CDC85DA0F0A90B0BB84CF06818BC91ECC95AEB4D22CDFF7CFAAF005B1
          9048C40FC3C03941240629A0F7918213886015C9A0F84B06C27DDA1114D2EB2C
          813C69599B2476EEB4DBA6CDB73ED0A1E68EB56CFDA19A1759759C5909E529B9
          671A37A42D0C127BFAE056E7D8543638EB3D0B07E38800768118169112A32407
          6FC6223281143988F9420EDDAD62AA82229E4B1A2D074D2803416920E0F0C54D
          25E2F6FC67111DD744323CED2EA0DBD0B83042EB979E340FE71A07E956037F17
          B0B4E473C3E12C32541F61117A60CBF575D05200A5FE01D06BBFA0C52274370B
          50638C4451C251188215082F7B1573BDEF4213C64AB50DCD9DF198300B606A6F
          1C30E45DD3B803F0A1A6B32D365CE7ED193C1723E3365243AAA806582C1390CA
          E43C293907097D19177A625FD37A04FDE8B7E4168A5CE5F758B9435DB91DEF25
          9E8345EA0D25151F6B5B3D7EDABC05B1A9A48A555AC3C784D881AB799B61C8AF
          F29B0680645E6A6E61895A17A40A8B8EE46DED33F6E0CBFABB3C80C8B818C83C
          E4140601CC0420E766028252A9B48F516575D0652A0F40DD39333E883F09BB42
          45FB1A30D6DE3072D4FBB0E7FC7422E638F14448E1902B71B5D00E435EA566D6
          EB987A824FE7E8F52A36D9D5D2D2535E90F55274E6B6E4E0A48C9CC465C96408
          8709A1021B2B33A130B542EEEF8598145220D7A1BB733E6E555DC77B01FBD1D3
          DE3E9C6DCE1E8A5BB53128505347003A5057E1C088C981FE71EBA58C83551B66
          9250E24AC7B015F945A56CA22C376315FDB02E57999E57549BBC3215369B8D27
          E18448811122C9AFAE2C42641AF533348F9883E8AE28466FF567FC15AE5EF42C
          D4CFAC056EEFA1104970FBA215B13BAF7C87CEEB20699BADC199F44490EBFD81
          EBF25151A3D2B17CED4ACA2C1BCF8309811419E7290DA32310F42DB290950D19
          B57E7AAA075295B3CC4D0C909AA3F46BE46FA7D6966FE34EC5B9E2D56F566F9A
          99053341285CCF63AEB24997567113A5A0274B2F76E38DD29213CAD711F6DA1F
          80FA1DA490729F480A8E968B754E00363254C88E2357390861CC11D41EDA8184
          5DC5DE8F0230DBF065A121F1C3C34E4A52BD37EA4FAAA880007D9A06AD974C18
          E9B542E1274298C18B0F415D511F9F49CA0009E63EE38396F21E74348E0F2E3D
          703D72B642F4A8C1CC509248DDE698977497B393CE2A7DE5DEF75A472EBD70B8
          FA60FDB1D44FA3D7CFE101FCFB48339E2EA8CCFCFCD74B3EF2F193AA86072D43
          CB0AAE529DE69BD4C12701F075A0186983E12CE74324DCE5DCE40A11BB63E8F4
          9E11CBE5E7DEBEB1D5059CB547232E5EB1AECAFAFF0270F70C2BFE936D5A882B
          548C96AC1BEEC464B3ECE4D328DCAEE36F7AB8878A556EF60F87F50FB6D916FF
          17C81DB79FE9C0378B0000003574455874636F6D6D656E740057696467657473
          2066726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F6E6761
          6C2E636F6D2F65749E120000002574455874646174653A637265617465003230
          31312D30382D32315431343A31333A32362D30363A3030BB6C46790000002574
          455874646174653A6D6F6469667900323031312D30382D32315431343A31333A
          32362D30363A3030CA31FEC50000001974455874536F6674776172650041646F
          626520496D616765526561647971C9653C0000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgSettingsClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
    object pnlPayment: TRzPanel
      Left = 103
      Top = 11
      Width = 40
      Height = 40
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 18
      object imgNewPayment: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'New payment'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000006B84944415478DAED977D54CD771CC7DFBFFBBBF72A29
          269525CD1C0F939131C3B479BC651EAE8A8E67624C9ECA4C9EB289118AA8E62C
          E6501DCF246ED212239A878D469C3CCEB13C6CBF909496BA4FFB7C7FDF5BBB99
          195B8E7FF63DE773EA7EBBDFCFE7F5797F3E9FEFEF9760369BF12A97F03F80D5
          EFCAA018BF5D82601EF8B2A0044180D92CEC8D0F49194C1F0DD600E2C468ED4E
          8D97C6EFAD661E30994C2F0540A150E0D2B53C646667A6AC9DA10BA02D230350
          4E89F54F79AFEDDBFDDD5F7783C168C0CB5440292A91FFEB2DFC907B61DF9AE0
          DD7E0CC03E387E507144E01A0AAEAF12C58CBF87102A85ABD4CF8CE73F43DF51
          8A2ACC4B9882D8A06407B6EB343D7E70C1E2B17198F65520D42A35CC26332A0C
          7A989EA20473A45008B29C2C23D9257D8F95CD64323F154241DF532B5510E85C
          85BE02715313307FE334AC0EDAE5CC3C38CFF826400A1F1D8D88CDB3A052AA65
          47DE5D3E80919C5A3BE4C11528292D41CEC58B2828BC2FEF3BD77744FB56AD60
          6F672F833C7946A433074E1C93C1F5860ACC1B1189F0A419889EB0D34506085D
          3F549A37621962762F846D2D1B52C1069E2D58331AAB5CB12F0AE488A9A33B7A
          08AE0D1AC0A581A3FC37E9DE7DDCB9770FDA0F7BC9599A65883FCF291422CE5D
          C9A3EC1FA3ACFC3142FC1750B27310357E1B0798BD61B8143A7411166C988961
          1FF9C16030FE2513B644727426EF1C656180AB9353558998C477EEDE25F594E8
          E0E149CA199F523605944A115BD353B070DC0A446DFB02CBC76DE1007313464A
          9F06846171521802BC7DA9198D5501F9ECF21A8BA202BAC319F068DA8C97CA6C
          B200286469F3AE5F83B6870F8C4653558FB0B395404A51C4CE037B307FF412AC
          DAB9044B03377180F989A3A529834211B56511FC35BEE4C028074F3B7A0045C5
          0F51CFA12EFA77F36673843D075329CB77AA295499E199BC9FE0D75B2B4FC5BE
          2C3A5B4267EDEBA25F370DF74900C9997B103AFC73AC498EC2E231491CE08B4D
          63A44FB49F21664704FC2C008C762F056373CBEE86811AAD1C2CF5900EED5BBF
          0B93B13A00739E93974300FE72CDF764F2B32C7B5F82D2D35441614272C62E4C
          0B988375BA955834329103846F1E2B8D1D108CF8DD51F0ED39480660B29ECC3D
          8EB2B212D8DAD64167CFAEB2A4E9D9FBD1AAA9075434CBD6256013732DFF3A5A
          366F88CC7389B8907F9940D888D29D4B1568EBDE029A7681C8BDF033C6FB8660
          836E35168CD8C001BEDCFAB134AADF6424E8E230B077804CCBC84958A63AEF01
          0A2650A00B57CECA93D0D0C995EFC9D92B5158F800595736A2A0F412FAB61F82
          364DBAD244D59601CBCA4B917BE338D273B6C3417447D4840C6C2480B0A16B39
          C092ED13A4E17D27227A53048C0613D5AD1EFCBD07C9D257DE74664BB733E18F
          9DCC808B7363383BBACA500F8A0A9196B30206F10142FA47E256F1499CFF2D05
          058F4AF93D51C70E6D1AFAC1CDA13356A5CE44BB267DA02E7F1333FD577180A5
          3B82A4217DC762DD8E585E370A3C4C1B48E3A887D97AA0D96408221E5159AE5C
          3F8FA287F7A9595528AE9070FAF61684FA47E2787E1C0A4A6EA29CD863FBF3C3
          C1FB04D45252207B37BCDF38185129B3E0E932048B866DE70091BB2649BEDE63
          B0236D3D0128E4A06CE498C44FDE054C729635EB7A567B956883133712D1AB43
          1F3C164F53F61765B97EA79E8BE9C7CF86A409A8ADE249B839B482ADA923B2CE
          1E41D2E47C0EB03265AA34A0F728184C1556F7BBD553E6694F040132482DA51D
          464579226CD81464DDA0071AF5250D08CA08E0EB01FCFCA45401B62A76AFD05D
          40D6BDC9344427C7E1C01CC8004E0B1326A438D4B3E9FAA28F61366E6AD10EDB
          CF46609CB613F2A45358D6FBD93EE61C14D0BA61176CDE7F0219B339803D993B
          59037659BD10015FAA5E1148F7F771C5EDA23B58D2F3D90061DF0970ABD708A9
          076F23DD02C082DA92D9A0FA2BDAF3AED77C96E352772FC8F29793F47AFAF998
          9A70B50F87999E21C086A2A848FE5A2A5E8663DF03FB677180FFBA9C34E1F8D6
          B303DA3B3BF14B87F5006BC2881E1C60DE61DE84720F8840C15DE0DC19E46486
          A34F4D00D4F518006D4B0D92BC3A51DB0A1C8229B0C08B032CCCE60AB0E0026D
          659F022E6762745E2A743501A02673ED3E0B31CE4DA0EDD2913E51A67A02D05B
          9ECA2A0AAC628526654EFC480ADC80EE48244268E74E4D005436F21BDD6662A9
          6363F46BD91C7071A18C2D2D4DAF0F9024CAFA2A70FF26D2B256602E6DFF4256
          5213006C89AC14648D9A6BE0E5DE09416A07B4B57E2DAA28466EFE29C45FCD44
          36EDDC267B08CB6B794D2D066147561F7CA4EB58F6D862C57844768FAC90ACD4
          B2F7AFC6EE9FCAC12E5D36D66A547F71AF202B23D3C3EA8AAD698017277ED5FF
          9CFE01E331CDCE87E4311A0000003774455874636F6D6D656E7400416464206D
          6F6E65792066726F6D2049636F6E2047616C6C65727920687474703A2F2F6963
          6F6E67616C2E636F6D2F13EB34460000002574455874646174653A6372656174
          6500323031312D30382D32315431343A31313A31302D30363A303052C6A49D00
          00002574455874646174653A6D6F6469667900323031312D30382D3231543134
          3A31313A31302D30363A3030239B1C210000001974455874536F667477617265
          0041646F626520496D616765526561647971C9653C0000000049454E44AE4260
          82}
        ShowHint = True
        OnClick = imgNewPaymentClick
        OnMouseDown = imgAddClientMouseDown
        OnMouseUp = imgAddClientMouseUp
      end
    end
  end
  object mmMain: TMainMenu
    Left = 240
    Top = 117
    object File1: TMenuItem
      Caption = '&File'
      object Save1: TMenuItem
        Action = acSave
      end
      object Newclient1: TMenuItem
        Action = acAddClient
        Caption = 'Add client'
      end
      object Newloan1: TMenuItem
        Action = acNewLoan
        Caption = 'New Loan'
      end
      object Newpayment1: TMenuItem
        Caption = 'New payment'
        ShortCut = 115
      end
      object New1: TMenuItem
        Action = acGenericNew
      end
    end
    object Client1: TMenuItem
      Caption = '&Client'
    end
    object Loan1: TMenuItem
      Caption = '&Loan'
      object Selectclient1: TMenuItem
        Caption = '&Select client'
      end
    end
    object Payment1: TMenuItem
      Caption = '&Payment'
      object Selectclient2: TMenuItem
        Caption = '&Add active loan'
      end
    end
  end
  object alMain: TActionList
    Left = 280
    Top = 117
    object acSave: TAction
      Caption = 'Save'
      ShortCut = 16467
      OnExecute = imgSaveClick
    end
    object acAddClient: TAction
      Caption = 'Action2'
      ShortCut = 113
      OnExecute = tbAddClientClick
    end
    object acNewLoan: TAction
      Caption = 'acNewLoan'
      ShortCut = 114
      OnExecute = tbNewLoanClick
    end
    object acGenericNew: TAction
      Caption = 'New'
      ShortCut = 16462
      OnExecute = acGenericNewExecute
    end
    object acSelectClient: TAction
      Caption = 'acSelectClient'
      ShortCut = 16497
      OnExecute = acSelectClientExecute
    end
    object acNewPayment: TAction
      Caption = 'acNewPayment'
      ShortCut = 115
      OnExecute = imgNewPaymentClick
    end
    object acAddActiveLoan: TAction
      Caption = 'Add Active Loan'
      ShortCut = 16449
      OnExecute = acAddActiveLoanExecute
    end
  end
end
