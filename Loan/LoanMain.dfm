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
    object JvGroupHeader1: TJvGroupHeader
      Tag = 1
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
      Tag = 1
      Left = 35
      Top = 40
      Width = 29
      Height = 13
      Caption = 'Client'
      Transparent = True
    end
    object JvLabel7: TJvLabel
      Tag = 1
      Left = 35
      Top = 64
      Width = 62
      Height = 13
      Caption = 'Date applied'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Tag = 1
      Left = 35
      Top = 88
      Width = 39
      Height = 13
      Caption = 'Amount'
      Transparent = True
    end
    object JvLabel5: TJvLabel
      Tag = 1
      Left = 35
      Top = 112
      Width = 63
      Height = 13
      Caption = 'Desired term'
      Transparent = True
    end
    object JvLabel6: TJvLabel
      Tag = 1
      Left = 35
      Top = 136
      Width = 41
      Height = 13
      Caption = 'Purpose'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Tag = 1
      Left = 36
      Top = 160
      Width = 51
      Height = 13
      Caption = 'Loan class'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Tag = 1
      Left = 36
      Top = 184
      Width = 33
      Height = 13
      Caption = 'Status'
      Transparent = True
    end
    object JvGroupHeader2: TJvGroupHeader
      Left = 19
      Top = 206
      Width = 302
      Height = 12
      Caption = 'Approval details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Left = 35
      Top = 226
      Width = 74
      Height = 13
      Caption = 'Date approved'
      Transparent = True
    end
    object JvLabel9: TJvLabel
      Left = 35
      Top = 250
      Width = 39
      Height = 13
      Caption = 'Amount'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Left = 35
      Top = 274
      Width = 55
      Height = 13
      Caption = 'Interest %'
      Transparent = True
    end
    object JvLabel11: TJvLabel
      Left = 35
      Top = 298
      Width = 26
      Height = 13
      Caption = 'Term'
      Transparent = True
    end
    object JvGroupHeader3: TJvGroupHeader
      Tag = 1
      Left = 363
      Top = 20
      Width = 302
      Height = 12
      Caption = 'Client details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dteDateApplied: TRzDBDateTimeEdit
      Tag = 1
      Left = 114
      Top = 58
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appl'
      Enabled = False
      TabOrder = 1
      EditType = etDate
    end
    object edAppAmount: TRzDBNumericEdit
      Tag = 1
      Left = 114
      Top = 82
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appl'
      Alignment = taLeftJustify
      Enabled = False
      TabOrder = 2
      DisplayFormat = '###,##0.00'
    end
    object edDesiredTerm: TRzDBEdit
      Tag = 1
      Left = 114
      Top = 106
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'des_term'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
    end
    object edPurpose: TRzDBEdit
      Tag = 1
      Left = 114
      Top = 130
      Width = 207
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'purpose'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 4
    end
    object bteClient: TRzButtonEdit
      Tag = 1
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
      AltBtnHint = 'Clear referee'
      ButtonHint = 'Find referee'
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
      Top = 154
      Width = 207
      Height = 21
      DataField = 'class_id'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'class_id'
      ListField = 'class_name'
      ListSource = dmLoan.dscLoanClass
      TabOrder = 5
      AllowNull = True
      FrameColor = clBlack
      FrameHotColor = clBlack
    end
    object dbluLoanStatus: TRzDBLookupComboBox
      Tag = 1
      Left = 114
      Top = 178
      Width = 207
      Height = 21
      DataField = 'status_id'
      DataSource = dmLoan.dscLoan
      Enabled = False
      KeyField = 'status_id'
      ListField = 'status_name'
      ListSource = dmLoan.dscLoanStatus
      TabOrder = 6
      AllowNull = True
      FrameColor = clBlack
      FrameHotColor = clBlack
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Tag = 2
      Left = 114
      Top = 220
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'date_appv'
      Enabled = False
      TabOrder = 7
      EditType = etDate
    end
    object RzDBNumericEdit1: TRzDBNumericEdit
      Tag = 2
      Left = 114
      Top = 244
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'amt_appv'
      Alignment = taLeftJustify
      Enabled = False
      TabOrder = 8
      DisplayFormat = '0.00'
    end
    object RzDBEdit1: TRzDBEdit
      Tag = 2
      Left = 114
      Top = 268
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'int'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 9
    end
    object RzDBEdit2: TRzDBEdit
      Tag = 2
      Left = 114
      Top = 292
      Width = 95
      Height = 21
      DataSource = dmLoan.dscLoan
      DataField = 'terms'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 10
    end
  end
end
