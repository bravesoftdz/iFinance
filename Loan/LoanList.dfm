inherited frmLoanList: TfrmLoanList
  Caption = 'frmLoanList'
  ClientWidth = 599
  ExplicitWidth = 615
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 599
    ExplicitWidth = 599
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Loans list'
      ExplicitWidth = 58
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
    BorderSides = []
    Color = 14273211
    TabOrder = 1
    DesignSize = (
      599
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
      Width = 539
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 65
    Width = 585
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 583
      Height = 168
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = True
      DataSource = dmApplication.dscLoans
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
          FieldName = 'loan_id'
          Title.Alignment = taCenter
          Title.Caption = 'Loan ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
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
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'class_name'
          Title.Alignment = taCenter
          Title.Caption = 'Loan class'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end>
    end
  end
end
