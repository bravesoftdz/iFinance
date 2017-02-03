inherited frmBaseGridDetail: TfrmBaseGridDetail
  Caption = 'frmBaseGridDetail'
  ClientHeight = 474
  ClientWidth = 778
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 794
  ExplicitHeight = 513
  DesignSize = (
    778
    474)
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 778
    ExplicitWidth = 778
  end
  object pnlList: TRzPanel
    Left = 8
    Top = 65
    Width = 481
    Height = 403
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 479
      Height = 401
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmEntities.dscGroups
      DrawingStyle = gdsGradient
      FixedColor = 12955288
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FrameColor = 6572079
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = clWhite
      AltRowShadingColor = 15854564
    end
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 778
    Height = 33
    Align = alTop
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      778
      33)
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 37
      Height = 14
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 52
      Top = 9
      Width = 437
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
  object pnlDetail: TRzPanel
    Left = 495
    Top = 65
    Width = 276
    Height = 403
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      276
      403)
    object pnlAdd: TRzPanel
      Left = 8
      Top = 373
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 0
      object sbtnNew: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'New'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnNewClick
      end
    end
    object pnlDetailHead: TRzPanel
      Left = 1
      Top = 1
      Width = 274
      Height = 19
      Align = alTop
      BorderOuter = fsNone
      BorderSides = [sdBottom]
      BorderColor = clBlack
      BorderWidth = 1
      Color = 8675134
      GradientColorStyle = gcsCustom
      GradientColorStart = 6572079
      GradientColorStop = 8675134
      TabOrder = 1
      VisualStyle = vsGradient
      object lblDetailHeadCaption: TRzLabel
        Left = 7
        Top = 2
        Width = 41
        Height = 14
        Caption = 'Details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
end
