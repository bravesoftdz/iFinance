inherited frmLoanClassificationList: TfrmLoanClassificationList
  Caption = 'frmLoanClassificationList'
  ClientHeight = 549
  ClientWidth = 855
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 871
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 15
    Width = 37
    Height = 14
    Caption = 'Branch'
  end
  object JvLabel2: TJvLabel [1]
    Left = 21
    Top = 116
    Width = 54
    Height = 14
    Caption = 'Comakers'
    Transparent = True
  end
  inherited pnlTitle: TRzPanel
    Top = -30
    Width = 855
    Align = alNone
    ExplicitTop = -30
    ExplicitWidth = 855
    inherited lblTitle: TRzLabel
      Width = 133
      Caption = 'Loan classification list'
      ExplicitWidth = 133
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 37
    Width = 559
    Height = 506
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 504
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = dmLoansAux.dscLoanClass
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
      OnCellClick = grListCellClick
      OnKeyUp = grListKeyUp
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'grp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Group'
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
          FieldName = 'class_name'
          Title.Alignment = taCenter
          Title.Caption = 'Class name'
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
          FieldName = 'loan_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Loan type'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel
    Left = 571
    Top = 9
    Width = 276
    Height = 534
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      534)
    object JvLabel6: TJvLabel
      Left = 13
      Top = 50
      Width = 35
      Height = 14
      Caption = 'Group'
      Transparent = True
    end
    object JvLabel1: TJvLabel
      Left = 13
      Top = 77
      Width = 61
      Height = 14
      Caption = 'Class name'
      Transparent = True
    end
    object JvLabel9: TJvLabel
      Tag = -1
      Left = 13
      Top = 23
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object JvLabel7: TJvLabel
      Left = 13
      Top = 212
      Width = 72
      Height = 14
      Caption = 'Computation'
      Transparent = True
    end
    object JvLabel12: TJvLabel
      Left = 13
      Top = 292
      Width = 50
      Height = 14
      Caption = 'Payment'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 13
      Top = 104
      Width = 62
      Height = 14
      Caption = 'Interest %'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Left = 161
      Top = 104
      Width = 31
      Height = 14
      Caption = 'Term'
      Transparent = True
    end
    object JvLabel5: TJvLabel
      Left = 13
      Top = 131
      Width = 54
      Height = 14
      Caption = 'Comakers'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Left = 13
      Top = 319
      Width = 56
      Height = 14
      Caption = 'Valid from'
      Transparent = True
    end
    object JvLabel14: TJvLabel
      Left = 14
      Top = 185
      Width = 73
      Height = 14
      Caption = 'Max. amount'
      Transparent = True
    end
    object JvLabel11: TJvLabel
      Left = 13
      Top = 346
      Width = 54
      Height = 14
      Caption = 'Valid until'
      Transparent = True
    end
    object JvLabel13: TJvLabel
      Left = 13
      Top = 158
      Width = 47
      Height = 14
      Caption = 'Max age'
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Left = 161
      Top = 131
      Width = 23
      Height = 14
      Caption = 'Max'
      Transparent = True
    end
    object urlClassCharges: TRzURLLabel
      Left = 14
      Top = 396
      Width = 71
      Height = 14
      Caption = 'Class charges'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlClassChargesClick
    end
    object urlAdvancePayment: TRzURLLabel
      Left = 14
      Top = 420
      Width = 99
      Height = 14
      Caption = 'Advance payment'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlAdvancePaymentClick
    end
    object JvLabel15: TJvLabel
      Left = 14
      Top = 265
      Width = 128
      Height = 14
      Caption = 'Max. advance payment'
      Transparent = True
    end
    object pnlAdd: TRzPanel
      Left = 8
      Top = 504
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 0
      object sbtnNew: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'New'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnNewClick
      end
    end
    object edClassName: TRzDBEdit
      Left = 88
      Top = 71
      Width = 176
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'class_name'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
    end
    object dbluBranch: TRzDBLookupComboBox
      Tag = 1
      Left = 88
      Top = 17
      Width = 176
      Height = 22
      DataField = 'loc_code'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'location_code'
      ListField = 'location_name'
      ListSource = dmLoansAux.dscBranches
      TabOrder = 1
      OnClick = dbluBranchClick
      OnCloseUp = dbluBranchClick
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object dbluCompMethod: TRzDBLookupComboBox
      Left = 88
      Top = 206
      Width = 176
      Height = 22
      DataField = 'int_comp_method'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmAux.dscCompMethod
      TabOrder = 10
      OnClick = dbluCompMethodClick
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object dbluPayFreq: TRzDBLookupComboBox
      Left = 88
      Top = 286
      Width = 176
      Height = 22
      DataField = 'pay_freq'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmAux.dscPaymentFreq
      TabOrder = 13
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edInterest: TRzDBNumericEdit
      Left = 88
      Top = 98
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'int_rate'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = '0.00'
      FlatButtons = True
    end
    object edTerm: TRzDBEdit
      Left = 207
      Top = 98
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'term'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 5
    end
    object edComakersMin: TRzDBEdit
      Left = 88
      Top = 125
      Width = 57
      Height = 22
      Hint = 'Minimum comakers required'
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'comakers_min'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 6
    end
    object edMaxLoan: TRzDBNumericEdit
      Left = 88
      Top = 179
      Width = 176
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'max_loan'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 9
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
    object dteFrom: TRzDBDateTimeEdit
      Left = 88
      Top = 313
      Width = 105
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_from'
      DisabledColor = 14273211
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 14
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtons = True
    end
    object dteUntil: TRzDBDateTimeEdit
      Left = 88
      Top = 340
      Width = 105
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_until'
      DisabledColor = 14273211
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 15
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtons = True
    end
    object RzDBEdit2: TRzDBEdit
      Left = 88
      Top = 152
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'max_age'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 8
    end
    object bteGroup: TRzButtonEdit
      Tag = 1
      Left = 88
      Top = 44
      Width = 176
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
      TabOrder = 2
      AllowKeyEdit = False
      AltBtnHint = 'Clear group'
      ButtonHint = 'Find group'
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      FlatButtonColor = 8675134
      HideButtonsOnReadOnly = False
      OnButtonClick = bteGroupButtonClick
    end
    object pnlActivate: TRzPanel
      Left = 144
      Top = 504
      Width = 53
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 16
      object sbtnActivate: TRzShapeButton
        Left = 0
        Top = 0
        Width = 53
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'Activate'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnActivateClick
      end
    end
    object RzPanel3: TRzPanel
      Left = 203
      Top = 504
      Width = 65
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 17
      object RzShapeButton1: TRzShapeButton
        Left = 0
        Top = 0
        Width = 65
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'Deactivate'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnNewClick
      end
    end
    object edComakersMax: TRzDBEdit
      Left = 207
      Top = 125
      Width = 57
      Height = 22
      Hint = 'Maximum comakers required'
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'comakers_max'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 7
    end
    object rbgDiminishingType: TRzDBRadioGroup
      Left = 81
      Top = 232
      Width = 176
      Height = 24
      DataField = 'dim_type'
      DataSource = dmLoansAux.dscLoanClass
      Items.Strings = (
        'Scheduled'
        'Fixed')
      Values.Strings = (
        '1'
        '2')
      BorderColor = 15263976
      BorderSides = []
      Caption = ''
      Color = 15327448
      Columns = 2
      Enabled = False
      FlatColor = 15327448
      GroupStyle = gsCustom
      TabOnEnter = True
      TabOrder = 11
      TabStop = True
    end
    object edMaxAdvancePayment: TRzDBNumericEdit
      Left = 148
      Top = 259
      Width = 116
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'max_advance_pmt'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 12
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
  end
  object cmbBranch: TRzComboBox
    Left = 51
    Top = 9
    Width = 514
    Height = 22
    AllowEdit = False
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = False
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    Sorted = True
    TabOrder = 3
  end
end
