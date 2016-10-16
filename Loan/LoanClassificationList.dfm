inherited frmLoanClassificationList: TfrmLoanClassificationList
  Caption = 'frmLoanClassificationList'
  ClientHeight = 549
  ClientWidth = 739
  OnCreate = FormCreate
  ExplicitWidth = 755
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 739
    ExplicitWidth = 739
    inherited lblTitle: TRzLabel
      Width = 133
      Caption = 'Loan classification list'
      ExplicitWidth = 133
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 28
    Width = 739
    Height = 521
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    DesignSize = (
      739
      521)
    object urlRefreshList: TRzURLLabel
      Left = 695
      Top = 239
      Width = 38
      Height = 13
      Hint = 'Refresh identity document list'
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
      OnClick = urlRefreshListClick
    end
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 727
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
          FieldName = 'grp_name'
          Title.Caption = 'Group'
          Width = 120
          Visible = True
        end
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
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'int_rate'
          Title.Caption = 'Interest %'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'term'
          Title.Caption = 'Term'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'comakers'
          Title.Caption = 'Comakers'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'max_loan'
          Title.Caption = 'Max. loanable'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'comp_method'
          Title.Caption = 'Computation method'
          Width = 120
          Visible = True
        end>
    end
    object pcDetail: TRzPageControl
      Left = 6
      Top = 270
      Width = 729
      Height = 245
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
          725
          222)
        object JvLabel1: TJvLabel
          Left = 19
          Top = 47
          Width = 56
          Height = 13
          Caption = 'Class name'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 71
          Width = 26
          Height = 13
          Caption = 'Type'
          Transparent = True
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 95
          Width = 55
          Height = 13
          Caption = 'Interest %'
          Transparent = True
        end
        object JvLabel4: TJvLabel
          Left = 163
          Top = 95
          Width = 72
          Height = 13
          Caption = 'Term (months)'
          Transparent = True
        end
        object JvLabel5: TJvLabel
          Left = 19
          Top = 119
          Width = 49
          Height = 13
          Caption = 'Comakers'
          Transparent = True
        end
        object JvLabel6: TJvLabel
          Left = 19
          Top = 23
          Width = 31
          Height = 13
          Caption = 'Group'
          Transparent = True
        end
        object JvLabel7: TJvLabel
          Left = 19
          Top = 143
          Width = 72
          Height = 13
          Caption = 'Comp. method'
          Transparent = True
        end
        object JvLabel8: TJvLabel
          Left = 163
          Top = 119
          Width = 69
          Height = 13
          Caption = 'Max. loanable'
          Transparent = True
        end
        object edClassName: TRzDBEdit
          Left = 105
          Top = 41
          Width = 207
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'class_name'
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object dbluType: TRzDBLookupComboBox
          Left = 105
          Top = 65
          Width = 207
          Height = 21
          DataField = 'loan_type'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'loan_type'
          ListField = 'loan_name'
          ListSource = dmAux.dscLoanType
          TabOrder = 2
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object edTerm: TRzDBEdit
          Left = 249
          Top = 89
          Width = 63
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'term'
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object edComakers: TRzDBEdit
          Left = 105
          Top = 113
          Width = 40
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'comakers'
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object dbluGroup: TRzDBLookupComboBox
          Left = 105
          Top = 17
          Width = 207
          Height = 21
          DataField = 'grp_id'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'grp_id'
          ListField = 'grp_name'
          ListSource = dmAux.dscGroups
          TabOrder = 0
          OnClick = dbluGroupClick
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object dbluCompMethod: TRzDBLookupComboBox
          Left = 105
          Top = 137
          Width = 207
          Height = 21
          DataField = 'int_comp_method'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmAux.dscCompMethod
          TabOrder = 7
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object lbxLocations: TRzListBox
          Left = 328
          Top = 17
          Width = 385
          Height = 193
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = 3
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 8
        end
        object edInterest: TRzDBNumericEdit
          Left = 105
          Top = 89
          Width = 40
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'int_rate'
          Alignment = taLeftJustify
          TabOrder = 3
          DisplayFormat = '0.00'
        end
        object edMaxLoan: TRzDBNumericEdit
          Left = 249
          Top = 113
          Width = 63
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'max_loan'
          Alignment = taLeftJustify
          TabOrder = 6
          DisplayFormat = '###,##0.00'
        end
      end
    end
    object btnNew: TRzButton
      Left = 6
      Top = 239
      Width = 171
      Hint = 'New'
      Caption = 'New loan classification'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnNewClick
    end
  end
end
