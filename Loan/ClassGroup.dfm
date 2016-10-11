inherited frmClassGroup: TfrmClassGroup
  Caption = 'frmClassGroup'
  ClientWidth = 460
  ExplicitWidth = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 460
    ExplicitWidth = 460
    inherited imgClose: TImage
      Left = 439
      ExplicitLeft = 439
    end
    inherited lblCaption: TRzLabel
      Width = 117
      Caption = 'Add/Remove groups'
      ExplicitWidth = 117
    end
  end
  inherited pnlMain: TRzPanel
    Width = 460
    ExplicitWidth = 460
    object JvLabel1: TJvLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Available groups'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 234
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Selected groups'
      Transparent = True
    end
    object lbxAvailable: TRzListBox
      Left = 8
      Top = 24
      Width = 217
      Height = 195
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 296
      Top = 227
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
    end
    object btnClose: TButton
      Left = 377
      Top = 227
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object lbxSelected: TRzListBox
      Left = 234
      Top = 24
      Width = 217
      Height = 195
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 3
    end
  end
end
