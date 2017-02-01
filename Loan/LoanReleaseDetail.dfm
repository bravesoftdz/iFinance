inherited frmLoanReleaseDetail: TfrmLoanReleaseDetail
  Caption = 'frmLoanReleaseDetail'
  ClientHeight = 306
  ClientWidth = 527
  OnShow = FormShow
  ExplicitWidth = 527
  ExplicitHeight = 306
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 527
    ExplicitWidth = 527
    inherited imgClose: TImage
      Left = 506
      ExplicitLeft = 545
    end
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Release details'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    Width = 527
    Height = 285
    ExplicitWidth = 527
    ExplicitHeight = 285
    inherited pnlDetail: TRzPanel
      Left = 7
      Top = 7
      Width = 512
      Height = 238
      ExplicitLeft = 7
      ExplicitTop = 7
      ExplicitWidth = 512
      ExplicitHeight = 238
      inherited pcDetail: TRzPageControl
        Width = 510
        Height = 236
        ExplicitWidth = 510
        ExplicitHeight = 236
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 510
          ExplicitHeight = 236
          object urlReleaseToClient: TRzURLLabel
            Tag = 1
            Left = 403
            Top = 198
            Width = 90
            Height = 14
            Alignment = taRightJustify
            Caption = 'Release to client'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8675134
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlReleaseToClientClick
          end
          object pcAssessment: TRzPageControl
            Tag = 3
            Left = 19
            Top = 23
            Width = 474
            Height = 169
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
            FixedDimension = 20
            object tsRecipients: TRzTabSheet
              Color = 14273211
              Caption = 'Recipients'
              DesignSize = (
                472
                144)
              object grReleaseRecipient: TRzStringGrid
                Left = 6
                Top = 6
                Width = 460
                Height = 132
                Anchors = [akLeft, akTop, akRight, akBottom]
                ColCount = 4
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
                  60)
                RowHeights = (
                  18)
              end
            end
            object tsMonExp: TRzTabSheet
              Color = 14273211
              Caption = 'Charges'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 388
              ExplicitHeight = 102
              DesignSize = (
                472
                144)
              object grCharges: TRzStringGrid
                Left = 6
                Top = 6
                Width = 460
                Height = 132
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
            Top = 198
            Width = 50
            Height = 22
            Anchors = [akRight, akBottom]
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
            Top = 198
            Width = 50
            Height = 22
            Anchors = [akRight, akBottom]
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
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 469
      Top = 254
      ExplicitLeft = 469
      ExplicitTop = 254
    end
    inherited pnlSave: TRzPanel
      Left = 413
      Top = 254
      ExplicitLeft = 413
      ExplicitTop = 254
    end
  end
end
