inherited frmConfBox: TfrmConfBox
  Caption = 'frmConfBox'
  ClientHeight = 129
  ClientWidth = 357
  ExplicitWidth = 357
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 357
    GradientColorStart = clGreen
    GradientColorStop = 39680
    ExplicitWidth = 357
    inherited imgClose: TImage
      Left = 336
      ExplicitLeft = 336
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Confirmation'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 357
    Height = 108
    ExplicitWidth = 357
    ExplicitHeight = 108
    object lblMessage: TJvLabel
      Left = 24
      Top = 24
      Width = 179
      Height = 13
      Caption = 'Record has been saved successfully.'
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
