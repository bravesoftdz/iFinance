inherited frmClientMain: TfrmClientMain
  Caption = 'frmClientMain'
  ClientHeight = 520
  ClientWidth = 923
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 939
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 923
    ExplicitWidth = 923
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Client record'
      ExplicitWidth = 78
    end
    object lblClientName: TRzLabel
      Left = 790
      Top = 6
      Width = 82
      Height = 14
      Alignment = taRightJustify
      Caption = 'NEW RECORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4235263
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pcClient: TRzPageControl
    Left = 0
    Top = 28
    Width = 923
    Height = 492
    Hint = ''
    ActivePage = tsClientInfo
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    OnChange = pcClientChange
    OnChanging = pcClientChanging
    ExplicitTop = 27
    FixedDimension = 19
    object tsClientInfo: TRzTabSheet
      Caption = 'Client information'
      object JvLabel1: TJvLabel
        Left = 35
        Top = 40
        Width = 48
        Height = 13
        Caption = 'Lastname'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Left = 35
        Top = 64
        Width = 49
        Height = 13
        Caption = 'Firstname'
        Transparent = True
      end
      object JvLabel3: TJvLabel
        Left = 35
        Top = 88
        Width = 32
        Height = 13
        Caption = 'Middle'
        Transparent = True
      end
      object JvGroupHeader3: TJvGroupHeader
        Left = 19
        Top = 110
        Width = 302
        Height = 12
        Caption = 'Personal Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Left = 35
        Top = 130
        Width = 46
        Height = 13
        Caption = 'Birthdate'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Left = 35
        Top = 154
        Width = 54
        Height = 13
        Caption = 'Civil status'
        Transparent = True
      end
      object JvLabel13: TJvLabel
        Left = 223
        Top = 130
        Width = 21
        Height = 13
        Caption = 'Age'
        Transparent = True
      end
      object JvLabel8: TJvLabel
        Left = 223
        Top = 154
        Width = 20
        Height = 13
        Caption = 'Sex'
        Transparent = True
      end
      object JvLabel35: TJvLabel
        Left = 35
        Top = 178
        Width = 60
        Height = 13
        Caption = 'Referred by'
        Transparent = True
      end
      object JvGroupHeader2: TJvGroupHeader
        Left = 19
        Top = 290
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
        Top = 310
        Width = 32
        Height = 13
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Left = 35
        Top = 334
        Width = 48
        Height = 13
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Left = 35
        Top = 358
        Width = 61
        Height = 13
        Caption = 'City or town'
        Transparent = True
      end
      object urlCopyAddress: TRzURLLabel
        Left = 114
        Top = 449
        Width = 208
        Height = 13
        Caption = 'Copy present address to provincial address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlCopyAddressClick
      end
      object JvLabel14: TJvLabel
        Left = 35
        Top = 382
        Width = 57
        Height = 13
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel15: TJvLabel
        Left = 35
        Top = 406
        Width = 43
        Height = 13
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel16: TJvLabel
        Left = 35
        Top = 430
        Width = 40
        Height = 13
        Caption = 'Contact'
        Transparent = True
      end
      object JvGroupHeader4: TJvGroupHeader
        Left = 347
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
        Left = 363
        Top = 40
        Width = 32
        Height = 13
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel10: TJvLabel
        Left = 363
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel11: TJvLabel
        Left = 363
        Top = 88
        Width = 61
        Height = 13
        Caption = 'City or town'
        Transparent = True
      end
      object JvLabel17: TJvLabel
        Left = 363
        Top = 112
        Width = 57
        Height = 13
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel18: TJvLabel
        Left = 363
        Top = 136
        Width = 43
        Height = 13
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel19: TJvLabel
        Left = 363
        Top = 160
        Width = 40
        Height = 13
        Caption = 'Contact'
        Transparent = True
      end
      object JvGroupHeader5: TJvGroupHeader
        Left = 19
        Top = 200
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
        Top = 220
        Width = 26
        Height = 13
        Caption = 'Email'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Left = 35
        Top = 244
        Width = 48
        Height = 13
        Caption = 'Facebook'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Left = 35
        Top = 268
        Width = 71
        Height = 13
        Caption = 'Mobile/tel. no.'
        Transparent = True
      end
      object JvGroupHeader6: TJvGroupHeader
        Left = 347
        Top = 200
        Width = 502
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
        Left = 363
        Top = 220
        Width = 46
        Height = 13
        Caption = 'Employer'
        Transparent = True
      end
      object JvLabel24: TJvLabel
        Left = 363
        Top = 244
        Width = 41
        Height = 13
        Caption = 'Address'
        Transparent = True
      end
      object JvLabel25: TJvLabel
        Left = 363
        Top = 286
        Width = 59
        Height = 13
        Caption = 'Emp. status'
        Transparent = True
      end
      object JvLabel26: TJvLabel
        Left = 363
        Top = 310
        Width = 58
        Height = 13
        Caption = 'Designation'
        Transparent = True
      end
      object JvLabel27: TJvLabel
        Left = 363
        Top = 334
        Width = 53
        Height = 13
        Caption = 'Imm. head'
        Transparent = True
      end
      object JvLabel28: TJvLabel
        Left = 363
        Top = 358
        Width = 67
        Height = 13
        Caption = 'Service years'
        Transparent = True
      end
      object JvLabel29: TJvLabel
        Left = 363
        Top = 382
        Width = 65
        Height = 13
        Caption = 'Gross income'
        Transparent = True
      end
      object JvLabel30: TJvLabel
        Left = 363
        Top = 406
        Width = 40
        Height = 13
        Caption = 'Net pay'
        Transparent = True
      end
      object JvLabel31: TJvLabel
        Left = 363
        Top = 430
        Width = 66
        Height = 13
        Caption = 'Other income'
        Transparent = True
      end
      object JvLabel32: TJvLabel
        Left = 643
        Top = 286
        Width = 46
        Height = 13
        Caption = 'Acct. no.'
        Transparent = True
      end
      object JvLabel33: TJvLabel
        Left = 643
        Top = 310
        Width = 44
        Height = 13
        Caption = 'Card no.'
        Transparent = True
      end
      object JvLabel34: TJvLabel
        Left = 643
        Top = 220
        Width = 25
        Height = 13
        Caption = 'Bank'
        Transparent = True
      end
      object JvLabel36: TJvLabel
        Left = 643
        Top = 244
        Width = 35
        Height = 13
        Caption = 'Branch'
        Transparent = True
      end
      object urlTakePhoto: TRzURLLabel
        Left = 664
        Top = 181
        Width = 82
        Height = 13
        Caption = 'Take client photo'
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
        Height = 21
        DataSource = dmClient.dscPersonalInfo
        DataField = 'lastname'
        CharCase = ecUpperCase
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
      end
      object edFirstname: TRzDBEdit
        Left = 114
        Top = 58
        Width = 207
        Height = 21
        DataSource = dmClient.dscPersonalInfo
        DataField = 'firstname'
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edMiddlename: TRzDBEdit
        Left = 114
        Top = 82
        Width = 207
        Height = 21
        DataSource = dmClient.dscPersonalInfo
        DataField = 'middlename'
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 114
        Top = 148
        Width = 95
        Height = 21
        DataField = 'civil_status'
        DataSource = dmClient.dscPersonalInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscCivilStatus
        TabOrder = 5
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object RzDBLookupComboBox2: TRzDBLookupComboBox
        Left = 255
        Top = 148
        Width = 66
        Height = 21
        DataField = 'gender'
        DataSource = dmClient.dscPersonalInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscGender
        TabOrder = 6
      end
      object RzGroupBox1: TRzGroupBox
        Left = 664
        Top = 18
        Width = 185
        Height = 161
        TabOrder = 18
        object imgClient: TImage
          Left = 1
          Top = 14
          Width = 183
          Height = 146
          Align = alClient
          Proportional = True
          ExplicitTop = 13
        end
      end
      object edAge: TRzEdit
        Left = 255
        Top = 124
        Width = 66
        Height = 21
        TabStop = False
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
      end
      object bteReferee: TRzButtonEdit
        Left = 114
        Top = 173
        Width = 207
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
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
        Top = 304
        Width = 207
        Height = 21
        DataSource = dmClient.dscAddressInfo
        DataField = 'st'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 12
      end
      object RzDBEdit5: TRzDBEdit
        Left = 114
        Top = 328
        Width = 207
        Height = 21
        DataSource = dmClient.dscAddressInfo
        DataField = 'brgy'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 13
      end
      object RzDBLookupComboBox3: TRzDBLookupComboBox
        Left = 114
        Top = 352
        Width = 207
        Height = 21
        DataField = 'post_code'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'post_code'
        ListField = 'town'
        ListSource = dmAux.dscTowns
        TabOrder = 14
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object RzDBLookupComboBox5: TRzDBLookupComboBox
        Left = 114
        Top = 376
        Width = 207
        Height = 21
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 15
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object bteLandlord: TRzButtonEdit
        Left = 114
        Top = 400
        Width = 207
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
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
        Left = 114
        Top = 424
        Width = 207
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 17
      end
      object RzDBEdit6: TRzDBEdit
        Left = 438
        Top = 34
        Width = 187
        Height = 21
        DataSource = dmClient.dscAddressInfo2
        DataField = 'st'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 19
      end
      object RzDBEdit7: TRzDBEdit
        Left = 438
        Top = 58
        Width = 187
        Height = 21
        DataSource = dmClient.dscAddressInfo2
        DataField = 'brgy'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 20
      end
      object RzDBLookupComboBox4: TRzDBLookupComboBox
        Left = 438
        Top = 82
        Width = 187
        Height = 21
        DataField = 'post_code'
        DataSource = dmClient.dscAddressInfo2
        KeyField = 'post_code'
        ListField = 'town'
        ListSource = dmAux.dscTowns
        TabOrder = 21
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object RzDBLookupComboBox6: TRzDBLookupComboBox
        Left = 438
        Top = 106
        Width = 187
        Height = 21
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo2
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 22
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object bteLandlord2: TRzButtonEdit
        Left = 438
        Top = 130
        Width = 187
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
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
        Left = 438
        Top = 154
        Width = 187
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 24
      end
      object RzDBEdit8: TRzDBEdit
        Left = 114
        Top = 238
        Width = 207
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'fb_acct'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 9
      end
      object RzDBEdit9: TRzDBEdit
        Left = 114
        Top = 214
        Width = 207
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'email_add'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 8
      end
      object RzDBEdit11: TRzDBEdit
        Left = 114
        Top = 262
        Width = 102
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'mobile_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 10
      end
      object RzDBEdit10: TRzDBEdit
        Left = 219
        Top = 262
        Width = 102
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'home_phone'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 11
      end
      object bteEmployer: TRzButtonEdit
        Left = 438
        Top = 214
        Width = 187
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
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
        Left = 438
        Top = 280
        Width = 187
        Height = 21
        DataField = 'emp_status'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscEmpStatus
        TabOrder = 27
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object mmEmployerAddress: TRzMemo
        Left = 438
        Top = 238
        Width = 187
        Height = 39
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 26
      end
      object bteImmHead: TRzButtonEdit
        Left = 438
        Top = 328
        Width = 187
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
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
        Left = 438
        Top = 352
        Width = 59
        Height = 21
        DataSource = dmClient.dscEmplInfo
        DataField = 'serv_len'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 30
      end
      object RzDBEdit15: TRzDBEdit
        Left = 694
        Top = 280
        Width = 155
        Height = 21
        DataSource = dmClient.dscAcctInfo
        DataField = 'acct_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 36
      end
      object RzDBEdit16: TRzDBEdit
        Left = 694
        Top = 304
        Width = 155
        Height = 21
        DataSource = dmClient.dscAcctInfo
        DataField = 'card_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 37
      end
      object RzDBLookupComboBox8: TRzDBLookupComboBox
        Left = 438
        Top = 304
        Width = 187
        Height = 21
        DataField = 'des_id'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'des_id'
        ListField = 'designation'
        ListSource = dmAux.dscDesignations
        TabOrder = 28
        AllowNull = True
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object dtpBirthdate: TRzDateTimePicker
        Left = 114
        Top = 124
        Width = 95
        Height = 21
        Date = 42624.922021979170000000
        Format = 'MM/dd/yyyy'
        Time = 42624.922021979170000000
        TabOrder = 3
        OnChange = dtpBirthdateChange
      end
      object bteBank: TRzButtonEdit
        Left = 694
        Top = 214
        Width = 155
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 34
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
      object bteOtherIncome: TRzButtonEdit
        Left = 438
        Top = 424
        Width = 187
        Height = 21
        Text = ''
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 33
        AllowKeyEdit = False
        AltBtnHint = 'Clear other income'
        ButtonHint = 'Find other income'
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
      object mmBranch: TRzMemo
        Left = 694
        Top = 238
        Width = 155
        Height = 39
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 35
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 438
        Top = 376
        Width = 187
        Height = 21
        DataSource = dmClient.dscEmplInfo
        DataField = 'gross_pay'
        Alignment = taLeftJustify
        TabOrder = 31
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 438
        Top = 400
        Width = 187
        Height = 21
        DataSource = dmClient.dscEmplInfo
        DataField = 'net_pay'
        Alignment = taLeftJustify
        TabOrder = 32
        DisplayFormat = '###,##0.00'
      end
    end
    object tsReferences: TRzTabSheet
      Caption = 'Family and personal references'
      object pnlList: TRzPanel
        Left = 0
        Top = 0
        Width = 921
        Height = 468
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        DesignSize = (
          921
          468)
        object grList: TRzDBGrid
          Left = 6
          Top = 5
          Width = 909
          Height = 228
          Align = alTop
          DataSource = dmEntities.dscGroups
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AltRowShading = True
          AltRowShadingColor = 15854564
        end
        object pcDetail: TRzPageControl
          Left = 6
          Top = 239
          Width = 911
          Height = 224
          Hint = ''
          ActivePage = tsDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          FixedDimension = 19
          object tsDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Change caption here'
          end
        end
      end
    end
    object tsIdentityInfo: TRzTabSheet
      Caption = 'Identity information'
      object pnlIdentity: TRzPanel
        Left = 0
        Top = 0
        Width = 921
        Height = 468
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        DesignSize = (
          921
          468)
        object grIdentityList: TRzDBGrid
          Left = 6
          Top = 5
          Width = 909
          Height = 228
          Align = alTop
          DataSource = dmClient.dscIdentInfo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
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
          Width = 911
          Height = 193
          Hint = ''
          ActivePage = tsIdentDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          FixedDimension = 19
          object tsIdentDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Identity document details'
            ExplicitHeight = 201
            object JvLabel37: TJvLabel
              Left = 19
              Top = 23
              Width = 26
              Height = 13
              Caption = 'Type'
              Transparent = True
            end
            object JvLabel38: TJvLabel
              Left = 19
              Top = 44
              Width = 52
              Height = 13
              Caption = 'ID number'
              Transparent = True
            end
            object JvLabel39: TJvLabel
              Left = 19
              Top = 68
              Width = 32
              Height = 13
              Caption = 'Expiry'
              Transparent = True
            end
            object edIdNo: TRzDBEdit
              Left = 105
              Top = 38
              Width = 207
              Height = 21
              DataSource = dmClient.dscIdentInfo
              DataField = 'ident_no'
              CharCase = ecUpperCase
              TabOrder = 0
              OnChange = edIdNoChange
            end
            object cmbIdType: TRzDBLookupComboBox
              Left = 105
              Top = 14
              Width = 207
              Height = 21
              DataField = 'ident_type'
              DataSource = dmClient.dscIdentInfo
              KeyField = 'ident_type'
              ListField = 'ident_name'
              ListSource = dmAux.dscIdentType
              TabOrder = 1
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
            end
            object dtpExpiry: TRzDateTimePicker
              Left = 105
              Top = 62
              Width = 95
              Height = 21
              Date = 42624.922021979170000000
              Format = 'MM/dd/yyyy'
              Time = 42624.922021979170000000
              TabOrder = 2
              OnChange = dtpExpiryChange
            end
            object chbNonExpiring: TRzCheckBox
              Left = 206
              Top = 65
              Width = 80
              Height = 15
              Caption = 'Non-expiring'
              ReadOnly = True
              State = cbUnchecked
              TabOrder = 3
            end
          end
        end
        object btnNew: TRzButton
          Left = 6
          Top = 239
          Width = 131
          Hint = 'New branch'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'New identity document'
          Color = clMoneyGreen
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = btnNewClick
        end
      end
    end
    object tsLoansHistory: TRzTabSheet
      Caption = 'Loans history'
      object RzPanel2: TRzPanel
        Left = 0
        Top = 0
        Width = 921
        Height = 468
        Align = alClient
        BorderOuter = fsFlat
        BorderSides = [sdLeft, sdRight]
        BorderWidth = 5
        TabOrder = 0
        DesignSize = (
          921
          468)
        object RzDBGrid2: TRzDBGrid
          Left = 6
          Top = 5
          Width = 909
          Height = 228
          Align = alTop
          DataSource = dmEntities.dscGroups
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AltRowShading = True
          AltRowShadingColor = 15854564
        end
        object RzPageControl2: TRzPageControl
          Left = 6
          Top = 239
          Width = 911
          Height = 224
          Hint = ''
          ActivePage = RzTabSheet2
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          FixedDimension = 19
          object RzTabSheet2: TRzTabSheet
            Color = 15263976
            Caption = 'Change caption here'
          end
        end
      end
    end
  end
  object PhotoLauncher: TRzLauncher
    Action = 'Open'
    FileName = 'PhotoUtil.exe'
    Timeout = -1
    OnFinished = PhotoLauncherFinished
    Left = 785
    Top = 61
  end
end
