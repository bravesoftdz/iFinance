inherited frmLoanMain: TfrmLoanMain
  Caption = 'frmLoanMain'
  ClientHeight = 542
  ClientWidth = 1155
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1171
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1155
    ExplicitWidth = 1155
    DesignSize = (
      1155
      28)
    inherited lblTitle: TRzLabel
      Width = 73
      Caption = 'Loan record'
      ExplicitWidth = 73
    end
    object lblHeader: TRzLabel
      Left = 1080
      Top = 7
      Width = 64
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'NEW LOAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8675134
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
    Width = 1155
    Height = 514
    Align = alClient
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdRight, sdBottom]
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      1155
      514)
    object pnlApplication: TRzPanel
      Tag = 100
      Left = 182
      Top = 6
      Width = 356
      Height = 502
      Anchors = [akLeft, akTop, akBottom]
      BorderOuter = fsNone
      BorderColor = 15327448
      BorderWidth = 1
      Color = 15327448
      TabOrder = 0
      DesignSize = (
        356
        502)
      object c: TJvLabel
        Tag = -1
        Left = 19
        Top = 45
        Width = 32
        Height = 14
        Caption = 'Client'
        Transparent = True
      end
      object JvLabel2: TJvLabel
        Tag = -1
        Left = 19
        Top = 209
        Width = 56
        Height = 14
        Caption = 'Loan class'
        Transparent = True
      end
      object JvLabel12: TJvLabel
        Tag = -1
        Left = 233
        Top = 235
        Width = 34
        Height = 14
        Caption = 'Int %'
        Transparent = True
      end
      object JvLabel7: TJvLabel
        Tag = -1
        Left = 19
        Top = 236
        Width = 70
        Height = 14
        Caption = 'Date applied'
        Transparent = True
      end
      object JvLabel5: TJvLabel
        Tag = -1
        Left = 19
        Top = 263
        Width = 88
        Height = 14
        Caption = 'Amount applied'
        Transparent = True
      end
      object JvLabel9: TJvLabel
        Tag = -1
        Left = 19
        Top = 290
        Width = 72
        Height = 14
        Caption = 'Desired term'
        Transparent = True
      end
      object JvLabel6: TJvLabel
        Tag = -1
        Left = 19
        Top = 317
        Width = 46
        Height = 14
        Caption = 'Purpose'
        Transparent = True
      end
      object JvLabel21: TJvLabel
        Tag = -1
        Left = 209
        Top = 263
        Width = 27
        Height = 14
        Caption = 'Max.'
        Transparent = True
      end
      object JvLabel22: TJvLabel
        Tag = -1
        Left = 209
        Top = 290
        Width = 27
        Height = 14
        Caption = 'Max.'
        Transparent = True
      end
      object lblComakersDesc: TRzDBLabel
        Tag = -1
        Left = 22
        Top = 471
        Width = 89
        Height = 14
        Anchors = [akTop, akRight]
        AutoSize = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        DataField = 'comakers_desc'
        DataSource = dmLoan.dscLoanClass
      end
      object JvLabel20: TJvLabel
        Tag = -1
        Left = 19
        Top = 72
        Width = 45
        Height = 14
        Caption = 'Address'
        Transparent = True
      end
      object JvLabel4: TJvLabel
        Tag = -1
        Left = 19
        Top = 109
        Width = 52
        Height = 14
        Caption = 'Employer'
        Transparent = True
      end
      object JvLabel34: TJvLabel
        Tag = -1
        Left = 19
        Top = 146
        Width = 45
        Height = 14
        Caption = 'Net pay'
        Transparent = True
      end
      object edDesiredTerm: TRzDBNumericEdit
        Tag = 1
        Left = 114
        Top = 284
        Width = 80
        Height = 22
        DataSource = dmLoan.dscLoan
        DataField = 'des_term'
        Alignment = taLeftJustify
        DisabledColor = clWhite
        Enabled = False
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 5
        DisplayFormat = '0'
      end
      object edAppAmount: TRzDBNumericEdit
        Tag = 1
        Left = 114
        Top = 257
        Width = 80
        Height = 22
        DataSource = dmLoan.dscLoan
        DataField = 'amt_appl'
        Alignment = taLeftJustify
        DisabledColor = clWhite
        Enabled = False
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 4
        DisplayFormat = '###,##0.00'
      end
      object dteDateApplied: TRzDBDateTimeEdit
        Tag = 1
        Left = 114
        Top = 230
        Width = 105
        Height = 22
        DataSource = dmLoan.dscLoan
        DataField = 'date_appl'
        DisabledColor = clWhite
        Enabled = False
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
        TabOrder = 3
        EditType = etDate
        Format = 'mm/dd/yyyy'
        FlatButtons = True
      end
      object edInterest: TRzDBNumericEdit
        Tag = -1
        Left = 280
        Top = 230
        Width = 49
        Height = 22
        TabStop = False
        DataSource = dmLoan.dscLoanClass
        DataField = 'int_rate'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = 15327448
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
        TabOnEnter = True
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object dbluLoanClass: TRzDBLookupComboBox
        Tag = 1
        Left = 114
        Top = 203
        Width = 215
        Height = 22
        DataField = 'class_id'
        DataSource = dmLoan.dscLoan
        Enabled = False
        KeyField = 'class_id'
        ListField = 'class_name_method'
        ListSource = dmLoan.dscLoanClass
        TabOrder = 1
        FlatButtons = True
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object bteClient: TRzButtonEdit
        Left = 114
        Top = 39
        Width = 215
        Height = 22
        Text = ''
        Color = clWhite
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ParentShowHint = False
        ReadOnly = True
        ReadOnlyColor = clWhite
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
        Tag = -1
        Left = 242
        Top = 257
        Width = 87
        Height = 22
        Hint = 'Maximum loanable amout'
        TabStop = False
        DataSource = dmLoan.dscLoanClass
        DataField = 'max_loan'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = 15327448
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
        TabOnEnter = True
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = '###,##0.00'
      end
      object RzDBNumericEdit2: TRzDBNumericEdit
        Tag = -1
        Left = 280
        Top = 284
        Width = 49
        Height = 22
        Hint = 'Maximum allowed term'
        TabStop = False
        DataSource = dmLoan.dscLoanClass
        DataField = 'term'
        ReadOnly = True
        Alignment = taLeftJustify
        Color = 15327448
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
        TabOnEnter = True
        TabOrder = 7
        IntegersOnly = False
        DisplayFormat = ',0;(,0)'
      end
      object lbxComakers: TRzListBox
        Tag = -1
        Left = 19
        Top = 371
        Width = 310
        Height = 57
        Color = clWhite
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ItemHeight = 14
        TabOrder = 9
        OnDblClick = lbxComakersDblClick
      end
      object mmAddress: TRzMemo
        Tag = -1
        Left = 114
        Top = 66
        Width = 215
        Height = 32
        TabStop = False
        Color = 15327448
        ReadOnly = True
        TabOrder = 10
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
      end
      object mmEmployer: TRzMemo
        Tag = -1
        Left = 114
        Top = 103
        Width = 215
        Height = 32
        TabStop = False
        Color = 15327448
        ReadOnly = True
        TabOrder = 11
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15327448
      end
      object RzGroupBox1: TRzGroupBox
        Tag = -1
        Left = 19
        Top = 347
        Width = 310
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Comakers'
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
        TabOrder = 12
      end
      object RzGroupBox2: TRzGroupBox
        Tag = -1
        Left = 19
        Top = 179
        Width = 310
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Loan details'
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
        TabOrder = 13
      end
      object RzGroupBox3: TRzGroupBox
        Tag = -1
        Left = 19
        Top = 15
        Width = 310
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderColor = 6572079
        BorderSides = []
        BorderWidth = 1
        Caption = 'Client details'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = 8675134
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
        TabOrder = 14
      end
      object pnlAdd: TRzPanel
        Tag = 1
        Left = 19
        Top = 435
        Width = 50
        Height = 22
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 15
        object btnAddComaker: TRzShapeButton
          Tag = 1
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Hint = 'Add comaker'
          BorderStyle = bsNone
          Caption = 'Add'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAddComakerClick
        end
      end
      object pnlRemoveComaker: TRzPanel
        Left = 75
        Top = 435
        Width = 50
        Height = 22
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 16
        object btnRemoveComaker: TRzShapeButton
          Tag = 1
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Hint = 'Remove comaker'
          BorderStyle = bsNone
          Caption = 'Remove'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnRemoveComakerClick
        end
      end
      object pnlClientRecord: TRzPanel
        Tag = -1
        Left = 309
        Top = 9
        Width = 20
        Height = 20
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 17
        Visible = False
        object imgClientRecord: TImage
          Left = 2
          Top = 2
          Width = 16
          Height = 16
          Cursor = crHandPoint
          Hint = 'Client record'
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF6100000006624B474400FF00FF00FFA0BDA793000000
            097048597300000048000000480046C96B3E0000000976704167000000100000
            0010005CC6ADC3000002254944415478DAA5935148536114C7FF9F6EC9BAE476
            E7DAD68C353768CA2A228AC2E18A1E929E8C9EDA7CB087C4ACC8A422A8A7A820
            28A808DAAC8746506A0FA524442F619610A92BD431296DB174F3DED9EEEE2AB7
            4BB3AFAB2114DCD1A0038703E77CE777CEF7FFF808A514FF63E44F002164299E
            DCC53A880A834683C6949328522989539752F795E7C2D462FDAF1E25C0F13A76
            DC5D6B70B1AC094206187E1747664E0877BC1136140538BD474F6BB75BB18AB5
            222D96626878127C621A774302290AD0B6B39C56D90DB03BB7C0E1AA06379B44
            F06627EE8D668A03346F2BA3B707BA21C5E21084342449C2B9C397713F221507
            68DAAC7E107C12F072331CD2B208B95C0ED72F0402C150AEB52880D366ACBE73
            C917596B62208A2226267978CF3CB4C8A5C43F01EE86D64EBDD172E0E0EE7230
            D930A29F62887E33E343763D9289CF5DAF7AFCDE8200CFBE16FE27C56AE9C702
            DA4F1C816FFA229057E3DACA267477F562859AA08494A0FFD12DA208F01D3B4F
            753A2D426FC3604D6BF0B451053016D4FB3FE26B6A0E951613783E89178F03CA
            80FD87CE52BBDD8AA1915164B20BF05B0741353A1C7DEF02234FDFB4D189B1B1
            090CF4742803F636B6538F672B66E27170BC085EF88E7C9EA2425B864AB31E36
            9B157D7DFD78D95B0050D7D0426B6AD6816134CBAACABE24BBECC0FC7C169148
            4CDEA0C0155C3BEADB2ACC5557E59C4AF1E71192FF321B3D157EFDEC46A167D4
            CAC181DF73956CF1F094DC232E277E014D8117F0A787AF080000003774455874
            636F6D6D656E74005375697420757365722066726F6D2049636F6E2047616C6C
            65727920687474703A2F2F69636F6E67616C2E636F6D2F6F1927920000002574
            455874646174653A63726561746500323031312D30382D32315431343A31323A
            33372D30363A30303E73266D0000002574455874646174653A6D6F6469667900
            323031312D30382D32315431343A31323A33372D30363A30304F2E9ED1000000
            1974455874536F6674776172650041646F626520496D616765526561647971C9
            653C0000000049454E44AE426082}
          ShowHint = True
          OnClick = imgClientRecordClick
          OnMouseDown = imgAssessmentMouseDown
          OnMouseUp = imgAssessmentMouseUp
        end
      end
      object pnlAlerts: TRzPanel
        Tag = -1
        Left = 285
        Top = 9
        Width = 20
        Height = 20
        BorderOuter = fsNone
        BorderColor = 14272955
        BorderWidth = 1
        Color = 15327448
        TabOrder = 18
        Visible = False
        object imgAlerts: TImage
          Left = 2
          Top = 2
          Width = 16
          Height = 16
          Cursor = crHandPoint
          Hint = 'Client alerts'
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF6100000006624B474400FF00FF00FFA0BDA793000000
            097048597300000048000000480046C96B3E0000000976704167000000100000
            0010005CC6ADC3000002354944415478DAA5934F48545114C6BF7BDF7B339115
            449696363013811A84FF1693124CE62C5B0C1518648B0C37A126B488DA0C92D2
            2230B536522D3248A89845CB3113DA588D3A04A910CDC0A4A56504955133EFDD
            DBB9D76782F417DFE6DD77BEC3EF9EEFBC739894126B7958A2B3F6978210C26F
            B06C4A9D1DE90970CED3FF0C9042C0CE6527CAC29172F53D198F254DCB53C138
            FF3B40599276AE6563A1AFB7A4A155C7A6077BF1792ED3CA4CAB8F31F6678070
            9CF58CF1C5EA93E7907EBDA063FE9DF948DCBC447091C70DE3EB6F01AA74874A
            0F840E976FDDEBC391F6511DBFD71DC4FBE719A446EE278D5556560054BA63E7
            1A361404EE941D6F03A6CEE2684FA596EEB68D03A5973179BB075FE653C70CD3
            1A846BE527804A878429AB9B3BC167BA81EF533874A54E6B0FCE0C03DE5288E2
            7624FA2F80C166646505E0961EF71D68ACDF5E487F6BE131B08E2314D53F0123
            D124F04D00F9FBF176CE8FCCA38121B212565658E2620D956ED7E715EC8EEF89
            1C04D2FD84B5E846E0DD874D1AB06DCB27AA48D9CC51479BF122F6108BF32FC3
            86690EB1671DFB20E09115274EC1FA7883924C025093BC0291AE2A0D889D1F23
            00575D26CD466E7313266E5D074796B127D1E0D5A260DDE9A25DD340565D4389
            AA3F1E81504BF19285BE19D21440778B342F665F95607674F81A1BEBAA95958D
            3BDC21708744BD548F4C774F6C0A387001EA8EA5C3F8C01BB0A71D355238347D
            42BA09CB1009EE1E9504B93C8152A73012B9C17476D57FADDFEA5D58EB3AFF00
            FAD9DED5BEC910D80000004274455874636F6D6D656E74004572726F72207761
            726E696E672068617A6172642066726F6D2049636F6E2047616C6C6572792068
            7474703A2F2F69636F6E67616C2E636F6D2F3439FB8D00000025744558746461
            74653A63726561746500323031312D30382D32315431343A31303A32312D3036
            3A303095FCC3F40000002574455874646174653A6D6F6469667900323031312D
            30382D32315431343A31303A32312D30363A3030E4A17B480000001974455874
            536F6674776172650041646F626520496D616765526561647971C9653C000000
            0049454E44AE426082}
          ShowHint = True
          OnClick = imgAlertsClick
          OnMouseDown = imgAssessmentMouseDown
          OnMouseUp = imgAssessmentMouseUp
        end
      end
      object dbluPurpose: TRzDBLookupComboBox
        Tag = 1
        Left = 114
        Top = 311
        Width = 215
        Height = 22
        DataField = 'purp_id'
        DataSource = dmLoan.dscLoan
        Enabled = False
        KeyField = 'purp_id'
        ListField = 'purpose'
        ListSource = dmLoansAux.dscPurpose
        TabOrder = 8
        FlatButtons = True
        DisabledColor = clWhite
        FrameColor = 14272955
        FrameHotColor = clBlack
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOnEnter = True
      end
      object edNetPay: TRzNumericEdit
        Tag = -1
        Left = 114
        Top = 140
        Width = 80
        Height = 22
        TabStop = False
        Color = 15327448
        FrameColor = 14272955
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 15327448
        TabOrder = 19
        DisplayFormat = '###,##,##0.00'
      end
    end
    object pnlToolbar: TRzPanel
      Left = 0
      Top = 0
      Width = 175
      Height = 514
      Align = alLeft
      BorderOuter = fsNone
      BorderSides = [sdRight]
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      Enabled = False
      TabOrder = 1
      object urlAssessment: TRzURLLabel
        Left = 18
        Top = 19
        Width = 64
        Height = 14
        Caption = 'Assessment'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlAssessmentClick
      end
      object urlApproval: TRzURLLabel
        Left = 18
        Top = 43
        Width = 54
        Height = 14
        Caption = 'Appproval'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlApprovalClick
      end
      object urlRelease: TRzURLLabel
        Left = 18
        Top = 67
        Width = 41
        Height = 14
        Caption = 'Release'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlReleaseClick
      end
      object urlReject: TRzURLLabel
        Left = 18
        Top = 91
        Width = 35
        Height = 14
        Caption = 'Reject'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlRejectClick
      end
      object urlCancel: TRzURLLabel
        Left = 18
        Top = 115
        Width = 35
        Height = 14
        Caption = 'Cancel'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlCancelClick
      end
      object urlClose: TRzURLLabel
        Left = 18
        Top = 139
        Width = 77
        Height = 14
        Caption = 'Close this loan'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlCloseClick
      end
      object urlReloan: TRzURLLabel
        Left = 18
        Top = 163
        Width = 113
        Height = 14
        Caption = 'Reloan / Restructure'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object urlLedger: TRzURLLabel
        Left = 18
        Top = 187
        Width = 68
        Height = 14
        Caption = 'Open ledger'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlLedgerClick
      end
      object urlSummary: TRzURLLabel
        Left = 18
        Top = 212
        Width = 50
        Height = 14
        Caption = 'Summary'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlSummaryClick
      end
    end
    object pnlStatus: TRzPanel
      Left = 544
      Top = 6
      Width = 605
      Height = 502
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 14273211
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object pcStatus: TRzPageControl
        Left = 1
        Top = 1
        Width = 603
        Height = 500
        Hint = ''
        ActivePage = tsSummary
        ActivePageDefault = tsSummary
        Align = alClient
        Color = 15327448
        FlatColor = 15327448
        ParentColor = False
        ShowCardFrame = False
        ShowShadow = False
        TabOrder = 0
        TabStop = False
        Transparent = True
        FixedDimension = 20
        object tsAssessment: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Assessment'
          object JvLabel29: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 181
            Height = 14
            Caption = 'No assessment details found.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object pnlAssessment: TRzPanel
            Tag = 200
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderColor = 8675134
            Color = 15327448
            TabOrder = 0
            DesignSize = (
              603
              500)
            object JvLabel10: TJvLabel
              Tag = -1
              Left = 19
              Top = 17
              Width = 92
              Height = 14
              Caption = 'Date assessed:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel11: TJvLabel
              Tag = -1
              Left = 20
              Top = 185
              Width = 56
              Height = 14
              Caption = 'Amount:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel24: TJvLabel
              Tag = -1
              Left = 155
              Top = 17
              Width = 47
              Height = 14
              Caption = 'Capacity'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel1: TRzDBLabel
              Left = 20
              Top = 37
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'date_ass_f'
              DataSource = dmLoan.dscLoanAss
            end
            object RzDBLabel2: TRzDBLabel
              Left = 21
              Top = 205
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'rec_amt_f'
              DataSource = dmLoan.dscLoanAss
            end
            object RzDBLabel3: TRzDBLabel
              Left = 232
              Top = 17
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'capacity'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel35: TJvLabel
              Tag = -1
              Left = 155
              Top = 59
              Width = 54
              Height = 14
              Caption = 'Character'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel16: TRzDBLabel
              Left = 232
              Top = 59
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'character'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel36: TJvLabel
              Tag = -1
              Left = 155
              Top = 101
              Width = 37
              Height = 14
              Caption = 'Capital'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel17: TRzDBLabel
              Left = 232
              Top = 101
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'capital'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel37: TJvLabel
              Tag = -1
              Left = 155
              Top = 143
              Width = 58
              Height = 14
              Caption = 'Conditions'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel18: TRzDBLabel
              Left = 232
              Top = 143
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'conditions'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel38: TJvLabel
              Tag = -1
              Left = 155
              Top = 185
              Width = 50
              Height = 14
              Caption = 'Collateral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel19: TRzDBLabel
              Left = 232
              Top = 185
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'collateral'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel39: TJvLabel
              Tag = -1
              Left = 155
              Top = 227
              Width = 49
              Height = 14
              Caption = 'Comaker'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object RzDBLabel20: TRzDBLabel
              Left = 232
              Top = 227
              Width = 346
              Height = 36
              Color = clWhite
              ParentColor = False
              WordWrap = True
              BorderColor = 14272955
              BorderWidth = 1
              DataField = 'comaker'
              DataSource = dmLoan.dscLoanAss
            end
            object JvLabel40: TJvLabel
              Tag = -1
              Left = 19
              Top = 101
              Width = 113
              Height = 14
              Caption = 'Recommendation:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel21: TRzDBLabel
              Left = 19
              Top = 121
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'recommendation'
              DataSource = dmLoan.dscLoanAss
            end
            object pnlEditAssessment: TRzPanel
              Left = 546
              Top = 471
              Width = 50
              Height = 22
              Anchors = [akRight, akBottom]
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 0
              OnClick = pnlEditAssessmentClick
              object btnEditAssessment: TRzShapeButton
                Left = 0
                Top = 0
                Width = 50
                Height = 22
                Hint = 'Edit assessment'
                BorderStyle = bsNone
                Caption = 'Edit'
                ParentShowHint = False
                ShowHint = True
                OnClick = btnEditAssessmentClick
              end
            end
            object pcAssessment: TRzPageControl
              Tag = 3
              Left = 19
              Top = 281
              Width = 559
              Height = 148
              Hint = ''
              ActivePage = tsFinInfo
              ActivePageDefault = tsFinInfo
              Anchors = [akLeft, akTop, akRight, akBottom]
              ButtonColor = 15327448
              FlatColor = 14272955
              ShowShadow = False
              TabOverlap = 0
              TabColors.HighlightBar = 15327448
              TabColors.Shadow = 15327448
              TabColors.Unselected = 15327448
              TabIndex = 0
              TabOrder = 1
              TabStyle = tsRoundCorners
              FixedDimension = 20
              object tsFinInfo: TRzTabSheet
                Color = 15327448
                Caption = 'Financial info'
                DesignSize = (
                  557
                  123)
                object grFinInfo: TRzDBGrid
                  Left = 5
                  Top = 5
                  Width = 547
                  Height = 113
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dmLoan.dscFinInfo
                  FixedColor = clWhite
                  GradientEndColor = 12955288
                  GradientStartColor = 12955288
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  FrameColor = 8675134
                  FrameHotStyle = fsNone
                  FrameStyle = fsNone
                  FramingPreference = fpCustomFraming
                  FixedLineColor = clWhite
                  LineColor = 14273211
                  AltRowShadingColor = 15854564
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'comp_name'
                      Title.Alignment = taCenter
                      Title.Caption = 'Company'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -12
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = [fsBold]
                      Width = 150
                      Visible = True
                    end
                    item
                      Alignment = taRightJustify
                      Expanded = False
                      FieldName = 'mon_due_f'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Monthly'
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
                      FieldName = 'loan_bal_f'
                      Title.Alignment = taRightJustify
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
              object tsMonExp: TRzTabSheet
                Color = 15327448
                Caption = 'Monthly expenses'
                DesignSize = (
                  557
                  123)
                object grMonExp: TRzDBGrid
                  Left = 5
                  Top = 5
                  Width = 547
                  Height = 113
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dmLoan.dscMonExp
                  FixedColor = clWhite
                  GradientEndColor = 12955288
                  GradientStartColor = 12955288
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  DisabledColor = 14273211
                  FrameColor = 8675134
                  FrameHotStyle = fsNone
                  FrameStyle = fsNone
                  FramingPreference = fpCustomFraming
                  FixedLineColor = clWhite
                  LineColor = 14273211
                  AltRowShadingColor = 15854564
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'exp_name'
                      Title.Alignment = taCenter
                      Title.Caption = 'Expense'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -12
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = [fsBold]
                      Width = 160
                      Visible = True
                    end
                    item
                      Alignment = taRightJustify
                      Expanded = False
                      FieldName = 'monthly_f'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Monthly'
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
          end
        end
        object tsApproval: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Approval'
          object JvLabel30: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 164
            Height = 14
            Caption = 'No approval details found.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object pnlApproval: TRzPanel
            Tag = 200
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderColor = 14272955
            Color = 15327448
            TabOrder = 0
            DesignSize = (
              603
              500)
            object JvLabel13: TJvLabel
              Tag = -1
              Left = 19
              Top = 17
              Width = 97
              Height = 14
              Caption = 'Date approved:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel14: TJvLabel
              Tag = -1
              Left = 19
              Top = 40
              Width = 118
              Height = 14
              Caption = 'Approved amount:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel16: TJvLabel
              Tag = -1
              Left = 19
              Top = 63
              Width = 99
              Height = 14
              Caption = 'Approved term:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel17: TJvLabel
              Tag = -1
              Left = 19
              Top = 109
              Width = 58
              Height = 14
              Caption = 'Remarks:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel28: TJvLabel
              Left = 19
              Top = 86
              Width = 113
              Height = 14
              Caption = 'Approval method:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel4: TRzDBLabel
              Left = 168
              Top = 17
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'date_appv_f'
              DataSource = dmLoan.dscLoanAppv
            end
            object RzDBLabel5: TRzDBLabel
              Left = 168
              Top = 40
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'amt_appv_f'
              DataSource = dmLoan.dscLoanAppv
            end
            object RzDBLabel6: TRzDBLabel
              Left = 168
              Top = 63
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'terms'
              DataSource = dmLoan.dscLoanAppv
            end
            object RzDBLabel7: TRzDBLabel
              Left = 168
              Top = 86
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'method_name'
              DataSource = dmLoan.dscLoanAppv
            end
            object RzDBLabel8: TRzDBLabel
              Left = 96
              Top = 109
              Width = 473
              Height = 72
              WordWrap = True
              DataField = 'remarks'
              DataSource = dmLoan.dscLoanAppv
            end
            object pnlEditApproval: TRzPanel
              Left = 546
              Top = 471
              Width = 50
              Height = 22
              Anchors = [akRight, akBottom]
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 0
              object btnEditApproval: TRzShapeButton
                Left = 0
                Top = 0
                Width = 50
                Height = 22
                Hint = 'Edit approval details'
                BorderStyle = bsNone
                Caption = 'Edit'
                ParentShowHint = False
                ShowHint = True
                OnClick = btnEditApprovalClick
              end
            end
          end
        end
        object tsReleased: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Released'
          object JvLabel33: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 153
            Height = 14
            Caption = 'No release details found.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object pnlRelease: TRzPanel
            Tag = -1
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderColor = 8675134
            Color = 15327448
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            DesignSize = (
              603
              500)
            object JvLabel15: TJvLabel
              Tag = -1
              Left = 19
              Top = 17
              Width = 118
              Height = 14
              Caption = 'Approved amount:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel15: TRzDBLabel
              Left = 143
              Top = 17
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'amt_appv_f'
              DataSource = dmLoan.dscLoanAppv
            end
            object JvLabel26: TJvLabel
              Tag = -1
              Left = 243
              Top = 41
              Width = 88
              Height = 14
              Caption = 'Total charges:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object lblTotalCharges: TJvLabel
              Tag = -1
              Left = 339
              Top = 41
              Width = 27
              Height = 14
              Caption = '0.00'
              Transparent = True
            end
            object JvLabel27: TJvLabel
              Tag = -1
              Left = 19
              Top = 65
              Width = 86
              Height = 14
              Caption = 'Net proceeds:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object lblNetProceeds: TJvLabel
              Tag = -1
              Left = 115
              Top = 65
              Width = 27
              Height = 14
              Caption = '0.00'
              Transparent = True
            end
            object lblReleaseAmount: TJvLabel
              Tag = -1
              Left = 129
              Top = 41
              Width = 27
              Height = 14
              Caption = '0.00'
              Transparent = True
            end
            object JvLabel42: TJvLabel
              Tag = -1
              Left = 19
              Top = 41
              Width = 104
              Height = 14
              Caption = 'Release amount:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel45: TJvLabel
              Tag = -1
              Left = 243
              Top = 65
              Width = 116
              Height = 14
              Caption = 'Advance payment:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object lblAdvancePayment: TJvLabel
              Tag = -1
              Left = 371
              Top = 65
              Width = 212
              Height = 34
              AutoSize = False
              Caption = '0.00'
              Transparent = True
              WordWrap = True
            end
            object JvLabel46: TJvLabel
              Tag = -1
              Left = 243
              Top = 17
              Width = 106
              Height = 14
              Caption = 'Promissory note:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel25: TRzDBLabel
              Left = 363
              Top = 17
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'pn_no'
              DataSource = dmLoan.dscLoan
            end
            object RzGroupBox6: TRzGroupBox
              Tag = -1
              Left = 19
              Top = 105
              Width = 564
              Height = 22
              BorderColor = 6572079
              BorderSides = []
              BorderWidth = 1
              Caption = 'Recipients'
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
              TabOrder = 0
            end
            object RzGroupBox7: TRzGroupBox
              Tag = -1
              Left = 19
              Top = 249
              Width = 564
              Height = 36
              BorderColor = 6572079
              BorderSides = []
              BorderWidth = 1
              Caption = 'Charges'
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
              TabOrder = 1
            end
            object RzPanel2: TRzPanel
              Left = 546
              Top = 471
              Width = 50
              Height = 22
              Anchors = [akRight, akBottom]
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 2
              OnClick = pnlEditRejectionClick
              object RzShapeButton1: TRzShapeButton
                Left = 0
                Top = 0
                Width = 50
                Height = 22
                Hint = 'Edit approval details'
                BorderStyle = bsNone
                Caption = 'Edit'
                ParentShowHint = False
                ShowHint = True
                OnClick = btnEditApprovalClick
              end
            end
            object RzPanel3: TRzPanel
              Left = 17
              Top = 128
              Width = 566
              Height = 99
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 3
              object grRecipients: TRzDBGrid
                Left = 1
                Top = 1
                Width = 564
                Height = 97
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = False
                DataSource = dmLoan.dscLoanRelease
                FixedColor = clWhite
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ParentCtl3D = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                DisabledColor = clWhite
                FrameColor = 14272955
                FrameHotColor = clWhite
                FrameHotStyle = fsNone
                FrameStyle = fsNone
                FramingPreference = fpCustomFraming
                FixedLineColor = clWhite
                LineColor = 14273211
                AltRowShadingColor = 15854564
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'date_rel_f'
                    Title.Alignment = taCenter
                    Title.Caption = 'Date'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = [fsBold]
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'recipient_name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Recipient'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = [fsBold]
                    Width = 140
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'loc_name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Branch'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = [fsBold]
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'method_name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Method'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = [fsBold]
                    Width = 60
                    Visible = True
                  end
                  item
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'rel_amt_f'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Amount'
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
            object RzPanel4: TRzPanel
              Left = 17
              Top = 272
              Width = 566
              Height = 119
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 4
              object grCharges: TRzDBGrid
                Left = 1
                Top = 1
                Width = 564
                Height = 117
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = dmLoan.dscLoanCharge
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
                FrameColor = 14272955
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = clWhite
                LineColor = clWhite
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
                    Width = 150
                    Visible = True
                  end
                  item
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'charge_amt_f'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Amount'
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
        end
        object tsRejected: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Rejected'
          object JvLabel32: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 165
            Height = 14
            Caption = 'No rejection details found.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object pnlRejection: TRzPanel
            Tag = -1
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderColor = 8675134
            Color = 15327448
            TabOrder = 0
            DesignSize = (
              603
              500)
            object JvLabel3: TJvLabel
              Tag = -1
              Left = 19
              Top = 17
              Width = 89
              Height = 14
              Caption = 'Date rejected:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel12: TRzDBLabel
              Left = 136
              Top = 17
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'date_rejected_f'
              DataSource = dmLoan.dscLoanReject
            end
            object RzDBLabel13: TRzDBLabel
              Left = 96
              Top = 40
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'reason_name'
              DataSource = dmLoan.dscLoanReject
            end
            object RzDBLabel14: TRzDBLabel
              Left = 96
              Top = 63
              Width = 489
              Height = 72
              WordWrap = True
              DataField = 'remarks'
              DataSource = dmLoan.dscLoanReject
            end
            object JvLabel8: TJvLabel
              Tag = -1
              Left = 19
              Top = 63
              Width = 58
              Height = 14
              Caption = 'Remarks:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel25: TJvLabel
              Tag = -1
              Left = 19
              Top = 40
              Width = 51
              Height = 14
              Caption = 'Reason:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object pnlEditRejection: TRzPanel
              Left = 546
              Top = 471
              Width = 50
              Height = 22
              Anchors = [akRight, akBottom]
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 0
              OnClick = pnlEditRejectionClick
              object btnEditRejection: TRzShapeButton
                Left = 0
                Top = 0
                Width = 50
                Height = 22
                Hint = 'Edit approval details'
                BorderStyle = bsNone
                Caption = 'Edit'
                ParentShowHint = False
                ShowHint = True
                OnClick = btnEditApprovalClick
              end
            end
          end
        end
        object tsCancelled: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Cancelled'
          object JvLabel31: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 183
            Height = 14
            Caption = 'No cancellation details found.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object pnlCancellation: TRzPanel
            Tag = -1
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderSides = [sdTop]
            BorderColor = 8675134
            Color = 15327448
            TabOrder = 0
            DesignSize = (
              603
              500)
            object JvLabel18: TJvLabel
              Tag = -1
              Left = 19
              Top = 17
              Width = 94
              Height = 14
              Caption = 'Date cancelled:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel19: TJvLabel
              Tag = -1
              Left = 19
              Top = 63
              Width = 58
              Height = 14
              Caption = 'Remarks:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel23: TJvLabel
              Tag = -1
              Left = 19
              Top = 40
              Width = 51
              Height = 14
              Caption = 'Reason:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel9: TRzDBLabel
              Left = 136
              Top = 17
              Width = 62
              Height = 14
              AutoSize = True
              DataField = 'cancelled_date_f'
              DataSource = dmLoan.dscLoanCancel
            end
            object RzDBLabel10: TRzDBLabel
              Left = 96
              Top = 40
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'reason_name'
              DataSource = dmLoan.dscLoanCancel
            end
            object RzDBLabel11: TRzDBLabel
              Left = 96
              Top = 63
              Width = 481
              Height = 72
              WordWrap = True
              DataField = 'remarks'
              DataSource = dmLoan.dscLoanCancel
            end
            object pnlEditCancel: TRzPanel
              Left = 546
              Top = 471
              Width = 50
              Height = 22
              Anchors = [akRight, akBottom]
              BorderOuter = fsNone
              BorderColor = 14272955
              BorderWidth = 1
              Color = 15327448
              TabOrder = 0
              object btnEditCancel: TRzShapeButton
                Left = 0
                Top = 0
                Width = 50
                Height = 22
                Hint = 'Edit approval details'
                BorderStyle = bsNone
                Caption = 'Edit'
                ParentShowHint = False
                ShowHint = True
                OnClick = btnEditCancelClick
              end
            end
          end
        end
        object tsSummary: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Summary'
          object pnlSummary: TRzPanel
            Tag = -1
            Left = 0
            Top = 0
            Width = 603
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderSides = []
            BorderColor = 8675134
            BorderWidth = 1
            Color = 15327448
            TabOrder = 0
            object JvLabel1: TJvLabel
              Tag = -1
              Left = 19
              Top = 23
              Width = 59
              Height = 14
              Caption = 'Summary'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel47: TJvLabel
              Left = 19
              Top = 60
              Width = 86
              Height = 14
              Caption = 'Amortization:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel48: TJvLabel
              Left = 19
              Top = 85
              Width = 86
              Height = 14
              Caption = 'Loan balance:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel49: TJvLabel
              Left = 19
              Top = 110
              Width = 98
              Height = 14
              Caption = 'Interest deficit:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel50: TJvLabel
              Left = 19
              Top = 135
              Width = 99
              Height = 14
              Caption = 'Principal deficit:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel51: TJvLabel
              Left = 19
              Top = 161
              Width = 106
              Height = 14
              Caption = 'Last transaction:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel52: TJvLabel
              Left = 19
              Top = 186
              Width = 35
              Height = 14
              Caption = 'Days:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel53: TJvLabel
              Left = 19
              Top = 211
              Width = 154
              Height = 14
              Caption = 'Due as of payment date:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object JvLabel54: TJvLabel
              Left = 19
              Top = 237
              Width = 116
              Height = 14
              Caption = 'Total interest due:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -12
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
            end
            object RzDBLabel26: TRzDBLabel
              Left = 144
              Top = 60
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'amort_f'
              DataSource = dmLoan.dscLoan
            end
            object RzDBLabel27: TRzDBLabel
              Left = 144
              Top = 84
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'balance_f'
              DataSource = dmLoan.dscLoan
            end
            object RzDBLabel28: TRzDBLabel
              Left = 143
              Top = 110
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'int_deficit_f'
              DataSource = dmLoan.dscLoan
            end
            object RzDBLabel29: TRzDBLabel
              Left = 143
              Top = 135
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'prc_deficit_f'
              DataSource = dmLoan.dscLoan
            end
            object RzDBLabel30: TRzDBLabel
              Left = 143
              Top = 161
              Width = 69
              Height = 14
              AutoSize = True
              DataField = 'last_trans_date_f'
              DataSource = dmLoan.dscLoan
            end
          end
        end
        object tsClosed: TRzTabSheet
          Color = 15327448
          TabVisible = False
          Caption = 'Closed'
          object RzDBLabel22: TRzDBLabel
            Left = 96
            Top = 40
            Width = 69
            Height = 14
            AutoSize = True
            DataField = 'reason_name'
            DataSource = dmLoan.dscLoanClose
          end
          object RzDBLabel23: TRzDBLabel
            Left = 96
            Top = 63
            Width = 481
            Height = 72
            WordWrap = True
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanClose
          end
          object RzDBLabel24: TRzDBLabel
            Left = 120
            Top = 17
            Width = 69
            Height = 14
            AutoSize = True
            DataField = 'date_closed_f'
            DataSource = dmLoan.dscLoanClose
          end
          object JvLabel41: TJvLabel
            Tag = -1
            Left = 19
            Top = 17
            Width = 77
            Height = 14
            Caption = 'Date closed:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel43: TJvLabel
            Tag = -1
            Left = 19
            Top = 40
            Width = 51
            Height = 14
            Caption = 'Reason:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel44: TJvLabel
            Tag = -1
            Left = 19
            Top = 63
            Width = 58
            Height = 14
            Caption = 'Remarks:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
        end
      end
    end
  end
end
