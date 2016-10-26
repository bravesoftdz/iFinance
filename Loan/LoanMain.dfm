inherited frmLoanMain: TfrmLoanMain
  Caption = 'frmLoanMain'
  ClientHeight = 445
  ClientWidth = 865
  OnCreate = FormCreate
  ExplicitWidth = 881
  ExplicitHeight = 484
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
    Height = 417
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    ExplicitTop = 27
    DesignSize = (
      865
      417)
    object JvGroupHeader1: TJvGroupHeader
      Tag = -1
      Left = 19
      Top = 20
      Width = 302
      Height = 12
      Caption = 'Application details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
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
    object JvLabel7: TJvLabel
      Tag = -1
      Left = 35
      Top = 112
      Width = 62
      Height = 13
      Caption = 'Date applied'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Tag = -1
      Left = 35
      Top = 136
      Width = 39
      Height = 13
      Caption = 'Amount'
      Transparent = True
    end
    object JvLabel5: TJvLabel
      Tag = -1
      Left = 35
      Top = 184
      Width = 63
      Height = 13
      Caption = 'Desired term'
      Transparent = True
    end
    object JvLabel6: TJvLabel
      Tag = -1
      Left = 35
      Top = 208
      Width = 41
      Height = 13
      Caption = 'Purpose'
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
    object JvGroupHeader2: TJvGroupHeader
      Tag = -1
      Left = 382
      Top = 20
      Width = 190
      Height = 12
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
      Left = 398
      Top = 40
      Width = 74
      Height = 13
      Caption = 'Date approved'
      Transparent = True
    end
    object JvLabel9: TJvLabel
      Tag = -1
      Left = 398
      Top = 64
      Width = 39
      Height = 13
      Caption = 'Amount'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Tag = -1
      Left = 398
      Top = 88
      Width = 55
      Height = 13
      Caption = 'Interest %'
      Transparent = True
    end
    object JvLabel11: TJvLabel
      Tag = -1
      Left = 398
      Top = 112
      Width = 26
      Height = 13
      Caption = 'Term'
      Transparent = True
    end
    object JvLabel12: TJvLabel
      Tag = -1
      Left = 35
      Top = 160
      Width = 55
      Height = 13
      Caption = 'Interest %'
      Transparent = True
    end
    object JvGroupHeader3: TJvGroupHeader
      Tag = -1
      Left = 382
      Top = 140
      Width = 190
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
      Left = 398
      Top = 160
      Width = 69
      Height = 13
      Caption = 'Date released'
      Transparent = True
    end
    object JvLabel14: TJvLabel
      Tag = -1
      Left = 398
      Top = 184
      Width = 39
      Height = 13
      Caption = 'Amount'
      Transparent = True
    end
    object JvGroupHeader4: TJvGroupHeader
      Tag = -1
      Left = 19
      Top = 260
      Width = 302
      Height = 12
      Caption = 'Comakers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Tag = -1
      Left = 35
      Top = 88
      Width = 52
      Height = 13
      Caption = 'Acct. type'
      Transparent = True
    end
    object dteDateApplied: TRzDBDateTimeEdit
      Tag = 1
      Left = 114
      Top = 106
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appl'
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 3
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object edAppAmount: TRzDBNumericEdit
      Tag = 1
      Left = 114
      Top = 130
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appl'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 4
      DisplayFormat = '###,##0.00'
    end
    object edDesiredTerm: TRzDBEdit
      Tag = 1
      Left = 114
      Top = 178
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'des_term'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 6
    end
    object edPurpose: TRzDBEdit
      Tag = 1
      Left = 114
      Top = 202
      Width = 207
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'purpose'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 7
    end
    object bteClient: TRzButtonEdit
      Left = 114
      Top = 34
      Width = 207
      Height = 21
      Text = ''
      Color = clInfoBk
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
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
    object dbluLoanClass: TRzDBLookupComboBox
      Tag = 1
      Left = 114
      Top = 58
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
    end
    object dteDateApproved: TRzDBDateTimeEdit
      Tag = 5
      Left = 477
      Top = 34
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 14
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object edAppvAmount: TRzDBNumericEdit
      Tag = 5
      Left = 477
      Top = 58
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appv'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 15
      DisplayFormat = '###,##0.00'
    end
    object edAppvInterest: TRzDBEdit
      Tag = 5
      Left = 477
      Top = 82
      Width = 39
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'int'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 16
    end
    object edAppvTerm: TRzDBEdit
      Tag = 5
      Left = 477
      Top = 106
      Width = 39
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'terms'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 17
    end
    object edInterest: TRzDBNumericEdit
      Tag = 1
      Left = 114
      Top = 154
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoanClass
      DataField = 'int_rate'
      ReadOnly = True
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 5
      DisplayFormat = '###,##0.00'
    end
    object edRelAmount: TRzDBNumericEdit
      Tag = 7
      Left = 477
      Top = 178
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_rel'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 20
      DisplayFormat = '###,##0.00'
    end
    object dteDateReleased: TRzDBDateTimeEdit
      Tag = 7
      Left = 477
      Top = 154
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_rel'
      DisabledColor = clWhite
      Enabled = False
      TabOrder = 19
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object cbxApproved: TRzCheckBox
      Tag = 4
      Left = 363
      Top = 17
      Width = 19
      Height = 15
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      State = cbUnchecked
      TabOrder = 13
      OnClick = cbxApprovedClick
    end
    object cbxReleased: TRzCheckBox
      Tag = 6
      Left = 363
      Top = 137
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
      TabOrder = 18
      OnClick = cbxReleasedClick
    end
    object cbxCancelled: TRzCheckBox
      Tag = 2
      Left = 114
      Top = 229
      Width = 65
      Height = 15
      Caption = 'Cancelled'
      Enabled = False
      State = cbUnchecked
      TabOrder = 8
      OnClick = cbxCancelledClick
    end
    object cbxDenied: TRzCheckBox
      Tag = 3
      Left = 218
      Top = 229
      Width = 52
      Height = 15
      Caption = 'Denied'
      Enabled = False
      State = cbUnchecked
      TabOrder = 9
      OnClick = cbxDeniedClick
    end
    object dbluAcctType: TRzDBLookupComboBox
      Tag = 1
      Left = 114
      Top = 82
      Width = 207
      Height = 21
      DataField = 'acct_type'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'acct_type'
      ListField = 'acct_name'
      ListSource = dmLoan.dscAcctType
      TabOrder = 2
      DisabledColor = clWhite
      FrameColor = clBlack
      FrameHotColor = clBlack
    end
    object btnAddComaker: TRzButton
      Tag = 1
      Left = 35
      Top = 343
      Caption = 'Add comaker'
      Enabled = False
      TabOrder = 11
      OnClick = btnAddComakerClick
    end
    object btnRemoveComaker: TRzButton
      Tag = 1
      Left = 116
      Top = 343
      Width = 109
      Caption = 'Remove comaker'
      Enabled = False
      TabOrder = 12
      OnClick = btnRemoveComakerClick
    end
    object grComakers: TRzDBGrid
      Tag = -1
      Left = 35
      Top = 274
      Width = 286
      Height = 63
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
          Width = 250
          Visible = True
        end>
    end
    object RzPanel1: TRzPanel
      Tag = -1
      Left = 616
      Top = 22
      Width = 225
      Height = 135
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsFlat
      TabOrder = 21
      DesignSize = (
        225
        135)
      object RzPanel2: TRzPanel
        Tag = -1
        Left = 1
        Top = 1
        Width = 223
        Height = 21
        Align = alTop
        BorderOuter = fsNone
        BorderWidth = 1
        GradientColorStyle = gcsCustom
        GradientColorStart = 2829311
        GradientColorStop = 5329407
        GradientDirection = gdVerticalEnd
        TabOrder = 0
        VisualStyle = vsGradient
        DesignSize = (
          223
          21)
        object imgClose: TImage
          Left = 336
          Top = 2
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C000001C34944415478DAA5923D484251
            14C7CF4D7D5A3E230C5B32228508D7E762542E61E110CE4ED112B436B7B534B8
            34083534044A3889D15048145406D5180E81499A3E233FFAF0EB3DD1CE7BF7D5
            12E58B0EFC2FE7DE77CFEF9C77F9934EA703FF09B2272D002C6A19D33994B94B
            4D0975886DB750EF32006375D4E1589970B9AC4C5F1FF353A534AD50AB09C944
            229B49268378142021FAED686E71D15D17450654841640380E854E31F5905D7A
            763DBFB4C4158B4555FF6D341AE1241CBEC1D4497614C0ACDFCFF13CAF0AC0B2
            2C5CC66214B0AD00667C3E2E9FCF7F5D1245116AD5AA2C4110A0D56AD1F1B55A
            B0582CF0787B4B01410530E5F572854201A6CFCF2197CB41A552018D46238F2B
            756418FA3CFB763B1871FF94C950C0E627C0E3E1F2E9340C472272379D4EF7AD
            588A380218BD1E1E789E02020A60D2E9E48AA914BC7731168BEAC1C992CFCF14
            B0A100DC361B572B97553D22100257A51205AC2B00AFD5CA09F8606A235E2E53
            C01ADD1F2D0C0DB9199546AAB7DBC2C1CB0B35D208AE3EB4F2B8C1B0E23218AC
            26427E85BC61F145A391BD6B368351C9CA7866EE07189B42CE20800BF7035D06
            A8A05F136700D157807B09D08B32816CF13F85E4ACB70FF592AC54D3E6BCFB00
            00000049454E44AE426082}
        end
        object lblCaption: TRzLabel
          Left = 25
          Top = 4
          Width = 34
          Height = 13
          Caption = 'Alerts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Image1: TImage
          Left = 7
          Top = 2
          Width = 16
          Height = 16
          DragCursor = crHandPoint
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
        end
      end
      object mmAlerts: TRzMemo
        Left = 4
        Top = 24
        Width = 217
        Height = 107
        Anchors = [akLeft, akTop, akRight]
        BorderStyle = bsNone
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ReadOnlyColor = clMenu
      end
    end
  end
end
