inherited frmActiveLoans: TfrmActiveLoans
  Caption = 'frmActiveLoans'
  ClientHeight = 219
  ClientWidth = 451
  OnShow = FormShow
  ExplicitWidth = 451
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 451
    inherited imgClose: TImage
      Left = 430
    end
    inherited lblCaption: TRzLabel
      Width = 62
      Caption = 'Select loan'
      ExplicitWidth = 62
    end
  end
  inherited pnlMain: TRzPanel
    Width = 451
    Height = 198
    object pnlLoans: TRzPanel
      Left = 8
      Top = 8
      Width = 435
      Height = 181
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 0
      ExplicitWidth = 527
      ExplicitHeight = 243
      object grLoans: TRzStringGrid
        Left = 1
        Top = 1
        Width = 433
        Height = 179
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ColCount = 4
        Ctl3D = True
        DrawingStyle = gdsGradient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [goRowSelect]
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = grLoansDblClick
        FrameColor = 8675134
        FrameStyle = fsNone
        FrameVisible = True
        FramingPreference = fpCustomFraming
        FixedLineColor = clBtnFace
        ColWidths = (
          60
          60
          60
          60)
        RowHeights = (
          18)
      end
    end
  end
end
