inherited frmComakerDetail: TfrmComakerDetail
  Caption = 'frmComakerDetail'
  ClientHeight = 428
  ClientWidth = 694
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 694
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 694
    ExplicitWidth = 694
    inherited imgClose: TImage
      Left = 673
      ExplicitLeft = 653
    end
    inherited lblCaption: TRzLabel
      Width = 51
      Caption = 'Comaker'
      ExplicitWidth = 51
    end
  end
  inherited pnlMain: TRzPanel
    Width = 694
    Height = 407
    ExplicitWidth = 694
    ExplicitHeight = 407
    inherited pnlDetail: TRzPanel
      Width = 678
      Height = 361
      ExplicitWidth = 678
      ExplicitHeight = 361
      inherited pcDetail: TRzPageControl
        Width = 676
        Height = 359
        TabOrientation = toBottom
        ExplicitWidth = 676
        ExplicitHeight = 359
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          Caption = 'Comaker details'
          ExplicitWidth = 676
          ExplicitHeight = 360
          object urlCopyAddress: TRzURLLabel
            Left = 359
            Top = 188
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
          object Label1: TLabel
            Left = 35
            Top = 42
            Width = 52
            Height = 14
            Caption = 'Lastname'
          end
          object Label2: TLabel
            Left = 35
            Top = 69
            Width = 52
            Height = 14
            Caption = 'Firstname'
          end
          object Label3: TLabel
            Left = 35
            Top = 96
            Width = 34
            Height = 14
            Caption = 'Middle'
          end
          object Label4: TLabel
            Left = 35
            Top = 156
            Width = 50
            Height = 14
            Caption = 'Birthdate'
          end
          object Label5: TLabel
            Left = 35
            Top = 183
            Width = 56
            Height = 14
            Caption = 'Civil status'
          end
          object Label6: TLabel
            Left = 223
            Top = 183
            Width = 20
            Height = 14
            Caption = 'Sex'
          end
          object Label7: TLabel
            Left = 39
            Top = 241
            Width = 50
            Height = 14
            Caption = 'Employer'
          end
          object Label8: TLabel
            Left = 39
            Top = 268
            Width = 43
            Height = 14
            Caption = 'Address'
          end
          object Label9: TLabel
            Left = 39
            Top = 322
            Width = 71
            Height = 14
            Caption = 'Service years'
          end
          object Label10: TLabel
            Left = 359
            Top = 42
            Width = 82
            Height = 14
            Caption = 'Mobile/Tel. no.'
          end
          object Label11: TLabel
            Left = 359
            Top = 107
            Width = 35
            Height = 14
            Caption = 'Street'
          end
          object Label12: TLabel
            Left = 359
            Top = 134
            Width = 49
            Height = 14
            Caption = 'Barangay'
          end
          object Label13: TLabel
            Left = 359
            Top = 161
            Width = 68
            Height = 14
            Caption = 'City or town'
          end
          object Label14: TLabel
            Left = 359
            Top = 241
            Width = 35
            Height = 14
            Caption = 'Street'
          end
          object Label15: TLabel
            Left = 359
            Top = 268
            Width = 49
            Height = 14
            Caption = 'Barangay'
          end
          object Label16: TLabel
            Left = 359
            Top = 295
            Width = 68
            Height = 14
            Caption = 'City or town'
          end
          object edMiddlename: TRzDBEdit
            Left = 114
            Top = 90
            Width = 207
            Height = 22
            DataSource = dmComaker.dscPersonalInfo
            DataField = 'middlename'
            CharCase = ecUpperCase
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 2
          end
          object edFirstname: TRzDBEdit
            Left = 114
            Top = 63
            Width = 207
            Height = 22
            DataSource = dmComaker.dscPersonalInfo
            DataField = 'firstname'
            CharCase = ecUpperCase
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = clWhite
            TabOnEnter = True
            TabOrder = 1
          end
          object edLastname: TRzDBEdit
            Left = 114
            Top = 36
            Width = 207
            Height = 22
            DataSource = dmComaker.dscPersonalInfo
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
          object dteBirthdate: TRzDBDateTimeEdit
            Left = 114
            Top = 150
            Width = 95
            Height = 22
            DataSource = dmComaker.dscPersonalInfo
            DataField = 'birth_date'
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 3
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object RzDBLookupComboBox1: TRzDBLookupComboBox
            Left = 114
            Top = 177
            Width = 95
            Height = 22
            DataField = 'civil_status'
            DataSource = dmComaker.dscPersonalInfo
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmComaker.dscCivilStatus
            TabOrder = 4
            AllowNull = True
            FlatButtons = True
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object RzDBLookupComboBox2: TRzDBLookupComboBox
            Left = 255
            Top = 177
            Width = 66
            Height = 22
            DataField = 'gender'
            DataSource = dmComaker.dscPersonalInfo
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmComaker.dscGender
            TabOrder = 5
            FlatButtons = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object RzDBEdit11: TRzDBEdit
            Left = 438
            Top = 36
            Width = 100
            Height = 22
            DataSource = dmComaker.dscContactInfo
            DataField = 'mobile_no'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 9
          end
          object RzDBEdit10: TRzDBEdit
            Left = 541
            Top = 36
            Width = 104
            Height = 22
            DataSource = dmComaker.dscContactInfo
            DataField = 'home_phone'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 10
          end
          object RzDBEdit4: TRzDBEdit
            Left = 438
            Top = 101
            Width = 207
            Height = 22
            DataSource = dmComaker.dscAddressInfo
            DataField = 'st'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 11
          end
          object RzDBEdit5: TRzDBEdit
            Left = 438
            Top = 128
            Width = 207
            Height = 22
            DataSource = dmComaker.dscAddressInfo
            DataField = 'brgy'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 12
          end
          object RzDBLookupComboBox3: TRzDBLookupComboBox
            Left = 438
            Top = 155
            Width = 207
            Height = 22
            DataField = 'post_code'
            DataSource = dmComaker.dscAddressInfo
            KeyField = 'post_code'
            ListField = 'town'
            ListSource = dmAux.dscTowns
            TabOrder = 13
            AllowNull = True
            FlatButtonColor = 8675134
            FlatButtons = True
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object RzDBLookupComboBox4: TRzDBLookupComboBox
            Left = 438
            Top = 289
            Width = 207
            Height = 22
            DataField = 'post_code'
            DataSource = dmComaker.dscAddressInfo2
            KeyField = 'post_code'
            ListField = 'town'
            ListSource = dmAux.dscTowns
            TabOrder = 16
            AllowNull = True
            FlatButtons = True
            FrameColor = 14272955
            FrameHotColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object RzDBEdit7: TRzDBEdit
            Left = 438
            Top = 262
            Width = 207
            Height = 22
            DataSource = dmComaker.dscAddressInfo2
            DataField = 'brgy'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 15
          end
          object RzDBEdit6: TRzDBEdit
            Left = 438
            Top = 235
            Width = 207
            Height = 22
            DataSource = dmComaker.dscAddressInfo2
            DataField = 'st'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 14
          end
          object bteEmployer: TRzButtonEdit
            Tag = 1
            Left = 114
            Top = 235
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
            Top = 262
            Width = 207
            Height = 49
            Color = clWhite
            ReadOnly = True
            TabOrder = 7
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = clWhite
            TabOnEnter = True
          end
          object RzDBEdit12: TRzDBEdit
            Left = 114
            Top = 316
            Width = 59
            Height = 22
            DataSource = dmComaker.dscEmplInfo
            DataField = 'serv_len'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 8
          end
          object RzGroupBox1: TRzGroupBox
            Left = 19
            Top = 126
            Width = 302
            Height = 22
            BorderColor = 6572079
            BorderSides = []
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
            TabOrder = 17
          end
          object RzGroupBox3: TRzGroupBox
            Left = 19
            Top = 211
            Width = 302
            Height = 22
            BorderColor = 6572079
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
            TabOrder = 18
          end
          object RzGroupBox4: TRzGroupBox
            Left = 343
            Top = 12
            Width = 302
            Height = 22
            BorderColor = 6572079
            BorderSides = []
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
            TabOrder = 19
            object RzGroupBox5: TRzGroupBox
              Left = 0
              Top = 88
              Width = 302
              Height = 22
              BorderColor = 6572079
              BorderSides = []
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
              TabOrder = 0
            end
          end
          object RzGroupBox6: TRzGroupBox
            Left = 343
            Top = 77
            Width = 302
            Height = 22
            BorderColor = 6572079
            BorderSides = []
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
            TabOrder = 20
            object RzGroupBox7: TRzGroupBox
              Left = 0
              Top = 88
              Width = 302
              Height = 22
              BorderColor = 6572079
              BorderSides = []
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
              TabOrder = 0
            end
          end
          object RzGroupBox8: TRzGroupBox
            Left = 343
            Top = 211
            Width = 302
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
            TabOrder = 21
            object RzGroupBox9: TRzGroupBox
              Left = 0
              Top = 88
              Width = 302
              Height = 22
              BorderColor = 6572079
              BorderSides = []
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
              TabOrder = 0
            end
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 636
      Top = 376
      ExplicitLeft = 636
      ExplicitTop = 376
    end
    inherited pnlSave: TRzPanel
      Left = 580
      Top = 376
      ExplicitLeft = 580
      ExplicitTop = 376
    end
    object RzGroupBox2: TRzGroupBox
      Left = 28
      Top = 21
      Width = 302
      Height = 22
      BorderColor = 6572079
      BorderSides = []
      BorderWidth = 1
      Caption = 'Comaker name'
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
      TabOrder = 3
    end
  end
end
