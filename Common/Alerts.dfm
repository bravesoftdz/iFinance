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
    Color = 4868863
    GradientColorStart = 5329407
    GradientColorStop = 4868863
    ExplicitWidth = 456
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
    Color = 10461183
    ExplicitWidth = 456
    ExplicitHeight = 265
    object mmAlerts: TRzMemo
      Tag = -1
      Left = 24
      Top = 19
      Width = 474
      Height = 227
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 10461183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DisabledColor = clMenu
      FrameColor = 10461183
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 13948116
      ExplicitWidth = 403
    end
  end
end
