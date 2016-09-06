inherited frmBasePopupDetail: TfrmBasePopupDetail
  Caption = 'frmBasePopupDetail'
  ClientHeight = 317
  ClientWidth = 549
  OnClose = FormClose
  ExplicitWidth = 549
  ExplicitHeight = 317
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 549
    ExplicitWidth = 549
    DesignSize = (
      549
      21)
    inherited imgClose: TImage
      Left = 528
      ExplicitLeft = 528
    end
  end
  inherited pnlMain: TRzPanel
    Width = 549
    Height = 296
    ExplicitWidth = 549
    ExplicitHeight = 296
    DesignSize = (
      549
      296)
    object lblStatus: TLabel
      Left = 9
      Top = 233
      Width = 69
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Error Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitTop = 242
    end
    object pcDetail: TRzPageControl
      Left = 8
      Top = 11
      Width = 532
      Height = 214
      Hint = ''
      ActivePage = tsDetail
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseColoredTabs = True
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object tsDetail: TRzTabSheet
        Color = 15263976
        Caption = 'Change caption here'
      end
    end
    object btnSave: TRzButton
      Left = 9
      Top = 263
      ShowFocusRect = False
      Anchors = [akLeft, akBottom]
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnCancel: TRzButton
      Left = 90
      Top = 263
      ModalResult = 2
      ShowFocusRect = False
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      TabOrder = 2
    end
  end
end
