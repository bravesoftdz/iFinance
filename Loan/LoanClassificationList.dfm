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
      Top = 231
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
      Height = 220
      Align = alTop
      DataSource = dmLoansAux.dscLoanClass
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'class_name'
          Title.Caption = 'Class name'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loan_name'
          Title.Caption = 'Loan type'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acct_name'
          Title.Caption = 'Acct. type'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loc_code'
          Title.Caption = 'Branch'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'int_rate_f'
          Title.Caption = 'Int %'
          Width = 35
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
          Title.Caption = 'CM'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'max_loan_f'
          Title.Caption = 'Max.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'comp_method'
          Title.Caption = 'Comp. method'
          Width = 115
          Visible = True
        end>
    end
    object pcDetail: TRzPageControl
      Left = 6
      Top = 262
      Width = 729
      Height = 253
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
        ExplicitHeight = 222
        DesignSize = (
          725
          230)
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
          Width = 78
          Height = 13
          Caption = 'Loan/acct. type'
          Transparent = True
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 143
          Width = 55
          Height = 13
          Caption = 'Interest %'
          Transparent = True
        end
        object JvLabel4: TJvLabel
          Left = 163
          Top = 143
          Width = 72
          Height = 13
          Caption = 'Term (months)'
          Transparent = True
        end
        object JvLabel5: TJvLabel
          Left = 19
          Top = 167
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
          Top = 119
          Width = 72
          Height = 13
          Caption = 'Comp. method'
          Transparent = True
        end
        object JvLabel8: TJvLabel
          Left = 163
          Top = 167
          Width = 69
          Height = 13
          Caption = 'Max. loanable'
          Transparent = True
        end
        object JvLabel9: TJvLabel
          Tag = -1
          Left = 19
          Top = 95
          Width = 35
          Height = 13
          Caption = 'Branch'
          Transparent = True
        end
        object JvGroupHeader4: TJvGroupHeader
          Tag = -1
          Left = 344
          Top = 17
          Width = 361
          Height = 12
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Charges'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9134911
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object JvLabel10: TJvLabel
          Left = 19
          Top = 191
          Width = 36
          Height = 13
          Caption = 'Validity'
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
        object dbluLoanType: TRzDBLookupComboBox
          Left = 105
          Top = 65
          Width = 104
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
          Top = 137
          Width = 63
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'term'
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object edComakers: TRzDBEdit
          Left = 105
          Top = 161
          Width = 40
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'comakers'
          CharCase = ecUpperCase
          TabOrder = 8
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
          Top = 113
          Width = 207
          Height = 21
          DataField = 'int_comp_method'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmAux.dscCompMethod
          TabOrder = 5
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object edInterest: TRzDBNumericEdit
          Left = 105
          Top = 137
          Width = 40
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'int_rate'
          Alignment = taLeftJustify
          TabOrder = 6
          IntegersOnly = False
          DisplayFormat = '0.00'
        end
        object edMaxLoan: TRzDBNumericEdit
          Left = 249
          Top = 161
          Width = 63
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'max_loan'
          Alignment = taLeftJustify
          TabOrder = 9
          DisplayFormat = '###,##0.00'
        end
        object dbluAcctType: TRzDBLookupComboBox
          Tag = 1
          Left = 213
          Top = 65
          Width = 99
          Height = 21
          DataField = 'acct_type'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'acct_type'
          ListField = 'acct_name'
          ListSource = dmAux.dscAcctType
          TabOrder = 3
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object grCharges: TRzDBGrid
          Tag = -1
          Left = 360
          Top = 32
          Width = 345
          Height = 126
          Anchors = [akLeft, akTop, akRight]
          DataSource = dmLoansAux.dscClassCharges
          Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 10
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grChargesDblClick
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'charge_name'
              Title.Caption = 'Type'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'charge_value_f'
              Title.Caption = 'Value'
              Width = 100
              Visible = True
            end>
        end
        object dbluBranch: TRzDBLookupComboBox
          Tag = 1
          Left = 105
          Top = 89
          Width = 207
          Height = 21
          DataField = 'acct_type'
          DataSource = dmLoansAux.dscLoanClass
          KeyField = 'acct_type'
          ListField = 'acct_name'
          ListSource = dmAux.dscAcctType
          TabOrder = 4
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object btnAddCharge: TRzButton
          Left = 360
          Top = 181
          Width = 97
          Hint = 'New identity document'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'Add charge'
          Enabled = False
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          TabStop = False
          OnClick = btnAddChargeClick
        end
        object btnRemoveCharge: TRzButton
          Left = 463
          Top = 181
          Width = 114
          Hint = 'Remove identity document'
          FrameColor = clBlack
          ShowFocusRect = False
          Caption = 'Remove charge'
          Enabled = False
          HotTrackColor = clMoneyGreen
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          TabStop = False
          OnClick = btnRemoveChargeClick
        end
        object dteFrom: TRzDBDateTimeEdit
          Left = 105
          Top = 185
          Width = 102
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'valid_from'
          TabOnEnter = True
          TabOrder = 11
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object dteUntil: TRzDBDateTimeEdit
          Left = 210
          Top = 185
          Width = 102
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'valid_until'
          TabOnEnter = True
          TabOrder = 12
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
      end
    end
    object btnNew: TRzButton
      Left = 6
      Top = 231
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
