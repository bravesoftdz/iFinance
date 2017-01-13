inherited frmLoanMain: TfrmLoanMain
  Caption = 'frmLoanMain'
  ClientHeight = 513
  ClientWidth = 900
  OnCreate = FormCreate
  ExplicitWidth = 916
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 900
    ExplicitWidth = 900
    DesignSize = (
      900
      28)
    inherited lblTitle: TRzLabel
      Width = 73
      Caption = 'Loan record'
      ExplicitWidth = 73
    end
    object lblLoanId: TRzLabel
      Left = 825
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
      ExplicitLeft = 790
    end
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 28
    Width = 900
    Height = 485
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    object pnlApplication: TRzPanel
      Tag = 100
      Left = 17
      Top = 20
      Width = 850
      Height = 166
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 0
      DesignSize = (
        850
        166)
      object c: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 29
        Height = 13
        Caption = 'Client'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Tag = -1
        Left = 300
        Top = 40
        Width = 51
        Height = 13
        Caption = 'Loan class'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Tag = -1
        Left = 483
        Top = 64
        Width = 30
        Height = 13
        Caption = 'Int %'
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Tag = -1
        Left = 300
        Top = 64
        Width = 62
        Height = 13
        Caption = 'Date applied'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Tag = -1
        Left = 300
        Top = 88
        Width = 76
        Height = 13
        Caption = 'Amount applied'
        Transparent = True
      end
      object JvLabel9: TJvLabel
        Tag = -1
        Left = 300
        Top = 112
        Width = 63
        Height = 13
        Caption = 'Desired term'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Tag = -1
        Left = 300
        Top = 136
        Width = 41
        Height = 13
        Caption = 'Purpose'
        Transparent = True
      end
      object JvLabel3: TJvLabel
        Tag = -1
        Left = 615
        Top = 40
        Width = 49
        Height = 13
        Caption = 'Comakers'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Tag = -1
        Left = 483
        Top = 88
        Width = 26
        Height = 13
        Caption = 'Max.'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Tag = -1
        Left = 483
        Top = 112
        Width = 26
        Height = 13
        Caption = 'Max.'
        Transparent = True
      end
      object lblComakersDesc: TRzDBLabel
        Tag = -1
        Left = 753
        Top = 40
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
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
      object JvLabel20: TJvLabel
        Left = 20
        Top = 64
        Width = 26
        Height = 13
        Caption = 'Email'
        Transparent = True
      end
      object JvLabel4: TJvLabel
        Left = 20
        Top = 88
        Width = 48
        Height = 13
        Caption = 'Facebook'
        Transparent = True
      end
      object JvLabel8: TJvLabel
        Left = 20
        Top = 112
        Width = 71
        Height = 13
        Caption = 'Mobile/tel. no.'
        Transparent = True
      end
      object btnAddComaker: TRzButton
        Tag = 1
        Left = 715
        Top = 133
        Width = 57
        Height = 20
        Caption = 'Add'
        Enabled = False
        TabOrder = 7
        OnClick = btnAddComakerClick
      end
      object btnRemoveComaker: TRzButton
        Tag = 1
        Left = 776
        Top = 133
        Width = 57
        Height = 20
        Caption = 'Remove'
        Enabled = False
        TabOrder = 8
        OnClick = btnRemoveComakerClick
      end
      object edPurpose: TRzDBEdit
        Tag = 1
        Left = 379
        Top = 130
        Width = 207
        Height = 21
        DataSource = dmLoan.dscLoan
        DataField = 'purpose'
        DisabledColor = clWhite
        Enabled = False
        TabOnEnter = True
        TabOrder = 6
      end
      object edDesiredTerm: TRzDBNumericEdit
        Tag = 1
        Left = 379
        Top = 106
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
        Left = 379
        Top = 82
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
        Left = 379
        Top = 58
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
        Tag = 100
        Left = 521
        Top = 58
        Width = 65
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
        Left = 379
        Top = 34
        Width = 207
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
        Left = 99
        Top = 34
        Width = 175
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
      object RzDBNumericEdit1: TRzDBNumericEdit
        Tag = 100
        Left = 521
        Top = 82
        Width = 65
        Height = 21
        Hint = 'Maximum loanable amout'
        DataSource = dmLoan.dscLoanClass
        DataField = 'max_loan'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 9
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Tag = 100
        Left = 521
        Top = 106
        Width = 65
        Height = 21
        Hint = 'Maximum allowed term'
        DataSource = dmLoan.dscLoanClass
        DataField = 'term'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 10
        IntegersOnly = False
        DisplayFormat = ',0;(,0)'
      end
      object lbxComakers: TRzListBox
        Tag = -1
        Left = 615
        Top = 58
        Width = 218
        Height = 69
        ItemHeight = 13
        TabOrder = 11
        OnDblClick = lbxComakersDblClick
      end
      object RzDBEdit9: TRzDBEdit
        Left = 99
        Top = 58
        Width = 175
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'email_add'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 12
      end
      object RzDBEdit8: TRzDBEdit
        Left = 99
        Top = 82
        Width = 175
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'fb_acct'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 13
      end
      object RzDBEdit11: TRzDBEdit
        Left = 99
        Top = 106
        Width = 86
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'mobile_no'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 14
      end
      object RzDBEdit10: TRzDBEdit
        Left = 189
        Top = 106
        Width = 85
        Height = 21
        DataSource = dmClient.dscContactInfo
        DataField = 'home_phone'
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 15
      end
      object RzPanel1: TRzPanel
        Tag = -1
        Left = 1
        Top = 1
        Width = 848
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 8806462
        GradientColorStop = 11110503
        TabOrder = 16
        VisualStyle = vsGradient
        object RzLabel1: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 104
          Height = 13
          Caption = 'Application details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
    end
    object pnlAssessment: TRzPanel
      Tag = 200
      Left = 17
      Top = 192
      Width = 850
      Height = 19
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 1
      Visible = False
      object JvLabel10: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 72
        Height = 13
        Caption = 'Date assessed'
        Transparent = True
      end
      object JvLabel11: TJvLabel
        Tag = -1
        Left = 197
        Top = 40
        Width = 111
        Height = 13
        Caption = 'Recommended amount'
        Transparent = True
      end
      object JvLabel24: TJvLabel
        Tag = -1
        Left = 20
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Remarks'
        Transparent = True
      end
      object RzPanel3: TRzPanel
        Left = 1
        Top = 1
        Width = 848
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 16737380
        GradientColorStop = 16741749
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          848
          17)
        object RzLabel2: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 110
          Height = 13
          Caption = 'Assessment details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object imgAssessment: TImage
          Tag = 1
          Left = 830
          Top = 1
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgAssessmentClick
          ExplicitLeft = 810
        end
      end
      object dteDateAssessed: TRzDBDateTimeEdit
        Tag = 3
        Left = 99
        Top = 34
        Width = 86
        Height = 21
        DataSource = dmLoan.dscLoanAss
        DataField = 'date_ass'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 1
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object edRecAmount: TRzDBNumericEdit
        Tag = 3
        Left = 319
        Top = 34
        Width = 82
        Height = 21
        DataSource = dmLoan.dscLoanAss
        DataField = 'rec_amt'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 2
        DisplayFormat = '###,##0.00'
      end
      object pcAssessment: TRzPageControl
        Tag = 3
        Left = 452
        Top = 34
        Width = 383
        Height = 115
        Hint = ''
        ActivePage = tsMonExp
        ActivePageDefault = tsFinInfo
        TabOverlap = 0
        TabIndex = 1
        TabOrder = 3
        TabStyle = tsRoundCorners
        FixedDimension = 19
        object tsFinInfo: TRzTabSheet
          Color = 15000804
          Caption = 'Financial info'
          ExplicitHeight = 134
          DesignSize = (
            379
            89)
          object grFinInfo: TRzDBGrid
            Left = 5
            Top = 5
            Width = 369
            Height = 79
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataSource = dmLoan.dscFinInfo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            AltRowShadingColor = 15854564
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'comp_name'
                Title.Caption = 'Company'
                Width = 150
                Visible = True
              end
              item
                Alignment = taRightJustify
                Color = clInfoBk
                Expanded = False
                FieldName = 'mon_due_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Monthly'
                Width = 80
                Visible = True
              end
              item
                Alignment = taRightJustify
                Color = clInfoBk
                Expanded = False
                FieldName = 'loan_bal_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Balance'
                Width = 80
                Visible = True
              end>
          end
        end
        object tsMonExp: TRzTabSheet
          Color = 15000804
          Caption = 'Monthly expenses'
          ExplicitHeight = 134
          DesignSize = (
            379
            89)
          object grMonExp: TRzDBGrid
            Left = 5
            Top = 5
            Width = 369
            Height = 79
            Anchors = [akLeft, akTop, akRight]
            DataSource = dmLoan.dscMonExp
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            AltRowShadingColor = 15854564
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'exp_name'
                Title.Caption = 'Expense'
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'monthly_f'
                Title.Alignment = taRightJustify
                Title.Caption = 'Monthly'
                Width = 80
                Visible = True
              end>
          end
        end
      end
      object mmRemarks: TRzDBMemo
        Left = 99
        Top = 58
        Width = 302
        Height = 45
        Color = clInfoBk
        DataField = 'remarks'
        DataSource = dmLoan.dscLoanAss
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnlApproval: TRzPanel
      Tag = 200
      Left = -1000
      Top = 216
      Width = 850
      Height = 19
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 2
      Visible = False
      object JvLabel13: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 74
        Height = 13
        Caption = 'Date approved'
        Transparent = True
      end
      object JvLabel14: TJvLabel
        Tag = -1
        Left = 20
        Top = 64
        Width = 88
        Height = 13
        Caption = 'Approved amount'
        Transparent = True
      end
      object JvLabel16: TJvLabel
        Tag = -1
        Left = 20
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Approved term'
        Transparent = True
      end
      object JvLabel17: TJvLabel
        Tag = -1
        Left = 236
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Remarks'
        Transparent = True
      end
      object JvLabel28: TJvLabel
        Left = 236
        Top = 40
        Width = 84
        Height = 13
        Caption = 'Approval method'
        Transparent = True
      end
      object RzPanel5: TRzPanel
        Left = 1
        Top = 1
        Width = 848
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 37632
        GradientColorStop = 43008
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          848
          17)
        object RzLabel3: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 92
          Height = 13
          Caption = 'Approval details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object imgApproval: TImage
          Tag = 1
          Left = 830
          Top = 1
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgAssessmentClick
          ExplicitLeft = 810
        end
      end
      object dteDateApproved: TRzDBDateTimeEdit
        Tag = 5
        Left = 125
        Top = 34
        Width = 86
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanAppv
        DataField = 'date_appv'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 1
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object edAppvAmount: TRzDBNumericEdit
        Tag = 5
        Left = 125
        Top = 58
        Width = 86
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanAppv
        DataField = 'amt_appv'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 2
        DisplayFormat = '###,##0.00'
      end
      object edAppvTerm: TRzDBNumericEdit
        Tag = 5
        Left = 125
        Top = 82
        Width = 86
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanAppv
        DataField = 'terms'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 3
        DisplayFormat = '0'
      end
      object RzDBMemo1: TRzDBMemo
        Left = 341
        Top = 58
        Width = 276
        Height = 45
        TabStop = False
        Color = clInfoBk
        DataField = 'remarks'
        DataSource = dmLoan.dscLoanAppv
        ReadOnly = True
        TabOrder = 4
      end
      object RzDBEdit3: TRzDBEdit
        Left = 341
        Top = 34
        Width = 276
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanAppv
        DataField = 'method_name'
        ReadOnly = True
        Color = clInfoBk
        Ctl3D = True
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 5
      end
    end
    object pnlRelease: TRzPanel
      Tag = -1
      Left = 17
      Top = 217
      Width = 850
      Height = 135
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 3
      Visible = False
      DesignSize = (
        850
        135)
      object JvLabel1: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 46
        Height = 13
        Caption = 'Recipient'
        Transparent = True
      end
      object JvLabel15: TJvLabel
        Tag = -1
        Left = 491
        Top = 40
        Width = 42
        Height = 13
        Caption = 'Charges'
        Transparent = True
      end
      object RzPanel7: TRzPanel
        Left = 1
        Top = 1
        Width = 848
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 37632
        GradientColorStop = 43008
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          848
          17)
        object RzLabel4: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 86
          Height = 13
          Caption = 'Release details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object imgRelease: TImage
          Tag = 1
          Left = 830
          Top = 1
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgAssessmentClick
          ExplicitLeft = 810
        end
      end
      object RzDBGrid1: TRzDBGrid
        Left = 77
        Top = 34
        Width = 379
        Height = 86
        Anchors = [akLeft, akTop, akRight]
        DataSource = dmLoan.dscLoanRelease
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        AltRowShadingColor = 15854564
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'date_rel_f'
            Title.Caption = 'Date'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'recipient_name'
            Title.Caption = 'Recipient'
            Width = 145
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'method_name'
            Title.Caption = 'Method'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'rel_amt_f'
            Title.Caption = 'Amount'
            Width = 60
            Visible = True
          end>
      end
      object RzDBGrid2: TRzDBGrid
        Left = 552
        Top = 35
        Width = 281
        Height = 86
        Anchors = [akLeft, akTop, akRight]
        DataSource = dmLoan.dscMonExp
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        AltRowShadingColor = 15854564
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'exp_name'
            Title.Caption = 'Expense'
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'monthly_f'
            Title.Alignment = taRightJustify
            Title.Caption = 'Monthly'
            Width = 80
            Visible = True
          end>
      end
    end
    object pnlCancellation: TRzPanel
      Tag = -1
      Left = -1000
      Top = 168
      Width = 492
      Height = 120
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 4
      Visible = False
      object JvLabel18: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 72
        Height = 13
        Caption = 'Date cancelled'
        Transparent = True
      end
      object JvLabel19: TJvLabel
        Tag = -1
        Left = 190
        Top = 40
        Width = 38
        Height = 13
        Caption = 'Reason'
        Transparent = True
      end
      object JvLabel23: TJvLabel
        Tag = -1
        Left = 20
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Remarks'
        Transparent = True
      end
      object RzPanel9: TRzPanel
        Left = 1
        Top = 1
        Width = 490
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 5329407
        GradientColorStop = 4868863
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          490
          17)
        object RzLabel5: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 110
          Height = 13
          Caption = 'Cancellation details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object imgCancellation: TImage
          Tag = 1
          Left = 472
          Top = 1
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgAssessmentClick
          ExplicitLeft = 810
        end
      end
      object RzDBMemo2: TRzDBMemo
        Left = 99
        Top = 58
        Width = 302
        Height = 45
        TabStop = False
        Color = clInfoBk
        DataField = 'remarks'
        DataSource = dmLoan.dscLoanCancel
        ReadOnly = True
        TabOrder = 1
        TabOnEnter = True
      end
      object dteDateCancelled: TRzDBDateTimeEdit
        Left = 99
        Top = 34
        Width = 80
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanCancel
        DataField = 'cancelled_date'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 2
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object RzDBEdit1: TRzDBEdit
        Tag = 1
        Left = 234
        Top = 34
        Width = 167
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanCancel
        DataField = 'reason_name'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 3
      end
    end
    object pnlRejection: TRzPanel
      Tag = -1
      Left = -1000
      Top = 148
      Width = 491
      Height = 120
      BorderOuter = fsFlat
      Color = 15000804
      TabOrder = 5
      Visible = False
      object JvLabel25: TJvLabel
        Tag = -1
        Left = 20
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Date rejected'
        Transparent = True
      end
      object JvLabel26: TJvLabel
        Tag = -1
        Left = 20
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Remarks'
        Transparent = True
      end
      object JvLabel27: TJvLabel
        Tag = -1
        Left = 189
        Top = 40
        Width = 38
        Height = 13
        Caption = 'Reason'
        Transparent = True
      end
      object RzPanel11: TRzPanel
        Left = 1
        Top = 1
        Width = 489
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderColor = clBlack
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 5329407
        GradientColorStop = 4868863
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          489
          17)
        object RzLabel6: TRzLabel
          Tag = -1
          Left = 7
          Top = 2
          Width = 95
          Height = 13
          Caption = 'Rejection details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object imgRejection: TImage
          Tag = 1
          Left = 471
          Top = 1
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          OnClick = imgAssessmentClick
          ExplicitLeft = 810
        end
      end
      object RzDBMemo3: TRzDBMemo
        Left = 99
        Top = 58
        Width = 302
        Height = 45
        TabStop = False
        Color = clInfoBk
        DataField = 'remarks'
        DataSource = dmLoan.dscLoanReject
        ReadOnly = True
        TabOrder = 1
        TabOnEnter = True
      end
      object RzDBDateTimeEdit1: TRzDBDateTimeEdit
        Left = 99
        Top = 34
        Width = 80
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanReject
        DataField = 'date_rejected'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 2
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object RzDBEdit2: TRzDBEdit
        Tag = 1
        Left = 234
        Top = 34
        Width = 167
        Height = 21
        TabStop = False
        DataSource = dmLoan.dscLoanReject
        DataField = 'reason_name'
        ReadOnly = True
        Color = clInfoBk
        DisabledColor = clWhite
        TabOnEnter = True
        TabOrder = 3
      end
    end
  end
end
