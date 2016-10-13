inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  ClientHeight = 287
  ClientWidth = 569
  ExplicitWidth = 585
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
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
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 1
    DesignSize = (
      569
      33)
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 47
      Top = 9
      Width = 402
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
    object cbxNonClients: TCheckBox
      Left = 460
      Top = 11
      Width = 103
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Show non-clients'
      TabOrder = 1
      OnClick = cbxNonClientsClick
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 61
    Width = 569
    Height = 226
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 557
      Height = 215
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dmApplication.dscClients
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grListDblClick
      AltRowShading = True
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'display_id'
          Title.Caption = 'Client ID'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 350
          Visible = True
        end>
    end
  end
end
