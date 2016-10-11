inherited frmLoanClassificationList: TfrmLoanClassificationList
  Caption = 'frmLoanClassificationList'
  ClientHeight = 512
  ClientWidth = 739
  OnCreate = FormCreate
  ExplicitWidth = 755
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 739
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
    Height = 484
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    ExplicitLeft = -218
    ExplicitTop = -206
    ExplicitWidth = 745
    ExplicitHeight = 448
    DesignSize = (
      739
      484)
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
          FieldName = 'class_name'
          Title.Caption = 'Class name'
          Width = 250
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
        end>
    end
    object pcDetail: TRzPageControl
      Left = 6
      Top = 270
      Width = 729
      Height = 208
      Hint = ''
      ActivePage = tsDetail
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseColoredTabs = True
      TabIndex = 0
      TabOrder = 1
      ExplicitWidth = 735
      ExplicitHeight = 172
      FixedDimension = 19
      object tsDetail: TRzTabSheet
        Color = 15263976
        Caption = 'Group details'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          725
          185)
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
        object JvLabel3: TJvLabel
          Left = 19
          Top = 71
          Width = 55
          Height = 13
          Caption = 'Interest %'
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
          Caption = 'Comakers'
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
        object edInterest: TRzDBEdit
          Left = 105
          Top = 65
          Width = 65
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'int_rate'
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edTerm: TRzDBEdit
          Left = 105
          Top = 89
          Width = 65
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'term'
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object edComakers: TRzDBEdit
          Left = 105
          Top = 113
          Width = 65
          Height = 21
          DataSource = dmLoansAux.dscLoanClass
          DataField = 'comakers'
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object RzPageControl1: TRzPageControl
          Left = 328
          Top = 17
          Width = 388
          Height = 159
          Hint = ''
          ActivePage = tsGroups
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowShadow = False
          TabIndex = 0
          TabOrder = 5
          ExplicitWidth = 384
          ExplicitHeight = 150
          FixedDimension = 19
          object tsGroups: TRzTabSheet
            Color = 15263976
            Caption = 'Groups'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            DesignSize = (
              386
              138)
            object urlClassGroup: TRzURLLabel
              Left = 15
              Top = 119
              Width = 101
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Add / remove groups'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = urlClassGroupClick
            end
            object grGroups: TRzDBGrid
              Left = 15
              Top = 10
              Width = 353
              Height = 103
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dmLoansAux.dscLoanClassGroups
              Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AltRowShadingColor = 15854564
              Columns = <
                item
                  Expanded = False
                  FieldName = 'grp_name'
                  Title.Caption = 'Comakers'
                  Width = 200
                  Visible = True
                end>
            end
          end
          object tsBranches: TRzTabSheet
            Color = 15263976
            Caption = 'Branches'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
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
