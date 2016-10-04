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
    GradientColorStart = 4342527
    GradientColorStop = 7434751
    inherited imgClose: TImage
      Left = 336
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
    object lblMessage: TJvLabel
      Left = 24
      Top = 24
      Width = 233
      Height = 13
      Caption = 'Errors have been found. Unable to save record.'
      Transparent = True
    end
    object btnOk: TRzButton
      Left = 275
      Top = 76
      ModalResult = 8
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'OK'
      TabOrder = 0
    end
  end
end
