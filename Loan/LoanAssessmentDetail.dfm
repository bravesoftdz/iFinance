inherited frmLoanAssessmentDetail: TfrmLoanAssessmentDetail
  Caption = 'frmLoanAssessmentDetail'
  ClientHeight = 383
  ClientWidth = 441
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 441
    ExplicitWidth = 441
    inherited imgClose: TImage
      Left = 420
      ExplicitLeft = 420
    end
    inherited lblCaption: TRzLabel
      Width = 98
      Caption = 'Loan assessment'
      ExplicitWidth = 98
    end
  end
  inherited pnlMain: TRzPanel
    Width = 441
    Height = 362
    ExplicitWidth = 441
    ExplicitHeight = 360
    inherited pnlDetail: TRzPanel
      Width = 424
      Height = 312
      ExplicitWidth = 433
      ExplicitHeight = 329
      inherited pcDetail: TRzPageControl
        Width = 422
        Height = 310
        ExplicitWidth = 760
        ExplicitHeight = 327
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 514
          ExplicitHeight = 181
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
            Left = 20
            Top = 47
            Width = 72
            Height = 14
            Caption = 'Rec. amount'
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 222
            Top = 47
            Width = 92
            Height = 14
            Caption = 'Applied amount:'
            Transparent = True
          end
          object urlAppliedAmount: TRzURLLabel
            Tag = 1
            Left = 324
            Top = 47
            Width = 25
            Height = 14
            Caption = '0.00'
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
            Left = 20
            Top = 71
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
          end
          object dteDateAssessed: TRzDBDateTimeEdit
            Tag = 3
            Left = 112
            Top = 17
            Width = 97
            Height = 22
            DataSource = dmLoan.dscLoanAss
            DataField = 'date_ass'
            DisabledColor = clWhite
            FrameColor = 8675134
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
            Left = 112
            Top = 41
            Width = 97
            Height = 22
            DataSource = dmLoan.dscLoanAss
            DataField = 'rec_amt'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object pcAssessment: TRzPageControl
            Tag = 3
            Left = 19
            Top = 116
            Width = 378
            Height = 147
            Hint = ''
            ActivePage = tsMonExp
            ActivePageDefault = tsFinInfo
            ButtonColor = 14273211
            FlatColor = 8675134
            ShowShadow = False
            TabOverlap = 0
            TabColors.HighlightBar = 14273211
            TabColors.Shadow = 14273211
            TabColors.Unselected = 14273211
            TabIndex = 1
            TabOrder = 3
            TabStyle = tsRoundCorners
            FixedDimension = 20
            object tsFinInfo: TRzTabSheet
              Color = 14273211
              Caption = 'Financial info'
              ExplicitWidth = 374
              ExplicitHeight = 120
              DesignSize = (
                376
                122)
              object grFinInfo: TRzStringGrid
                Left = 6
                Top = 6
                Width = 364
                Height = 111
                Anchors = [akLeft, akTop, akRight, akBottom]
                ColCount = 3
                Ctl3D = False
                DrawingStyle = gdsGradient
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goFixedVertLine, goFixedHorzLine, goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
                OnDblClick = grFinInfoDblClick
                FrameColor = 8675134
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = 14273211
                ColWidths = (
                  60
                  60
                  60)
                RowHeights = (
                  18)
              end
            end
            object tsMonExp: TRzTabSheet
              Color = 14273211
              Caption = 'Monthly expenses'
              ExplicitWidth = 374
              ExplicitHeight = 120
              object grMonExp: TRzStringGrid
                Left = 6
                Top = 6
                Width = 364
                Height = 111
                ColCount = 2
                Ctl3D = False
                DrawingStyle = gdsGradient
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goFixedVertLine, goFixedHorzLine, goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
                OnDblClick = grMonExpDblClick
                FrameColor = 8675134
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = 14273211
                ColWidths = (
                  60
                  60)
                RowHeights = (
                  18)
              end
            end
          end
          object mmRemarks: TRzDBMemo
            Left = 112
            Top = 65
            Width = 283
            Height = 45
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanAss
            TabOrder = 2
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
          end
          object pnlAdd: TRzPanel
            Left = 19
            Top = 269
            Width = 50
            Height = 22
            BorderOuter = fsNone
            BorderColor = 6572079
            BorderWidth = 1
            Color = 12955288
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
            Top = 269
            Width = 50
            Height = 22
            BorderOuter = fsNone
            BorderColor = 6572079
            BorderWidth = 1
            Color = 12955288
            TabOrder = 5
            object btnRemove: TRzShapeButton
              Left = 0
              Top = 0
              Width = 50
              Height = 22
              Hint = 'Remove'
              BorderStyle = bsNone
              Caption = 'Remove'
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRemoveClick
            end
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 382
      Top = 329
      ExplicitLeft = 391
      ExplicitTop = 346
    end
    inherited pnlSave: TRzPanel
      Left = 326
      Top = 329
      ExplicitLeft = 335
      ExplicitTop = 346
    end
  end
end
