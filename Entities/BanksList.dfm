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
    Top = -30
    Width = 877
    Align = alNone
    ExplicitTop = -30
    ExplicitWidth = 877
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Banks list'
      ExplicitWidth = 58
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 9
    Width = 581
    Height = 120
    Anchors = [akLeft, akTop, akRight]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 579
      Height = 118
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = dmAux.dscBanks
      FixedColor = clWhite
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
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
    Top = 9
    Width = 276
    Height = 483
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      483)
    object JvLabel1: TJvLabel
      Left = 13
      Top = 23
      Width = 62
      Height = 14
      Caption = 'Bank name'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 13
      Top = 50
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object pnlAdd: TRzPanel
      Left = 8
      Top = 453
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
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
    object edBankName: TRzDBEdit
      Left = 81
      Top = 17
      Width = 176
      Height = 22
      DataSource = dmAux.dscBanks
      DataField = 'bank_name'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = 15327448
      FocusColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15327448
      TabOrder = 0
    end
    object mmBranch: TRzDBMemo
      Left = 81
      Top = 44
      Width = 176
      Height = 53
      DataField = 'branch'
      DataSource = dmAux.dscBranches
      TabOrder = 1
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
  end
  object pnlBranches: TRzPanel
    Left = 6
    Top = 135
    Width = 581
    Height = 357
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    TabOrder = 3
    object grBranches: TRzDBGrid
      Left = 1
      Top = 1
      Width = 579
      Height = 355
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = dmAux.dscBranches
      FixedColor = clWhite
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
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
