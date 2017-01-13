inherited frmAlerts: TfrmAlerts
  Caption = 'frmAlerts'
  ClientHeight = 286
  ClientWidth = 456
  OnCreate = FormCreate
  ExplicitWidth = 456
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 456
    GradientColorStart = 5329407
    GradientColorStop = 4868863
    ExplicitWidth = 334
    inherited imgClose: TImage
      Left = 435
      ExplicitLeft = 313
    end
    inherited lblCaption: TRzLabel
      Width = 34
      Caption = 'Alerts'
      ExplicitWidth = 34
    end
  end
  inherited pnlMain: TRzPanel
    Width = 456
    Height = 265
    Color = 13027071
    ExplicitWidth = 334
    object mmAlerts: TRzMemo
      Tag = -1
      Left = 24
      Top = 19
      Width = 403
      Height = 227
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 13027071
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DisabledColor = clMenu
      ReadOnlyColor = 13948116
      ExplicitWidth = 281
      ExplicitHeight = 222
    end
  end
end
