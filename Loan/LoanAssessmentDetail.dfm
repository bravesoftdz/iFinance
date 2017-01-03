inherited frmLoanAssessmentDetail: TfrmLoanAssessmentDetail
  Caption = 'frmLoanAssessmentDetail'
  ClientHeight = 323
  ClientWidth = 441
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 323
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
    Height = 302
    ExplicitWidth = 441
    ExplicitHeight = 302
    inherited pcDetail: TRzPageControl
      Width = 424
      Height = 248
      ExplicitWidth = 424
      ExplicitHeight = 248
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 420
        ExplicitHeight = 244
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
          Left = 198
          Top = 23
          Width = 111
          Height = 13
          Caption = 'Recommended amount'
          Transparent = True
        end
        object dteDateAssessed: TRzDBDateTimeEdit
          Tag = 3
          Left = 102
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
          Left = 320
          Top = 17
          Width = 75
          Height = 21
          DataSource = dmLoan.dscLoanAss
          DataField = 'rec_amt'
          Alignment = taLeftJustify
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 1
          DisplayFormat = '###,##0.00'
        end
        object pcAssessment: TRzPageControl
          Tag = 3
          Left = 19
          Top = 54
          Width = 378
          Height = 147
          Hint = ''
          ActivePage = tsFinInfo
          ActivePageDefault = tsFinInfo
          TabOverlap = 0
          TabIndex = 0
          TabOrder = 2
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
          Top = 207
          Width = 57
          Height = 20
          Caption = 'Add'
          TabOrder = 3
          OnClick = btnAddAssClick
        end
        object btnRemoveAss: TRzButton
          Tag = 3
          Left = 82
          Top = 207
          Width = 57
          Height = 20
          Caption = 'Remove'
          TabOrder = 4
          OnClick = btnRemoveAssClick
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 275
      Top = 267
      ExplicitLeft = 275
      ExplicitTop = 267
    end
    inherited btnCancel: TRzButton
      Left = 356
      Top = 267
      ExplicitLeft = 356
      ExplicitTop = 267
    end
  end
end
