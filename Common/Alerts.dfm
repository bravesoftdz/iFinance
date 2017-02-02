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
    Color = 6572079
    GradientColorStart = 2960895
    GradientColorStop = 4737279
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
    Color = 10921727
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
      Color = 10921727
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DisabledColor = 10921727
      FrameColor = 10921727
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 13948116
    end
  end
end
