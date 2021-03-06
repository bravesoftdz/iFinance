inherited frmLoanAssessmentDetail: TfrmLoanAssessmentDetail
  Caption = 'frmLoanAssessmentDetail'
  ClientHeight = 393
  ClientWidth = 699
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 699
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 699
    ExplicitWidth = 699
    inherited imgClose: TImage
      Left = 678
      ExplicitLeft = 420
    end
    inherited lblCaption: TRzLabel
      Width = 98
      Caption = 'Loan assessment'
      ExplicitWidth = 98
    end
  end
  inherited pnlMain: TRzPanel
    Width = 699
    Height = 372
    ExplicitWidth = 699
    ExplicitHeight = 360
    inherited pnlDetail: TRzPanel
      Width = 682
      Height = 322
      ExplicitWidth = 682
      ExplicitHeight = 310
      inherited pcDetail: TRzPageControl
        Width = 680
        Height = 320
        ExplicitWidth = 680
        ExplicitHeight = 308
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 680
          ExplicitHeight = 308
          object JvLabel4: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 79
            Height = 14
            Caption = 'Date assessed'
            Transparent = True
          end
          object JvLabel11: TJvLabel
            Tag = -1
            Left = 19
            Top = 77
            Width = 72
            Height = 14
            Caption = 'Rec. amount'
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 241
            Top = 50
            Width = 100
            Height = 14
            Caption = 'Applied amount'
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
          object urlAppliedAmount: TRzURLLabel
            Tag = 1
            Left = 241
            Top = 77
            Width = 25
            Height = 14
            Caption = '0.00'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlAppliedAmountClick
          end
          object JvLabel2: TJvLabel
            Tag = -1
            Left = 366
            Top = 23
            Width = 47
            Height = 14
            Caption = 'Capacity'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Tag = -1
            Left = 366
            Top = 71
            Width = 54
            Height = 14
            Caption = 'Character'
            Transparent = True
          end
          object JvLabel5: TJvLabel
            Tag = -1
            Left = 366
            Top = 119
            Width = 37
            Height = 14
            Caption = 'Capital'
            Transparent = True
          end
          object JvLabel6: TJvLabel
            Tag = -1
            Left = 366
            Top = 167
            Width = 58
            Height = 14
            Caption = 'Conditions'
            Transparent = True
          end
          object JvLabel7: TJvLabel
            Tag = -1
            Left = 366
            Top = 215
            Width = 50
            Height = 14
            Caption = 'Collateral'
            Transparent = True
          end
          object JvLabel8: TJvLabel
            Tag = -1
            Left = 366
            Top = 263
            Width = 49
            Height = 14
            Caption = 'Comaker'
            Transparent = True
          end
          object JvLabel9: TJvLabel
            Tag = -1
            Left = 19
            Top = 50
            Width = 97
            Height = 14
            Caption = 'Recommendation'
            Transparent = True
          end
          object dteDateAssessed: TRzDBDateTimeEdit
            Tag = 3
            Left = 120
            Top = 17
            Width = 97
            Height = 22
            DataSource = dmLoan.dscLoanAss
            DataField = 'date_ass'
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            EditType = etDate
            Format = 'mm/dd/yyyy'
            PopupButtonColor = 14273211
            FlatButtons = True
          end
          object edRecAmount: TRzDBNumericEdit
            Tag = 3
            Left = 120
            Top = 71
            Width = 97
            Height = 22
            DataSource = dmLoan.dscLoanAss
            DataField = 'rec_amt'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object pcAssessment: TRzPageControl
            Tag = 3
            Left = 20
            Top = 110
            Width = 325
            Height = 157
            Hint = ''
            ActivePage = tsFinInfo
            ActivePageDefault = tsFinInfo
            ButtonColor = 14273211
            Color = 15327448
            FlatColor = 14272955
            ParentColor = False
            ShowShadow = False
            TabOverlap = 0
            TabColors.HighlightBar = 15327448
            TabColors.Shadow = 15327448
            TabColors.Unselected = 15327448
            TabIndex = 0
            TabOrder = 3
            TabStyle = tsRoundCorners
            FixedDimension = 20
            object tsFinInfo: TRzTabSheet
              Color = 15327448
              Caption = 'Financial info'
              ExplicitHeight = 138
              DesignSize = (
                323
                132)
              object grFinInfo: TRzStringGrid
                Left = 6
                Top = 6
                Width = 311
                Height = 121
                Anchors = [akLeft, akTop, akRight, akBottom]
                BorderStyle = bsNone
                ColCount = 3
                Ctl3D = True
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
                OnDblClick = grFinInfoDblClick
                FrameColor = 14272955
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = 14273211
                ExplicitHeight = 127
                ColWidths = (
                  60
                  60
                  60)
                RowHeights = (
                  18)
              end
            end
            object tsMonExp: TRzTabSheet
              Color = 15327448
              Caption = 'Monthly expenses'
              ExplicitHeight = 138
              DesignSize = (
                323
                132)
              object grMonExp: TRzStringGrid
                Left = 6
                Top = 6
                Width = 311
                Height = 121
                Anchors = [akLeft, akTop, akRight, akBottom]
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                ColCount = 2
                Ctl3D = True
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
                OnDblClick = grMonExpDblClick
                FrameColor = 14272955
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = 14273211
                ExplicitHeight = 127
                ColWidths = (
                  60
                  60)
                RowHeights = (
                  18)
              end
            end
          end
          object mmRemarks: TRzDBMemo
            Left = 432
            Top = 17
            Width = 217
            Height = 43
            DataField = 'capacity'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 6
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object pnlAdd: TRzPanel
            Left = 19
            Top = 273
            Width = 50
            Height = 22
            BorderOuter = fsNone
            BorderColor = 14272955
            BorderWidth = 1
            Color = 15327448
            TabOrder = 4
            object btnAdd: TRzShapeButton
              Left = 0
              Top = 0
              Width = 50
              Height = 22
              Hint = 'Add'
              BorderStyle = bsNone
              Caption = 'Add'
              ParentShowHint = False
              ShowHint = True
              OnClick = btnAddClick
            end
          end
          object pnlRemoveComaker: TRzPanel
            Left = 75
            Top = 273
            Width = 60
            Height = 22
            BorderOuter = fsNone
            BorderColor = 14272955
            BorderWidth = 1
            Color = 15327448
            TabOrder = 5
            object btnRemove: TRzShapeButton
              Left = 0
              Top = 0
              Width = 60
              Height = 22
              Hint = 'Remove'
              BorderStyle = bsNone
              Caption = 'Remove'
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRemoveClick
            end
          end
          object RzDBMemo1: TRzDBMemo
            Left = 432
            Top = 65
            Width = 217
            Height = 43
            DataField = 'character'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 7
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object RzDBMemo2: TRzDBMemo
            Left = 432
            Top = 113
            Width = 217
            Height = 43
            DataField = 'capital'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 8
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object RzDBMemo3: TRzDBMemo
            Left = 432
            Top = 161
            Width = 217
            Height = 43
            DataField = 'conditions'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 9
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object RzDBMemo4: TRzDBMemo
            Left = 432
            Top = 209
            Width = 217
            Height = 43
            DataField = 'collateral'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 10
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object RzDBMemo5: TRzDBMemo
            Left = 432
            Top = 257
            Width = 217
            Height = 43
            DataField = 'comaker'
            DataSource = dmLoan.dscLoanAss
            MaxLength = 200
            TabOrder = 11
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object dbluRecommendation: TRzDBLookupComboBox
            Tag = 1
            Left = 120
            Top = 44
            Width = 97
            Height = 22
            DataField = 'rec_code'
            DataSource = dmLoan.dscLoanAss
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmLoansAux.dscRecommendation
            TabOrder = 1
            OnClick = dbluRecommendationClick
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 640
      Top = 339
      ExplicitLeft = 640
      ExplicitTop = 327
    end
    inherited pnlSave: TRzPanel
      Left = 584
      Top = 339
      ExplicitLeft = 584
      ExplicitTop = 327
    end
  end
end
