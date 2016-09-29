inherited frmBaseSearch: TfrmBaseSearch
  Caption = 'frmBaseSearch'
  ClientHeight = 342
  ClientWidth = 314
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 314
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 314
    ExplicitWidth = 314
    DesignSize = (
      314
      21)
    inherited imgClose: TImage
      Left = 293
      ExplicitLeft = 293
    end
  end
  inherited pnlMain: TRzPanel
    Width = 314
    Height = 321
    ExplicitWidth = 314
    ExplicitHeight = 321
    DesignSize = (
      314
      321)
    object RzLabel2: TRzLabel
      Left = 8
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 47
      Top = 8
      Width = 257
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
    object grSearch: TRzDBGrid
      Left = 8
      Top = 35
      Width = 296
      Height = 245
      Anchors = [akLeft, akTop, akRight, akBottom]
      Options = [dgIndicator, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grSearchDblClick
      AltRowShading = True
      AltRowShadingColor = 16249582
    end
    object btnSelect: TButton
      Left = 8
      Top = 288
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Select'
      ModalResult = 1
      TabOrder = 2
    end
    object btnNew: TButton
      Left = 89
      Top = 288
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'New'
      TabOrder = 3
      OnClick = btnNewClick
    end
    object btnClose: TButton
      Left = 229
      Top = 288
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
    end
  end
end
