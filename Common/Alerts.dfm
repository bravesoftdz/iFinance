inherited frmAlerts: TfrmAlerts
  Caption = 'frmAlerts'
  ClientHeight = 286
  ClientWidth = 527
  OnCreate = FormCreate
  ExplicitWidth = 527
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 527
    BorderColor = 886527
    Color = 4235263
    GradientColorStart = 5220351
    GradientColorStop = 5220351
    ExplicitWidth = 527
    inherited imgClose: TImage
      Left = 506
      ExplicitLeft = 313
    end
    inherited lblCaption: TRzLabel
      Width = 34
      Caption = 'Alerts'
      ExplicitWidth = 34
    end
  end
  inherited pnlMain: TRzPanel
    Width = 527
    Height = 265
    BorderColor = 886527
    Color = 9225983
    ExplicitWidth = 527
    ExplicitHeight = 265
    object mmAlerts: TRzMemo
      Tag = -1
      Left = 34
      Top = 24
      Width = 452
      Height = 216
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 9225983
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DisabledColor = 9225983
      FrameColor = 9225983
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 13948116
    end
    object pnlContinue: TRzPanel
      Left = 459
      Top = 235
      Width = 60
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 886527
      BorderWidth = 1
      Color = 7124735
      TabOrder = 1
      object btnContinue: TRzShapeButton
        Left = 0
        Top = 0
        Width = 60
        Height = 22
        Hint = 'Continue'
        Caption = 'Close'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnContinueClick
      end
    end
  end
end
