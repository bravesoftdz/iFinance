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
    GradientColorStart = 21503
    GradientColorStop = 875519
    ExplicitWidth = 357
    inherited imgClose: TImage
      Left = 336
      ExplicitLeft = 336
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
    ExplicitWidth = 357
    ExplicitHeight = 108
    object lblMessage: TJvLabel
      Left = 24
      Top = 24
      Width = 305
      Height = 46
      AutoSize = False
      Caption = 'Are you sure you want to proceed?'
      Transparent = True
      WordWrap = True
    end
    object btnNo: TRzButton
      Left = 275
      Top = 76
      Default = True
      ModalResult = 7
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'No'
      TabOrder = 0
    end
    object btnYes: TRzButton
      Left = 194
      Top = 76
      ModalResult = 6
      ShowDownPattern = False
      ShowFocusRect = False
      Caption = 'Yes'
      TabOrder = 1
    end
  end
end
