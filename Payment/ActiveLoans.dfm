inherited frmActiveLoans: TfrmActiveLoans
  Caption = 'frmActiveLoans'
  ClientHeight = 176
  ClientWidth = 422
  OnShow = FormShow
  ExplicitWidth = 422
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 422
    ExplicitWidth = 422
    inherited imgClose: TImage
      Left = 401
      ExplicitLeft = 430
    end
    inherited lblCaption: TRzLabel
      Width = 62
      Caption = 'Select loan'
      ExplicitWidth = 62
    end
  end
  inherited pnlMain: TRzPanel
    Width = 422
    Height = 155
    ExplicitWidth = 422
    ExplicitHeight = 155
    object pnlLoans: TRzPanel
      Left = 8
      Top = 8
      Width = 406
      Height = 138
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 14273211
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object grLoans: TRzStringGrid
        Left = 1
        Top = 1
        Width = 404
        Height = 136
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ColCount = 4
        Ctl3D = True
        FixedColor = clWhite
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentCtl3D = False
        ScrollBars = ssNone
        TabOrder = 0
        OnDblClick = grLoansDblClick
        OnDrawCell = grLoansDrawCell
        FrameColor = 8675134
        FrameStyle = fsNone
        FrameVisible = True
        FramingPreference = fpCustomFraming
        FixedLineColor = 14272955
        LineColor = clWhite
        UseDrawingStyle = False
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
