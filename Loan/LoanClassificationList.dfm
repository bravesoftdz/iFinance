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
    Top = 42
    Width = 37
    Height = 14
    Caption = 'Branch'
  end
  object JvLabel2: TJvLabel [1]
    Left = 21
    Top = 143
    Width = 54
    Height = 14
    Caption = 'Comakers'
    Transparent = True
  end
  inherited pnlTitle: TRzPanel
    Width = 855
    ExplicitWidth = 855
    inherited lblTitle: TRzLabel
      Width = 133
      Caption = 'Loan classification list'
      ExplicitWidth = 133
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 64
    Width = 559
    Height = 479
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 477
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmLoansAux.dscLoanClass
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
      OnCellClick = grListCellClick
      OnKeyUp = grListKeyUp
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
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
    Top = 64
    Width = 276
    Height = 479
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      479)
    object JvLabel6: TJvLabel
      Left = 13
      Top = 63
      Width = 35
      Height = 14
      Caption = 'Group'
      Transparent = True
    end
    object JvLabel1: TJvLabel
      Left = 13
      Top = 87
      Width = 61
      Height = 14
      Caption = 'Class name'
      Transparent = True
    end
    object JvLabel9: TJvLabel
      Tag = -1
      Left = 13
      Top = 39
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object JvLabel7: TJvLabel
      Left = 13
      Top = 207
      Width = 72
      Height = 14
      Caption = 'Computation'
      Transparent = True
    end
    object JvLabel12: TJvLabel
      Left = 13
      Top = 260
      Width = 50
      Height = 14
      Caption = 'Payment'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 13
      Top = 111
      Width = 62
      Height = 14
      Caption = 'Interest %'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Left = 161
      Top = 111
      Width = 31
      Height = 14
      Caption = 'Term'
      Transparent = True
    end
    object JvLabel5: TJvLabel
      Left = 13
      Top = 135
      Width = 54
      Height = 14
      Caption = 'Comakers'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Left = 13
      Top = 284
      Width = 56
      Height = 14
      Caption = 'Valid from'
      Transparent = True
    end
    object JvLabel14: TJvLabel
      Left = 14
      Top = 183
      Width = 73
      Height = 14
      Caption = 'Max. amount'
      Transparent = True
    end
    object JvLabel11: TJvLabel
      Left = 13
      Top = 308
      Width = 54
      Height = 14
      Caption = 'Valid until'
      Transparent = True
    end
    object JvLabel13: TJvLabel
      Left = 13
      Top = 159
      Width = 47
      Height = 14
      Caption = 'Max age'
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Left = 161
      Top = 135
      Width = 23
      Height = 14
      Caption = 'Max'
      Transparent = True
    end
    object urlClassCharges: TRzURLLabel
      Left = 14
      Top = 345
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
      Top = 369
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
    object pnlAdd: TRzPanel
      Left = 8
      Top = 449
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
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
      TabOrder = 1
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
    object edClassName: TRzDBEdit
      Left = 88
      Top = 81
      Width = 176
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'class_name'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 4
    end
    object dbluBranch: TRzDBLookupComboBox
      Tag = 1
      Left = 88
      Top = 33
      Width = 176
      Height = 22
      DataField = 'loc_code'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'location_code'
      ListField = 'location_name'
      ListSource = dmLoansAux.dscBranches
      TabOrder = 2
      OnClick = dbluBranchClick
      OnCloseUp = dbluBranchClick
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object dbluCompMethod: TRzDBLookupComboBox
      Left = 88
      Top = 201
      Width = 176
      Height = 22
      DataField = 'int_comp_method'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmAux.dscCompMethod
      TabOrder = 11
      OnClick = dbluCompMethodClick
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object dbluPayFreq: TRzDBLookupComboBox
      Left = 88
      Top = 254
      Width = 176
      Height = 22
      DataField = 'pay_freq'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmAux.dscPaymentFreq
      TabOrder = 12
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edInterest: TRzDBNumericEdit
      Left = 88
      Top = 105
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'int_rate'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 5
      IntegersOnly = False
      DisplayFormat = '0.00'
      FlatButtons = True
    end
    object edTerm: TRzDBEdit
      Left = 207
      Top = 105
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'term'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 6
    end
    object edComakersMin: TRzDBEdit
      Left = 88
      Top = 129
      Width = 57
      Height = 22
      Hint = 'Minimum comakers required'
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'comakers_min'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 7
    end
    object edMaxLoan: TRzDBNumericEdit
      Left = 88
      Top = 177
      Width = 176
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'max_loan'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 10
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
    object dteFrom: TRzDBDateTimeEdit
      Left = 88
      Top = 278
      Width = 105
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_from'
      DisabledColor = 14273211
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 13
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtons = True
    end
    object dteUntil: TRzDBDateTimeEdit
      Left = 88
      Top = 302
      Width = 105
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_until'
      DisabledColor = 14273211
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 14
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtons = True
    end
    object RzDBEdit2: TRzDBEdit
      Left = 88
      Top = 153
      Width = 57
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'max_age'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 9
    end
    object bteGroup: TRzButtonEdit
      Tag = 1
      Left = 88
      Top = 57
      Width = 176
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
      TabOrder = 3
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
      Top = 449
      Width = 53
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 15
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
      Top = 449
      Width = 65
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 16
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
      Top = 129
      Width = 57
      Height = 22
      Hint = 'Maximum comakers required'
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'comakers_max'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 8
    end
    object rbgDiminishingType: TRzDBRadioGroup
      Left = 81
      Top = 227
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
      Color = 14273211
      Columns = 2
      FlatColor = 14273211
      GroupStyle = gsCustom
      TabOnEnter = True
      TabOrder = 17
      TabStop = True
    end
  end
  object cmbBranch: TRzComboBox
    Left = 51
    Top = 36
    Width = 514
    Height = 22
    AllowEdit = False
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = False
    FrameColor = 6572079
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    Sorted = True
    TabOrder = 3
  end
end
