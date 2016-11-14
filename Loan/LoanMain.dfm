inherited frmLoanMain: TfrmLoanMain
  Caption = 'frmLoanMain'
  ClientHeight = 536
  ClientWidth = 865
  OnCreate = FormCreate
  ExplicitWidth = 881
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 865
    ExplicitWidth = 865
    inherited lblTitle: TRzLabel
      Width = 73
      Caption = 'Loan record'
      ExplicitWidth = 73
    end
    object lblLoanId: TRzLabel
      Left = 790
      Top = 7
      Width = 64
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'NEW LOAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoBk
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 28
    Width = 865
    Height = 508
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    DesignSize = (
      865
      508)
    object JvGroupHeader2: TJvGroupHeader
      Tag = -1
      Left = 38
      Top = 339
      Width = 285
      Height = 15
      Caption = 'Approved'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Tag = -1
      Left = 35
      Top = 359
      Width = 74
      Height = 13
      Caption = 'Date approved'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Tag = -1
      Left = 226
      Top = 383
      Width = 26
      Height = 13
      Caption = 'Term'
      Transparent = True
    end
    object JvGroupHeader3: TJvGroupHeader
      Tag = -1
      Left = 375
      Top = 338
      Width = 287
      Height = 12
      Caption = 'Released'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel13: TJvLabel
      Tag = -1
      Left = 355
      Top = 358
      Width = 46
      Height = 13
      Caption = 'Recipient'
      Transparent = True
    end
    object JvGroupHeader5: TJvGroupHeader
      Tag = -1
      Left = 38
      Top = 429
      Width = 285
      Height = 12
      Caption = 'Denied'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel14: TJvLabel
      Tag = -1
      Left = 35
      Top = 383
      Width = 88
      Height = 13
      Caption = 'Approved amount'
      Transparent = True
    end
    object JvLabel16: TJvLabel
      Tag = -1
      Left = 35
      Top = 407
      Width = 84
      Height = 13
      Caption = 'Approval method'
      Transparent = True
    end
    object JvLabel17: TJvLabel
      Tag = -1
      Left = 35
      Top = 448
      Width = 74
      Height = 13
      Caption = 'Date approved'
      Transparent = True
    end
    object JvLabel18: TJvLabel
      Tag = -1
      Left = 35
      Top = 473
      Width = 38
      Height = 13
      Caption = 'Reason'
      Transparent = True
    end
    object JvGroupHeader6: TJvGroupHeader
      Tag = -1
      Left = 375
      Top = 429
      Width = 287
      Height = 12
      Caption = 'Cancelled'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel19: TJvLabel
      Tag = -1
      Left = 375
      Top = 448
      Width = 72
      Height = 13
      Caption = 'Date cancelled'
      Transparent = True
    end
    object JvLabel20: TJvLabel
      Tag = -1
      Left = 375
      Top = 473
      Width = 38
      Height = 13
      Caption = 'Reason'
      Transparent = True
    end
    object dteDateApproved: TRzDBDateTimeEdit
      Tag = 5
      Left = 129
      Top = 353
      Width = 80
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 2
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object edAppvAmount: TRzDBNumericEdit
      Tag = 5
      Left = 129
      Top = 377
      Width = 80
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appv'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
    end
    object cbxApproved: TRzCheckBox
      Tag = 4
      Left = 19
      Top = 338
      Width = 19
      Height = 15
      Color = clBtnFace
      Enabled = False
      FillColor = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 1
      OnClick = cbxApprovedClick
    end
    object cbxReleased: TRzCheckBox
      Tag = 6
      Left = 355
      Top = 338
      Width = 19
      Height = 15
      Enabled = False
      FillColor = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 6
      OnClick = cbxReleasedClick
    end
    object cbxCancelled: TRzCheckBox
      Tag = 10
      Left = 355
      Top = 429
      Width = 19
      Height = 15
      Enabled = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 7
      OnClick = cbxCancelledClick
    end
    object cbxDenied: TRzCheckBox
      Tag = 8
      Left = 19
      Top = 429
      Width = 19
      Height = 15
      Enabled = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 8
      OnClick = cbxDeniedClick
    end
    object pnlAlerts: TRzPanel
      Tag = -1
      Left = 673
      Top = 20
      Width = 175
      Height = 468
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = clRed
      BorderWidth = 1
      Color = 13027071
      TabOrder = 9
      Visible = False
      VisualStyle = vsClassic
      DesignSize = (
        175
        468)
      object imgAlert: TImage
        Tag = -1
        Left = 16
        Top = 14
        Width = 16
        Height = 16
        Hint = 'Client alerts'
        DragCursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C0000022E4944415478DA63FCFFFF3F03
          2580114430313181311AE001E23A28BB0988BF204BFEFBF70F8C195958587019
          1E58539398C30074604BEBFC2940FE7AAC2EC06180B8A4A470D5B58BD3D38076
          3168E965CD7AFEE25D1B50FC25B106A4CC9C5E9419172466C40074C2A2B54FCF
          A5674D990E149F438C01EA7ABA8A9547F756C4D477DC640609349429FEB576E9
          5E72F9CAA37620F7268A01CCCCCCC87C5048966F5E57916C6BFC47B9B2E32B58
          B0BD8293E1E0C95F77FDC3A6CC05723B416188CB006B57679DD2358B22FCFF7C
          7FC450D0F81D2C38A19E9381894D9821346ECDC63D076E7703858E6233808389
          89B1E5F8FED23865A90FA2BFFEFE60700B39C7F0F2E54B863D9BF519FE01D3CB
          E3671CAFFD43B62D02A69D1AA0FA1FE8060426C69AE777369AD9BFFF7287E1DB
          EF2F0C7A0607C012172FD8836966263686E6D6DB07D7AC793C1116AD30038478
          B8D9FA8EED8F0E6165BFC9FDF7FF1FB00651314F30FDFAD576B81FDFBEFDFBD5
          CBEFC29AAF5FFF1601B9EF18A12930B3BC582F3D23855BFFEFDF6F70C54A5AE7
          C1F4BD6B8628D1346DD6CB8B7D935ECC0432A7830C509492E4987078A7AE173B
          EB1794389552BF0AA69FDDD44631E0FB8F7F7FECBDEE6D7BF6FC770123104C9D
          DC29E31311CC23F7FFFF5F0650C281016EA16030FDF5DD5A8C94B662EDE74779
          152FB78032D30CA0213A208381F4572006659A6F401A1487BFA1263203439E1D
          487301696E90D9201A88AF3142130F07107302311B033487E201FFA1068302EB
          07000B77D5C87BAFCCFA0000000049454E44AE426082}
        ShowHint = True
      end
      object JvLabel15: TJvLabel
        Tag = -1
        Left = 38
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Alerts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object mmAlerts: TRzMemo
        Tag = -1
        Left = 16
        Top = 36
        Width = 143
        Height = 424
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Color = 13027071
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DisabledColor = clMenu
        ReadOnlyColor = 13948116
      end
    end
    object dbluAppvMethod: TRzDBLookupComboBox
      Tag = 5
      Left = 129
      Top = 401
      Width = 194
      Height = 21
      DataField = 'appv_method'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmLoan.dscAppvMethod
      TabOrder = 5
      DisabledColor = clWhite
      FrameColor = clBlack
      FrameHotColor = clBlack
      TabOnEnter = True
    end
    object edAppvTerm: TRzDBNumericEdit
      Tag = 5
      Left = 266
      Top = 377
      Width = 57
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'terms'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 4
      DisplayFormat = '0'
    end
    object RzDBGrid1: TRzDBGrid
      Tag = -1
      Left = 355
      Top = 375
      Width = 307
      Height = 47
      DataSource = dmLoan.dscLoanComaker
      Options = [dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 220
          Visible = True
        end>
    end
    object RzDBLookupComboBox2: TRzDBLookupComboBox
      Tag = 9
      Left = 129
      Top = 467
      Width = 193
      Height = 21
      DataField = 'appv_method'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmLoan.dscAppvMethod
      TabOrder = 11
      DisabledColor = clWhite
      FrameColor = clBlack
      FrameHotColor = clBlack
      TabOnEnter = True
    end
    object RzButton1: TRzButton
      Tag = 7
      Left = 544
      Top = 352
      Width = 57
      Height = 20
      Caption = 'Add'
      Enabled = False
      TabOrder = 12
      OnClick = btnAddComakerClick
    end
    object RzButton2: TRzButton
      Tag = 7
      Left = 605
      Top = 352
      Width = 57
      Height = 20
      Caption = 'Remove'
      Enabled = False
      TabOrder = 13
      OnClick = btnRemoveComakerClick
    end
    object pnlDetails: TRzPanel
      Tag = -1
      Left = 19
      Top = 20
      Width = 643
      Height = 301
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 0
      object JvGroupHeader1: TJvGroupHeader
        Tag = -1
        Left = 19
        Top = 20
        Width = 285
        Height = 15
        Caption = 'Application details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvGroupHeader4: TJvGroupHeader
        Tag = -1
        Left = 356
        Top = 20
        Width = 258
        Height = 15
        Caption = 'Assessed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = JvGroupHeader4Click
      end
      object JvLabel1: TJvLabel
        Tag = -1
        Left = 35
        Top = 40
        Width = 29
        Height = 13
        Caption = 'Client'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Tag = -1
        Left = 35
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Loan class'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Tag = -1
        Left = 206
        Top = 88
        Width = 30
        Height = 13
        Caption = 'Int %'
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Tag = -1
        Left = 35
        Top = 88
        Width = 62
        Height = 13
        Caption = 'Date applied'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Tag = -1
        Left = 35
        Top = 112
        Width = 76
        Height = 13
        Caption = 'Amount applied'
        Transparent = True
      end
      object JvLabel9: TJvLabel
        Tag = -1
        Left = 35
        Top = 136
        Width = 63
        Height = 13
        Caption = 'Desired term'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Tag = -1
        Left = 35
        Top = 160
        Width = 41
        Height = 13
        Caption = 'Purpose'
        Transparent = True
      end
      object JvLabel3: TJvLabel
        Tag = -1
        Left = 35
        Top = 183
        Width = 49
        Height = 13
        Caption = 'Comakers'
        Transparent = True
      end
      object JvLabel4: TJvLabel
        Tag = -1
        Left = 356
        Top = 40
        Width = 72
        Height = 13
        Caption = 'Date assessed'
        Transparent = True
      end
      object JvLabel11: TJvLabel
        Tag = -1
        Left = 356
        Top = 64
        Width = 111
        Height = 13
        Caption = 'Recommended amount'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Tag = -1
        Left = 206
        Top = 112
        Width = 26
        Height = 13
        Caption = 'Max.'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Tag = -1
        Left = 206
        Top = 136
        Width = 26
        Height = 13
        Caption = 'Max.'
        Transparent = True
      end
      object lblComakersDesc: TRzDBLabel
        Tag = -1
        Left = 34
        Top = 259
        Width = 80
        Height = 13
        AutoSize = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        DataField = 'comakers_desc'
        DataSource = dmLoan.dscLoanClass
      end
      object btnAddComaker: TRzButton
        Tag = 1
        Left = 186
        Top = 256
        Width = 57
        Height = 20
        Caption = 'Add'
        Enabled = False
        TabOrder = 7
        OnClick = btnAddComakerClick
      end
      object btnRemoveComaker: TRzButton
        Tag = 1
        Left = 247
        Top = 256
        Width = 57
        Height = 20
        Caption = 'Remove'
        Enabled = False
        TabOrder = 8
        OnClick = btnRemoveComakerClick
      end
      object edPurpose: TRzDBEdit
        Tag = 1
        Left = 114
        Top = 154
        Width = 190
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'purpose'
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 6
      end
      object edDesiredTerm: TRzDBNumericEdit
        Tag = 1
        Left = 114
        Top = 130
        Width = 80
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'des_term'
        Alignment = taLeftJustify
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 5
        DisplayFormat = '0'
      end
      object edAppAmount: TRzDBNumericEdit
        Tag = 1
        Left = 114
        Top = 106
        Width = 80
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'amt_appl'
        Alignment = taLeftJustify
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 4
        DisplayFormat = '###,##0.00'
      end
      object dteDateApplied: TRzDBDateTimeEdit
        Tag = 1
        Left = 114
        Top = 82
        Width = 80
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'date_appl'
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 3
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object edInterest: TRzDBNumericEdit
        Tag = -1
        Left = 242
        Top = 82
        Width = 62
        Height = 21
        DataSource = dmLoan.dscLoanClass
        DataField = 'int_rate'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object dbluLoanClass: TRzDBLookupComboBox
        Tag = 1
        Left = 114
        Top = 58
        Width = 190
        Height = 21
        DataField = 'class_id'
        DataSource = dmLoan.dscLoan
        Enabled = False
        KeyField = 'class_id'
        ListField = 'class_name'
        ListSource = dmLoan.dscLoanClass
        TabOrder = 1
        DisabledColor = clWhite
        FrameColor = clBlack
        FrameHotColor = clBlack
        TabOnEnter = True
      end
      object bteClient: TRzButtonEdit
        Left = 114
        Top = 34
        Width = 190
        Height = 21
        Text = ''
        Color = clInfoBk
        DisabledColor = clWhite
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOnEnter = True
        TabOrder = 0
        AllowKeyEdit = False
        ButtonHint = 'Find client'
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnButtonClick = bteClientButtonClick
      end
      object dteDateAssessed: TRzDBDateTimeEdit
        Tag = 3
        Left = 515
        Top = 34
        Width = 99
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'date_appl'
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 10
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object edRecAmount: TRzDBNumericEdit
        Tag = 3
        Left = 515
        Top = 58
        Width = 99
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'amt_appl'
        Alignment = taLeftJustify
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 11
        DisplayFormat = '###,##0.00'
      end
      object pcAssessment: TRzPageControl
        Tag = 3
        Left = 356
        Top = 84
        Width = 260
        Height = 167
        Hint = ''
        ActivePage = tsFinInfo
        ActivePageDefault = tsFinInfo
        TabOverlap = 0
        TabIndex = 0
        TabOrder = 12
        TabStyle = tsRoundCorners
        FixedDimension = 19
        object tsFinInfo: TRzTabSheet
          Color = 15000804
          Caption = 'Financial info'
          DesignSize = (
            256
            141)
          object grFinInfo: TRzDBGrid
            Tag = -1
            Left = 5
            Top = 5
            Width = 246
            Height = 131
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dmLoan.dscFinInfo
            Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = grFinInfoDblClick
            AltRowShadingColor = 15854564
            Columns = <
              item
                Expanded = False
                FieldName = 'comp_name'
                Title.Caption = 'Company'
                Width = 122
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'mon_due_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Monthly'
                Width = 50
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'loan_bal_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Balance'
                Width = 50
                Visible = True
              end>
          end
        end
        object tsMonExp: TRzTabSheet
          Color = 15000804
          Caption = 'Monthly expenses'
          DesignSize = (
            256
            141)
          object grMonExp: TRzDBGrid
            Tag = -1
            Left = 5
            Top = 5
            Width = 246
            Height = 131
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dmLoan.dscMonExp
            Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = grMonExpDblClick
            AltRowShadingColor = 15854564
            Columns = <
              item
                Expanded = False
                FieldName = 'exp_name'
                Title.Caption = 'Expense'
                Width = 140
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'monthly_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Monthly'
                Visible = True
              end>
          end
        end
      end
      object btnAddAss: TRzButton
        Tag = 3
        Left = 496
        Top = 256
        Width = 57
        Height = 20
        Caption = 'Add'
        Enabled = False
        TabOrder = 13
        OnClick = btnAddAssClick
      end
      object btnRemoveAss: TRzButton
        Tag = 3
        Left = 557
        Top = 256
        Width = 57
        Height = 20
        Caption = 'Remove'
        Enabled = False
        TabOrder = 14
        OnClick = btnRemoveAssClick
      end
      object cbxAssessed: TRzCheckBox
        Tag = 2
        Left = 336
        Top = 20
        Width = 19
        Height = 15
        Color = 15000804
        DisabledColor = clWhite
        Enabled = False
        FillColor = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9134911
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        State = cbUnchecked
        TabOnEnter = True
        TabOrder = 9
        OnClick = cbxAssessedClick
      end
      object RzDBNumericEdit1: TRzDBNumericEdit
        Tag = -1
        Left = 242
        Top = 106
        Width = 62
        Height = 21
        Hint = 'Maximum loanable amout'
        DataSource = dmLoan.dscLoanClass
        DataField = 'max_loan'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 15
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Tag = -1
        Left = 242
        Top = 130
        Width = 62
        Height = 21
        Hint = 'Maximum allowed term'
        DataSource = dmLoan.dscLoanClass
        DataField = 'term'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 16
        IntegersOnly = False
        DisplayFormat = ',0;(,0)'
      end
      object lbxComakers: TRzListBox
        Tag = -1
        Left = 34
        Top = 201
        Width = 270
        Height = 48
        ItemHeight = 13
        TabOrder = 17
        OnDblClick = lbxComakersDblClick
      end
    end
    object RzDBDateTimeEdit2: TRzDBDateTimeEdit
      Tag = 9
      Left = 129
      Top = 443
      Width = 80
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 14
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object RzDBDateTimeEdit3: TRzDBDateTimeEdit
      Tag = 11
      Left = 469
      Top = 443
      Width = 80
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 15
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object RzDBLookupComboBox1: TRzDBLookupComboBox
      Tag = 11
      Left = 469
      Top = 467
      Width = 193
      Height = 21
      DataField = 'appv_method'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmLoan.dscAppvMethod
      TabOrder = 16
      DisabledColor = clWhite
      FrameColor = clBlack
      FrameHotColor = clBlack
      TabOnEnter = True
    end
  end
end
