inherited frmLoanReleaseDetail: TfrmLoanReleaseDetail
  Caption = 'frmLoanReleaseDetail'
  ClientHeight = 270
  ClientWidth = 451
  OnShow = FormShow
  ExplicitWidth = 451
  ExplicitHeight = 270
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 451
    ExplicitWidth = 451
    inherited imgClose: TImage
      Left = 430
      ExplicitLeft = 545
    end
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Release details'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    Width = 451
    Height = 249
    ExplicitWidth = 451
    ExplicitHeight = 249
    inherited pcDetail: TRzPageControl
      Width = 434
      Height = 195
      ExplicitWidth = 434
      ExplicitHeight = 195
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 430
        ExplicitHeight = 191
        object urlReleaseToClient: TRzURLLabel
          Tag = 1
          Left = 330
          Top = 158
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Release to client'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object btnAddRecipient: TRzButton
          Tag = 7
          Left = 19
          Top = 158
          Width = 57
          Height = 20
          Caption = 'Add'
          TabOrder = 0
          OnClick = btnAddRecipientClick
        end
        object btnRemoveRecipient: TRzButton
          Tag = 7
          Left = 81
          Top = 158
          Width = 57
          Height = 20
          Caption = 'Remove'
          TabOrder = 1
        end
        object pcAssessment: TRzPageControl
          Tag = 3
          Left = 19
          Top = 23
          Width = 392
          Height = 129
          Hint = ''
          ActivePage = tsRecipients
          ActivePageDefault = tsRecipients
          TabOverlap = 0
          TabIndex = 0
          TabOrder = 2
          TabStyle = tsRoundCorners
          FixedDimension = 19
          object tsRecipients: TRzTabSheet
            Color = 15000804
            Caption = 'Recipients'
            DesignSize = (
              388
              103)
            object grReleaseRecipient: TRzStringGrid
              Left = 7
              Top = 3
              Width = 378
              Height = 93
              Anchors = [akLeft, akTop, akRight, akBottom]
              ColCount = 4
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              OnDblClick = grReleaseRecipientDblClick
              ColWidths = (
                60
                60
                60
                60)
              RowHeights = (
                18)
            end
          end
          object tsMonExp: TRzTabSheet
            Color = 15000804
            Caption = 'Charges'
            object grCharges: TRzStringGrid
              Left = 5
              Top = 5
              Width = 378
              Height = 94
              ColCount = 2
              FixedCols = 0
              RowCount = 1
              FixedRows = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              ColWidths = (
                60
                60)
              RowHeights = (
                18)
            end
          end
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 285
      Top = 214
      ExplicitLeft = 285
      ExplicitTop = 214
    end
    inherited btnCancel: TRzButton
      Left = 366
      Top = 214
      ExplicitLeft = 366
      ExplicitTop = 214
    end
  end
end
