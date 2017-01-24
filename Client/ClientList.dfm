inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  ClientHeight = 287
  ClientWidth = 569
  OnCreate = FormCreate
  ExplicitWidth = 585
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 569
    ExplicitWidth = 569
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 569
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = []
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      569
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
      Width = 395
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
    object cbxNonClients: TCheckBox
      Left = 455
      Top = 12
      Width = 103
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Show non-clients'
      TabOrder = 1
      OnClick = cbxNonClientsClick
    end
  end
  object pnlList: TRzPanel
    Left = 8
    Top = 65
    Width = 553
    Height = 215
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 551
      Height = 213
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = True
      DataSource = dmApplication.dscClients
      DrawingStyle = gdsGradient
      FixedColor = 6572079
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grListDblClick
      FrameColor = 6572079
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = 6572079
      LineColor = 6572079
      AltRowShadingColor = 15854564
      AltRowShadingFixed = False
      Columns = <
        item
          Expanded = False
          FieldName = 'display_id'
          Title.Alignment = taCenter
          Title.Caption = 'Client ID'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Width = 350
          Visible = True
        end>
    end
  end
end
