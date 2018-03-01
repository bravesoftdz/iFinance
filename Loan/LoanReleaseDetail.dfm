inherited frmLoanReleaseDetail: TfrmLoanReleaseDetail
  Caption = 'frmLoanReleaseDetail'
  ClientHeight = 393
  ClientWidth = 541
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 541
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 541
    ExplicitWidth = 541
    inherited imgClose: TImage
      Left = 520
      ExplicitLeft = 545
    end
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Release details'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    Width = 541
    Height = 372
    ExplicitWidth = 541
    ExplicitHeight = 372
    inherited pnlDetail: TRzPanel
      Left = 7
      Top = 7
      Width = 526
      Height = 325
      ExplicitLeft = 7
      ExplicitTop = 7
      ExplicitWidth = 526
      ExplicitHeight = 325
      inherited pcDetail: TRzPageControl
        Width = 524
        Height = 323
        ExplicitWidth = 524
        ExplicitHeight = 323
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 524
          ExplicitHeight = 323
          object urlReleaseToClient: TRzURLLabel
            Tag = 1
            Left = 417
            Top = 285
            Width = 90
            Height = 14
            Alignment = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = 'Release to client'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8675134
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlReleaseToClientClick
            ExplicitTop = 241
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 248
            Top = 47
            Width = 118
            Height = 14
            Caption = 'Approved amount:'
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
          object urlApprovedAmount: TRzURLLabel
            Tag = 1
            Left = 382
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
            OnClick = urlApprovedAmountClick
          end
          object JvLabel14: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 89
            Height = 14
            Caption = 'Release amount'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Tag = -1
            Left = 248
            Top = 71
            Width = 55
            Height = 14
            Caption = 'Charges:'
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
          object lblCharges: TJvLabel
            Tag = -1
            Left = 382
            Top = 71
            Width = 27
            Height = 14
            Caption = '0.00'
            Transparent = True
          end
          object JvLabel4: TJvLabel
            Tag = -1
            Left = 22
            Top = 96
            Width = 86
            Height = 14
            Caption = 'Net proceeds:'
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
          object lblNetProceeds: TJvLabel
            Tag = -1
            Left = 132
            Top = 96
            Width = 27
            Height = 14
            Caption = '0.00'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Tag = -1
            Left = 248
            Top = 23
            Width = 104
            Height = 14
            Caption = 'Applied amount:'
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
          object lblAppliedAmount: TJvLabel
            Tag = -1
            Left = 382
            Top = 23
            Width = 27
            Height = 14
            Caption = '0.00'
            Transparent = True
          end
          object lblAdvancePayment: TJvLabel
            Tag = -1
            Left = 420
            Top = 96
            Width = 27
            Height = 14
            Caption = '0.00'
            Transparent = True
          end
          object JvLabel5: TJvLabel
            Tag = -1
            Left = 248
            Top = 96
            Width = 116
            Height = 14
            Caption = 'Advance payment:'
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
          object lblAdvancePaymentMonths: TJvLabel
            Tag = -1
            Left = 248
            Top = 120
            Width = 6
            Height = 14
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel37: TJvLabel
            Left = 19
            Top = 47
            Width = 89
            Height = 14
            Caption = 'Promissory note'
            Transparent = True
          end
          object pcAssessment: TRzPageControl
            Tag = 3
            Left = 19
            Top = 134
            Width = 488
            Height = 145
            Hint = ''
            ActivePage = tsRecipients
            ActivePageDefault = tsRecipients
            Anchors = [akLeft, akTop, akRight, akBottom]
            ButtonColor = 14273211
            FlatColor = 8675134
            ShowShadow = False
            TabOverlap = 0
            TabColors.Shadow = 14273211
            TabColors.Unselected = 14273211
            TabIndex = 0
            TabOrder = 0
            TabStyle = tsRoundCorners
            OnChange = pcAssessmentChange
            FixedDimension = 20
            object tsRecipients: TRzTabSheet
              Color = 14273211
              Caption = 'Recipients'
              DesignSize = (
                486
                120)
              object grReleaseRecipient: TRzStringGrid
                Left = 6
                Top = 6
                Width = 474
                Height = 108
                Anchors = [akLeft, akTop, akRight, akBottom]
                Ctl3D = True
                DrawingStyle = gdsGradient
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
                OnDblClick = grReleaseRecipientDblClick
                FrameColor = 8675134
                FrameVisible = True
                FramingPreference = fpCustomFraming
                FixedLineColor = 14273211
                ColWidths = (
                  60
                  60
                  60
                  60
                  60)
                RowHeights = (
                  18)
              end
            end
            object tsCharges: TRzTabSheet
              Color = 14273211
              Caption = 'Charges'
              DesignSize = (
                486
                120)
              object grCharges: TRzStringGrid
                Left = 6
                Top = 6
                Width = 474
                Height = 108
                Anchors = [akLeft, akTop, akRight, akBottom]
                ColCount = 2
                Ctl3D = True
                DrawingStyle = gdsGradient
                FixedColor = 14273211
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                GradientEndColor = 12955288
                GradientStartColor = 12955288
                Options = [goRowSelect]
                ParentCtl3D = False
                TabOrder = 0
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
          object RzPanel1: TRzPanel
            Left = 75
            Top = 285
            Width = 50
            Height = 22
            Anchors = [akLeft, akBottom]
            BorderOuter = fsNone
            BorderColor = 6572079
            BorderWidth = 1
            Color = 14273211
            TabOrder = 1
            object btnRemove: TRzShapeButton
              Left = 0
              Top = 0
              Width = 50
              Height = 22
              BorderStyle = bsNone
              Caption = 'Remove'
              OnClick = btnRemoveClick
            end
          end
          object RzPanel2: TRzPanel
            Left = 19
            Top = 285
            Width = 50
            Height = 22
            Anchors = [akLeft, akBottom]
            BorderOuter = fsNone
            BorderColor = 6572079
            BorderWidth = 1
            Color = 14273211
            TabOrder = 2
            object btnAdd: TRzShapeButton
              Left = 0
              Top = 0
              Width = 50
              Height = 22
              BorderStyle = bsNone
              Caption = 'Add'
              OnClick = btnAddClick
            end
          end
          object edReleasedAmount: TRzNumericEdit
            Left = 118
            Top = 17
            Width = 107
            Height = 22
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 3
            OnChange = edReleasedAmountChange
            DisplayFormat = '###,##0.00'
          end
          object edAdvancePaymentMonths: TRzNumericEdit
            Left = 382
            Top = 90
            Width = 27
            Height = 22
            DisabledColor = 14273211
            Enabled = False
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 5
            OnChange = edReleasedAmountChange
            DisplayFormat = '0'
          end
          object cmbPromissoryNotes: TRzComboBox
            Left = 118
            Top = 41
            Width = 107
            Height = 22
            TabOrder = 4
            OnChange = cmbPromissoryNotesChange
            OnClick = cmbPromissoryNotesChange
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 483
      Top = 341
      ExplicitLeft = 483
      ExplicitTop = 341
    end
    inherited pnlSave: TRzPanel
      Left = 427
      Top = 341
      ExplicitLeft = 427
      ExplicitTop = 341
    end
  end
end
