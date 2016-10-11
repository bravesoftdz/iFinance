inherited frmErrorBox: TfrmErrorBox
  Caption = 'frmErrorBox'
  ClientHeight = 129
  ClientWidth = 357
  ExplicitWidth = 357
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 357
    GradientColorStart = 2829311
    GradientColorStop = 5329407
    ExplicitWidth = 357
    inherited imgClose: TImage
      Left = 336
      ExplicitLeft = 336
    end
    inherited lblCaption: TRzLabel
      Width = 28
      Caption = 'Error'
      ExplicitWidth = 28
    end
  end
  inherited pnlMain: TRzPanel
    Width = 357
    Height = 108
    ExplicitWidth = 357
    ExplicitHeight = 108
    object lblMessage: TJvLabel
      Left = 29
      Top = 16
      Width = 292
      Height = 46
      AutoSize = False
      Caption = 'Errors have been found. Unable to save record.'
      Transparent = True
      WordWrap = True
    end
    object btnClose: TRzButton
      Left = 275
      Top = 76
      ModalResult = 8
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'Close'
      TabOrder = 0
    end
  end
end
