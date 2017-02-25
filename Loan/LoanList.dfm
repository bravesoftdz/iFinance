inherited frmLoanList: TfrmLoanList
  Caption = 'frmLoanList'
  ClientHeight = 509
  ClientWidth = 786
  ExplicitWidth = 802
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 786
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
    Width = 786
    Height = 33
    Align = alTop
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = []
    Color = 14273211
    TabOrder = 1
    ExplicitWidth = 599
    DesignSize = (
      786
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
      Width = 446
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
    Width = 491
    Height = 437
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 489
      Height = 435
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
          Width = 250
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel
    Left = 503
    Top = 64
    Width = 276
    Height = 437
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      276
      437)
    object JvLabel1: TJvLabel
      Left = 13
      Top = 39
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object JvLabel12: TJvLabel
      Left = 13
      Top = 63
      Width = 28
      Height = 14
      Caption = 'Date'
      Transparent = True
    end
    object pnlDetailHead: TRzPanel
      Left = 1
      Top = 1
      Width = 274
      Height = 19
      Align = alTop
      BorderOuter = fsNone
      BorderSides = [sdBottom]
      BorderColor = clBlack
      BorderWidth = 1
      Color = 8675134
      GradientColorStyle = gcsCustom
      GradientColorStart = 6572079
      GradientColorStop = 8675134
      TabOrder = 0
      VisualStyle = vsGradient
      object lblDetailHeadCaption: TRzLabel
        Left = 7
        Top = 2
        Width = 30
        Height = 14
        Caption = 'Filter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object cmbBranch: TRzComboBox
      Left = 58
      Top = 33
      Width = 207
      Height = 22
      AllowEdit = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      ReadOnlyColor = clWhite
      Sorted = True
      TabOrder = 1
    end
    object RzDateTimeEdit1: TRzDateTimeEdit
      Left = 58
      Top = 57
      Width = 121
      Height = 22
      EditType = etDate
      FlatButtons = True
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
