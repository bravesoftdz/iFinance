inherited frmLoanList: TfrmLoanList
  Caption = 'frmLoanList'
  ClientWidth = 599
  ExplicitWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 599
    ExplicitWidth = 599
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Loans list'
      ExplicitWidth = 58
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 61
    Width = 599
    Height = 181
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 587
      Height = 170
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dmApplication.dscLoans
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
          FieldName = 'loan_id'
          Title.Caption = 'Loan ID'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'class_name'
          Title.Caption = 'Loan class'
          Width = 120
          Visible = True
        end>
    end
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 599
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 2
    DesignSize = (
      599
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
      Width = 546
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
end
