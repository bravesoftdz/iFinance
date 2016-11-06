inherited frmComakerDetail: TfrmComakerDetail
  Caption = 'frmComakerDetail'
  ClientHeight = 383
  ClientWidth = 690
  OnCreate = FormCreate
  ExplicitWidth = 690
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 690
    ExplicitWidth = 674
    inherited imgClose: TImage
      Left = 669
      ExplicitLeft = 653
    end
    inherited lblCaption: TRzLabel
      Width = 51
      Caption = 'Comaker'
      ExplicitWidth = 51
    end
  end
  inherited pnlMain: TRzPanel
    Width = 690
    Height = 362
    ExplicitWidth = 674
    ExplicitHeight = 510
    inherited lblStatus: TLabel
      Top = 327
      Width = 488
      ExplicitTop = 327
      ExplicitWidth = 488
    end
    inherited pcDetail: TRzPageControl
      Width = 673
      Height = 308
      TabOrientation = toBottom
      ExplicitWidth = 657
      ExplicitHeight = 456
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        Caption = 'Comaker details'
        ExplicitTop = -9
        ExplicitWidth = 648
        ExplicitHeight = 379
        object JvGroupHeader1: TJvGroupHeader
          Left = 19
          Top = 20
          Width = 302
          Height = 12
          Caption = 'Comaker Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9134911
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
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
        object JvLabel8: TJvLabel
          Left = 223
          Top = 154
          Width = 20
          Height = 13
          Caption = 'Sex'
          Transparent = True
        end
        object JvGroupHeader5: TJvGroupHeader
          Left = 343
          Top = 20
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
        object JvLabel22: TJvLabel
          Left = 359
          Top = 40
          Width = 71
          Height = 13
          Caption = 'Mobile/tel. no.'
          Transparent = True
        end
        object JvGroupHeader2: TJvGroupHeader
          Left = 343
          Top = 75
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
          Left = 359
          Top = 95
          Width = 32
          Height = 13
          Caption = 'Street'
          Transparent = True
        end
        object JvLabel5: TJvLabel
          Left = 359
          Top = 119
          Width = 48
          Height = 13
          Caption = 'Barangay'
          Transparent = True
        end
        object JvLabel6: TJvLabel
          Left = 359
          Top = 143
          Width = 61
          Height = 13
          Caption = 'City or town'
          Transparent = True
        end
        object urlCopyAddress: TRzURLLabel
          Left = 438
          Top = 162
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
        object JvGroupHeader4: TJvGroupHeader
          Left = 343
          Top = 182
          Width = 302
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
          Left = 359
          Top = 202
          Width = 32
          Height = 13
          Caption = 'Street'
          Transparent = True
        end
        object JvLabel10: TJvLabel
          Left = 359
          Top = 226
          Width = 48
          Height = 13
          Caption = 'Barangay'
          Transparent = True
        end
        object JvLabel11: TJvLabel
          Left = 359
          Top = 250
          Width = 61
          Height = 13
          Caption = 'City or town'
          Transparent = True
        end
        object JvGroupHeader6: TJvGroupHeader
          Left = 23
          Top = 182
          Width = 298
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
          Left = 39
          Top = 202
          Width = 46
          Height = 13
          Caption = 'Employer'
          Transparent = True
        end
        object JvLabel24: TJvLabel
          Left = 39
          Top = 226
          Width = 41
          Height = 13
          Caption = 'Address'
          Transparent = True
        end
        object JvLabel28: TJvLabel
          Left = 39
          Top = 268
          Width = 67
          Height = 13
          Caption = 'Service years'
          Transparent = True
        end
        object edMiddlename: TRzDBEdit
          Left = 114
          Top = 82
          Width = 207
          Height = 21
          DataSource = dmComaker.dscPersonalInfo
          DataField = 'middlename'
          CharCase = ecUpperCase
          TabOnEnter = True
          TabOrder = 2
        end
        object edFirstname: TRzDBEdit
          Left = 114
          Top = 58
          Width = 207
          Height = 21
          DataSource = dmComaker.dscPersonalInfo
          DataField = 'firstname'
          CharCase = ecUpperCase
          TabOnEnter = True
          TabOrder = 1
        end
        object edLastname: TRzDBEdit
          Left = 114
          Top = 34
          Width = 207
          Height = 21
          DataSource = dmComaker.dscPersonalInfo
          DataField = 'lastname'
          CharCase = ecUpperCase
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 0
        end
        object dteBirthdate: TRzDBDateTimeEdit
          Left = 114
          Top = 124
          Width = 95
          Height = 21
          DataSource = dmComaker.dscPersonalInfo
          DataField = 'birth_date'
          TabOnEnter = True
          TabOrder = 3
          EditType = etDate
        end
        object RzDBLookupComboBox1: TRzDBLookupComboBox
          Left = 114
          Top = 148
          Width = 95
          Height = 21
          DataField = 'civil_status'
          DataSource = dmComaker.dscPersonalInfo
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmComaker.dscCivilStatus
          TabOrder = 4
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object RzDBLookupComboBox2: TRzDBLookupComboBox
          Left = 255
          Top = 148
          Width = 66
          Height = 21
          DataField = 'gender'
          DataSource = dmComaker.dscPersonalInfo
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmComaker.dscGender
          TabOrder = 5
          TabOnEnter = True
        end
        object RzDBEdit11: TRzDBEdit
          Left = 438
          Top = 34
          Width = 100
          Height = 21
          DataSource = dmComaker.dscContactInfo
          DataField = 'mobile_no'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 9
        end
        object RzDBEdit10: TRzDBEdit
          Left = 541
          Top = 34
          Width = 104
          Height = 21
          DataSource = dmComaker.dscContactInfo
          DataField = 'home_phone'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 10
        end
        object RzDBEdit4: TRzDBEdit
          Left = 438
          Top = 89
          Width = 207
          Height = 21
          DataSource = dmComaker.dscAddressInfo
          DataField = 'st'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 11
        end
        object RzDBEdit5: TRzDBEdit
          Left = 438
          Top = 113
          Width = 207
          Height = 21
          DataSource = dmComaker.dscAddressInfo
          DataField = 'brgy'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 12
        end
        object RzDBLookupComboBox3: TRzDBLookupComboBox
          Left = 438
          Top = 137
          Width = 207
          Height = 21
          DataField = 'post_code'
          DataSource = dmComaker.dscAddressInfo
          KeyField = 'post_code'
          ListField = 'town'
          ListSource = dmAux.dscTowns
          TabOrder = 13
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object RzDBLookupComboBox4: TRzDBLookupComboBox
          Left = 438
          Top = 244
          Width = 207
          Height = 21
          DataField = 'post_code'
          DataSource = dmComaker.dscAddressInfo2
          KeyField = 'post_code'
          ListField = 'town'
          ListSource = dmAux.dscTowns
          TabOrder = 16
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object RzDBEdit7: TRzDBEdit
          Left = 438
          Top = 220
          Width = 207
          Height = 21
          DataSource = dmComaker.dscAddressInfo2
          DataField = 'brgy'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 15
        end
        object RzDBEdit6: TRzDBEdit
          Left = 438
          Top = 196
          Width = 207
          Height = 21
          DataSource = dmComaker.dscAddressInfo2
          DataField = 'st'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 14
        end
        object bteEmployer: TRzButtonEdit
          Tag = 1
          Left = 114
          Top = 196
          Width = 207
          Height = 21
          Text = ''
          Color = clInfoBk
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOnEnter = True
          TabOrder = 6
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
        object mmEmployerAddress: TRzMemo
          Tag = 1
          Left = 114
          Top = 220
          Width = 207
          Height = 39
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 7
          TabOnEnter = True
        end
        object RzDBEdit12: TRzDBEdit
          Left = 114
          Top = 262
          Width = 59
          Height = 21
          DataSource = dmComaker.dscEmplInfo
          DataField = 'serv_len'
          Ctl3D = True
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 8
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 524
      Top = 327
      ExplicitLeft = 508
      ExplicitTop = 475
    end
    inherited btnCancel: TRzButton
      Left = 605
      Top = 327
      ExplicitLeft = 589
      ExplicitTop = 475
    end
  end
end
