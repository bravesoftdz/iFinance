inherited frmLoanAssessmentDetail: TfrmLoanAssessmentDetail
  Caption = 'frmLoanAssessmentDetail'
  ClientHeight = 381
  ClientWidth = 441
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
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
    Height = 360
    ExplicitWidth = 441
    ExplicitHeight = 360
    inherited pcDetail: TRzPageControl
      Width = 424
      Height = 306
      ExplicitWidth = 424
      ExplicitHeight = 306
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 420
        ExplicitHeight = 302
        object JvLabel4: TJvLabel
          Tag = -1
          Left = 19
          Top = 23
          Width = 72
          Height = 13
          Caption = 'Date assessed'
          Transparent = True
        end
        object JvLabel11: TJvLabel
          Tag = -1
          Left = 20
          Top = 47
          Width = 111
          Height = 13
          Caption = 'Recommended amount'
          Transparent = True
        end
        object JvLabel1: TJvLabel
          Tag = -1
          Left = 238
          Top = 47
          Width = 80
          Height = 13
          Caption = 'Applied amount:'
          Transparent = True
        end
        object urlAppliedAmount: TRzURLLabel
          Tag = 1
          Left = 324
          Top = 47
          Width = 22
          Height = 13
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlAppliedAmountClick
        end
        object JvLabel2: TJvLabel
          Tag = -1
          Left = 20
          Top = 71
          Width = 43
          Height = 13
          Caption = 'Remarks'
          Transparent = True
        end
        object dteDateAssessed: TRzDBDateTimeEdit
          Tag = 3
          Left = 137
          Top = 17
          Width = 85
          Height = 21
          DataSource = dmLoan.dscLoanAss
          DataField = 'date_ass'
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object edRecAmount: TRzDBNumericEdit
          Tag = 3
          Left = 137
          Top = 41
          Width = 85
          Height = 21
          DataSource = dmLoan.dscLoanAss
          DataField = 'rec_amt'
          Alignment = taLeftJustify
          DisabledColor = clWhite
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
          ActivePage = tsFinInfo
          ActivePageDefault = tsFinInfo
          TabOverlap = 0
          TabIndex = 0
          TabOrder = 3
          TabStyle = tsRoundCorners
          FixedDimension = 19
          object tsFinInfo: TRzTabSheet
            Color = 15000804
            Caption = 'Financial info'
            object grFinInfo: TRzStringGrid
              Left = 5
              Top = 5
              Width = 364
              Height = 111
              ColCount = 3
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              OnDblClick = grFinInfoDblClick
              ColWidths = (
                60
                60
                60)
              RowHeights = (
                18)
            end
          end
          object tsMonExp: TRzTabSheet
            Color = 15000804
            Caption = 'Monthly expenses'
            object grMonExp: TRzStringGrid
              Left = 5
              Top = 5
              Width = 364
              Height = 111
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              OnDblClick = grMonExpDblClick
              ColWidths = (
                60
                60)
              RowHeights = (
                18)
            end
          end
        end
        object btnAddAss: TRzButton
          Tag = 3
          Left = 19
          Top = 269
          Width = 57
          Height = 20
          Caption = 'Add'
          TabOrder = 4
          OnClick = btnAddAssClick
        end
        object btnRemoveAss: TRzButton
          Tag = 3
          Left = 82
          Top = 269
          Width = 57
          Height = 20
          Caption = 'Remove'
          TabOrder = 5
          OnClick = btnRemoveAssClick
        end
        object mmRemarks: TRzDBMemo
          Left = 137
          Top = 65
          Width = 258
          Height = 45
          DataField = 'remarks'
          DataSource = dmLoan.dscLoanAss
          TabOrder = 2
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 275
      Top = 325
      ExplicitLeft = 275
      ExplicitTop = 325
    end
    inherited btnCancel: TRzButton
      Left = 356
      Top = 325
      ExplicitLeft = 356
      ExplicitTop = 325
    end
  end
end
