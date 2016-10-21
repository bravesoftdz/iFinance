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
      Left = 830
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
    end
  end
  object pcClient: TRzPageControl
    Left = 0
    Top = 28
    Width = 923
    Height = 492
    Hint = ''
    ActivePage = tsLoansHistory
    Align = alClient
    TabIndex = 3
    TabOrder = 1
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    OnChange = pcClientChange
    OnChanging = pcClientChanging
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
        Tag = 1
        Left = 114
        Top = 172
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
        Tag = 1
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
        Tag = 1
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
        Tag = 1
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
        Tag = 1
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
        Tag = 1
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
        Tag = 1
        Left = 438
        Top = 238
        Width = 187
        Height = 39
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 26
      end
      object bteImmHead: TRzButtonEdit
        Tag = 1
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
      object bteBank: TRzButtonEdit
        Tag = 1
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
        Tag = 1
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
        Tag = 1
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
      object dteBirthdate: TRzDBDateTimeEdit
        Left = 114
        Top = 124
        Width = 95
        Height = 21
        DataSource = dmClient.dscPersonalInfo
        DataField = 'birth_date'
        TabOrder = 3
        OnChange = dteBirthdateChange
        EditType = etDate
      end
    end
    object tsReferences: TRzTabSheet
      Caption = 'Family and references'
      object pnlFamRef: TRzPanel
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
        object urlRefreshRefList: TRzURLLabel
          Left = 877
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
        end
        object grRefList: TRzDBGrid
          Left = 6
          Top = 5
          Width = 909
          Height = 156
          Align = alTop
          DataSource = dmRef.dscRefInfo
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
          Width = 911
          Height = 265
          Hint = ''
          ActivePage = tsFamRefDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          FixedDimension = 19
          object tsFamRefDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Reference details'
            object JvLabel39: TJvLabel
              Left = 35
              Top = 100
              Width = 41
              Height = 13
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
              Width = 48
              Height = 13
              Caption = 'Lastname'
              Transparent = True
            end
            object JvLabel41: TJvLabel
              Left = 35
              Top = 52
              Width = 49
              Height = 13
              Caption = 'Firstname'
              Transparent = True
            end
            object JvLabel42: TJvLabel
              Left = 35
              Top = 76
              Width = 32
              Height = 13
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
              Width = 32
              Height = 13
              Caption = 'Street'
              Transparent = True
            end
            object JvLabel44: TJvLabel
              Left = 335
              Top = 124
              Width = 48
              Height = 13
              Caption = 'Barangay'
              Transparent = True
            end
            object JvLabel45: TJvLabel
              Left = 335
              Top = 148
              Width = 61
              Height = 13
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
              Width = 52
              Height = 13
              Caption = 'Telephone'
              Transparent = True
            end
            object JvLabel47: TJvLabel
              Left = 335
              Top = 52
              Width = 32
              Height = 13
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
              Width = 49
              Height = 13
              Caption = 'Education'
              Transparent = True
            end
            object RzDBLookupComboBox9: TRzDBLookupComboBox
              Tag = 1
              Left = 114
              Top = 94
              Width = 168
              Height = 21
              DataField = 'ref_type'
              DataSource = dmRef.dscRefInfo
              KeyField = 'ref_type'
              ListField = 'ref_name'
              ListSource = dmAux.dscRefType
              TabOrder = 3
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
            end
            object RzDBEdit1: TRzDBEdit
              Left = 114
              Top = 70
              Width = 168
              Height = 21
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
              Height = 21
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
              Height = 21
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
              Width = 72
              Height = 15
              DataField = 'is_dependent'
              DataSource = dmRef.dscRefInfo
              ValueChecked = '1'
              ValueUnchecked = '0'
              Caption = 'Dependent'
              TabOrder = 4
            end
            object RzDBCheckBox2: TRzDBCheckBox
              Tag = 1
              Left = 114
              Top = 142
              Width = 57
              Height = 15
              DataField = 'is_student'
              DataSource = dmRef.dscRefInfo
              ValueChecked = '1'
              ValueUnchecked = '0'
              Caption = 'Student'
              TabOrder = 5
            end
            object RzDBLookupComboBox10: TRzDBLookupComboBox
              Tag = 1
              Left = 410
              Top = 142
              Width = 187
              Height = 21
              DataField = 'post_code'
              DataSource = dmRef.dscAddressInfo
              KeyField = 'post_code'
              ListField = 'town'
              ListSource = dmAux.dscTowns
              TabOrder = 11
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
            end
            object RzDBEdit13: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 118
              Width = 187
              Height = 21
              DataSource = dmRef.dscAddressInfo
              DataField = 'brgy'
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 10
            end
            object RzDBEdit14: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 94
              Width = 187
              Height = 21
              DataSource = dmRef.dscAddressInfo
              DataField = 'st'
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 9
            end
            object RzDBEdit19: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 22
              Width = 187
              Height = 21
              DataSource = dmRef.dscContactInfo
              DataField = 'home_phone'
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 7
            end
            object RzDBEdit20: TRzDBEdit
              Tag = 1
              Left = 410
              Top = 46
              Width = 187
              Height = 21
              DataSource = dmRef.dscContactInfo
              DataField = 'mobile_no'
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 8
            end
            object RzDBLookupComboBox11: TRzDBLookupComboBox
              Tag = 1
              Left = 114
              Top = 163
              Width = 168
              Height = 21
              DataField = 'educ_code'
              DataSource = dmRef.dscRefInfo
              KeyField = 'value'
              ListField = 'display'
              ListSource = dmRef.dscEducCode
              TabOrder = 6
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
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
        object urlRefreshIdentList: TRzURLLabel
          Left = 877
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
        end
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
            object lblExpiry: TJvLabel
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
              TabOrder = 1
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
              TabOrder = 0
              OnClick = cmbIdTypeClick
              AllowNull = True
              FrameColor = clBlack
              FrameHotColor = clBlack
            end
            object chbNoExpiry: TRzDBCheckBox
              Left = 223
              Top = 65
              Width = 65
              Height = 15
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
              Height = 21
              DataSource = dmClient.dscIdentInfo
              DataField = 'exp_date'
              TabOrder = 2
              EditType = etDate
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
      Caption = 'Loans history'
      object pnlLoans: TRzPanel
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
        object grLoans: TRzDBGrid
          Left = 6
          Top = 5
          Width = 909
          Height = 228
          Align = alTop
          DataSource = dmClient.dscLoans
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
              FieldName = 'loan_id'
              Title.Caption = 'Loan ID'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'class_name'
              Title.Caption = 'Loan class'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_appl_f'
              Title.Caption = 'Date applied'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'amt_appl_f'
              Title.Caption = 'Amt. applied'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_appv_f'
              Title.Caption = 'Date approved'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'amt_appv_f'
              Title.Caption = 'Amt. approved'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status_name'
              Title.Caption = 'Status'
              Width = 75
              Visible = True
            end>
        end
        object RzPageControl2: TRzPageControl
          Left = 6
          Top = 239
          Width = 911
          Height = 224
          Hint = ''
          ActivePage = tsLoansDetail
          Anchors = [akLeft, akTop, akRight, akBottom]
          UseColoredTabs = True
          TabIndex = 0
          TabOrder = 1
          FixedDimension = 19
          object tsLoansDetail: TRzTabSheet
            Color = 15263976
            Caption = 'Loan details'
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
    Left = 897
    Top = 517
  end
end
