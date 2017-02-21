inherited frmBanksList: TfrmBanksList
  Caption = 'frmBanksList'
  ClientHeight = 498
  ClientWidth = 877
  OnShow = FormShow
  ExplicitWidth = 893
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 877
    ExplicitWidth = 877
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Banks list'
      ExplicitWidth = 58
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 35
    Width = 581
    Height = 230
    Anchors = [akLeft, akTop, akRight]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 579
      Height = 228
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmAux.dscBanks
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
      FramingPreference = fpCustomFraming
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'bank_code'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bank_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel
    Left = 594
    Top = 35
    Width = 276
    Height = 457
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      457)
    object JvLabel1: TJvLabel
      Left = 13
      Top = 39
      Width = 62
      Height = 14
      Caption = 'Bank name'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 13
      Top = 63
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object pnlAdd: TRzPanel
      Left = 8
      Top = 427
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 2
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
      TabOrder = 3
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
    object edBankName: TRzDBEdit
      Left = 81
      Top = 33
      Width = 176
      Height = 22
      DataSource = dmAux.dscBanks
      DataField = 'bank_name'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = 14273211
      FocusColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 14273211
      TabOrder = 0
    end
    object mmBranch: TRzDBMemo
      Left = 81
      Top = 57
      Width = 176
      Height = 53
      DataField = 'branch'
      DataSource = dmAux.dscBranches
      TabOrder = 1
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
  end
  object pnlBranches: TRzPanel
    Left = 6
    Top = 271
    Width = 581
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 3
    object grBranches: TRzDBGrid
      Left = 1
      Top = 1
      Width = 579
      Height = 219
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmAux.dscBranches
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
      FramingPreference = fpCustomFraming
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'branch'
          Title.Alignment = taCenter
          Title.Caption = 'Branch'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end>
    end
  end
end
