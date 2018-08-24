inherited frmBanksList: TfrmBanksList
  Caption = 'frmBanksList'
  ClientHeight = 498
  ClientWidth = 877
  OnShow = FormShow
  ExplicitWidth = 893
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 8
    Top = 15
    Width = 26
    Height = 14
    Caption = 'Bank'
  end
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
    TabOrder = 1
    DesignSize = (
      276
      483)
    object Label2: TLabel
      Left = 13
      Top = 23
      Width = 60
      Height = 14
      Caption = 'Bank name'
    end
    object Label3: TLabel
      Left = 13
      Top = 50
      Width = 37
      Height = 14
      Caption = 'Branch'
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
      TabOrder = 1
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
    object mmBranch: TRzDBMemo
      Left = 81
      Top = 44
      Width = 176
      Height = 53
      DataField = 'branch'
      DataSource = dmAux.dscBranches
      TabOrder = 0
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
    object edBankName: TRzEdit
      Left = 81
      Top = 17
      Width = 176
      Height = 22
      Text = ''
      Color = 15327448
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = 15327448
      TabOrder = 2
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 37
    Width = 581
    Height = 455
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    object grBranches: TRzDBGrid
      Left = 1
      Top = 1
      Width = 579
      Height = 453
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
  object cmbBanks: TRzComboBox
    Left = 44
    Top = 9
    Width = 542
    Height = 22
    AllowEdit = False
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = False
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    Sorted = True
    TabOrder = 3
    OnClick = cmbBanksClick
  end
end
