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
    inherited imgClose: TImage
      Left = 506
      ExplicitLeft = 506
    end
    inherited lblCaption: TRzLabel
      Width = 68
      Caption = 'Client alerts'
      ExplicitWidth = 68
    end
  end
  inherited pnlMain: TRzPanel
    Width = 527
    Height = 265
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
      Color = 15327448
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DisabledColor = 15327448
      FrameColor = 15327448
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 13948116
    end
    object pnlContinue: TRzPanel
      Left = 456
      Top = 233
      Width = 60
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
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
