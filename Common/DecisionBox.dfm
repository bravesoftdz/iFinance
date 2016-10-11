inherited frmDecisionBox: TfrmDecisionBox
  Caption = 'frmDecisionBox'
  ClientHeight = 129
  ClientWidth = 357
  ExplicitWidth = 357
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 357
    GradientColorStart = 3109887
    GradientColorStop = 4621311
    inherited imgClose: TImage
      Left = 336
    end
    inherited lblCaption: TRzLabel
      Width = 82
      Caption = 'Confirm action'
      ExplicitWidth = 82
    end
  end
  inherited pnlMain: TRzPanel
    Width = 357
    Height = 108
    object lblMessage: TJvLabel
      Left = 24
      Top = 24
      Width = 172
      Height = 13
      Caption = 'Are you sure you want to proceed?'
      Transparent = True
    end
    object btnNo: TRzButton
      Left = 275
      Top = 76
      Default = True
      ModalResult = 7
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'No'
      TabOrder = 1
    end
    object btnYes: TRzButton
      Left = 194
      Top = 76
      ModalResult = 6
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'Yes'
      TabOrder = 0
    end
  end
end
