inherited frmLoanList: TfrmLoanList
  Caption = 'frmLoanList'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Loans list'
      ExplicitWidth = 58
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
    TabOrder = 1
    ExplicitLeft = -42
    ExplicitTop = 16
    ExplicitWidth = 569
    ExplicitHeight = 226
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 515
      Height = 170
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
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 527
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 2
    ExplicitLeft = -42
    ExplicitWidth = 569
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
      Width = 474
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
end
