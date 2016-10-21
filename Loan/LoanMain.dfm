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
      Left = 36
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
      Left = 36
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
      FrameColor = clBlack
      FrameHotColor = clBlack
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Tag = 5
      Left = 477
      Top = 34
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      Enabled = False
      TabOrder = 11
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Tag = 5
      Left = 477
      Top = 58
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appv'
      Alignment = taLeftJustify
      Enabled = False
      TabOrder = 12
      DisplayFormat = '###,##0.00'
    end
    object RzDBEdit1: TRzDBEdit
      Tag = 5
      Left = 477
      Top = 82
      Width = 39
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'int'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 13
    end
    object RzDBEdit2: TRzDBEdit
      Tag = 5
      Left = 477
      Top = 106
      Width = 39
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'terms'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 14
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
      Enabled = False
      TabOrder = 5
      DisplayFormat = '###,##0.00'
    end
    object RzDBNumericEdit2: TRzDBNumericEdit
      Tag = 7
      Left = 477
      Top = 178
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_rel'
      Alignment = taLeftJustify
      Enabled = False
      TabOrder = 17
      DisplayFormat = '###,##0.00'
    end
    object RzDBDateTimeEdit2: TRzDBDateTimeEdit
      Tag = 7
      Left = 477
      Top = 154
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_rel'
      Enabled = False
      TabOrder = 16
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
      TabOrder = 10
      OnClick = cbxApprovedClick
    end
    object cbxReleased: TRzCheckBox
      Tag = 6
      Left = 363
      Top = 137
      Width = 19
      Height = 15
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbUnchecked
      TabOrder = 15
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
    object lbxComaker: TRzDBListBox
      Left = 36
      Top = 278
      Width = 285
      Height = 35
      BorderStyle = bsNone
      Color = clMenu
      ItemHeight = 13
      TabOrder = 18
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
      FrameColor = clBlack
      FrameHotColor = clBlack
    end
  end
end
