inherited frmClientMain: TfrmClientMain
  Caption = 'frmClientMain'
  ClientHeight = 580
  ClientWidth = 1136
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1152
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1136
    ExplicitWidth = 1136
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Client record'
      ExplicitWidth = 78
    end
    object lblClientName: TRzLabel
      Left = 1043
      Top = 7
      Width = 82
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'NEW RECORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8675134
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitLeft = 830
    end
  end
  object pcClient: TRzPageControl
    Left = 175
    Top = 28
    Width = 961
    Height = 552
    Hint = ''
    ActivePage = tsLoansHistory
    Align = alClient
    BoldCurrentTab = True
    UseColoredTabs = True
    FlatColor = 6572079
    ShowFullFrame = False
    ShowShadow = False
    TabIndex = 3
    TabOrder = 1
    TabOrientation = toBottom
    TabStop = False
    TabStyle = tsRoundCorners
    FixedDimension = 20
    object tsClientInfo: TRzTabSheet
      Color = 15327448
      Caption = 'Client information'
      object JvLabel1: TJvLabel
        Left = 34
        Top = 49
        Width = 54
        Height = 14
        Caption = 'Lastname'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Left = 34
        Top = 76
        Width = 54
        Height = 14
        Caption = 'Firstname'
        Transparent = True
      end
      object JvLabel3: TJvLabel
        Left = 34
        Top = 103
        Width = 66
        Height = 14
        Caption = 'Middlename'
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Left = 34
        Top = 167
        Width = 52
        Height = 14
        Caption = 'Birthdate'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Left = 34
        Top = 194
        Width = 58
        Height = 14
        Caption = 'Civil status'
        Transparent = True
      end
      object JvLabel13: TJvLabel
        Left = 222
        Top = 167
        Width = 24
        Height = 14
        Caption = 'Age'
        Transparent = True
      end
      object JvLabel8: TJvLabel
        Left = 222
        Top = 192
        Width = 22
        Height = 14
        Caption = 'Sex'
        Transparent = True
      end
      object JvLabel35: TJvLabel
        Left = 34
        Top = 221
        Width = 66
        Height = 14
        Caption = 'Referred by'
        Transparent = True
      end
      object JvLabel4: TJvLabel
        Left = 359
        Top = 49
        Width = 37
        Height = 14
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Left = 359
        Top = 76
        Width = 51
        Height = 14
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Left = 359
        Top = 103
        Width = 70
        Height = 14
        Caption = 'City or town'
        Transparent = True
      end
      object urlCopyAddress: TRzURLLabel
        Left = 359
        Top = 220
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
        Left = 359
        Top = 130
        Width = 62
        Height = 14
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel15: TJvLabel
        Left = 359
        Top = 157
        Width = 48
        Height = 14
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel16: TJvLabel
        Left = 359
        Top = 185
        Width = 45
        Height = 14
        Caption = 'Contact'
        Transparent = True
      end
      object JvLabel9: TJvLabel
        Left = 359
        Top = 285
        Width = 37
        Height = 14
        Caption = 'Street'
        Transparent = True
      end
      object JvLabel10: TJvLabel
        Left = 359
        Top = 312
        Width = 51
        Height = 14
        Caption = 'Barangay'
        Transparent = True
      end
      object JvLabel11: TJvLabel
        Left = 359
        Top = 339
        Width = 70
        Height = 14
        Caption = 'City or town'
        Transparent = True
      end
      object JvLabel17: TJvLabel
        Left = 359
        Top = 366
        Width = 62
        Height = 14
        Caption = 'Res. status'
        Transparent = True
      end
      object JvLabel18: TJvLabel
        Left = 359
        Top = 393
        Width = 48
        Height = 14
        Caption = 'Landlord'
        Transparent = True
      end
      object JvLabel19: TJvLabel
        Left = 359
        Top = 421
        Width = 45
        Height = 14
        Caption = 'Contact'
        Transparent = True
      end
      object JvLabel20: TJvLabel
        Left = 34
        Top = 285
        Width = 29
        Height = 14
        Caption = 'Email'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Left = 34
        Top = 312
        Width = 54
        Height = 14
        Caption = 'Facebook'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Left = 34
        Top = 339
        Width = 36
        Height = 14
        Caption = 'Mobile'
        Transparent = True
      end
      object JvLabel23: TJvLabel
        Left = 663
        Top = 49
        Width = 52
        Height = 14
        Caption = 'Employer'
        Transparent = True
      end
      object JvLabel24: TJvLabel
        Left = 663
        Top = 76
        Width = 45
        Height = 14
        Caption = 'Address'
        Transparent = True
      end
      object JvLabel25: TJvLabel
        Left = 663
        Top = 130
        Width = 67
        Height = 14
        Caption = 'Emp. status'
        Transparent = True
      end
      object JvLabel26: TJvLabel
        Left = 663
        Top = 157
        Width = 65
        Height = 14
        Caption = 'Designation'
        Transparent = True
      end
      object JvLabel27: TJvLabel
        Left = 663
        Top = 185
        Width = 61
        Height = 14
        Caption = 'Imm. head'
        Transparent = True
      end
      object JvLabel28: TJvLabel
        Left = 663
        Top = 213
        Width = 86
        Height = 14
        Caption = 'Years in service'
        Transparent = True
      end
      object JvLabel29: TJvLabel
        Left = 663
        Top = 240
        Width = 74
        Height = 14
        Caption = 'Gross income'
        Transparent = True
      end
      object JvLabel30: TJvLabel
        Left = 663
        Top = 267
        Width = 45
        Height = 14
        Caption = 'Net pay'
        Transparent = True
      end
      object JvLabel31: TJvLabel
        Left = 663
        Top = 293
        Width = 77
        Height = 14
        Caption = 'Other income'
        Transparent = True
      end
      object JvLabel32: TJvLabel
        Left = 663
        Top = 422
        Width = 105
        Height = 14
        Caption = 'Information source'
        Transparent = True
      end
      object JvLabel38: TJvLabel
        Left = 34
        Top = 366
        Width = 61
        Height = 14
        Caption = 'Telephone'
        Transparent = True
      end
      object edLastname: TRzDBEdit
        Left = 113
        Top = 43
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'lastname'
        CharCase = ecUpperCase
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        ReadOnlyColor = clWhite
        TabOnEnter = True
        TabOrder = 0
      end
      object edFirstname: TRzDBEdit
        Left = 113
        Top = 70
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'firstname'
        CharCase = ecUpperCase
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = clWhite
        TabOnEnter = True
        TabOrder = 1
      end
      object edMiddlename: TRzDBEdit
        Left = 113
        Top = 97
        Width = 207
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'middlename'
        CharCase = ecUpperCase
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = clWhite
        TabOnEnter = True
        TabOrder = 2
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 113
        Top = 188
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
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object RzDBLookupComboBox2: TRzDBLookupComboBox
        Left = 254
        Top = 188
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
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object edAge: TRzEdit
        Left = 254
        Top = 161
        Width = 66
        Height = 22
        TabStop = False
        Text = ''
        Color = 15327448
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 15327448
        TabOrder = 4
      end
      object bteReferee: TRzButtonEdit
        Tag = 1
        Left = 113
        Top = 215
        Width = 207
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 14272955
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
        Left = 438
        Top = 43
        Width = 183
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'st'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 12
      end
      object RzDBEdit5: TRzDBEdit
        Left = 438
        Top = 70
        Width = 183
        Height = 22
        DataSource = dmClient.dscAddressInfo
        DataField = 'brgy'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 13
      end
      object RzDBLookupComboBox3: TRzDBLookupComboBox
        Left = 438
        Top = 97
        Width = 183
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
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object dbluResStatusPres: TRzDBLookupComboBox
        Left = 438
        Top = 124
        Width = 183
        Height = 22
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 15
        OnClick = dbluResStatusPresClick
        AllowNull = True
        FlatButtonColor = 8675134
        FlatButtons = True
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteLandlord: TRzButtonEdit
        Tag = 1
        Left = 438
        Top = 151
        Width = 183
        Height = 22
        Text = ''
        DisabledColor = 15327448
        Enabled = False
        FocusColor = clWhite
        FrameColor = 14272955
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
        Left = 438
        Top = 179
        Width = 183
        Height = 22
        Text = ''
        DisabledColor = 15327448
        Enabled = False
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 17
      end
      object edStreeProv: TRzDBEdit
        Left = 434
        Top = 279
        Width = 187
        Height = 22
        DataSource = dmClient.dscAddressInfo2
        DataField = 'st'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 18
      end
      object RzDBEdit7: TRzDBEdit
        Left = 434
        Top = 306
        Width = 187
        Height = 22
        DataSource = dmClient.dscAddressInfo2
        DataField = 'brgy'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 19
      end
      object RzDBLookupComboBox4: TRzDBLookupComboBox
        Left = 434
        Top = 333
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
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object dbluResStatusProv: TRzDBLookupComboBox
        Left = 434
        Top = 360
        Width = 187
        Height = 22
        DataField = 'res_status'
        DataSource = dmClient.dscAddressInfo2
        KeyField = 'value'
        ListField = 'display'
        ListSource = dmClient.dscResStatus
        TabOrder = 21
        OnClick = dbluResStatusProvClick
        AllowNull = True
        FlatButtons = True
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteLandlord2: TRzButtonEdit
        Tag = 1
        Left = 434
        Top = 387
        Width = 187
        Height = 22
        Text = ''
        DisabledColor = 15327448
        Enabled = False
        FrameColor = 14272955
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
        Left = 434
        Top = 415
        Width = 187
        Height = 22
        Text = ''
        DisabledColor = 15327448
        Enabled = False
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 23
      end
      object RzDBEdit8: TRzDBEdit
        Left = 113
        Top = 306
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'fb_acct'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 9
      end
      object RzDBEdit9: TRzDBEdit
        Left = 113
        Top = 279
        Width = 207
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'email_add'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 8
      end
      object edMobile: TRzDBEdit
        Left = 113
        Top = 333
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'mobile_no'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 10
      end
      object edTelephone: TRzDBEdit
        Left = 113
        Top = 360
        Width = 102
        Height = 22
        DataSource = dmClient.dscContactInfo
        DataField = 'home_phone'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 11
      end
      object bteEmployer: TRzButtonEdit
        Tag = 1
        Left = 738
        Top = 43
        Width = 187
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 14272955
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
        Left = 738
        Top = 124
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
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object mmEmployerAddress: TRzMemo
        Tag = 1
        Left = 738
        Top = 70
        Width = 187
        Height = 48
        Color = 15327448
        ReadOnly = True
        TabOrder = 25
        DisabledColor = 15327448
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
        TabOnEnter = True
      end
      object bteImmHead: TRzButtonEdit
        Tag = 1
        Left = 738
        Top = 179
        Width = 187
        Height = 22
        Text = ''
        Color = clWhite
        FrameColor = 14272955
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
        Left = 784
        Top = 207
        Width = 141
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'serv_len'
        Ctl3D = True
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 29
      end
      object RzDBLookupComboBox8: TRzDBLookupComboBox
        Left = 738
        Top = 151
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
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Left = 784
        Top = 234
        Width = 141
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'gross_pay'
        Alignment = taLeftJustify
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 30
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Left = 784
        Top = 261
        Width = 141
        Height = 22
        DataSource = dmClient.dscEmplInfo
        DataField = 'net_pay'
        Alignment = taLeftJustify
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 31
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object dteBirthdate: TRzDBDateTimeEdit
        Left = 113
        Top = 161
        Width = 95
        Height = 22
        DataSource = dmClient.dscPersonalInfo
        DataField = 'birth_date'
        FrameColor = 14272955
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
        Left = 663
        Top = 311
        Width = 262
        Height = 46
        DataField = 'oth_income'
        DataSource = dmClient.dscPersonalInfo
        TabOrder = 32
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object RzGroupBox2: TRzGroupBox
        Left = 18
        Top = 19
        Width = 302
        Height = 22
        BorderColor = 14272955
        BorderSides = []
        BorderWidth = 1
        Caption = 'Client name'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientColorStyle = gcsCustom
        GroupStyle = gsUnderline
        ParentFont = False
        TabOrder = 33
      end
      object RzGroupBox3: TRzGroupBox
        Left = 18
        Top = 137
        Width = 302
        Height = 22
        BorderColor = 14272955
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Personal info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientColorStyle = gcsCustom
        GroupStyle = gsUnderline
        ParentFont = False
        TabOrder = 34
      end
      object RzGroupBox4: TRzGroupBox
        Left = 18
        Top = 255
        Width = 302
        Height = 22
        BorderColor = 14273211
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Contact info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientColorStyle = gcsCustom
        GroupStyle = gsUnderline
        ParentFont = False
        TabOrder = 35
      end
      object RzGroupBox5: TRzGroupBox
        Left = 343
        Top = 19
        Width = 278
        Height = 22
        BorderColor = 14273211
        BorderSides = [sdTop]
        BorderWidth = 1
        Caption = 'Present address'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientColorStyle = gcsCustom
        GroupStyle = gsUnderline
        ParentFont = False
        TabOrder = 36
      end
      object RzGroupBox6: TRzGroupBox
        Left = 343
        Top = 255
        Width = 278
        Height = 22
        BorderColor = 14273211
        BorderSides = []
        BorderWidth = 1
        Caption = 'Provincial address'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
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
      object RzGroupBox7: TRzGroupBox
        Left = 647
        Top = 19
        Width = 278
        Height = 22
        BorderColor = 14273211
        BorderSides = []
        BorderWidth = 1
        Caption = 'Employment info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
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
      object RzGroupBox8: TRzGroupBox
        Left = 647
        Top = 393
        Width = 278
        Height = 22
        BorderColor = 14273211
        BorderSides = []
        BorderWidth = 1
        Caption = 'Other info'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 12493963
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
      object dbluInformationSource: TRzDBLookupComboBox
        Left = 778
        Top = 416
        Width = 147
        Height = 22
        DataField = 'source_id'
        DataSource = dmClient.dscPersonalInfo
        Enabled = False
        KeyField = 'source_id'
        ListField = 'source_name'
        ListSource = dmAux.dscInfoSource
        TabOrder = 40
        AllowNull = True
        FlatButtonColor = 6572079
        FlatButtons = True
        DisabledColor = 15327448
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
    end
    object tsReferences: TRzTabSheet
      Color = 15327448
      Caption = 'Family and references'
      DesignSize = (
        961
        529)
      object pnlFamRef: TRzPanel
        Left = 6
        Top = 6
        Width = 667
        Height = 517
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        FlatColor = 14273211
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          667
          517)
        object urlRefreshRefList: TRzURLLabel
          Left = 96
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
          Width = 665
          Height = 515
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dmRef.dscRefInfo
          FixedColor = clWhite
          GradientEndColor = 15327448
          GradientStartColor = 15327448
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameColor = 6572079
          FrameSides = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          FixedLineColor = clWhite
          LineColor = clWhite
          AltRowShadingColor = 15854564
          Columns = <
            item
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
        Left = 679
        Top = 6
        Width = 276
        Height = 517
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          517)
        object JvLabel40: TJvLabel
          Left = 13
          Top = 23
          Width = 54
          Height = 14
          Caption = 'Lastname'
          Transparent = True
        end
        object JvLabel41: TJvLabel
          Left = 13
          Top = 50
          Width = 54
          Height = 14
          Caption = 'Firstname'
          Transparent = True
        end
        object JvLabel42: TJvLabel
          Left = 13
          Top = 77
          Width = 36
          Height = 14
          Caption = 'Middle'
          Transparent = True
        end
        object JvLabel39: TJvLabel
          Left = 13
          Top = 104
          Width = 45
          Height = 14
          Caption = 'Relation'
          Transparent = True
        end
        object urlCopyClientAddress: TRzURLLabel
          Tag = 1
          Left = 95
          Top = 251
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
          Top = 175
          Width = 70
          Height = 14
          Caption = 'City or town'
          Transparent = True
        end
        object JvLabel44: TJvLabel
          Left = 13
          Top = 202
          Width = 51
          Height = 14
          Caption = 'Barangay'
          Transparent = True
        end
        object JvLabel43: TJvLabel
          Left = 13
          Top = 229
          Width = 37
          Height = 14
          Caption = 'Street'
          Transparent = True
        end
        object JvLabel47: TJvLabel
          Left = 13
          Top = 310
          Width = 36
          Height = 14
          Caption = 'Mobile'
          Transparent = True
        end
        object JvLabel46: TJvLabel
          Left = 13
          Top = 283
          Width = 61
          Height = 14
          Caption = 'Telephone'
          Transparent = True
        end
        object pnlAddFamRef: TRzPanel
          Left = 8
          Top = 487
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 12
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
        object RzDBEdit3: TRzDBEdit
          Left = 95
          Top = 17
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'lastname'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = 15327448
          Ctl3D = True
          DisabledColor = clWindow
          FocusColor = 14273211
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          ReadOnlyColor = 15327448
          TabOrder = 0
        end
        object RzDBEdit2: TRzDBEdit
          Left = 95
          Top = 44
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'firstname'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = 15327448
          DisabledColor = clWindow
          FocusColor = 14273211
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = 15327448
          TabOrder = 1
        end
        object RzDBEdit1: TRzDBEdit
          Left = 95
          Top = 71
          Width = 168
          Height = 22
          DataSource = dmRef.dscPersonalInfo
          DataField = 'middlename'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = 15327448
          DisabledColor = clWindow
          FocusColor = 14273211
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = 15327448
          TabOrder = 2
        end
        object RzDBLookupComboBox9: TRzDBLookupComboBox
          Tag = 1
          Left = 95
          Top = 98
          Width = 168
          Height = 22
          DataField = 'ref_type'
          DataSource = dmRef.dscRefInfo
          KeyField = 'ref_type'
          ListField = 'ref_name'
          ListSource = dmAux.dscRefType
          TabOrder = 3
          AllowNull = True
          FlatButtonColor = 8675134
          FlatButtons = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
        object RzDBCheckBox1: TRzDBCheckBox
          Tag = 1
          Left = 98
          Top = 126
          Width = 81
          Height = 16
          DataField = 'is_dependent'
          DataSource = dmRef.dscRefInfo
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Dependent'
          DisabledColor = clWindow
          TabOnEnter = True
          TabOrder = 4
        end
        object RzDBCheckBox2: TRzDBCheckBox
          Tag = 1
          Left = 98
          Top = 147
          Width = 64
          Height = 16
          DataField = 'is_student'
          DataSource = dmRef.dscRefInfo
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Student'
          DisabledColor = clWindow
          TabOnEnter = True
          TabOrder = 5
        end
        object RzDBLookupComboBox10: TRzDBLookupComboBox
          Tag = 1
          Left = 95
          Top = 169
          Width = 168
          Height = 22
          DataField = 'post_code'
          DataSource = dmRef.dscAddressInfo
          KeyField = 'post_code'
          ListField = 'town'
          ListSource = dmAux.dscTowns
          TabOrder = 6
          AllowNull = True
          FlatButtons = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
        object RzDBEdit13: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 196
          Width = 168
          Height = 22
          DataSource = dmRef.dscAddressInfo
          DataField = 'brgy'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 7
        end
        object RzDBEdit14: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 223
          Width = 168
          Height = 22
          DataSource = dmRef.dscAddressInfo
          DataField = 'st'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 8
        end
        object RzDBEdit20: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 304
          Width = 168
          Height = 22
          DataSource = dmRef.dscContactInfo
          DataField = 'mobile_no'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 9
        end
        object RzDBEdit19: TRzDBEdit
          Tag = 1
          Left = 95
          Top = 277
          Width = 168
          Height = 22
          DataSource = dmRef.dscContactInfo
          DataField = 'home_phone'
          Ctl3D = True
          DisabledColor = clWindow
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 10
        end
        object pnlRemoveFamRef: TRzPanel
          Left = 65
          Top = 487
          Width = 60
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 11
          object sbtnRemoveFamRef: TRzShapeButton
            Left = 0
            Top = 0
            Width = 60
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
      Color = 15327448
      Caption = 'Identity information'
      DesignSize = (
        961
        529)
      object pnlIdentity: TRzPanel
        Left = 6
        Top = 6
        Width = 667
        Height = 517
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grIdentityList: TRzDBGrid
          Left = 1
          Top = 1
          Width = 665
          Height = 515
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dmClient.dscIdentInfo
          FixedColor = clWhite
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameSides = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          FixedLineColor = clWhite
          LineColor = 6572079
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
        Left = 679
        Top = 6
        Width = 276
        Height = 517
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          517)
        object JvLabel49: TJvLabel
          Left = 13
          Top = 23
          Width = 30
          Height = 14
          Caption = 'Type'
          Transparent = True
        end
        object JvLabel50: TJvLabel
          Left = 13
          Top = 50
          Width = 60
          Height = 14
          Caption = 'ID number'
          Transparent = True
        end
        object JvLabel51: TJvLabel
          Left = 13
          Top = 77
          Width = 34
          Height = 14
          Caption = 'Expiry'
          Transparent = True
        end
        object JvLabel52: TJvLabel
          Left = 80
          Top = 99
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
          Top = 487
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
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
        object pnlRemIdentDoc: TRzPanel
          Left = 65
          Top = 487
          Width = 60
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 4
          object sbtnRemIdentDoc: TRzShapeButton
            Left = 0
            Top = 0
            Width = 60
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
          Top = 17
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
          FrameColor = 14272955
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = 15327448
          TabOnEnter = True
        end
        object edIdNo: TRzDBEdit
          Left = 80
          Top = 44
          Width = 183
          Height = 22
          DataSource = dmClient.dscIdentInfo
          DataField = 'ident_no'
          CharCase = ecUpperCase
          DisabledColor = clWhite
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
          TabOrder = 1
        end
        object dteExpiry: TRzDBDateTimeEdit
          Left = 80
          Top = 71
          Width = 183
          Height = 22
          DataSource = dmClient.dscIdentInfo
          DataField = 'exp_date'
          DisabledColor = clWhite
          FrameColor = 14272955
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
      Color = 15327448
      Caption = 'Loans history'
      DesignSize = (
        961
        529)
      object pnlLoans: TRzPanel
        Left = 6
        Top = 6
        Width = 949
        Height = 517
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grLoans: TRzDBGrid
          Left = 1
          Top = 1
          Width = 947
          Height = 515
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dmClient.dscLoans
          FixedColor = clWhite
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          PopupMenu = ppLoans
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grLoansDblClick
          FrameSides = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          FixedLineColor = clWhite
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
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'amort_f'
              Title.Alignment = taCenter
              Title.Caption = 'Amortization'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'int_deficit_f'
              Title.Alignment = taCenter
              Title.Caption = 'Interest deficit'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'prc_deficit_f'
              Title.Alignment = taCenter
              Title.Caption = 'Principal deficit'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'balance_f'
              Title.Alignment = taCenter
              Title.Caption = 'Balance'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end>
        end
      end
    end
    object tsGroups: TRzTabSheet
      Color = 15327448
      Caption = 'Groups'
      DesignSize = (
        961
        529)
      object RzGroupBox1: TRzGroupBox
        Left = 19
        Top = 12
        Width = 926
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 15327448
        BorderSides = []
        BorderWidth = 1
        Caption = 'Groups'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clRed
        CaptionFont.Height = -12
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        Color = 15327448
        FlatColor = 15327448
        FlatColorAdjustment = 0
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
      object lbGroups: TRzListBox
        Left = 19
        Top = 32
        Width = 926
        Height = 401
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 15327448
        Columns = 3
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ItemHeight = 14
        TabOrder = 1
      end
      object pnlAddGroup: TRzPanel
        Left = 19
        Top = 470
        Width = 78
        Height = 22
        Anchors = [akLeft, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 2
        object sbtnAddGroup: TRzShapeButton
          Left = 0
          Top = 0
          Width = 81
          Height = 22
          Hint = 'Add group'
          BorderStyle = bsNone
          Caption = 'Add group'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAddGroupClick
        end
      end
      object pnlRemoveGroup: TRzPanel
        Left = 104
        Top = 470
        Width = 78
        Height = 22
        Anchors = [akLeft, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 3
        object sbtnRemoveGroup: TRzShapeButton
          Left = 0
          Top = 0
          Width = 81
          Height = 22
          Hint = 'Remove group'
          BorderStyle = bsNone
          Caption = 'Remove'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnRemoveGroupClick
        end
      end
    end
    object tsBankAcctInfo: TRzTabSheet
      Color = 15327448
      Caption = 'Bank account info'
      DesignSize = (
        961
        529)
      object pnlAccounts: TRzPanel
        Left = 6
        Top = 6
        Width = 667
        Height = 517
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grAccounts: TRzDBGrid
          Left = 1
          Top = 1
          Width = 665
          Height = 515
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmClient.dscAcctInfo
          FixedColor = clWhite
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          FixedLineColor = clWhite
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
              FieldName = 'bank_name'
              Title.Alignment = taCenter
              Title.Caption = 'Bank'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'acct_no'
              Title.Alignment = taCenter
              Title.Caption = 'Account no.'
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
              FieldName = 'card_no'
              Title.Alignment = taCenter
              Title.Caption = 'Card no.'
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
              FieldName = 'card_expiry_f'
              Title.Alignment = taCenter
              Title.Caption = 'Card expiry'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
      end
      object pnlAcctDetails: TRzPanel
        Left = 679
        Top = 6
        Width = 276
        Height = 516
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          516)
        object JvLabel37: TJvLabel
          Left = 13
          Top = 23
          Width = 28
          Height = 14
          Caption = 'Bank'
          Transparent = True
        end
        object JvLabel48: TJvLabel
          Left = 13
          Top = 103
          Width = 94
          Height = 14
          Caption = 'Account number'
          Transparent = True
        end
        object JvLabel34: TJvLabel
          Left = 13
          Top = 157
          Width = 63
          Height = 14
          Caption = 'Expiry date'
          Transparent = True
        end
        object JvLabel33: TJvLabel
          Left = 13
          Top = 130
          Width = 72
          Height = 14
          Caption = 'Card number'
          Transparent = True
        end
        object RzPanel5: TRzPanel
          Left = 8
          Top = 486
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 5
          object sbtnNewBankAccount: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Add a new record'
            BorderStyle = bsNone
            Caption = 'New'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnNewBankAccountClick
          end
        end
        object RzPanel7: TRzPanel
          Left = 65
          Top = 486
          Width = 60
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 6
          object sbtnRemoveBankAccount: TRzShapeButton
            Left = 0
            Top = 0
            Width = 60
            Height = 22
            Hint = 'Remove record'
            BorderStyle = bsNone
            Caption = 'Remove'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnRemoveBankAccountClick
          end
        end
        object edCardNo: TRzDBEdit
          Left = 136
          Top = 124
          Width = 127
          Height = 22
          DataSource = dmClient.dscAcctInfo
          DataField = 'card_no'
          Ctl3D = True
          DisabledColor = 15327448
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          ReadOnlyColor = 15327448
          TabOnEnter = True
          TabOrder = 3
        end
        object edAccount: TRzDBEdit
          Left = 136
          Top = 97
          Width = 127
          Height = 22
          DataSource = dmClient.dscAcctInfo
          DataField = 'acct_no'
          Ctl3D = True
          DisabledColor = 15327448
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          ReadOnlyColor = 15327448
          TabOnEnter = True
          TabOrder = 2
        end
        object dteCardExpiry: TRzDBDateTimeEdit
          Left = 136
          Top = 151
          Width = 127
          Height = 22
          DataSource = dmClient.dscAcctInfo
          DataField = 'card_expiry'
          DisabledColor = clWhite
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
          TabOrder = 4
          EditType = etDate
          Format = 'mm/dd/yyyy'
          FlatButtons = True
        end
        object mmBank: TRzDBMemo
          Left = 72
          Top = 45
          Width = 191
          Height = 46
          Color = 15327448
          DataField = 'bank_name'
          DataSource = dmClient.dscAcctInfo
          ReadOnly = True
          TabOrder = 1
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ReadOnlyColor = 15327448
          TabOnEnter = True
        end
        object dbluBank: TRzDBLookupComboBox
          Left = 72
          Top = 17
          Width = 191
          Height = 22
          DataField = 'bank_id'
          DataSource = dmClient.dscAcctInfo
          KeyField = 'bank_id'
          ListField = 'bank_name'
          ListSource = dmAux.dscBankBranches
          TabOrder = 0
          AllowNull = True
          FlatButtonColor = 6572079
          FlatButtons = True
          FrameColor = 14272955
          FrameHotColor = clBlack
          FrameVisible = True
          FramingPreference = fpCustomFraming
          TabOnEnter = True
        end
      end
    end
    object tsPromissoryNotes: TRzTabSheet
      Color = 15327448
      Caption = 'Promissory notes'
      DesignSize = (
        961
        529)
      object pnlPromissoryNotes: TRzPanel
        Left = 6
        Top = 6
        Width = 673
        Height = 516
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 0
        object grPromissoryNotes: TRzDBGrid
          Left = 1
          Top = 1
          Width = 671
          Height = 514
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dmClient.dscPromissoryNotes
          FixedColor = clWhite
          GradientEndColor = 12955288
          GradientStartColor = 12955288
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FrameStyle = fsNone
          FramingPreference = fpCustomFraming
          FixedLineColor = clWhite
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
              FieldName = 'pn_no'
              Title.Alignment = taCenter
              Title.Caption = 'PN No.'
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
              Width = 100
              Visible = True
            end>
        end
      end
      object RzPanel2: TRzPanel
        Left = 685
        Top = 6
        Width = 276
        Height = 516
        Anchors = [akTop, akRight, akBottom]
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          276
          516)
        object JvLabel36: TJvLabel
          Left = 13
          Top = 23
          Width = 39
          Height = 14
          Caption = 'PN no.'
          Transparent = True
        end
        object RzPanel3: TRzPanel
          Left = 8
          Top = 486
          Width = 50
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 1
          object sbtnNewPromissoryNote: TRzShapeButton
            Left = 0
            Top = 0
            Width = 50
            Height = 22
            Hint = 'Add a new record'
            BorderStyle = bsNone
            Caption = 'New'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnNewPromissoryNoteClick
          end
        end
        object RzPanel10: TRzPanel
          Left = 65
          Top = 486
          Width = 60
          Height = 22
          Anchors = [akLeft, akBottom]
          BorderOuter = fsNone
          BorderColor = 14272955
          BorderWidth = 1
          Color = 15327448
          TabOrder = 2
          object sbtnRemovePromissoryNote: TRzShapeButton
            Left = 0
            Top = 0
            Width = 60
            Height = 22
            Hint = 'Remove record'
            BorderStyle = bsNone
            Caption = 'Remove'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnRemovePromissoryNoteClick
          end
        end
        object edPNNo: TRzDBEdit
          Left = 72
          Top = 17
          Width = 185
          Height = 22
          DataSource = dmClient.dscPromissoryNotes
          DataField = 'pn_no'
          Ctl3D = True
          DisabledColor = 14273211
          FrameColor = 14272955
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 0
        end
      end
    end
    object tsPhoto: TRzTabSheet
      Color = 15327448
      Caption = 'Photo'
      object pnlPhoto: TRzPanel
        Left = 157
        Top = 36
        Width = 524
        Height = 373
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Caption = 'No photo available.'
        Color = 15327448
        TabOrder = 0
        object imgClient: TImage
          Left = 1
          Top = 1
          Width = 522
          Height = 371
          Align = alClient
          Center = True
          Proportional = True
          ExplicitLeft = 157
          ExplicitTop = 36
          ExplicitWidth = 524
          ExplicitHeight = 373
        end
        object VideoWindow: TVideoWindow
          Left = 1
          Top = 1
          Width = 522
          Height = 371
          VMROptions.Mode = vmrRenderless
          Color = 15327448
          Visible = False
          Align = alClient
        end
      end
      object ListBox: TListBox
        Left = 17
        Top = 20
        Width = 121
        Height = 97
        ItemHeight = 14
        TabOrder = 1
        Visible = False
      end
      object ListBox2: TListBox
        Left = 17
        Top = 123
        Width = 121
        Height = 97
        ItemHeight = 14
        TabOrder = 2
        Visible = False
      end
      object pnlTakePhoto: TRzPanel
        Left = 157
        Top = 434
        Width = 95
        Height = 22
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 3
        object btnTakePhoto: TRzShapeButton
          Left = 0
          Top = 0
          Width = 95
          Height = 22
          Hint = 'Take photo'
          BorderStyle = bsNone
          Caption = 'Take photo'
          OnClick = btnTakePhotoClick
        end
      end
      object pnlCancel: TRzPanel
        Left = 261
        Top = 434
        Width = 50
        Height = 22
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 4
        object btnCancel: TRzShapeButton
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Hint = 'Cancel'
          BorderStyle = bsNone
          Caption = 'Cancel'
          OnClick = btnCancelClick
        end
      end
    end
  end
  object pnlToolbar: TRzPanel
    Left = 0
    Top = 28
    Width = 175
    Height = 552
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    Enabled = False
    TabOrder = 2
    object urlHome: TRzURLLabel
      Left = 18
      Top = 19
      Width = 32
      Height = 14
      Caption = 'Home'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlHomeClick
    end
    object urlFamilyAndReferences: TRzURLLabel
      Left = 18
      Top = 43
      Width = 118
      Height = 14
      Caption = 'Family and references'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlFamilyAndReferencesClick
    end
    object urlIdentityInformation: TRzURLLabel
      Left = 18
      Top = 67
      Width = 108
      Height = 14
      Caption = 'Identity information'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlIdentityInformationClick
    end
    object urlBankAccountInformation: TRzURLLabel
      Left = 18
      Top = 91
      Width = 139
      Height = 14
      Caption = 'Bank account information'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlBankAccountInformationClick
    end
    object urlLoanHistory: TRzURLLabel
      Left = 18
      Top = 115
      Width = 66
      Height = 14
      Caption = 'Loan history'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlLoanHistoryClick
    end
    object urlGroups: TRzURLLabel
      Left = 18
      Top = 139
      Width = 38
      Height = 14
      Caption = 'Groups'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlGroupsClick
    end
    object urlPromissoryNotes: TRzURLLabel
      Left = 18
      Top = 163
      Width = 92
      Height = 14
      Caption = 'Promissory notes'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlPromissoryNotesClick
    end
    object urlPhoto: TRzURLLabel
      Left = 18
      Top = 187
      Width = 33
      Height = 14
      Caption = 'Photo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlPhotoClick
    end
  end
  object ppLoans: TPopupMenu
    Left = 14
    Top = 531
    object Ledger1: TMenuItem
      Caption = 'Ledger'
      OnClick = Ledger1Click
    end
    object Loandetails1: TMenuItem
      Caption = 'Loan details'
      OnClick = Loandetails1Click
    end
  end
  object SampleGrabber: TSampleGrabber
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 240
    Top = 65489
  end
  object VideoSourceFilter: TFilter
    BaseFilter.data = {00000000}
    Left = 176
    Top = 65489
  end
  object CaptureGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 208
    Top = 65489
  end
end
