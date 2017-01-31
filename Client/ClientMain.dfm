inherited frmClientMain: TfrmClientMain
  Caption = 'frmClientMain'
  ClientHeight = 580
  ClientWidth = 931
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 947
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 931
    ExplicitWidth = 931
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Client record'
      ExplicitWidth = 78
    end
    object lblClientName: TRzLabel
      Left = 838
      Top = 7
      Width = 82
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'NEW RECORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
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
    Width = 860
    Height = 552
    Hint = ''
    ActivePage = tsLoansHistory
    Anchors = [akLeft, akTop, akRight, akBottom]
    BoldCurrentTab = True
    FlatColor = 6572079
    ShowFullFrame = False
    ShowShadow = False
    TabIndex = 3
    TabOrder = 1
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    FixedDimension = 20
    object tsClientInfo: TRzTabSheet
      Color = 14273211
      Caption = 'Client information'
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
      object JvLabel4: TJvLabel
        Left = 35
        Top = 346
        Width = 37
        Height = 14
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Left = 35
        Top = 370
        Width = 51
        Height = 14
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Left = 35
        Top = 394
        Width = 70
        Height = 14
        Caption = 'City or town'
        Transparent = True
      end
      object urlCopyAddress: TRzURLLabel
        Left = 35
        Top = 491
        Width = 232
        Height = 14
        Caption = 'Copy present address to provincial address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlCopyAddressClick
      end
      object JvLabel14: TJvLabel
        Left = 35
        Top = 418
        Width = 62
        Height = 14
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel15: TJvLabel
        Left = 35
        Top = 442
        Width = 48
        Height = 14
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel16: TJvLabel
        Left = 35
        Top = 466
        Width = 45
        Height = 14
        Caption = 'Contact'
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
      object JvLabel20: TJvLabel
        Left = 35
        Top = 244
        Width = 29
        Height = 14
        Caption = 'Email'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Left = 35
        Top = 268
        Width = 54
        Height = 14
        Caption = 'Facebook'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Left = 35
        Top = 292
        Width = 68
        Height = 14
        Caption = 'Cell/Tel. no.'
        Transparent = True
      end
      object JvLabel23: TJvLabel
        Left = 352
        Top = 244
        Width = 52
        Height = 14
        Caption = 'Employer'
        Transparent = True
      end
      object JvLabel24: TJvLabel
        Left = 352
        Top = 268
        Width = 45
        Height = 14
        Caption = 'Address'
        Transparent = True
      end
      object JvLabel25: TJvLabel
        Left = 352
        Top = 322
        Width = 67
        Height = 14
        Caption = 'Emp. status'
        Transparent = True
      end
      object JvLabel26: TJvLabel
        Left = 352
        Top = 346
        Width = 65
        Height = 14
        Caption = 'Designation'
        Transparent = True
      end
      object JvLabel27: TJvLabel
        Left = 352
        Top = 370
        Width = 61
        Height = 14
        Caption = 'Imm. head'
        Transparent = True
      end
      object JvLabel28: TJvLabel
        Left = 352
        Top = 394
        Width = 73
        Height = 14
        Caption = 'Service years'
        Transparent = True
      end
      object JvLabel29: TJvLabel
        Left = 352
        Top = 418
        Width = 74
        Height = 14
        Caption = 'Gross income'
        Transparent = True
      end
      object JvLabel30: TJvLabel
        Left = 352
        Top = 442
        Width = 45
        Height = 14
        Caption = 'Net pay'
        Transparent = True
      end
      object JvLabel31: TJvLabel
        Left = 643
        Top = 394
        Width = 77
        Height = 14
        Caption = 'Other income'
        Transparent = True
      end
      object JvLabel32: TJvLabel
        Left = 643
        Top = 322
        Width = 53
        Height = 14
        Caption = 'Acct. no.'
        Transparent = True
      end
      object JvLabel33: TJvLabel
        Left = 643
        Top = 346
        Width = 48
        Height = 14
        Caption = 'Card no.'
        Transparent = True
      end
      object JvLabel34: TJvLabel
        Left = 643
        Top = 244
        Width = 28
        Height = 14
        Caption = 'Bank'
        Transparent = True
      end
      object JvLabel36: TJvLabel
        Left = 643
        Top = 268
        Width = 39
        Height = 14
        Caption = 'Branch'
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
        ReadOnlyColor = clWhite
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
        ReadOnlyColor = clWhite
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
        ReadOnlyColor = clWhite
        TabOnEnter = True
        TabOrder = 2
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 114
        Top = 160
        Width = 95
        Height = 22
        DataField = 'civil_status'
        DataSource = dmClient.dscPersonalInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmAux.dscCivilStatus
        TabOrder = 5
        AllowNull = True
        FlatButtonColor = 8675134
        FlatButtons = True
        FrameColor = 8675134
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
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
        FlatButtonColor = 8675134
        FlatButtons = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object edAge: TRzEdit
        Left = 255
        Top = 136
        Width = 66
        Height = 22
        TabStop = False
        Text = ''
        Color = 14273211
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 14273211
        TabOrder = 4
      end
      object bteReferee: TRzButtonEdit
        Tag = 1
        Left = 114
        Top = 184
        Width = 207
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
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
        FlatButtonColor = 8675134
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteRefereeAltBtnClick
        OnButtonClick = bteRefereeButtonClick
      end
      object RzDBEdit4: TRzDBEdit
        Left = 114
        Top = 340
        Width = 207
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'st'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 12
      end
      object RzDBEdit5: TRzDBEdit
        Left = 114
        Top = 364
        Width = 207
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'brgy'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 13
      end
      object RzDBLookupComboBox3: TRzDBLookupComboBox
        Left = 114
        Top = 388
        Width = 207
        Height = 22
        DataField = 'post_code'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'post_code'
        ListField = 'town'
        ListSource = dmAux.dscTowns
        TabOrder = 14
        AllowNull = True
        FlatButtonColor = 8675134
        FlatButtons = True
        FrameColor = 8675134
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object RzDBLookupComboBox5: TRzDBLookupComboBox
        Left = 114
        Top = 412
        Width = 207
        Height = 22
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 15
        AllowNull = True
        FlatButtonColor = 8675134
        FlatButtons = True
        FrameColor = 8675134
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteLandlord: TRzButtonEdit
        Tag = 1
        Left = 114
        Top = 436
        Width = 207
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
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
        Top = 460
        Width = 207
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = clWhite
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
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 18
      end
      object RzDBEdit7: TRzDBEdit
        Left = 427
        Top = 58
        Width = 187
        Height = 22
        DataSource = dmClient.dscAddressInfo2
        DataField = 'brgy'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 19
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
        TabOrder = 20
        AllowNull = True
        FlatButtons = True
        FrameColor = 8675134
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
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
        TabOrder = 21
        AllowNull = True
        FlatButtons = True
        FrameColor = 8675134
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteLandlord2: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 130
        Width = 187
        Height = 22
        Text = ''
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWindow
        ShowHint = True
        TabOnEnter = True
        TabOrder = 22
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
        Color = clWhite
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = clWhite
        TabOnEnter = True
        TabOrder = 23
      end
      object RzDBEdit8: TRzDBEdit
        Left = 114
        Top = 262
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'fb_acct'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 9
      end
      object RzDBEdit9: TRzDBEdit
        Left = 114
        Top = 238
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'email_add'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 8
      end
      object RzDBEdit11: TRzDBEdit
        Left = 114
        Top = 286
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'mobile_no'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 10
      end
      object RzDBEdit10: TRzDBEdit
        Left = 219
        Top = 286
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'home_phone'
        Ctl3D = True
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 11
      end
      object bteEmployer: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 238
        Width = 187
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
        ShowHint = True
        TabOnEnter = True
        TabOrder = 24
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
        Top = 316
        Width = 187
        Height = 22
        DataField = 'emp_status'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscEmpStatus
        TabOrder = 26
        AllowNull = True
        FlatButtonColor = 6572079
        FlatButtons = True
        FrameColor = 6572079
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object mmEmployerAddress: TRzMemo
        Tag = 1
        Left = 427
        Top = 262
        Width = 187
        Height = 52
        Color = clWhite
        ReadOnly = True
        TabOrder = 25
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = clWhite
        TabOnEnter = True
      end
      object bteImmHead: TRzButtonEdit
        Tag = 1
        Left = 427
        Top = 364
        Width = 187
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
        ShowHint = True
        TabOnEnter = True
        TabOrder = 28
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
        Top = 388
        Width = 59
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'serv_len'
        Ctl3D = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 29
      end
      object RzDBEdit15: TRzDBEdit
        Left = 699
        Top = 316
        Width = 160
        Height = 22
        DataSource = dmClient.dscAcctInfo
        DataField = 'acct_no'
        Ctl3D = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 34
      end
      object RzDBEdit16: TRzDBEdit
        Left = 699
        Top = 340
        Width = 160
        Height = 22
        DataSource = dmClient.dscAcctInfo
        DataField = 'card_no'
        Ctl3D = True
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 35
      end
      object RzDBLookupComboBox8: TRzDBLookupComboBox
        Left = 427
        Top = 340
        Width = 187
        Height = 22
        DataField = 'des_id'
        DataSource = dmClient.dscEmplInfo
        KeyField = 'des_id'
        ListField = 'designation'
        ListSource = dmAux.dscDesignations
        TabOrder = 27
        AllowNull = True
        FlatButtonColor = 6572079
        FlatButtons = True
        FrameColor = 6572079
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteBank: TRzButtonEdit
        Tag = 1
        Left = 699
        Top = 238
        Width = 160
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
        ShowHint = True
        TabOnEnter = True
        TabOrder = 32
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
        Left = 699
        Top = 262
        Width = 160
        Height = 52
        Color = clWhite
        ReadOnly = True
        TabOrder = 33
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = clWhite
        TabOnEnter = True
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 427
        Top = 412
        Width = 187
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'gross_pay'
        Alignment = taLeftJustify
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 30
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 427
        Top = 436
        Width = 187
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'net_pay'
        Alignment = taLeftJustify
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 31
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
        FrameColor = 8675134
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 3
        OnChange = dteBirthdateChange
        EditType = etDate
        Format = 'mm/dd/yyyy'
        FlatButtons = True
      end
      object RzDBMemo1: TRzDBMemo
        Left = 643
        Top = 412
        Width = 216
        Height = 46
        DataField = 'oth_income'
        DataSource = dmClient.dscPersonalInfo
        TabOrder = 36
        FrameColor = 6572079
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object RzGroupBox2: TRzGroupBox
        Left = 19
        Top = 12
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Client name'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 37
      end
      object RzGroupBox3: TRzGroupBox
        Left = 19
        Top = 114
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Personal info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 38
      end
      object RzGroupBox4: TRzGroupBox
        Left = 19
        Top = 216
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Contact info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 39
      end
      object RzGroupBox5: TRzGroupBox
        Left = 19
        Top = 318
        Width = 302
        Height = 22
        BorderColor = 6572079
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Present address'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 40
      end
      object RzGroupBox6: TRzGroupBox
        Left = 336
        Top = 12
        Width = 278
        Height = 22
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Provincial address'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 41
      end
      object RzGroupBox7: TRzGroupBox
        Left = 336
        Top = 216
        Width = 278
        Height = 22
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Employer info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 42
      end
      object RzGroupBox8: TRzGroupBox
        Left = 627
        Top = 216
        Width = 232
        Height = 22
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Bank account info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 43
      end
      object pnlPhoto: TRzPanel
        Left = 627
        Top = 25
        Width = 232
        Height = 174
        BorderOuter = fsNone
        BorderColor = 6572079
        BorderWidth = 1
        Color = 12955288
        TabOrder = 44
        object imgClient: TImage
          Left = 1
          Top = 1
          Width = 230
          Height = 172
          Align = alClient
          Proportional = True
          ExplicitLeft = 118
          ExplicitTop = 115
          ExplicitWidth = 104
          ExplicitHeight = 71
        end
      end
    end
    object tsReferences: TRzTabSheet
      Color = 14273211
      Caption = 'Family and references'
      DesignSize = (
        860
        529)
      object pnlFamRef: TRzPanel
        Left = 8
        Top = 9
        Width = 570
        Height = 513
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 8675134
        BorderWidth = 1
        FlatColor = 14273211
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          570
          513)
        object urlRefreshRefList: TRzURLLabel
          Left = -1
          Top = 179
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
          ExplicitLeft = 326
        end
        object grRefList: TRzDBGrid
          Left = 1
          Top = 1
          Width = 568
          Height = 511
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmRef.dscRefInfo
          DrawingStyle = gdsGradient
          FixedColor = 12955288
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          FixedLineColor = 12955288
          LineColor = clWhite
          AltRowShadingColor = 15854564
          Columns = <
            item
              Color = clWhite
              Expanded = False
              FieldName = 'name'
              Title.Alignment = taCenter
              Title.Caption = 'Name'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'ref_name'
              Title.Alignment = taCenter
              Title.Caption = 'Relation'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end>
        end
      end
      object pnlFamRefDetail: TRzPanel
        Left = 584
        Top = 9
        Width = 276
        Height = 513
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 8675134
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          513)
        object JvLabel40: TJvLabel
          Left = 13
          Top = 39
          Width = 54
          Height = 14
          Caption = 'Lastname'
          Transparent = True
        end
        object JvLabel41: TJvLabel
          Left = 13
          Top = 63
          Width = 54
          Height = 14
          Caption = 'Firstname'
          Transparent = True
        end
        object JvLabel42: TJvLabel
          Left = 13
          Top = 87
          Width = 36
          Height = 14
          Caption = 'Middle'
          Transparent = True
        end
        object JvLabel39: TJvLabel
          Left = 13
          Top = 111
          Width = 45
          Height = 14
          Caption = 'Relation'
          Transparent = True
        end
        object JvLabel48: TJvLabel
          Left = 13
          Top = 182
          Width = 56
          Height = 14
          Caption = 'Education'
          Transparent = True
        end
        object urlCopyClientAddress: TRzURLLabel
          Tag = 1
          Left = 95
          Top = 276
          Width = 105
          Height = 14
          Caption = 'Copy client address'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8675134
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlCopyClientAddressClick
          FlatColor = 8675134
        end
        object JvLabel45: TJvLabel
          Left = 13
          Top = 206
          Width = 70
          Height = 14
          Caption = 'City or town'
          Transparent = True
        end
        object JvLabel44: TJvLabel
          Left = 13
          Top = 230
          Width = 51
          Height = 14
          Caption = 'Barangay'
          Transparent = True
        end
        object JvLabel43: TJvLabel
          Left = 13
          Top = 254
          Width = 37
          Height = 14
          Caption = 'Street'
          Transparent = True
        end
        object JvLabel47: TJvLabel
          Left = 13
          Top = 332
          Width = 36
          Height = 14
          Caption = 'Mobile'
          Transparent = True
        end
        object JvLabel46: TJvLabel
          Left = 13
          Top = 308
          Width = 61
          Height = 14
          Caption = 'Telephone'
          Transparent = True
        end
        object pnlAddFamRef: TRzPanel
          Left = 8
          Top = 483
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 6572079
          BorderWidth = 1
          Color = 12955288
          TabOrder = 14
          object sbtnNewFamRef: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Add a new record'
            BorderStyle = bsNone
            Caption = 'New'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnNewFamRefClick
          end
        end
        object pnlDetailHead: TRzPanel
          Left = 1
          Top = 1
          Width = 274
          Height = 19
          Align = alTop
          BorderOuter = fsNone
          BorderSides = [sdBottom]
          BorderColor = clBlack
          BorderWidth = 1
          Color = 8675134
          GradientColorStyle = gcsCustom
          GradientColorStart = 6572079
          GradientColorStop = 8675134
          TabOrder = 0
          VisualStyle = vsGradient
          object lblDetailHeadCaption: TRzLabel
            Left = 7
            Top = 2
            Width = 41
            Height = 14
            Caption = 'Details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
        object RzDBEdit3: TRzDBEdit
          Left = 95
          Top = 33
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'lastname'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          ReadOnlyColor = clWhite
          TabOrder = 1
        end
        object RzDBEdit2: TRzDBEdit
          Left = 95
          Top = 57
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'firstname'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = clWhite
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = clWhite
          TabOrder = 2
        end
        object RzDBEdit1: TRzDBEdit
          Left = 95
          Top = 81
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'middlename'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = clWhite
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = clWhite
          TabOrder = 3
        end
        object RzDBLookupComboBox9: TRzDBLookupComboBox
          Tag = 1
          Left = 95
          Top = 105
          Width = 168
          Height = 22
          DataField = 'ref_type'
          DataSource = dmRef.dscRefInfo
          KeyField = 'ref_type'
          ListField = 'ref_name'
          ListSource = dmAux.dscRefType
          TabOrder = 4
          AllowNull = True
          FlatButtonColor = 8675134
          FlatButtons = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
        object RzDBCheckBox1: TRzDBCheckBox
          Tag = 1
          Left = 98
          Top = 133
          Width = 81
          Height = 16
          DataField = 'is_dependent'
          DataSource = dmRef.dscRefInfo
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Dependent'
          DisabledColor = clWindow
          TabOnEnter = True
          TabOrder = 5
        end
        object RzDBCheckBox2: TRzDBCheckBox
          Tag = 1
          Left = 98
          Top = 154
          Width = 64
          Height = 16
          DataField = 'is_student'
          DataSource = dmRef.dscRefInfo
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Student'
          DisabledColor = clWindow
          TabOnEnter = True
          TabOrder = 6
        end
        object RzDBLookupComboBox11: TRzDBLookupComboBox
          Tag = 1
          Left = 95
          Top = 176
          Width = 168
          Height = 22
          DataField = 'educ_code'
          DataSource = dmRef.dscRefInfo
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmRef.dscEducCode
          TabOrder = 7
          AllowNull = True
          FlatButtons = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
        object RzDBLookupComboBox10: TRzDBLookupComboBox
          Tag = 1
          Left = 95
          Top = 200
          Width = 168
          Height = 22
          DataField = 'post_code'
          DataSource = dmRef.dscAddressInfo
          KeyField = 'post_code'
          ListField = 'town'
          ListSource = dmAux.dscTowns
          TabOrder = 8
          AllowNull = True
          FlatButtons = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
        object RzDBEdit13: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 224
          Width = 168
          Height = 22
          DataSource = dmRef.dscAddressInfo
          DataField = 'brgy'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 9
        end
        object RzDBEdit14: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 248
          Width = 168
          Height = 22
          DataSource = dmRef.dscAddressInfo
          DataField = 'st'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 10
        end
        object RzDBEdit20: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 326
          Width = 168
          Height = 22
          DataSource = dmRef.dscContactInfo
          DataField = 'mobile_no'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 11
        end
        object RzDBEdit19: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 302
          Width = 168
          Height = 22
          DataSource = dmRef.dscContactInfo
          DataField = 'home_phone'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 12
        end
        object pnlRemoveFamRef: TRzPanel
          Left = 217
          Top = 483
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 6572079
          BorderWidth = 1
          Color = 12955288
          TabOrder = 13
          object sbtnRemoveFamRef: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Remove record'
            BorderStyle = bsNone
            Caption = 'Remove'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnRemoveFamRefClick
          end
        end
      end
    end
    object tsIdentityInfo: TRzTabSheet
      Color = 14273211
      Caption = 'Identity information'
      DesignSize = (
        860
        529)
      object pnlIdentity: TRzPanel
        Left = 8
        Top = 9
        Width = 570
        Height = 513
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 8675134
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grIdentityList: TRzDBGrid
          Left = 1
          Top = 1
          Width = 568
          Height = 511
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmClient.dscIdentInfo
          DrawingStyle = gdsGradient
          FixedColor = 12955288
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FramingPreference = fpCustomFraming
          QuickCompare.FieldName = 'expiry'
          QuickCompare.FieldValue = 42644d
          QuickCompare.Operation = qcoLessThan
          QuickCompare.Color = 14277119
          QuickCompare.FontColor = clRed
          AltRowShadingColor = 15854564
          AltRowShadingFixed = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ident_name'
              Title.Alignment = taCenter
              Title.Caption = 'Type'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ident_no'
              Title.Alignment = taCenter
              Title.Caption = 'ID Number'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'exp_date_f'
              Title.Alignment = taCenter
              Title.Caption = 'Expiry '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end>
        end
      end
      object pnlIdentDocDetail: TRzPanel
        Left = 584
        Top = 9
        Width = 276
        Height = 513
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 8675134
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          513)
        object JvLabel49: TJvLabel
          Left = 13
          Top = 39
          Width = 30
          Height = 14
          Caption = 'Type'
          Transparent = True
        end
        object JvLabel50: TJvLabel
          Left = 13
          Top = 63
          Width = 60
          Height = 14
          Caption = 'ID number'
          Transparent = True
        end
        object JvLabel51: TJvLabel
          Left = 13
          Top = 87
          Width = 34
          Height = 14
          Caption = 'Expiry'
          Transparent = True
        end
        object JvLabel52: TJvLabel
          Left = 80
          Top = 109
          Width = 123
          Height = 14
          Caption = 'ID type has no expiry.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object pnlIdentDoc: TRzPanel
          Left = 8
          Top = 483
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 6572079
          BorderWidth = 1
          Color = 12955288
          TabOrder = 3
          object sbtnNewIdentDoc: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Add a new record'
            BorderStyle = bsNone
            Caption = 'New'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnNewIdentDocClick
          end
        end
        object RzPanel4: TRzPanel
          Left = 1
          Top = 1
          Width = 274
          Height = 19
          Align = alTop
          BorderOuter = fsNone
          BorderSides = [sdBottom]
          BorderColor = clBlack
          BorderWidth = 1
          Color = 8675134
          GradientColorStyle = gcsCustom
          GradientColorStart = 6572079
          GradientColorStop = 8675134
          TabOrder = 5
          VisualStyle = vsGradient
          object RzLabel1: TRzLabel
            Left = 7
            Top = 2
            Width = 41
            Height = 14
            Caption = 'Details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
        object pnlRemIdentDoc: TRzPanel
          Left = 217
          Top = 483
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 6572079
          BorderWidth = 1
          Color = 12955288
          TabOrder = 4
          object sbtnRemIdentDoc: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Remove record'
            BorderStyle = bsNone
            Caption = 'Remove'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnRemIdentDocClick
          end
        end
        object cmbIdType: TRzDBLookupComboBox
          Left = 80
          Top = 33
          Width = 183
          Height = 22
          DataField = 'ident_type'
          DataSource = dmClient.dscIdentInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ident_type'
          ListField = 'ident_name'
          ListSource = dmAux.dscIdentType
          ParentFont = False
          TabOrder = 0
          OnClick = cmbIdTypeClick
          AllowNull = True
          FlatButtonColor = 8675134
          FlatButtons = True
          DisabledColor = clWhite
          FrameColor = 8675134
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = 14273211
          TabOnEnter = True
        end
        object edIdNo: TRzDBEdit
          Left = 80
          Top = 57
          Width = 183
          Height = 22
          DataSource = dmClient.dscIdentInfo
          DataField = 'ident_no'
          CharCase = ecUpperCase
          DisabledColor = clWhite
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
          TabOrder = 1
        end
        object dteExpiry: TRzDBDateTimeEdit
          Left = 80
          Top = 81
          Width = 183
          Height = 22
          DataSource = dmClient.dscIdentInfo
          DataField = 'exp_date'
          DisabledColor = clWhite
          FrameColor = 8675134
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
          TabOrder = 2
          EditType = etDate
          Format = 'mm/dd/yyyy'
          FlatButtons = True
        end
      end
    end
    object tsLoansHistory: TRzTabSheet
      Color = 14273211
      Caption = 'Loans history'
      DesignSize = (
        860
        529)
      object pnlLoans: TRzPanel
        Left = 8
        Top = 9
        Width = 852
        Height = 513
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 8675134
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grLoans: TRzDBGrid
          Left = 1
          Top = 1
          Width = 850
          Height = 511
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmClient.dscLoans
          DrawingStyle = gdsGradient
          FixedColor = 12955288
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'loan_id'
              Title.Alignment = taCenter
              Title.Caption = 'Loan ID'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'class_name'
              Title.Alignment = taCenter
              Title.Caption = 'Loan class'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status_name'
              Title.Alignment = taCenter
              Title.Caption = 'Status'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end>
        end
      end
    end
    object tsLoanClassAccess: TRzTabSheet
      Color = 14273211
      Caption = 'Loan class accessibility'
      DesignSize = (
        860
        529)
      object RzGroupBox1: TRzGroupBox
        Left = 19
        Top = 12
        Width = 825
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Available loan class'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
        TabOrder = 0
      end
      object pnlAvailList: TRzPanel
        Left = 19
        Top = 35
        Width = 825
        Height = 230
        Anchors = [akLeft, akTop, akRight]
        BorderOuter = fsNone
        BorderColor = 6572079
        BorderWidth = 1
        Color = 14273211
        TabOrder = 1
        object grAvailList: TRzDBGrid
          Left = 1
          Top = 1
          Width = 823
          Height = 228
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmClient.dscLoanClassAvail
          DrawingStyle = gdsGradient
          FixedColor = 12955288
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameColor = 8675134
          FrameHotTrack = True
          FrameVisible = True
          FramingPreference = fpCustomFraming
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'grp_name'
              Title.Alignment = taCenter
              Title.Caption = 'Group'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'class_name'
              Title.Alignment = taCenter
              Title.Caption = 'Class name'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'loan_name'
              Title.Alignment = taCenter
              Title.Caption = 'Loan type'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'acct_name'
              Title.Alignment = taCenter
              Title.Caption = 'Account type'
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'int_rate_f'
              Title.Alignment = taCenter
              Title.Caption = 'Int %'
              Width = 40
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'term'
              Title.Alignment = taCenter
              Title.Caption = 'Term'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'comakers'
              Title.Alignment = taCenter
              Title.Caption = 'CM'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'max_loan_f'
              Title.Alignment = taCenter
              Title.Caption = 'Maximum'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comp_method'
              Title.Alignment = taCenter
              Title.Caption = 'Comp. method'
              Width = 145
              Visible = True
            end>
        end
      end
      object pnlAdd: TRzPanel
        Left = 20
        Top = 272
        Width = 129
        Height = 22
        BorderOuter = fsNone
        BorderColor = 6572079
        BorderWidth = 1
        Color = 12955288
        TabOrder = 2
        object btnMakeAccessible: TRzShapeButton
          Left = 0
          Top = 0
          Width = 129
          Height = 22
          Hint = 'Make the selected loan class accessible'
          BorderStyle = bsNone
          Caption = 'Make accessible'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnMakeAccessibleClick
        end
      end
      object RzGroupBox9: TRzGroupBox
        Left = 19
        Top = 309
        Width = 825
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Available loan class'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
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
      object pnlAccessList: TRzPanel
        Left = 20
        Top = 332
        Width = 824
        Height = 136
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 6572079
        BorderWidth = 1
        Color = 14273211
        TabOrder = 4
        object grAccessList: TRzDBGrid
          Left = 1
          Top = 1
          Width = 822
          Height = 134
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmClient.dscClientLoanClass
          DrawingStyle = gdsGradient
          FixedColor = 12955288
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameVisible = True
          FramingPreference = fpCustomFraming
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'grp_name'
              Title.Alignment = taCenter
              Title.Caption = 'Group'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'class_name'
              Title.Alignment = taCenter
              Title.Caption = 'Class name'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'loan_name'
              Title.Alignment = taCenter
              Title.Caption = 'Loan type'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'acct_name'
              Title.Alignment = taCenter
              Title.Caption = 'Account type'
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'int_rate_f'
              Title.Alignment = taCenter
              Title.Caption = 'Int %'
              Width = 40
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'term'
              Title.Alignment = taCenter
              Title.Caption = 'Term'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'comakers'
              Title.Alignment = taCenter
              Title.Caption = 'CM'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'max_loan_f'
              Title.Alignment = taCenter
              Title.Caption = 'Maximum'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comp_method'
              Title.Alignment = taCenter
              Title.Caption = 'Comp. method'
              Width = 145
              Visible = True
            end>
        end
      end
      object RzPanel2: TRzPanel
        Left = 20
        Top = 475
        Width = 129
        Height = 22
        Anchors = [akLeft, akBottom]
        BorderOuter = fsNone
        BorderColor = 6572079
        BorderWidth = 1
        Color = 12955288
        TabOrder = 5
        object btnRemoveAccessibility: TRzShapeButton
          Left = 0
          Top = 0
          Width = 129
          Height = 22
          Hint = 'Make the selected loan class accessible'
          BorderStyle = bsNone
          Caption = 'Remove accesibility'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnRemoveAccessibilityClick
        end
      end
    end
  end
  object pnlToolbar: TRzPanel
    Left = 860
    Top = 28
    Width = 128
    Height = 552
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderSides = []
    BorderColor = 6572079
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    Visible = False
    DesignSize = (
      128
      552)
    object pnlClientMainBtn: TRzPanel
      Left = 16
      Top = 9
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 0
      object imgClientMain: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Main'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D0000080C4944415478DAB5970B5454751EC7BFF7CE9D61782A
          670185503956E6AA24083E8E72CEBABA8A481048D816CA4B4012717D145B59BB
          C74A33304945455061CDCA7350414D5930C858B7430AA2216CE0C62B5E232A3A
          020EF3B8777F77E63230A819BBDBE5FCCFDCF9BF7E9FDF7B6030F2872B48C669
          F125640F82E943FF5FDC617E98910A3F96883C258B10F18B8647C11F33112E41
          7099D97F2B6019048A6B3CCF9F4D4C88097912E04800649FC521CF8A41A861DC
          02D3C44FA5E817901F71D00861B33FFB53F54BCB66E04EB70A5F9736213121D6
          81E6EFFF3F00644756214FC123543F760EA6451F314E5ECF8D04D7590EAD80BC
          C85CACDB75E08B8E97433D09A013255F35223929DE85B675FDAF00B29C281C53
          002FE9C7CEC6D49559F09A32D578F26A4D0D6A3E4D00D7F11DBA7B71B47F51DE
          8A883002B8D386E2A21B58BF2E710C9DBF391200EEF81A14C8243FB232F2F303
          1A7DE453B759F08CCC82E7E467D0DB731B2CAD5BDB3BA1BAF606AA8FC443D67A
          197DCECF23F4FDB3B873AB11855F5663E3FAA41103D81F4B80DA73EE427A15F0
          63CD7574B5DC84E03E1B5ED199F0FAAD07B47DDDE8E93159D5CECE194A1B475C
          A96DC4D5DC78A0B1126E74F6D95776E0D4F1EFF0FAFA915BC039371A37BD66FB
          E0DFB5F5B8DD4EF1336E26BC630E60FA64777C52781767AB4CDA8B0F4F23D0DB
          09EB031C70ED87565C39140FA6F90A5CE7FE0E75B6717863EDCA1103B8644540
          35DAD11AB75A1F8019EF8B19B19978CE632C18831AC1BBD5D818EE09271B13C2
          AD3E1E3BF3AA71669D0378F928D435B413440241544137612692F75C1E39C0BE
          70A8042D39C07D267CE2F661E2B8DF40DFDF0356E8C18A432CC2029E47697DAF
          71F38249B63851F83D8EAEE2C13376E0ACECD0F0D36D5C399808A6B5121A06F9
          1B0B8C296AF82500B2B460CA73209471F7854FFC5E4C7073804ED30FBDBE0F36
          0A0191391C1607CF82BA8F371E70204B149FBE8423317AF4691970721BC8AD94
          686EBF87CAEC24A0AD02BA27400C0070692F228F33208421CD67C567C06D8C12
          069D285C07AA6E50CA19ACC8B58642C6D321C17848A037AD81C5D1E807D0E804
          F034CD710AC8E50AB4AA34B894BD160265875E8682374E992BE643005C6A10CE
          91571771EEB330336E0FC63AC9A0D7E920F0266856C6917656B052C82193597A
          CD6010D0AFD5D1FE7EF006D3FD0CE52F2797A3F39601970F2643DF7A490CD8F3
          2967B0743884789BDDFBFE2852F7A077E2EAD38B16CF7785B65F43C20569070B
          566E8DD69349E8AE2A07332C6A04DAE6E83D07EECBF682D751D11078E9180305
          B9A3F842071A0F049FB7B783EDBB45F0A7A59E870068B88A019891FDF9C5D5D1
          41A8FFB142D4DBAC0D6B658FAA94E958B0F904D94B49108C249CA4EB3528DD1A
          06EFD46BE0FBEF9BAD2626E9A4A77D7120F70CD6C6BFEA276543C7A300381A4A
          1ACEBBF61D6A88238086A66A12320440E9808A142FFC7E530E2A7263C0C824ED
          49966F740EBEFE3806BEA957C16BD46600812CF1B4C774E4E49E43D29AC88930
          F504CDA35C604EC1F4DDFB553151816869ABA7854100997214CA5FF7C2C20D7B
          71FD4412C584D2A4A3418369617B51929E84393BAEC2A0B937C402023C9E9A8A
          CF8E94213179F963EB8105C0CE4F3254912B97A0BDB3D1C20532EB51F8768337
          16266F477DF116025048005A4C5AFC5794EC791373D3AB607830140098E03A0D
          4BF78F81AD1CEDC529F0A029DDCF02ECD899A18A8858005557AB796900E0E29F
          7CF087359BD1F88F0C02909B00781D26FAAD45C9BEADF0DB4500435CC0D09FBB
          F364BC90E58A80494059033A8BDFC4F8E110C30076ABC297FB513FEF7A08A06C
          9D2F16AD5E87B6CA2F28064C002CA5DDF8191128C94CC7FCFD7514847DE4FB01
          00164EA3C62130CB1987A2DFC2B1F20F71B10EF925EF5A16254B808F77AB42C2
          A8D2A9EF0E128A394D00A549B3E09F1007556D21052867CC0439A56ABE13830B
          F79A00AD9481C2E08562011313E5F0AA2DE8EEABC3F9EF3F3741BC33086101F0
          515ABA2A28C40B0FFA348337490025AFCDC192B85771A7A91C621AB074D48A67
          F01A5387E3ABB37157734A8A1BCB4221668342588C0BF5C998EE1E8DA2EA5CFC
          B306F95F4910E652BCE5BD0F4E727265D0D217A640A7D35B00C86D46A328D10F
          41B12150ABFE2519988535CF225E7F1DB9B1DB48C0DB46D1C3BB9B20A9C948C3
          D32D16C5D587F16D35BE2C7A9BFA8EB4CF7EDBF634F5CBE1CBE1F6943DF406DE
          2C9F911180723476CC67F062AC3F7ABBDB250006D6028B559A2A6444AD45454B
          C623010626180946C959C165D4B3D875F23AFE9E028781FD4E5B3F4CED9AE64D
          6558AB37FA72C0950CCB1A83B0664B0842A2E6A1BFBFD7B86802E010D37319A9
          51A1A8BB99FFD81F985275365A80A3B2D7423A7C7311DF947E806503675CB66E
          4B550504F9C0A03718036750034A28EA05A7A3FD101E3DC5681D0112001488EA
          B986F7627DD071BF128C00CB5E41DFC596A297128FA30ADA44195E5A82B2B28F
          904C538D03DB9DDFDAFC977C3B3BBB793C2F58D2130D4B2D76D3A60D1043831F
          D08686155D98561486E2DA93C67ACE3130FF5C339D25E17426EA15D37B733350
          72DE287C032DB7D0B86B8E011A62917082A9370C7DE49959870B757493082748
          CE110B0D4BD9A0609590B3640BD60E2BE2FD03605968E44BB6A3307225507F83
          343F4BC2D3CCC2BB2DB28086354C4D69B82BC56EE92C7DFEDC2376B92E58763B
          C7C034FC308F7AE18512DC2E7EC7D88E9B078403BFEC1F13B1F0DB8ADA3C619F
          A8B9F863513B64CE257827541403EA737FC612FADE40E3161E53097F8DC79186
          8764E136C9428FED05BFC6235ACF467AEFC523BAE17F00E58D348292B2D17200
          00003674455874636F6D6D656E7400476F20686F7573652066726F6D2049636F
          6E2047616C6C65727920687474703A2F2F69636F6E67616C2E636F6D2F275678
          040000002574455874646174653A63726561746500323031312D30382D323154
          31343A31313A34392D30363A30308FBEEF2A0000002574455874646174653A6D
          6F6469667900323031312D30382D32315431343A31313A34392D30363A3030FE
          E357960000001974455874536F6674776172650041646F626520496D61676552
          6561647971C9653C0000000049454E44AE426082}
        ShowHint = True
        OnClick = imgClientMainClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
    object pnlFamRefBtn: TRzPanel
      Left = 16
      Top = 54
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 1
      object imgFamRef: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Family and reference'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000008474944415478DAC5970B7054E515C7FFF7BDD92CBB9B
          EC6E5E908410D040840022A54078A441AD082D6AC5E928C20C328CB5483463A1
          03856241D0F2AAA5B62308A8F481156C85E1A112280549208021011423219B84
          DDCDBEDFCFBB3D7793545E2DD1D1F1CE9CD9DD7BBFFDCEEF3BDFFF9CF35D2699
          4CE2BBBC18058061986F622E7EE1848C9D1CC7CD60C1012CDD49CA90E5C4AEB5
          879D33E957FCDB0410AB27654654E93C0A0B2588A284405086CD1182DB1187C4
          27B1E643BB44E3A2DF0600BFA05CFF6E7ABA387D4499062A950E1CAF42209484
          C51640F3172E2422318842FCFD75871D0FDD18896F02A0CFF3938DDEFC0211FD
          0B8D10D2F410780D42B456CB552F9A9BEDB0D99CC833305875D0AAA5F1BEDE02
          304F8FD38F9104F62516EC448E0712C4CED2DECA49F94838262FDEF46FF7091A
          67A8AEC8EE2C18C0A15F6E0ED2B5042119607744F0D925331C761F990BF9D93C
          56EE6B37D1787B6F0058723E5B2D725BF40601D93912044E40309C84DB1D81D3
          19A340CA08C5624F12C4C1172AB3AE66982448B4F74946A0E751E415E563E888
          3B51577B11F5479B30205F5200B2696EDBED009839DFD3951BD4FC913C0A6B51
          BE0E2C97068615110A25E07447D161F5A1A3DD874C0D838F5BFC634717A4EFCB
          3089BA69337F0297CB8B3B4B0791164404832128F33F33E7150C2E4A8FACFEC0
          52D01B00714179C621AD5E1837A2540B5ED28213D329F422A251064E5798003C
          04E021718548F1890FFDE17830D7284E5FF9D6AB08753AE0F305100C84100E87
          0940C6AFAAFE882C2357F38763AE477BB3053A12953B2F9F47415F03D2D4242A
          49034ED0201A49C2EE0CC06C76A2D3E682CBE9469E89C3A6239D154F4F36FE73
          E56BAB344EBB137E7F80A215A6F151C41309ECF8D3AEE0E126DBA3673AA2FFEA
          8D084DD515265BDF020E266326B43A03A4341D78410F739B0B173FBD0CAF2F0C
          39C620E0F3A22087C3CA0396B2A5B3463E53F5DC134F057D7E04FC4184C21144
          C93C9E006A6B2F6C5DB2B57619CD6D218BDD0E20EB854A93559F25816778709C
          845882456B9B13A5C34B3069CA18E833FB60F5AFDF84C3DC89FE3902561DB20D
          A0FFA94FBEFB8B46AD86472C1A4184F2D0E3F1E368ED792CDB7C62283D6F210B
          90256F0B503DC9D8DAC72448132B2B49ECCA7816838795409D26C14FC28AC7A3
          68FEAC03BF5FF317DC51A082B73C6BB9214BBD7C76C9C3F8BCB50D56CA7BAFC7
          47005E781D1EE82AD2E175F957BFBCE8DC129A2C713B00E3BCEF6BFF6ACA147F
          F09BAD1B41B9D715D21059309212563C1E27B5FBB17ED91B183ABE10E58BE6A1
          A4640C02073E8227E086ADD3496275C3470096363B7EFED6163434D4E0C4F13D
          549C9CD37FB7A2714F4F246E05A09D3A583D6B90917BB56A45150C2613028100
          39A6B086A38844222980CF29027BDED88D87572D44DADD269CBD7C10D373E781
          7704A90EB4116C90042820AC93F0A9F6084A7326A130BB0CA7EB0EA0F6D8A1B9
          1B969FDB4ABEE45B01284DA3DF8AC7061D98F5D4CC626D462645C08F30293AA2
          40D0672C1687C7EE464B8705D223C568B39EA7C62753BD10B1E8FE1AD010B204
          429130B69D9C461D31967A9E97710786154DC13B6FAEC1CB8B1BD4E42774CB42
          449631BED43066F9FC897B878F1E05AF3FDC15015A7D341A438CBE5F35B7217D
          EA44D499F79242F85440E3721803B3C6E3A7F7BC42CE819DF50BD1EAAE03CF4A
          A982942090F1431EC3FE5D5BB0F6979F18C98FE37F9562912C6FD9B38FBCF760
          C590B23E628456AD388E23485A3879E602F8FE65C82D4F4743F311B08C2A2554
          9956194D84306DF8628291B1BF610D3526353DE7882F49CFE3281B3805C7F7ED
          C2BA25675365F95600ECFD6B3F79222E6856E875A682D5B92FE112E5BFD5E626
          657BA91778E07358D0F1D02584BDE761E4B7234BFA88E2A622170239A19526BB
          3A2E477D8155BA1705B50B40C6C07E23D178F430D62F3D73130033F9C5630F42
          A57B674CB156AA1CAC4745491F5CDCFB3C7CB472BBDD4BE22208AF8BC27F050B
          36D4E19C538FFD8D7ED45F6E45B1F67518A453E44609379B9238A3EC66CFDAC8
          874A5243ABCE84F96C13362CADBF0E801DBBB4664E51BFDCCDCF56E621374342
          A303282F12215F3D85F6E63A72EC443814200D24A1EF371469459568978D18A2
          4FA2DD99C0BA0FDCD0F39BD0575BDB05811BB6957EC67D51043A3DE8347BDFDE
          B1A9A94AE90B3D00691356D607373E5E023BD5FB7A2B9D9D64061A89C1C2D12A
          C428AC8AAA63947E89B8920D21EC6CD1214891165819779B18185402E66C69C7
          A4E4BD48B01A8A02771340D0176D68B9E4FD5BCDFB2DBBE98E99CCDF036098B1
          FEACFDB9070660FF1599F6AEAB5A52CB47BE96C3FC7B04F882514409804944B0
          E3A2046B8803C72653EA4FD0EC0FF417307773332EAC19F6C31BEB7DF795E82E
          C58E6EF32BF77A00B2EE5D75D23AFFBE621C6B8F936ABBB64EA9C2B4708C2FE4
          31A38445943261F785044E5A585A3952E392DDE326E48BA8DEDE844B1BC695D0
          2DD72D0094A1CAA134DC0D285F5B09B3262EFFD83AABA218A72C5F02A4B06958
          8420E68E12E9BB8C6DA7E3107945E15FCEAAD8A81C112FFEF92C2EBF5679D3A9
          E7FF5DFF05289ABFDFFAB319C3D1688DA69286B9069BFC526AA13BB5BACE85D7
          3E5746DF952D62E3DFEB617E7DEAD703C879F21FD61F4F2E052308F0D0D14B4E
          C8D7C5AEE7058AB9263AA9A2C1B1D0A771743E88E1BD9A2658B6FFE86B0118F5
          53D7AF17F4858F8FBCAB1026EAF76AB50AB77B6D53EA4790BA65A7D387D38D57
          10735F79DBBDB72A955E5F154043DF0BD463AB67277503EEA36234ACB7AF8CA9
          1A16F634309E2F0E048FFF761BFD6A4597C2BF128092B40A84726ECF24533A15
          D7CB3994F40A9239C93ABB9D277AF9DFEBCE034AD1569A90D2590400BD7D5D52
          62A5A495925E4A9AC9BDFCDF4D00DFC9F51FC4AB265A3E1822F2000000457445
          5874636F6D6D656E740047726F75702070656F706C6520757365722075736572
          732066726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F6E67
          616C2E636F6D2F46982A930000002574455874646174653A6372656174650032
          3031312D30382D32315431343A31303A31322D30363A30302A9BDE8A00000025
          74455874646174653A6D6F6469667900323031312D30382D32315431343A3130
          3A31322D30363A30305BC666360000001974455874536F667477617265004164
          6F626520496D616765526561647971C9653C0000000049454E44AE426082}
        ShowHint = True
        OnClick = imgFamRefClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
    object pnlIdentInfoBtn: TRzPanel
      Left = 16
      Top = 99
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 2
      object imgIdentInfo: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Identity information'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000005C24944415478DAED97696C545514C7FFF7CDDECE94EE
          8BD89652284BA929B518148A8052DA4E0582317C51E2062E18C337134A0A65B3
          90102231516A881A8C02891123A50918400465A986A2586984D6B4653A94CE74
          A6EDECEF3DCF7D33D3E93203FD827CD09B9C74DEBDEF9EF3BB67BBAF4C96653C
          CCC1FE0778E80024EACCBAC6632E9199FD22877990400C1A15439C4A6EECD962
          5E4513010E604AA83DE174D455FE6BA79EB4A509CE6D5509F4738003A4196A1A
          EFB87654A1B1AD870805A848649516B2A083C4D48A9B180210442F20FA204912
          B8B7E80FF96B821E9383BE5D313313719B4FC0BDD39C4E8FBD5C77BAA1E6B8D5
          B5C38CD31DBDD8FDB50D5ABD1E6ADB5F48FB611D72351DF07865744B79702CFB
          04BEC469F0793DA8793E05BEC0C4C325C95C64544C4F27804602A8CEA0E93BA3
          002E74DEC517675DD0C59B207E5E8EB2A95D484CCB45BF13B8D27C0B839A5CE8
          D79F847768006B97C44314019520040F48CAC3F9AC1258D02F72C43F2211F849
          96E4A58E07D013809B007EEEEAC3A9AB7EE88CC9E8DDA4C3C2A5854848C987DD
          21E0CAA55658DA6E60CEA71E7806ECA898ABA5B030CCDB7D06EB16E543947948
          64BC5B968792FAD3CA9C34028087EC8D2773B02027050602F04403B8DC6D43CB
          2D40674AC6A55719A617E5207FF613985A3813D6DB1634EC3C88EAEF64789D36
          144FE56A05A805160EB1E266C5036C38EC9135EE0151C2FCECE4D800CDB7FB61
          ED53411367C291D50C072F1C81C7D2077B5F3FDC434E6C5A5F8FD74FC9F05108
          B2524552CC1356A518E021602C6C39683AF8CC9444E5892B12C0BCC9936203FC
          6AE987ECD741A333E0DCFEB7B0E19559B0F60EA2DFEEC0A0C3866BDD59285DBB
          0D018F1B82D60726A871B2612F72E6CCC5ECB26771F2C05E6417162BC60ACB96
          296BFC99FB801B9FB96029E666986203B4581DC88A3342AB51A1F7AE0DDDE7EB
          91932CC0E170E2F70E2796AC3B04A39EC1EF17D1E31A824009C8C803C3A76642
          A4DE107C660896AA4C501CAC28FD1E0037FA06509064C2F6262B5A6D0C2FE7B6
          007F7E89F68E4EF4673E87EBA92F627A6200B5951968B30D40662A825005FBE9
          7015F05008E39A00CF014912312BD5181BA0D3E9C6C6437F63E9AC243C5D9481
          47EDC7F1C7C5A368BFD50E6376190A56EFC299AB569C69B563DFDA290848020E
          7FF03E0A8A4BE9841C4042E9339538BABF1ED31E2BC1F03D230773A064F172E4
          27E9A3006C22809D66F4BABD78E9C356D4AD9E86E39D2ABC566240AE091872B9
          70DDEA46539711D5D901BCB0BF05CDF5A570F9B89B55E0B9268FF500C3A86B45
          0901014E9944003504B02B0A80D3EF47795D3336AE9881F35D229518B0CF6CC4
          0001D49EA52C96181665ABF04EC32FB8F9D1620C7A250520D288A82EC878B8FA
          235501C503DC43934DBAD8001E59C48CB74F63C3CA39F8CDE22583745D49411D
          1C864BD1237A6CFDEC326C5F5513808C037B76A0B0641E247AB96C79151AF66C
          C7ECE2C751566EA6B5EDCA1A1D5FA98285CB2A901EA7890D1080848435C7503E
          BF00596909A10A0E8EA047192C779DF8FE621BEC8757853C10CC74DEF5780C18
          6FCD616F84DB7428047C3ED9700F002FBDF4E3B53B58B3FB3C6C3D0341AB636E
          B4E44C6A52EF2DC482A2747803D270FF1F0D1AF93D622B384EA25E3D1E404700
          1E0270934235F5510D1B6B79F4F093555F40522E98B1838D8C7D383742BF059A
          376A55D01380371A8057941457F217F977C1C86AE64AFC52D0B5D2889B6FAC71
          35EDD3081100BE27407AF9EBFC96D4D1FA3880F0758C502C85D009167DFC130C
          1A016EBF84736F3E35BC1E6BDC6F5F787DDC754C9F64D6689F64A186B1921AD5
          B7EE10E044C6FDF6853EC9220059DB4EDC1C0AC0C8AF4BA5A5D32C0F814190ED
          D6ADE6CA8CAD8D4D6E892585D7638D31FB2A32367F73C42DE8A68CD51BAFC6A0
          A5B62A3F0C90489247921425716D24F6D05A32C6D745B411DE670BE94E01C6A5
          13D7D94ED2CF156A48E249B45194F942A28DB11E6B84F76942FB5894F52112FF
          444EF440C7C3FFCFE83F0FF00F1F103F394813697B0000003374455874636F6D
          6D656E740056636172642066726F6D2049636F6E2047616C6C65727920687474
          703A2F2F69636F6E67616C2E636F6D2FEA4AF576000000257445587464617465
          3A63726561746500323031312D30382D32315431343A31333A33312D30363A30
          30B26178690000002574455874646174653A6D6F6469667900323031312D3038
          2D32315431343A31333A33312D30363A3030C33CC0D50000001974455874536F
          6674776172650041646F626520496D616765526561647971C9653C0000000049
          454E44AE426082}
        ShowHint = True
        OnClick = imgIdentInfoClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
    object pnlLoanHistoryBtn: TRzPanel
      Left = 16
      Top = 144
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 3
      object imgLoanHistory: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan history'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000007EF4944415478DACD977950D4E719C7BF7BB007084161
          773954C004610111C11A116D25085E6882114D9B981A10D1E220543469A9B1D8
          1033B94CF2879349A4691D9D2982C62301C724629C341E0876C2CAB994436421
          186191BDAF3EEF8F5D025BACB1994EFA32CF2CF39E9FF7B9DEE7C773381CF829
          1BEFFF0280C7E3FDA0B9A97FC26A08B0197CAC72F020E5B34EE7521FA10C0192
          B998E5990C99405963B4DC3BB225EBD74768C8FE630178CB4AB08A27C6897045
          B07871F8222803A2A0F091A16FB807DDDA2F70DB528BCE6F81477C012B1DB779
          D62DB4B5B4E3B6E6364C2653516E4ED6C1FB813C084098F62A8EFB7A8B33B296
          3C878880C770475B8F4BED4DA86955615003047BC8209F3B80489F7568535F81
          FD5622E26665206D6532E472192E5CFC12BD9A3E4DF6E64D21B49FE5610004CB
          4A51111B1A9AF1C2CF3331626C476DFB49543500529B1F9E897E070B952B21F5
          92A2A7BB1B0E871DB32323D1D1A546637303AAABAB101E1E8EDCDC1CF4F70FE0
          EAB55AF4F5F5CD2EFEDD1E35EDED78108030B5149573C2663CB925652DD4BDE7
          D0D2DB8ED33780DF2C3C8827E717C064D3C166B740AFD78D02D05F44A492FB15
          08F8100A853873E634CE9FFF0CFBF6ED255358F1F5E52BC8C9DE2CA1FD4DFF09
          80F78B9790210F169D7831633D5A7BCF60583F82CA2BC08EA51FE089D9593059
          EFC1E6B07217E1F3F92402EE7F9BCD065754B17E0F0F0F68341A1C3AF43EF2F2
          B663707008DF34A81AB76DCD8E739963320049DA010CED58932276408D3B235D
          B8D242B6F65C873DCB4F406F1E82DD6EE56ECAD6090402D4D5D5C1DBDB9B5339
          83703506C134D1D9D98D0FCBCAB0A7A80875F5F550ABD5B92FEEDE759839A63B
          006F491132A3E7F8963FFBC46C3469AE814C8BB26AE05CBE81E6D961B519B9C3
          B9C9B44E2412E1D8B1A3502A95888B8B87D56AC1F8DCC220D89C0B5FD45054F4
          226951122E5FBD6ADCBE357B1A0D1BDC01C42925A87C764554BA50DA06336DA6
          EE21A7336762F7F2E33098B5B03B26DE502C16E3F0871F9056ECC8D99ACBC20E
          EEC98D6989DDE4CD83EF62C3D34FA3A1B189C2B465E3FE92972BDC017C520FA0
          7F476688E45B523DED8F2FEB800DD16548563E4FB6D771DE3E1EC0D3CB135BB2
          B211A58C46E1AE42180C060E6682533935F5F9851A0CDE1D44585828AE5FAFFF
          A4E8B73BD7BB03F813C040C1263FF40E7E0706FE490D509C7A09CAA044D2889E
          34609F70B32964FB5F6EDC802953BCC9CE87A11BD18D018CD7049BDBDFD78FAA
          EA73484C5C84BF7F7D5953B8332F7202C0A3C988487C46D0BC76B907B4062384
          04F0B7D340458E01DE520939A0897CC03C7A2BFEE8ADC46211E2E3E33173E64C
          9C3A758A1BB3DB2922AC360A531B07C384013073BDF9F6412C4B59C60090BF63
          9BBF0B40B4E62D982C1459D315422C5DEA80CE64230F063EA26C6E27538C50E4
          D6ED75C068D1930BDAA137E8514F1EDD78F3262A2B2BB99063EA97C964502814
          884F4880422E47404020A2A222D1D4D4CC015FADAD436C6C2C1A1A5404B05DE1
          02F05DFD063AE645097CD72D17A1AE9BEC48DAF316F3F0989C8FA3676D98EA48
          C71FD69C254A02E03960D08D02A8542A94979773E166369BB9C3E5720512E68F
          02280209209201347100FFF84645DA0A456B6B0B0AF2F3BE0720CD85A7BD822A
          8A26FF790BE851B182F381AFBE024244EBB1F7A90A3ADC42716EE1920ECF9968
          D8C1050585983AD59732DEBE319B3B48ED36A7FA99B8C2F1CF7F390299BF8CDE
          0D357615E68F0178D01A194928419C7E3402FE8B1683BC96A8A41B50FC54392C
          6607677F07264601DBF4E4C727E1E3E3C3D9D662F93E0F4CCC07020C0EDD45CD
          C54BDC9A8E8ECEC1DDBB0A26382183F0671029AFE063AB000AA5F742FC7E6515
          A6874EA5DB9B2784E078082ECEA9B12CE81E82AE30649A6276EFE8EC828ECCD7
          DCD474F1D5D2FD99EE61C820E42F6CCADF9294B4F88FD34302C11758919ABA94
          BBD9649BBB0E70BFB13B241B39FFD9E734978FB6D636CA03B505C78E1EF968B2
          B7404A32737FC981E6B8F83808847C4A32910899319D4C60C3C39670AEDBABDB
          FF89D636350C7A03548D8DD692978B95347C6B32005669C972B7E5BDAE8C543E
          1F415E29160BB1E067F321954A392DFC1B846BBD5BBFEBB11A1ED6E21A851FCB
          0F2AD54DDCA8AF2F3D76F4AFEFD1943BF7AB07BC48C2F6BC545C131313ED1F14
          14C4259C84F879904A249C877310B48EE714970918208F4B547CAEDF6832A2B6
          AE1E4683095D5DDD686E6EEE7AEB8DD756D0942E4CF2188D654E12BF79F10949
          A9692B4EC6C4C450ECCE200D481042194F21978D4D1C1E1EE6F201DB27393979
          C226BD540B74D2A106CAAA549641D5D080D75F2B7D9C86DA490631C9733CBE89
          480294CAA8C757A7AF3DCE9EDBD0B050787979C1D3538AA04005A64DF383C968
          2487BACE012C59B204164A200C4A43797F84DE05961DD564FBD6D6562AD33ECD
          BCA96AB84CFB52097BFF8264CC8424620611332776417272CA21794080DF9C98
          68F8F9F941221543E421E26CCCD4CD9293C33E5A15198D263AD88421ED20D9FB
          06BD8077EFBEF7EEDB1934A993A41F0F28C926839093046FFCD5733B1532F946
          7F02080A0A868C4CC13432EA7BA3FBE8743A0C0C0CA09BEA44AD568B9EDB3D87
          4F549497318F674E4762C60F284ADD21587EF07582F8AD58959E1E1818944A87
          CFB5B3D35DDECF1C12768B5E6F6CEAEBD39CAFFEF4EC59EAFDCEA9F2213C6459
          3E9963B28A760AC9234EF172F6BB1A236125939E44EB947B2446FC971F269335
          BED341254ECDB82F76386F6A74AAFB477F9AFD4FDB4FFE75FC2F523ACFF1172E
          3F090000004174455874636F6D6D656E7400486973746F7279206672616D6520
          636C6F636B2066726F6D2049636F6E2047616C6C65727920687474703A2F2F69
          636F6E67616C2E636F6D2FE52C18F20000002574455874646174653A63726561
          746500323031312D30382D32315431343A31303A35322D30363A3030AED1D070
          0000002574455874646174653A6D6F6469667900323031312D30382D32315431
          343A31303A35322D30363A3030DF8C68CC0000001974455874536F6674776172
          650041646F626520496D616765526561647971C9653C0000000049454E44AE42
          6082}
        ShowHint = True
        OnClick = imgLoanHistoryClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
    object pnlLoanClassAccess: TRzPanel
      Left = 16
      Top = 189
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 4
      object imgLoanClass: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Loan class access'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000006114944415478DAAD976B6C14551886DF3333BBDB76CB
          65B9947F2498683082919012909BD24463FC230A144AD11845A115C40B6AB9B4
          B5943B72D38206132516E94D51A341052C84E085621A833F40834412130B1828
          BD6CE9EECCF89E7366B7EC765B36D5B33D9DC9CEE99CE77BCFF7BDE75400B036
          EFADFBCC011E755D17FD3737E56DFF4D40180206F0D5EB4BE73DC62FA2894F81
          411BF7D6DD7863C9DC74DF38A0B6E9DD7A942C9D3798B76DC9002337ECA9BDCC
          87185DF235827E1386102A4479350C139669C034054CC380C568E4BD7A26F83D
          870A21C7EA97097EAFAE702005ED8A3838B2622A36EEA9C5AAE2F9397C742519
          2087002D12E0EEB2231892617152703282F0C6E49B1580772FAF86BA0A35A99E
          989F38800BFEF0DE854382B6AE083E2F9A120318C52197FB04B8A7FC28425926
          7C96A5269711EAE88D9EE8E5C45E37859ED850137B005E824880A8EDA0ED6614
          9F3C37295D8023189E1D2080E945AA01E20A989E0AC2834850C08D03082F43ED
          A88DEB54A061716E7A00F7567C8761D97EF82DD39BBC67FDE57DCFE412042A0F
          62916B905869F04AF9235107ED04A87966627A00132A8F23E40128C9E535AE80
          8691CBA0CA4A6805CCA4E863F2CB928ED8365AC351D43C7D1F5869585594DF3F
          C0C40D270810D0008C5898CC05A580059F8CDA129E0A12D04D50A0477A1DBD4C
          409B00EDCC81838BC66113014AFA06A821403E72379F4428E8D749C83EDEFD1B
          39F635441D57C5A5157611FFDD9F19093DDE964AD0E50403F19932B1F1250D69
          363C434A0098B4F514866571097C26B50D6056E42C562C99FF3F1B52030D696E
          DC901200266FFB1EC38212C007D7F46146F817BC52B400CB0FE452954C969B31
          A0491D7E22D130762F6CC2863DF5585D3C2F6E48090053DEFA01C3830104FC1A
          E0FE8E66BC4A80AA6FF398179954D5C0ADDB8510A9274C1EE3BA0EBA0950FCD0
          B118403C171200A66DFF9165A80160F930A9F567AC2C2E40576B070204926FB3
          990FAC2E560354422633C8B993C748A29B760419438204A823407E6A80E93B4E
          D388FCC808F81165E64F6E3D43050A7067792382322F0820BDFDDC6B1330764B
          33327C2AA912E5F6FCFFD63112A02362E3F7F2077BF98106A82240513E66EC6E
          C2085905CC816E61615ADB19E640011EA86AC6A080A90677F0E5C716DF81BC7D
          1791E5D79BD1ADCD264067776CCC1F6A8C94A5BDDB4663516F3F480098F97613
          866705A8BE05DB600EDC384D808578BCFA027749430DEE8CBA68E0A6F644ED3F
          C864742249022E37BA48D1903F12736AAF20C3D4EE10E69A7C3A7F742F3F4854
          60571386CA2AE0FA3B961F535A7F620E2CC4A22FAE22D3D256C3E0F0419E8992
          DA668CE8FC2B4506EADAE73EA4EC5A5A772C2F227297342CE5B07CA4FC200120
          77DB696467FA7412FAFC9849054A9617D232C2507BB4F098E98415BB0EA2F4C5
          C2FFE007FA80A200B82E2DA94E4415BBAAD52415FB8FA97D40787565D0A6BB5A
          FE44199FDD55D6882C9F3E23DCD60FA8422773E8B737E3C998A300B6BC577F81
          1265BB8E132F5EF9A09BDB69E9B205CA4A906442E53BAB51BEA2100FEFFB55E5
          87296E0F2097A6836BF8CDE271F16A907F35947D0C7B0848286B5FE53B358759
          B328FFF0A8DA1D853EF2A8ADB9ABE59202283874C52B477D8C13AEDE0D918247
          9668980A1C983D8A7E504B3FD0005C7004D9FD49E343955535E756333752B5B5
          DBABB1EEE542B47744B94B5A5A38D786698761093BB54BAA8DC9852F3B84F504
          58E301F4D5FACC0D05B0E363AC7BA900D8C957F8B2F497D14EB43FEF6247FD09
          BAA0DB0B425AB43CA6AD7D72565A00234BB7BE7F28337BF054DB71E2FE2EBC23
          188D0D65CBE60107461020A425EFBE8E8E7C2E894B550C074861D40E010C7F46
          5A0083D847B373065849CF7CEBAAEA0FAF299AC37F37C66800A5C035DC7CE422
          367D749C0718B7D76EE5AA438A83D2A7F2D202909366B267A408254480730AE0
          E458BACD103D227A1DD1E9E77BD1A66AEBAB08F042FF00FDB59CCAAABA96D545
          CC8FB30410412FC47660FC7994EF6F64A520F54E4905CAD254A05F808D7BEB99
          A07306F8E771271C3880362F64DBB1F3227A0EA5B77BA974CD70FB8D53152B9F
          9D3D5080BECC2BDD260FA457D92F0D14A02FF34AB749A9BAD8C3FF02AF95A551
          D07871ED0000003C74455874636F6D6D656E7400496E7365727420656C656D65
          6E742066726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F6E
          67616C2E636F6D2F1987FE340000002574455874646174653A63726561746500
          323031312D30382D32315431343A31323A35362D30363A30305E6B245E000000
          2574455874646174653A6D6F6469667900323031312D30382D32315431343A31
          323A35362D30363A30302F369CE20000001974455874536F6674776172650041
          646F626520496D616765526561647971C9653C0000000049454E44AE426082}
        ShowHint = True
        OnClick = imgLoanClassClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
    object pnlTakePhoto: TRzPanel
      Left = 16
      Top = 234
      Width = 40
      Height = 40
      Anchors = [akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 5
      object imgTakePhoto: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Hint = 'Capture client photo'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
          097048597300000048000000480046C96B3E0000000976704167000000200000
          00200087FA9C9D000007624944415478DAC5970B70536516C7FF37B949FA481F
          49DBF4411F98E290B6B4147764B524EDA25D6464C5F5CDCE2C30830EF22AA5D6
          9599CA08EBB8CE2E3ACCE8B82E2CD607A88BC8820AA528149006DC9159288FA1
          9195F45DFA48DA246D9A34CF3DDFBD490DA50C0547FD6EBEC9BDE7DEFB9DDF77
          CEF9CE772E170C06F14B36EE36DEE1DF7CEB1F7BA452E9C38100830F8E0D2591
          70F0FBFD9FAF5DB3F27112F86E17807F7DCB1BBBA2A2A21E0B0BDC6EF7BF9F7F
          AE7211D3B6E9E55776DD3FF7378FEBF573E82A306E34098CC6936838767CCFA6
          9736B0E7FD9301E0B7FEB3F6338EE3168833222117C926CA444F05513CB3103E
          CF289C433620300E4022416C5C2278B9024DE72E5C373F66217279DD8AE54FFF
          3E6C21F644DCB6EDB58EE5CF2C13B4B0830BBDC8CEC3666632EB8015CEE1610C
          58ADE848BF1BD21FF88491D874B3AE9E863A2909CAB8382427258B1A42F0CC42
          A40B2B963F134F82A13040CAF6DA0FFA9E7AF2315C6969813A3111430E070606
          6DB0580730FF8172B4B6B5935538B1D30B0A1ED8D93F4D0088B41303589CF23D
          46FDE2D0DD5D9D7093A5D8BD2865024A4B0DD8BAAD166B563DAB21517F1840B3
          7275452FCFCB2097CB40BE17FA8C19332095F2B86F6E195A5B5BC700584BD324
          23411903C9B80862C6B20F8FA0A7CF220CECF78EA2CE5B24DC7B903F8769D3F3
          F04EED7BA858BD2295447D63006BD73DD72B97CB612833A0E94C9300C0F33C74
          3A1D0CFA12026823FF49C44E1083761B3A3B3A61B158AEB140527232B2B23291
          989048AEF343AD52411DAF14EE0DD8879090108FDAF7768256C9B5009555D502
          00535A5858888E8E0EC865324C27807BEF994D001D640D8970BFD9D48C41AB45
          70554C147B472200F87C018CB83D18B0D9A0494D436EEE3492F968A104845862
          AAB4DA1CBCFFC147A8AC58353180817C74E6BF679031650A45F910747979B8FB
          AE5968EFEA062F95C26C365300F62331291D475AE468B228E0F28816889603C5
          C9A328BFC30D9BB5176A750AB4B95A961742AB2888A939D9D8F1E14758B776CD
          E42CC0008A6716A18B009C234E982E5D822A6D2AB69D55222D43036D760AC543
          BCA0A0A7CF01737B3F7ABAFBF0ECAC610CF6B442979F8F38651CB9232000E4E4
          64E1E37F7D7263806B2C40CB8DC540E18C025CEDE985A9D904557C34769B3588
          CFCC45665AD2D8C062EEE08418E9BC6AC568EF152CCCEA836DC885BCFC3CC10A
          ECB96C8A8F4F767F8AAACA8A495880AEF3C802BAE977A2AFDF82C64623F4B38B
          F1F7EFB5C8CA4826DFFA43792322A5B2952291A2A3DB82D5D3CC307EDB242C3D
          2116E8D94C9AD8A77BF6A2BA6AEDE42CC00072B55A5829F1184F36A2BCB4046F
          B5E81043FE964BAECFE30CC643C97184E262CD1D26349CF8067ABD08C060D3D3
          D3B1F7F32FF0FC8D00C65B209F7C989D992944F649A3110BE695E1D54BB9D0C6
          70E0B91F9260645EF791D03C12444DFE151C3CDC08BDC1003F010468DF48D568
          B0FF401D685F999C0518407A5A1AEC76074E9D32E277F3EEC3C673536050C522
          80C084009429D038E8C49F6776A1FE881165FA7202F0C31B70539E48405DFD41
          FCA9BA6AF2164852AB31E41CC6594A50C505D371DE4FEB7B2415C9720EC1D021
          0E241E164F107C4C2F66F266984C5DF870782932A2E3B1B2E81052D4493874A4
          9E00D64DCE02050505502A95708DB8D07DB50B03967E2C7CB01C352794D04525
          A228311AB104CD8671F903386773C1E4B6E155C310F6D71FC794D43BF1466B39
          CA72808B3D2A6C2A6DC2E163FB515D3D993C40D70C80FD8F8E7AE0F57AF1DD65
          136214723C34FF7E7CDCCC63F7450E1E5F14A4123962651C9E2C906091CE43CA
          8FC04B7157A0BB0B35A775D8FAC717B0F3D4668CBA7E8BA9038B5159BD64E2BD
          A0B4AC944C7D56D80B649488D88624A6599FB0C66D36BBB0C3715C10BFFED52C
          E872F3B0ED9B45387CF9A8502F5036865FCCBA624D41E72C11D62EDB04ABF312
          EACFEF4657CB6CEC58FFEDB500AB2B2A0500A654A15040410085A49C8178BD62
          1211130D071B6D446C598E385D08B825A8935662D7CAB761F31C2085BC503988
          3FA1F810A25F1E9C87E3972B5094B904872EEC80F13CF61DDB8827D88629006C
          7E7D4B6F494909525353849DCCE1B06370D04ECAEC548E79421512C6B664B7C7
          03A7C3098F4B8A77FB1FC5F6657F21052F0AB3992837842DC27A61C6327C75E1
          5D9CBA80035FD6E011A120A9D9F0D23E0AB63991A935AC30F23F522EE1A4E083
          71F822B81C5B96AEC2E9F6B72704080BC2855114AF8026818273EF451C7A01F1
          4249463D9B3AD54FE0716B4D36F7AFA87F79F12368EEDB77C3123B5CBBB279B0
          45D3DE0D7C6DC4D7475FC1A35C48693483C3AD97E9AA799B615ABFE41E743AFE
          73FDCB41B14AF279C54B9E6AB8D64EE068034E9CF81B2A48D4723BDF05912DA5
          7C23F6C96231677C812CE867CA69392EFD8378DED606341C169457D1ED76EAB6
          1F0B7033F7C9E6938B962C062EFF8F665E47CA5F1B533E88D02AF831ED66EE53
          2D780DA6397AE07803AC5F6DC003246B0B2B076EEFD3EC569A66E116F4520C38
          0EAEC77CBA3653B720E28BE9A70650519F1AB25417C46F016FE4033F3500952E
          88099D3BC72BFF39006EDAFE0FD7904A7F91A502E90000003774455874636F6D
          6D656E740043616D65726120676F2066726F6D2049636F6E2047616C6C657279
          20687474703A2F2F69636F6E67616C2E636F6D2FEF0ACC870000002574455874
          646174653A63726561746500323031312D30382D32315431343A31323A31342D
          30363A30304DBE3B8D0000002574455874646174653A6D6F6469667900323031
          312D30382D32315431343A31323A31342D30363A30303CE38331000000197445
          5874536F6674776172650041646F626520496D616765526561647971C9653C00
          00000049454E44AE426082}
        ShowHint = True
        OnClick = imgTakePhotoClick
        OnMouseDown = imgClientMainMouseDown
        OnMouseUp = imgClientMainMouseUp
      end
    end
  end
  object PhotoLauncher: TRzLauncher
    Action = 'Open'
    FileName = 'PhotoUtil.exe'
    Timeout = -1
    OnFinished = PhotoLauncherFinished
    Left = 929
    Top = 332
  end
end
