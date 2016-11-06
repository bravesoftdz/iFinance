inherited frmLoanMain: TfrmLoanMain
  Caption = 'frmLoanMain'
  ClientHeight = 482
  ClientWidth = 865
  OnCreate = FormCreate
  ExplicitWidth = 881
  ExplicitHeight = 521
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
    Height = 454
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    DesignSize = (
      865
      454)
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
      Width = 65
      Height = 13
      Caption = 'Date/amount'
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
      Left = 35
      Top = 182
      Width = 286
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
      Left = 35
      Top = 202
      Width = 65
      Height = 13
      Caption = 'Date/amount'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Tag = -1
      Left = 35
      Top = 226
      Width = 61
      Height = 13
      Caption = 'Int(%)/term'
      Transparent = True
    end
    object JvLabel12: TJvLabel
      Tag = -1
      Left = 35
      Top = 136
      Width = 61
      Height = 13
      Caption = 'Int(%)/term'
      Transparent = True
    end
    object JvGroupHeader3: TJvGroupHeader
      Tag = -1
      Left = 35
      Top = 272
      Width = 286
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
      Left = 35
      Top = 292
      Width = 65
      Height = 13
      Caption = 'Date/amount'
      Transparent = True
    end
    object JvGroupHeader4: TJvGroupHeader
      Tag = -1
      Left = 344
      Top = 20
      Width = 241
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
    object lblComakersRequired: TJvLabel
      Tag = -1
      Left = 360
      Top = 181
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      Visible = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
    end
    object JvLabel16: TJvLabel
      Tag = -1
      Left = 35
      Top = 250
      Width = 38
      Height = 13
      Caption = 'Method'
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
      TabOnEnter = True
      TabOrder = 2
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object edAppAmount: TRzDBNumericEdit
      Tag = 1
      Left = 213
      Top = 106
      Width = 108
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appl'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
    end
    object edPurpose: TRzDBEdit
      Tag = 1
      Left = 114
      Top = 154
      Width = 207
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'purpose'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 6
    end
    object bteClient: TRzButtonEdit
      Left = 114
      Top = 34
      Width = 207
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
      TabOnEnter = True
    end
    object dteDateApproved: TRzDBDateTimeEdit
      Tag = 5
      Left = 114
      Top = 196
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 8
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object edAppvAmount: TRzDBNumericEdit
      Tag = 5
      Left = 213
      Top = 196
      Width = 108
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appv'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 9
      DisplayFormat = '###,##0.00'
    end
    object edInterest: TRzDBNumericEdit
      Tag = -1
      Left = 114
      Top = 130
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoanClass
      DataField = 'int_rate'
      ReadOnly = True
      Alignment = taLeftJustify
      Color = clInfoBk
      DisabledColor = clWhite
      TabOnEnter = True
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = '###,##0.00'
    end
    object edRelAmount: TRzDBNumericEdit
      Tag = 7
      Left = 213
      Top = 286
      Width = 108
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_rel'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 15
      DisplayFormat = '###,##0.00'
    end
    object dteDateReleased: TRzDBDateTimeEdit
      Tag = 7
      Left = 114
      Top = 286
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_rel'
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 14
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object cbxApproved: TRzCheckBox
      Tag = 4
      Left = 16
      Top = 179
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
      TabOrder = 7
      OnClick = cbxApprovedClick
    end
    object cbxReleased: TRzCheckBox
      Tag = 6
      Left = 16
      Top = 269
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
      TabOrder = 13
      OnClick = cbxReleasedClick
    end
    object cbxCancelled: TRzCheckBox
      Tag = 2
      Left = 16
      Top = 323
      Width = 65
      Height = 15
      Caption = 'Cancelled'
      Enabled = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 16
      OnClick = cbxCancelledClick
    end
    object cbxDenied: TRzCheckBox
      Tag = 3
      Left = 16
      Top = 344
      Width = 52
      Height = 15
      Caption = 'Denied'
      Enabled = False
      State = cbUnchecked
      TabOnEnter = True
      TabOrder = 17
      OnClick = cbxDeniedClick
    end
    object btnAddComaker: TRzButton
      Tag = 8
      Left = 360
      Top = 214
      Caption = 'Add comaker'
      Enabled = False
      TabOrder = 19
      OnClick = btnAddComakerClick
    end
    object btnRemoveComaker: TRzButton
      Tag = 8
      Left = 441
      Top = 214
      Width = 109
      Caption = 'Remove comaker'
      Enabled = False
      TabOrder = 20
      OnClick = btnRemoveComakerClick
    end
    object grComakers: TRzDBGrid
      Tag = -1
      Left = 360
      Top = 34
      Width = 225
      Height = 141
      DataSource = dmLoan.dscLoanComaker
      Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 18
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grComakersDblClick
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
    object pnlAlerts: TRzPanel
      Tag = -1
      Left = 603
      Top = 20
      Width = 251
      Height = 421
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = clRed
      BorderWidth = 1
      Color = 13027071
      TabOrder = 21
      Visible = False
      VisualStyle = vsClassic
      DesignSize = (
        251
        421)
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
        Width = 219
        Height = 377
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
      Left = 114
      Top = 244
      Width = 207
      Height = 21
      DataField = 'appv_method'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'value'
      ListField = 'display'
      ListSource = dmLoan.dscAppvMethod
      TabOrder = 12
      DisabledColor = clWhite
      FrameColor = clBlack
      FrameHotColor = clBlack
      TabOnEnter = True
    end
    object edDesiredTerm: TRzDBNumericEdit
      Tag = 1
      Left = 213
      Top = 130
      Width = 108
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
    object edAppvInterest: TRzDBNumericEdit
      Tag = 5
      Left = 114
      Top = 220
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'int'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 10
      IntegersOnly = False
      DisplayFormat = '###,##0.00'
    end
    object edAppvTerm: TRzDBNumericEdit
      Tag = 5
      Left = 213
      Top = 220
      Width = 108
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'terms'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      Enabled = False
      TabOnEnter = True
      TabOrder = 11
      DisplayFormat = '0'
    end
  end
end
