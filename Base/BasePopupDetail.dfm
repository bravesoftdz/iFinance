inherited frmBasePopupDetail: TfrmBasePopupDetail
  Caption = 'frmBasePopupDetail'
  ClientHeight = 253
  ClientWidth = 533
  OnClose = FormClose
  ExplicitWidth = 533
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 533
    ExplicitWidth = 533
    DesignSize = (
      533
      21)
    inherited imgClose: TImage
      Left = 512
      ExplicitLeft = 528
    end
  end
  inherited pnlMain: TRzPanel
    Width = 533
    Height = 232
    ExplicitWidth = 533
    ExplicitHeight = 232
    DesignSize = (
      533
      232)
    object lblStatus: TLabel
      Left = 9
      Top = 197
      Width = 344
      Height = 28
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object pcDetail: TRzPageControl
      Left = 8
      Top = 11
      Width = 516
      Height = 178
      Hint = ''
      ActivePage = tsDetail
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseColoredTabs = True
      TabOrder = 0
      FixedDimension = 19
      object tsDetail: TRzTabSheet
        Color = 15263976
        TabVisible = False
        Caption = 'Change caption here'
        ExplicitTop = 20
        ExplicitHeight = 155
      end
    end
    object btnSave: TRzButton
      Left = 367
      Top = 197
      ShowFocusRect = False
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnCancel: TRzButton
      Left = 448
      Top = 197
      ModalResult = 2
      ShowFocusRect = False
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 2
    end
  end
end
