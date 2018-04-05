inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  ClientHeight = 372
  ClientWidth = 727
  OnCreate = FormCreate
  ExplicitWidth = 743
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 727
    ExplicitWidth = 727
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 727
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = []
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      727
      33)
    object Label1: TLabel
      Left = 181
      Top = 15
      Width = 37
      Height = 14
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 227
      Top = 9
      Width = 492
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
  object pnlDockMain: TRzPanel
    Left = 0
    Top = 28
    Width = 175
    Height = 344
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 2
    DesignSize = (
      175
      344)
    object lblRecentlyAdded: TRzURLLabel
      Left = 23
      Top = 15
      Width = 109
      Height = 14
      Caption = 'Newly-added clients'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblRecentlyAddedClick
    end
    object lblActiveClients: TRzURLLabel
      Left = 23
      Top = 37
      Width = 72
      Height = 14
      Caption = 'Active clients'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblActiveClientsClick
    end
    object lblAllClients: TRzURLLabel
      Left = 23
      Top = 59
      Width = 50
      Height = 14
      Caption = 'All clients'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblAllClientsClick
    end
    object cbxNonClients: TCheckBox
      Left = 12
      Top = 322
      Width = 130
      Height = 17
      Anchors = [akLeft, akRight]
      Caption = 'Include non-clients'
      TabOrder = 0
      OnClick = cbxNonClientsClick
    end
  end
  object pnlList: TRzPanel
    Left = 181
    Top = 67
    Width = 538
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14272955
    TabOrder = 3
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 536
      Height = 298
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = dmApplication.dscClients
      FixedColor = clWhite
      GradientEndColor = 15327448
      GradientStartColor = 15327448
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grListDblClick
      FrameColor = 6572079
      FrameSides = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = 6572079
      AltRowShadingColor = 15854564
      AltRowShadingFixed = False
      Columns = <
        item
          Expanded = False
          FieldName = 'display_id'
          Title.Alignment = taCenter
          Title.Caption = 'Client ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 350
          Visible = True
        end>
    end
  end
end
