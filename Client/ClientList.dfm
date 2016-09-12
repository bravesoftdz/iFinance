inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  ClientHeight = 287
  ClientWidth = 569
  OnCreate = FormCreate
  ExplicitWidth = 585
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 569
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
    ExplicitWidth = 527
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
      Width = 516
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitWidth = 474
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
    ExplicitWidth = 527
    ExplicitHeight = 181
    DesignSize = (
      569
      226)
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 557
      Height = 190
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
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
    object CheckBox1: TCheckBox
      Left = 8
      Top = 202
      Width = 127
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Display non-clients'
      TabOrder = 1
    end
  end
end
