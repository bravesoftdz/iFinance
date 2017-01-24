inherited frmClientMain: TfrmClientMain
  Caption = 'frmClientMain'
  ClientHeight = 605
  ClientWidth = 927
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 943
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 927
    ExplicitWidth = 923
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Client record'
      ExplicitWidth = 78
    end
    object lblClientName: TRzLabel
      Left = 834
      Top = 7
      Width = 82
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'NEW RECORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoBk
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitLeft = 830
    end
  end
  object pcClient: TRzPageControl
    Left = 0
    Top = 28
    Width = 927
    Height = 577
    Hint = ''
    ActivePage = tsClientInfo
    Align = alClient
    BoldCurrentTab = True
    FlatColor = 6572079
    ShowFullFrame = False
    ShowShadow = False
    TabIndex = 0
    TabOrder = 1
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    OnChange = pcClientChange
    OnChanging = pcClientChanging
    ExplicitWidth = 923
    ExplicitHeight = 492
    FixedDimension = 20
    object tsClientInfo: TRzTabSheet
      Color = 14273211
      Caption = 'Client information'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 921
      ExplicitHeight = 467
      object JvLabel1: TJvLabel
        Left = 35
        Top = 40
        Width = 54
        Height = 14
        Caption = 'Lastname'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Left = 35
        Top = 64
        Width = 54
        Height = 14
        Caption = 'Firstname'
        Transparent = True
      end
      object JvLabel3: TJvLabel
        Left = 35
        Top = 88
        Width = 36
        Height = 14
        Caption = 'Middle'
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Left = 35
        Top = 142
        Width = 52
        Height = 14
        Caption = 'Birthdate'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Left = 35
        Top = 166
        Width = 58
        Height = 14
        Caption = 'Civil status'
        Transparent = True
      end
      object JvLabel13: TJvLabel
        Left = 223
        Top = 142
        Width = 24
        Height = 14
        Caption = 'Age'
        Transparent = True
      end
      object JvLabel8: TJvLabel
        Left = 223
        Top = 166
        Width = 22
        Height = 14
        Caption = 'Sex'
        Transparent = True
      end
      object JvLabel35: TJvLabel
        Left = 35
        Top = 190
        Width = 66
        Height = 14
        Caption = 'Referred by'
        Transparent = True
      end
      object JvGroupHeader2: TJvGroupHeader
        Left = 19
        Top = 302
        Width = 302
        Height = 12
        Caption = 'Present Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvLabel4: TJvLabel
        Left = 35
        Top = 322
        Width = 37
        Height = 14
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Left = 35
        Top = 346
        Width = 51
        Height = 14
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Left = 35
        Top = 370
        Width = 70
        Height = 14
        Caption = 'City or town'
        Transparent = True
      end
      object urlCopyAddress: TRzURLLabel
        Left = 114
        Top = 461
        Width = 208
        Height = 13
        Caption = 'Copy present address to provincial address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlCopyAddressClick
      end
      object JvLabel14: TJvLabel
        Left = 35
        Top = 394
        Width = 62
        Height = 14
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel15: TJvLabel
        Left = 35
        Top = 418
        Width = 48
        Height = 14
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel16: TJvLabel
        Left = 35
        Top = 442
        Width = 45
        Height = 14
        Caption = 'Contact'
        Transparent = True
      end
      object JvGroupHeader4: TJvGroupHeader
        Left = 336
        Top = 20
        Width = 278
        Height = 12
        Caption = 'Provincial Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvLabel9: TJvLabel
        Left = 352
        Top = 40
        Width = 37
        Height = 14
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel10: TJvLabel
        Left = 352
        Top = 64
        Width = 51
        Height = 14
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel11: TJvLabel
        Left = 352
        Top = 88
        Width = 70
        Height = 14
        Caption = 'City or town'
        Transparent = True
      end
      object JvLabel17: TJvLabel
        Left = 352
        Top = 112
        Width = 62
        Height = 14
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel18: TJvLabel
        Left = 352
        Top = 136
        Width = 48
        Height = 14
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel19: TJvLabel
        Left = 352
        Top = 160
        Width = 45
        Height = 14
        Caption = 'Contact'
        Transparent = True
      end
      object JvGroupHeader5: TJvGroupHeader
        Left = 19
        Top = 212
        Width = 302
        Height = 12
        Caption = 'Contact Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvLabel20: TJvLabel
        Left = 35
        Top = 232
        Width = 29
        Height = 14
        Caption = 'Email'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Left = 35
        Top = 256
        Width = 54
        Height = 14
        Caption = 'Facebook'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Left = 35
        Top = 280
        Width = 81
        Height = 14
        Caption = 'Mobile/tel. no.'
        Transparent = True
      end
      object JvGroupHeader6: TJvGroupHeader
        Left = 336
        Top = 200
        Width = 278
        Height = 12
        Caption = 'Employment Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvLabel23: TJvLabel
        Left = 352
        Top = 220
        Width = 52
        Height = 14
        Caption = 'Employer'
        Transparent = True
      end
      object JvLabel24: TJvLabel
        Left = 352
        Top = 244
        Width = 45
        Height = 14
        Caption = 'Address'
        Transparent = True
      end
      object JvLabel25: TJvLabel
        Left = 352
        Top = 286
        Width = 67
        Height = 14
        Caption = 'Emp. status'
        Transparent = True
      end
      object JvLabel26: TJvLabel
        Left = 352
        Top = 310
        Width = 65
        Height = 14
        Caption = 'Designation'
        Transparent = True
      end
      object JvLabel27: TJvLabel
        Left = 352
        Top = 334
        Width = 61
        Height = 14
        Caption = 'Imm. head'
        Transparent = True
      end
      object JvLabel28: TJvLabel
        Left = 352
        Top = 358
        Width = 73
        Height = 14
        Caption = 'Service years'
        Transparent = True
      end
      object JvLabel29: TJvLabel
        Left = 352
        Top = 382
        Width = 74
        Height = 14
        Caption = 'Gross income'
        Transparent = True
      end
      object JvLabel30: TJvLabel
        Left = 352
        Top = 406
        Width = 45
        Height = 14
        Caption = 'Net pay'
        Transparent = True
      end
      object JvLabel31: TJvLabel
        Left = 643
        Top = 358
        Width = 77
        Height = 14
        Caption = 'Other income'
        Transparent = True
      end
      object JvLabel32: TJvLabel
        Left = 643
        Top = 286
        Width = 53
        Height = 14
        Caption = 'Acct. no.'
        Transparent = True
      end
      object JvLabel33: TJvLabel
        Left = 643
        Top = 310
        Width = 48
        Height = 14
        Caption = 'Card no.'
        Transparent = True
      end
      object JvLabel34: TJvLabel
        Left = 643
        Top = 220
        Width = 28
        Height = 14
        Caption = 'Bank'
        Transparent = True
      end
      object JvLabel36: TJvLabel
        Left = 643
        Top = 244
        Width = 39
        Height = 14
        Caption = 'Branch'
        Transparent = True
      end
      object urlTakePhoto: TRzURLLabel
        Left = 767
        Top = 178
        Width = 82
        Height = 13
        Caption = 'Take client photo'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlTakePhotoClick
      end
      object JvGroupHeader1: TJvGroupHeader
        Left = 19
        Top = 20
        Width = 302
        Height = 12
        Caption = 'Client Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object imgPhoto: TImage
        Left = 749
        Top = 178
        Width = 16
        Height = 16
        DragCursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000003284944415478DA75935D489351
          18C7FFFB70EF74882E97999B9618BA891B7E8CC6320C03D30B8711D945E528C5
          56D94506B54449A4222DC82BD33088902230044B24139424949953FCC069E485
          6E7E949BC38BD936F7D1F39AAD0C7AE0CF39EFE1FC7FCF739E735E4E301884C1
          60009FCF87482482402090F278BC74007B49E1A41FA435BFDF3FEDF57A975C2E
          177C3E1F7E07E72F40985028D4262727E7E5E7E79F48484848B5D96C313299CC
          61B55AE7FAFAFA3ECCCFCF0FB8DDEE61026CED02E8F57A1670ACA0A0E06C7171
          F1399A8BB85C2EA6A6A6A0542A110804D8ACAEAEAEAE97BDBDBDAF68FE711740
          A7D3C968A3A1BAFA761597CB1371382060184C2613341A0DD884B48D407ED783
          070D4D047E4A47B28500393939BAC6C6861A8542A1E1907B7575150B0B8BA0D2
          4147C1810389888B8B03BBD762B1988CC6DBF7C9FB2E0490CBE515DDDDDD8D7C
          3E4F6CB7DBB1BCBC02954A05A19081DBEDC1E4E424E2E3F743229150357E6751
          519191BC6D21406C6CEC8DC1C1C1871E8F9B373B3B87B4B43478454AE4AAA251
          567611972ACA303333438952C130427F6E6EEE2DF23E0E01C2C3C3AFF6F70FDC
          6318466C368F42ABD5E24AD523641F2D81F953075A9A6E62787818D9D96A783C
          1EE7F1E379B5E47D1202D0BD973437B71AB5DA23D9A3A326CA9486C92FEBB0D9
          059049BC50A5ECC1ECEC0CD46A0D8186CC9595971BC9DBF13720292323B3AAAD
          ED45B9C3B11661B14C212BEB30C4E218389D0E8C8D8D40A150A235D81EE8B1BE
          77B885DE1EF07101AE4008C0C274A5A565678CC6DAF34B4B8B989E1EC7C68613
          515162A4A767422A4D8476286FBDE4D4E93DCF7A9E9BE10FAAE10BFE02B08F86
          AE8F21C8F5E6E69606B95C857DFBE2111121C2E6A60B77BED663E4FB672C6E58
          974AF467A41D6FDF98B75F5110E66D007BF73B3276767636B057C9BE796A1875
          9D4193A00D492753F06F0C74F68700D1F41D4D95E8EAEAEAF4858585EAC8C8C8
          6DF3D6D6166AC6EF6268C5B4B9B2F1CD915E9E9130FD7A62025CF8C0F9538190
          FDFB68DC4F3A446B129297D602242EAD85D1680FD644D4C5971F4C5D6E5F1887
          8093053E07A123EC04DB8718FC2FAE09EAA979996434930C9032F8094DFA7274
          A32C12AB0000000049454E44AE426082}
      end
      object JvGroupHeader10: TJvGroupHeader
        Left = 627
        Top = 200
        Width = 222
        Height = 12
        Caption = 'Bank Account Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edLastname: TRzDBEdit
        Left = 114
        Top = 34
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'lastname'
        CharCase = ecUpperCase
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 0
      end
      object edFirstname: TRzDBEdit
        Left = 114
        Top = 58
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'firstname'
        CharCase = ecUpperCase
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 1
      end
      object edMiddlename: TRzDBEdit
        Left = 114
        Top = 82
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'middlename'
        CharCase = ecUpperCase
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 2
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 114
        Top = 148
        Width = 95
        Height = 22
        DataField = 'civil_status'
        DataSource = dmClient.dscPersonalInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmAux.dscCivilStatus
        TabOrder = 5
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object RzDBLookupComboBox2: TRzDBLookupComboBox
        Left = 255
        Top = 160
        Width = 66
        Height = 22
        DataField = 'gender'
        DataSource = dmClient.dscPersonalInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmAux.dscGender
        TabOrder = 6
        TabOnEnter = True
      end
      object RzGroupBox1: TRzGroupBox
        Left = 664
        Top = 18
        Width = 185
        Height = 157
        TabOrder = 18
        object imgClient: TImage
          Left = 1
          Top = 15
          Width = 183
          Height = 141
          Align = alClient
          Proportional = True
          ExplicitTop = 13
          ExplicitHeight = 146
        end
      end
      object edAge: TRzEdit
        Left = 255
        Top = 136
        Width = 66
        Height = 22
        TabStop = False
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
      end
      object bteReferee: TRzButtonEdit
        Tag = 1
        Left = 114
        Top = 184
        Width = 207
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 7
        AllowKeyEdit = False
        AltBtnHint = 'Clear referee'
        ButtonHint = 'Find referee'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteRefereeAltBtnClick
        OnButtonClick = bteRefereeButtonClick
      end
      object RzDBEdit4: TRzDBEdit
        Left = 114
        Top = 316
        Width = 207
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'st'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 12
      end
      object RzDBEdit5: TRzDBEdit
        Left = 114
        Top = 340
        Width = 207
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'brgy'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 13
      end
      object RzDBLookupComboBox3: TRzDBLookupComboBox
        Left = 114
        Top = 364
        Width = 207
        Height = 22
        DataField = 'post_code'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'post_code'
        ListField = 'town'
        ListSource = dmAux.dscTowns
        TabOrder = 14
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object RzDBLookupComboBox5: TRzDBLookupComboBox
        Left = 114
        Top = 388
        Width = 207
        Height = 22
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 15
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object bteLandlord: TRzButtonEdit
        Tag = 1
        Left = 114
        Top = 412
        Width = 207
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 16
        AllowKeyEdit = False
        AltBtnHint = 'Clear landlord'
        ButtonHint = 'Find landlord'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteLandlordAltBtnClick
        OnButtonClick = bteLandlordButtonClick
      end
      object edLandlordContact: TRzEdit
        Tag = 1
        Left = 114
        Top = 436
        Width = 207
        Height = 22
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOnEnter = True
        TabOrder = 17
      end
      object RzDBEdit6: TRzDBEdit
        Left = 427
        Top = 34
        Width = 187
        Height = 22
        DataSource = dmClient.dscAddressInfo2
        DataField = 'st'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 19
      end
      object RzDBEdit7: TRzDBEdit
        Left = 427
        Top = 58
        Width = 187
        Height = 22
        DataSource = dmClient.dscAddressInfo2
        DataField = 'brgy'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 20
      end
      object RzDBLookupComboBox4: TRzDBLookupComboBox
        Left = 427
        Top = 82
        Width = 187
        Height = 22
        DataField = 'post_code'
        DataSource = dmClient.dscAddressInfo2
        KeyField = 'post_code'
        ListField = 'town'
        ListSource = dmAux.dscTowns
        TabOrder = 21
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object RzDBLookupComboBox6: TRzDBLookupComboBox
        Left = 427
        Top = 106
        Width = 187
        Height = 22
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo2
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 22
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object bteLandlord2: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 130
        Width = 187
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 23
        AllowKeyEdit = False
        AltBtnHint = 'Clear landlord'
        ButtonHint = 'Find landlord'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteLandlord2AltBtnClick
        OnButtonClick = bteLandlord2ButtonClick
      end
      object edLandlordContact2: TRzEdit
        Tag = 1
        Left = 427
        Top = 154
        Width = 187
        Height = 22
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOnEnter = True
        TabOrder = 24
      end
      object RzDBEdit8: TRzDBEdit
        Left = 114
        Top = 250
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'fb_acct'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 9
      end
      object RzDBEdit9: TRzDBEdit
        Left = 114
        Top = 226
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'email_add'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 8
      end
      object RzDBEdit11: TRzDBEdit
        Left = 114
        Top = 274
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'mobile_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 10
      end
      object RzDBEdit10: TRzDBEdit
        Left = 219
        Top = 274
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'home_phone'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 11
      end
      object bteEmployer: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 214
        Width = 187
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 25
        AllowKeyEdit = False
        AltBtnHint = 'Clear employer'
        ButtonHint = 'Find employer'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteEmployerAltBtnClick
        OnButtonClick = bteEmployerButtonClick
      end
      object RzDBLookupComboBox7: TRzDBLookupComboBox
        Left = 427
        Top = 280
        Width = 187
        Height = 22
        DataField = 'emp_status'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscEmpStatus
        TabOrder = 27
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object mmEmployerAddress: TRzMemo
        Tag = 1
        Left = 427
        Top = 238
        Width = 187
        Height = 39
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 26
        TabOnEnter = True
      end
      object bteImmHead: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 328
        Width = 187
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 29
        AltBtnHint = 'Clear immediate head'
        ButtonHint = 'Find immediate head'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteImmHeadAltBtnClick
        OnButtonClick = bteImmHeadButtonClick
      end
      object RzDBEdit12: TRzDBEdit
        Left = 427
        Top = 352
        Width = 59
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'serv_len'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 30
      end
      object RzDBEdit15: TRzDBEdit
        Left = 694
        Top = 280
        Width = 155
        Height = 22
        DataSource = dmClient.dscAcctInfo
        DataField = 'acct_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 35
      end
      object RzDBEdit16: TRzDBEdit
        Left = 694
        Top = 304
        Width = 155
        Height = 22
        DataSource = dmClient.dscAcctInfo
        DataField = 'card_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 36
      end
      object RzDBLookupComboBox8: TRzDBLookupComboBox
        Left = 427
        Top = 304
        Width = 187
        Height = 22
        DataField = 'des_id'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'des_id'
        ListField = 'designation'
        ListSource = dmAux.dscDesignations
        TabOrder = 28
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object bteBank: TRzButtonEdit
        Tag = 1
        Left = 694
        Top = 214
        Width = 155
        Height = 22
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 33
        AllowKeyEdit = False
        AltBtnHint = 'Clear bank'
        ButtonHint = 'Find bank'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteBankAltBtnClick
        OnButtonClick = bteBankButtonClick
      end
      object mmBranch: TRzMemo
        Tag = 1
        Left = 694
        Top = 238
        Width = 155
        Height = 39
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 34
        TabOnEnter = True
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 427
        Top = 376
        Width = 187
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'gross_pay'
        Alignment = taLeftJustify
        TabOnEnter = True
        TabOrder = 31
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 427
        Top = 400
        Width = 187
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'net_pay'
        Alignment = taLeftJustify
        TabOnEnter = True
        TabOrder = 32
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object dteBirthdate: TRzDBDateTimeEdit
        Left = 114
        Top = 136
        Width = 95
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'birth_date'
        TabOnEnter = True
        TabOrder = 3
        OnChange = dteBirthdateChange
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object RzDBMemo1: TRzDBMemo
        Left = 643
        Top = 376
        Width = 207
        Height = 45
        DataField = 'oth_income'
        DataSource = dmClient.dscPersonalInfo
        TabOrder = 37
        TabOnEnter = True
      end
      object RzGroupBox2: TRzGroupBox
        Left = 19
        Top = 12
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Client Name'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
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
        TabOrder = 38
      end
      object RzGroupBox3: TRzGroupBox
        Left = 19
        Top = 114
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Personal Info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
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
        TabOrder = 39
      end
    end
    object tsReferences: TRzTabSheet
      Color = 14273211
      Caption = 'Family and references'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 921
      ExplicitHeight = 467
      object pnlFamRef: TRzPanel
        Left = 0
        Top = 0
        Width = 927
        Height = 554
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        ExplicitWidth = 921
        ExplicitHeight = 467
        DesignSize = (
          927
          554)
        object urlRefreshRefList: TRzURLLabel
          Left = 883
          Top = 167
          Width = 38
          Height = 13
          Hint = 'Refresh references list'
          Anchors = [akTop, akRight]
          Caption = 'Refresh'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = urlRefreshRefListClick
          ExplicitLeft = 877
        end
        object grRefList: TRzDBGrid
          Left = 6
          Top = 5
          Width = 915
          Height = 156
          Align = alTop
          DataSource = dmRef.dscRefInfo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AltRowShading = True
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'name'
              Title.Caption = 'Name'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ref_name'
              Title.Caption = 'Relation'
              Width = 100
              Visible = True
            end>
        end
        object pcDetail: TRzPageControl
          Left = 6
          Top = 198
          Width = 917
          Height = 351
          Hint = ''
          ActivePage = tsFamRefDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          ExplicitWidth = 911
          ExplicitHeight = 264
          FixedDimension = 20
          object tsFamRefDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Reference details'
            ExplicitWidth = 907
            ExplicitHeight = 240
            object JvLabel39: TJvLabel
              Left = 35
              Top = 100
              Width = 45
              Height = 14
              Caption = 'Relation'
              Transparent = True
            end
            object JvGroupHeader7: TJvGroupHeader
              Left = 19
              Top = 8
              Width = 263
              Height = 12
              Caption = 'Name and relation'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9134911
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object JvLabel40: TJvLabel
              Left = 35
              Top = 28
              Width = 54
              Height = 14
              Caption = 'Lastname'
              Transparent = True
            end
            object JvLabel41: TJvLabel
              Left = 35
              Top = 52
              Width = 54
              Height = 14
              Caption = 'Firstname'
              Transparent = True
            end
            object JvLabel42: TJvLabel
              Left = 35
              Top = 76
              Width = 36
              Height = 14
              Caption = 'Middle'
              Transparent = True
            end
            object JvGroupHeader8: TJvGroupHeader
              Left = 319
              Top = 80
              Width = 278
              Height = 12
              Caption = 'Address info'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9134911
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object JvLabel43: TJvLabel
              Left = 335
              Top = 100
              Width = 37
              Height = 14
              Caption = 'Street'
              Transparent = True
            end
            object JvLabel44: TJvLabel
              Left = 335
              Top = 124
              Width = 51
              Height = 14
              Caption = 'Barangay'
              Transparent = True
            end
            object JvLabel45: TJvLabel
              Left = 335
              Top = 148
              Width = 70
              Height = 14
              Caption = 'City or town'
              Transparent = True
            end
            object JvGroupHeader9: TJvGroupHeader
              Left = 319
              Top = 8
              Width = 278
              Height = 12
              Caption = 'Contact Info'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9134911
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object JvLabel46: TJvLabel
              Left = 335
              Top = 28
              Width = 61
              Height = 14
              Caption = 'Telephone'
              Transparent = True
            end
            object JvLabel47: TJvLabel
              Left = 335
              Top = 52
              Width = 36
              Height = 14
              Caption = 'Mobile'
              Transparent = True
            end
            object urlCopyClientAddress: TRzURLLabel
              Tag = 1
              Left = 410
              Top = 167
              Width = 94
              Height = 13
              Caption = 'Copy client address'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = urlCopyClientAddressClick
            end
            object JvLabel48: TJvLabel
              Left = 35
              Top = 169
              Width = 56
              Height = 14
              Caption = 'Education'
              Transparent = True
            end
            object RzDBLookupComboBox9: TRzDBLookupComboBox
              Tag = 1
              Left = 114
              Top = 94
              Width = 168
              Height = 22
              DataField = 'ref_type'
              DataSource = dmRef.dscRefInfo
              KeyField = 'ref_type'
              ListField = 'ref_name'
              ListSource = dmAux.dscRefType
              TabOrder = 3
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
              TabOnEnter = True
            end
            object RzDBEdit1: TRzDBEdit
              Left = 114
              Top = 70
              Width = 168
              Height = 22
              DataSource = dmRef.dscPersonalInfo
              DataField = 'middlename'
              ReadOnly = True
              CharCase = ecUpperCase
              Color = clInfoBk
              TabOrder = 2
            end
            object RzDBEdit2: TRzDBEdit
              Left = 114
              Top = 46
              Width = 168
              Height = 22
              DataSource = dmRef.dscPersonalInfo
              DataField = 'firstname'
              ReadOnly = True
              CharCase = ecUpperCase
              Color = clInfoBk
              TabOrder = 1
            end
            object RzDBEdit3: TRzDBEdit
              Left = 114
              Top = 22
              Width = 168
              Height = 22
              DataSource = dmRef.dscPersonalInfo
              DataField = 'lastname'
              ReadOnly = True
              CharCase = ecUpperCase
              Color = clInfoBk
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 0
            end
            object RzDBCheckBox1: TRzDBCheckBox
              Tag = 1
              Left = 114
              Top = 121
              Width = 81
              Height = 16
              DataField = 'is_dependent'
              DataSource = dmRef.dscRefInfo
              ValueChecked = '1'
              ValueUnchecked = '0'
              Caption = 'Dependent'
              TabOnEnter = True
              TabOrder = 4
            end
            object RzDBCheckBox2: TRzDBCheckBox
              Tag = 1
              Left = 114
              Top = 142
              Width = 64
              Height = 16
              DataField = 'is_student'
              DataSource = dmRef.dscRefInfo
              ValueChecked = '1'
              ValueUnchecked = '0'
              Caption = 'Student'
              TabOnEnter = True
              TabOrder = 5
            end
            object RzDBLookupComboBox10: TRzDBLookupComboBox
              Tag = 1
              Left = 410
              Top = 142
              Width = 187
              Height = 22
              DataField = 'post_code'
              DataSource = dmRef.dscAddressInfo
              KeyField = 'post_code'
              ListField = 'town'
              ListSource = dmAux.dscTowns
              TabOrder = 11
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
              TabOnEnter = True
            end
            object RzDBEdit13: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 118
              Width = 187
              Height = 22
              DataSource = dmRef.dscAddressInfo
              DataField = 'brgy'
              Ctl3D = True
              ParentCtl3D = False
              TabOnEnter = True
              TabOrder = 10
            end
            object RzDBEdit14: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 94
              Width = 187
              Height = 22
              DataSource = dmRef.dscAddressInfo
              DataField = 'st'
              Ctl3D = True
              ParentCtl3D = False
              TabOnEnter = True
              TabOrder = 9
            end
            object RzDBEdit19: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 22
              Width = 187
              Height = 22
              DataSource = dmRef.dscContactInfo
              DataField = 'home_phone'
              Ctl3D = True
              ParentCtl3D = False
              TabOnEnter = True
              TabOrder = 7
            end
            object RzDBEdit20: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 46
              Width = 187
              Height = 22
              DataSource = dmRef.dscContactInfo
              DataField = 'mobile_no'
              Ctl3D = True
              ParentCtl3D = False
              TabOnEnter = True
              TabOrder = 8
            end
            object RzDBLookupComboBox11: TRzDBLookupComboBox
              Tag = 1
              Left = 114
              Top = 163
              Width = 168
              Height = 22
              DataField = 'educ_code'
              DataSource = dmRef.dscRefInfo
              KeyField = 'value'
              ListField = 'display'
              ListSource = dmRef.dscEducCode
              TabOrder = 6
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
              TabOnEnter = True
            end
          end
        end
        object btnNewRef: TRzButton
          Left = 6
          Top = 167
          Width = 131
          Hint = 'New reference'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'New reference'
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = btnNewRefClick
        end
        object btnRemoveRef: TRzButton
          Left = 143
          Top = 167
          Width = 146
          Hint = 'Remove reference'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'Remove reference'
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = False
          OnClick = btnRemoveRefClick
        end
      end
    end
    object tsIdentityInfo: TRzTabSheet
      Color = 14273211
      Caption = 'Identity information'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 921
      ExplicitHeight = 467
      object pnlIdentity: TRzPanel
        Left = 0
        Top = 0
        Width = 927
        Height = 554
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        ExplicitWidth = 921
        ExplicitHeight = 467
        DesignSize = (
          927
          554)
        object urlRefreshIdentList: TRzURLLabel
          Left = 883
          Top = 239
          Width = 38
          Height = 13
          Hint = 'Refresh identity document list'
          Anchors = [akTop, akRight]
          Caption = 'Refresh'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = urlRefreshIdentListClick
          ExplicitLeft = 877
        end
        object grIdentityList: TRzDBGrid
          Left = 6
          Top = 5
          Width = 915
          Height = 228
          Align = alTop
          DataSource = dmClient.dscIdentInfo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          QuickCompare.FieldName = 'expiry'
          QuickCompare.FieldValue = 42644d
          QuickCompare.Operation = qcoLessThan
          QuickCompare.Color = 14277119
          QuickCompare.FontColor = clRed
          AltRowShading = True
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'ident_name'
              Title.Caption = 'Type'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ident_no'
              Title.Caption = 'ID Number'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'exp_date'
              Title.Caption = 'Expiry '
              Width = 150
              Visible = True
            end>
        end
        object RzPageControl1: TRzPageControl
          Left = 6
          Top = 270
          Width = 917
          Height = 279
          Hint = ''
          ActivePage = tsIdentDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          ExplicitWidth = 911
          ExplicitHeight = 192
          FixedDimension = 20
          object tsIdentDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Identity document details'
            ExplicitWidth = 907
            ExplicitHeight = 168
            object JvLabel37: TJvLabel
              Left = 19
              Top = 23
              Width = 30
              Height = 14
              Caption = 'Type'
              Transparent = True
            end
            object JvLabel38: TJvLabel
              Left = 19
              Top = 44
              Width = 60
              Height = 14
              Caption = 'ID number'
              Transparent = True
            end
            object lblExpiry: TJvLabel
              Left = 19
              Top = 68
              Width = 34
              Height = 14
              Caption = 'Expiry'
              Transparent = True
            end
            object edIdNo: TRzDBEdit
              Left = 105
              Top = 38
              Width = 207
              Height = 22
              DataSource = dmClient.dscIdentInfo
              DataField = 'ident_no'
              CharCase = ecUpperCase
              TabOnEnter = True
              TabOrder = 1
            end
            object cmbIdType: TRzDBLookupComboBox
              Left = 105
              Top = 14
              Width = 207
              Height = 22
              DataField = 'ident_type'
              DataSource = dmClient.dscIdentInfo
              KeyField = 'ident_type'
              ListField = 'ident_name'
              ListSource = dmAux.dscIdentType
              TabOrder = 0
              OnClick = cmbIdTypeClick
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
              TabOnEnter = True
            end
            object chbNoExpiry: TRzDBCheckBox
              Left = 223
              Top = 65
              Width = 70
              Height = 16
              DataField = 'has_expiry'
              DataSource = dmAux.dscIdentType
              NullAsUnchecked = False
              ValueChecked = '0'
              ValueUnchecked = '1'
              Caption = 'No expiry'
              TabOrder = 3
            end
            object dteExpiry: TRzDBDateTimeEdit
              Left = 105
              Top = 62
              Width = 112
              Height = 22
              DataSource = dmClient.dscIdentInfo
              DataField = 'exp_date'
              TabOnEnter = True
              TabOrder = 2
              EditType = etDate
              Format = 'mm/dd/yyyy'
            end
          end
        end
        object btnNewId: TRzButton
          Left = 6
          Top = 239
          Width = 131
          Hint = 'New identity document'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'New identity document'
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = btnNewIdClick
        end
        object btnRemoveId: TRzButton
          Left = 143
          Top = 239
          Width = 146
          Hint = 'Remove identity document'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'Remove identity document'
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = False
          OnClick = btnRemoveIdClick
        end
      end
    end
    object tsLoansHistory: TRzTabSheet
      Color = 14273211
      Caption = 'Loans history'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 921
      ExplicitHeight = 467
      object pnlLoans: TRzPanel
        Left = 0
        Top = 0
        Width = 927
        Height = 554
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        ExplicitWidth = 921
        ExplicitHeight = 467
        DesignSize = (
          927
          554)
        object JvLabel63: TJvLabel
          Tag = -1
          Left = 7
          Top = 13
          Width = 37
          Height = 14
          Caption = 'Status'
          Transparent = True
        end
        object grLoans: TRzDBGrid
          Left = 6
          Top = 32
          Width = 915
          Height = 516
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dmClient.dscLoans
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AltRowShading = True
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'loan_id'
              Title.Caption = 'Loan ID'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'class_name'
              Title.Caption = 'Loan class'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status_name'
              Title.Caption = 'Status'
              Width = 150
              Visible = True
            end>
        end
        object RzComboBox1: TRzComboBox
          Left = 46
          Top = 7
          Width = 869
          Height = 22
          TabOrder = 1
        end
      end
    end
    object tsLoanClassAccess: TRzTabSheet
      Color = 14273211
      Caption = 'Loan class accessibility'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 921
      ExplicitHeight = 467
      DesignSize = (
        927
        554)
      object JvGroupHeader15: TJvGroupHeader
        Left = 19
        Top = 20
        Width = 892
        Height = 12
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Available loan class'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitWidth = 886
      end
      object JvGroupHeader16: TJvGroupHeader
        Left = 19
        Top = 310
        Width = 892
        Height = 12
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Accessible loan class'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitWidth = 886
      end
      object grAvailList: TRzDBGrid
        Left = 19
        Top = 35
        Width = 892
        Height = 230
        Anchors = [akLeft, akTop, akRight]
        DataSource = dmClient.dscLoanClassAvail
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        AltRowShading = True
        AltRowShadingColor = 15854564
        Columns = <
          item
            Expanded = False
            FieldName = 'grp_name'
            Title.Caption = 'Group'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'class_name'
            Title.Caption = 'Class name'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'loan_name'
            Title.Caption = 'Loan type'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acct_name'
            Title.Caption = 'Account type'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'int_rate_f'
            Title.Alignment = taRightJustify
            Title.Caption = 'Int %'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'term'
            Title.Alignment = taRightJustify
            Title.Caption = 'Term'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'comakers'
            Title.Alignment = taRightJustify
            Title.Caption = 'CM'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'max_loan_f'
            Title.Caption = 'Max. loanable'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comp_method'
            Title.Caption = 'Computation method'
            Width = 115
            Visible = True
          end>
      end
      object btnMakeAccessible: TRzButton
        Left = 19
        Top = 271
        Width = 131
        Hint = 'Make loan class accesible to client'
        FrameColor = clBlack
        ShowFocusRect = False
        Caption = 'Make accessible'
        HotTrackColor = clMoneyGreen
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = btnMakeAccessibleClick
      end
      object grAccessList: TRzDBGrid
        Left = 19
        Top = 325
        Width = 892
        Height = 100
        Anchors = [akLeft, akTop, akRight]
        DataSource = dmClient.dscClientLoanClass
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        AltRowShading = True
        AltRowShadingColor = 15854564
        Columns = <
          item
            Expanded = False
            FieldName = 'grp_name'
            Title.Caption = 'Group'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'class_name'
            Title.Caption = 'Class name'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'loan_name'
            Title.Caption = 'Loan type'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acct_name'
            Title.Caption = 'Account type'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'int_rate_f'
            Title.Alignment = taRightJustify
            Title.Caption = 'Int %'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'term'
            Title.Alignment = taRightJustify
            Title.Caption = 'Term'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'comakers'
            Title.Alignment = taRightJustify
            Title.Caption = 'CM'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'max_loan_f'
            Title.Caption = 'Max. loanable'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comp_method'
            Title.Caption = 'Computation method'
            Width = 115
            Visible = True
          end>
      end
      object btnRemoveAccessibility: TRzButton
        Left = 19
        Top = 431
        Width = 131
        Hint = 'Remove loan class accessibility'
        FrameColor = clBlack
        ShowFocusRect = False
        Caption = 'Remove accesibility'
        HotTrackColor = clMoneyGreen
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = btnRemoveAccessibilityClick
      end
    end
  end
  object PhotoLauncher: TRzLauncher
    Action = 'Open'
    FileName = 'PhotoUtil.exe'
    Timeout = -1
    OnFinished = PhotoLauncherFinished
    Left = 897
    Top = 516
  end
end
