inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 527
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 1
    DesignSize = (
      527
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
      Width = 475
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 61
    Width = 527
    Height = 181
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 515
      Height = 170
      Align = alClient
      DataSource = dmApplication.dscEntities
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
          FieldName = 'entity_id'
          Title.Caption = 'Client ID'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lastname'
          Title.Caption = 'Lastname'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'firstname'
          Title.Caption = 'Firstname'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'middlename'
          Title.Caption = 'Middlename'
          Width = 150
          Visible = True
        end>
    end
  end
end
