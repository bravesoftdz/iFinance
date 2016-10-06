inherited frmLoanClassList: TfrmLoanClassList
  Caption = 'frmLoanClassList'
  ClientHeight = 515
  ClientWidth = 755
  OnCreate = FormCreate
  ExplicitWidth = 771
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 755
    ExplicitWidth = 755
    inherited lblTitle: TRzLabel
      Width = 133
      Caption = 'Loan classification list'
      ExplicitWidth = 133
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 28
    Width = 755
    Height = 487
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    DesignSize = (
      755
      487)
    object urlLoanClassList: TRzURLLabel
      Left = 711
      Top = 239
      Width = 38
      Height = 13
      Hint = 'Refresh loan class list'
      Anchors = [akTop, akRight]
      Caption = 'Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = urlLoanClassListClick
    end
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 743
      Height = 228
      Align = alTop
      DataSource = dmLoansAux.dscLoanClass
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AltRowShading = True
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'class_name'
          Title.Caption = 'Class name'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loan_name'
          Title.Caption = 'Type'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'int_rate'
          Title.Caption = 'Interest'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'term'
          Title.Caption = 'Term'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valid_from'
          Title.Caption = 'Valid from'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valid_until'
          Title.Caption = 'Valid until'
          Width = 65
          Visible = True
        end>
    end
    object pcDetail: TRzPageControl
      Left = 6
      Top = 270
      Width = 745
      Height = 211
      Hint = ''
      ActivePage = tsDetail
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseColoredTabs = True
      TabIndex = 0
      TabOrder = 1
      FixedDimension = 19
      object tsDetail: TRzTabSheet
        Color = 15263976
        Caption = 'Loan classification details'
        DesignSize = (
          741
          188)
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 56
          Height = 13
          Caption = 'Class name'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 47
          Width = 26
          Height = 13
          Caption = 'Type'
          Transparent = True
        end
        object urlCopyAddress: TRzURLLabel
          Left = 318
          Top = 164
          Width = 55
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Add groups'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          ExplicitTop = 125
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 71
          Width = 64
          Height = 13
          Caption = 'Interest rate'
          Transparent = True
        end
        object JvLabel4: TJvLabel
          Left = 19
          Top = 95
          Width = 26
          Height = 13
          Caption = 'Term'
          Transparent = True
        end
        object JvLabel5: TJvLabel
          Left = 19
          Top = 119
          Width = 49
          Height = 13
          Caption = 'Valid from'
          Transparent = True
        end
        object JvLabel6: TJvLabel
          Left = 19
          Top = 143
          Width = 47
          Height = 13
          Caption = 'Valid until'
          Transparent = True
        end
        object RzURLLabel1: TRzURLLabel
          Left = 519
          Top = 164
          Width = 66
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Add branches'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object JvLabel7: TJvLabel
          Left = 159
          Top = 71
          Width = 13
          Height = 13
          Caption = '%'
          Transparent = True
        end
        object edClassName: TRzDBEdit
          Left = 105
          Top = 17
          Width = 207
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'class_name'
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object dbluType: TRzDBLookupComboBox
          Left = 105
          Top = 41
          Width = 207
          Height = 21
          DataField = 'loan_type'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'loan_type'
          ListField = 'loan_name'
          ListSource = dmLoansAux.dscLoanType
          TabOrder = 1
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object lbxGroups: TRzListBox
          Left = 318
          Top = 17
          Width = 195
          Height = 143
          Anchors = [akLeft, akTop, akBottom]
          ItemHeight = 13
          TabOrder = 2
        end
        object edInterest: TRzDBEdit
          Left = 105
          Top = 65
          Width = 48
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'int_rate'
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object edTerm: TRzDBEdit
          Left = 105
          Top = 89
          Width = 48
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'term'
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object dteValidFrom: TRzDBDateTimeEdit
          Left = 105
          Top = 113
          Width = 96
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'valid_from'
          TabOrder = 5
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object RzDBDateTimeEdit2: TRzDBDateTimeEdit
          Left = 105
          Top = 137
          Width = 96
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'valid_until'
          TabOrder = 6
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object lbxBranches: TRzListBox
          Left = 519
          Top = 17
          Width = 195
          Height = 143
          Anchors = [akLeft, akTop, akBottom]
          ItemHeight = 13
          TabOrder = 7
        end
      end
    end
    object btnNew: TRzButton
      Left = 6
      Top = 239
      Width = 179
      Hint = 'New'
      Caption = 'New loan classification'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnNewClick
    end
  end
end
