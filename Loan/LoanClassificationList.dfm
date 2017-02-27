inherited frmLoanClassificationList: TfrmLoanClassificationList
  Caption = 'frmLoanClassificationList'
  ClientHeight = 549
  ClientWidth = 855
  OnCreate = FormCreate
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
    Height = 303
    Anchors = [akLeft, akTop, akRight]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 301
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
    object JvLabel2: TJvLabel
      Left = 13
      Top = 111
      Width = 57
      Height = 14
      Caption = 'Loan type'
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
      Top = 231
      Width = 50
      Height = 14
      Caption = 'Payment'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 13
      Top = 135
      Width = 62
      Height = 14
      Caption = 'Interest %'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Left = 161
      Top = 135
      Width = 31
      Height = 14
      Caption = 'Term'
      Transparent = True
    end
    object JvLabel5: TJvLabel
      Left = 13
      Top = 159
      Width = 54
      Height = 14
      Caption = 'Comakers'
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Left = 142
      Top = 159
      Width = 51
      Height = 14
      Caption = 'Max. age'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Left = 13
      Top = 255
      Width = 40
      Height = 14
      Caption = 'Validity'
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
    object dbluGroup: TRzDBLookupComboBox
      Left = 88
      Top = 57
      Width = 176
      Height = 22
      DataField = 'grp_id'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'grp_id'
      ListField = 'grp_name'
      ListSource = dmAux.dscGroups
      TabOrder = 3
      OnClick = dbluGroupClick
      FlatButtons = True
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
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
    object dbluLoanType: TRzDBLookupComboBox
      Left = 88
      Top = 105
      Width = 176
      Height = 22
      DataField = 'loan_type'
      DataSource = dmLoansAux.dscLoanClass
      KeyField = 'loan_type'
      ListField = 'loan_type_name'
      ListSource = dmAux.dscLoanType
      TabOrder = 5
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
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
      Top = 225
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
      Top = 129
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
      TabOrder = 6
      IntegersOnly = False
      DisplayFormat = '0.00'
      FlatButtons = True
    end
    object edTerm: TRzDBEdit
      Left = 207
      Top = 129
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
      TabOrder = 7
    end
    object edComakers: TRzDBEdit
      Left = 88
      Top = 153
      Width = 41
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'comakers'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 8
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
      Top = 249
      Width = 86
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_from'
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
      Left = 178
      Top = 249
      Width = 86
      Height = 22
      DataSource = dmLoansAux.dscLoanClass
      DataField = 'valid_until'
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
      Left = 207
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
  object pnlCharges: TRzPanel
    Left = 6
    Top = 395
    Width = 559
    Height = 119
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 4
    object grCharges: TRzDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 117
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmLoansAux.dscClassCharges
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
      OnDblClick = grChargesDblClick
      FrameColor = 14273211
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      LineColor = 14273211
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'charge_name'
          Title.Alignment = taCenter
          Title.Caption = 'Charge'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'charge_value_f'
          Title.Alignment = taCenter
          Title.Caption = 'Value'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'value_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
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
          FieldName = 'ratio_amt_f'
          Title.Alignment = taCenter
          Title.Caption = 'Ratio'
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
          FieldName = 'max_amt_f'
          Title.Alignment = taCenter
          Title.Caption = 'Maximum'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'for_new_f'
          Title.Alignment = taCenter
          Title.Caption = 'New'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'for_renew_f'
          Title.Alignment = taCenter
          Title.Caption = 'Renew'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end>
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 6
    Top = 372
    Width = 559
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Charges'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 14273211
    FlatColor = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 5
  end
  object RzPanel1: TRzPanel
    Left = 6
    Top = 521
    Width = 50
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 6572079
    BorderWidth = 1
    Color = 12955288
    TabOrder = 6
    object btnAddCharge: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Add a new charge'
      BorderStyle = bsNone
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddChargesClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 62
    Top = 521
    Width = 50
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 6572079
    BorderWidth = 1
    Color = 12955288
    TabOrder = 7
    object btnRemoveCharge: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Remove selected charge'
      BorderStyle = bsNone
      Caption = 'Remove'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRemoveChargeClick
    end
  end
  object cbxNew: TRzCheckBox
    Left = 369
    Top = 524
    Width = 95
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = 'For new loans'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = cbxNewClick
  end
  object cbxRenewal: TRzCheckBox
    Left = 477
    Top = 524
    Width = 83
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = 'For renewal'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = cbxRenewalClick
  end
end
