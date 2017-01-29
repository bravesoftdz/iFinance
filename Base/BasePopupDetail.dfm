inherited frmBasePopupDetail: TfrmBasePopupDetail
  Caption = 'frmBasePopupDetail'
  ClientHeight = 253
  ClientWidth = 533
  OnClose = FormClose
  ExplicitWidth = 533
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 14
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
    object pnlDetail: TRzPanel
      Left = 8
      Top = 8
      Width = 516
      Height = 183
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 0
      object pcDetail: TRzPageControl
        Left = 1
        Top = 1
        Width = 514
        Height = 181
        Hint = ''
        ActivePage = tsDetail
        Align = alClient
        ButtonColor = 14273211
        UseColoredTabs = True
        FlatColor = 14273211
        ShowCardFrame = False
        ShowFocusRect = False
        ShowFullFrame = False
        ShowShadow = False
        TabOrder = 0
        TabStop = False
        FixedDimension = 20
        object tsDetail: TRzTabSheet
          Color = 14273211
          TabVisible = False
          Caption = 'Change caption here'
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
      end
    end
    object pnlCancel: TRzPanel
      Left = 474
      Top = 200
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 1
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Cancel'
        OnClick = btnCancelClick
      end
    end
    object pnlSave: TRzPanel
      Left = 418
      Top = 200
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 14273211
      TabOrder = 2
      object btnSave: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Save'
        OnClick = btnYesClick
      end
    end
  end
end
