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
    ExplicitWidth = 786
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
    Anchors = [akLeft, akTop, akRight]
    BorderInner = fsFlat
    BorderOuter = fsNone
    BorderSides = []
    Color = 15327448
    TabOrder = 1
    DesignSize = (
      786
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
      Width = 551
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
  object pnlList: TRzPanel
    Left = 181
    Top = 67
    Width = 597
    Height = 436
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    TabOrder = 2
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 595
      Height = 434
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = dmApplication.dscLoans
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
      OnDblClick = grListDblClick
      FrameColor = 14272955
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
          FieldName = 'balance_f'
          Title.Caption = 'Balance'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
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
  object pnlDockMain: TRzPanel
    Left = 0
    Top = 28
    Width = 175
    Height = 481
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 3
    object urlPending: TRzURLLabel
      Left = 23
      Top = 15
      Width = 44
      Height = 14
      Caption = 'Pending'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlPendingClick
    end
    object urlAssessed: TRzURLLabel
      Left = 23
      Top = 37
      Width = 49
      Height = 14
      Caption = 'Assessed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlAssessedClick
    end
    object urlApproved: TRzURLLabel
      Left = 23
      Top = 59
      Width = 53
      Height = 14
      Caption = 'Approved'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlApprovedClick
    end
    object urlActive: TRzURLLabel
      Left = 23
      Top = 83
      Width = 34
      Height = 14
      Caption = 'Active'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlActiveClick
    end
    object urlCancelled: TRzURLLabel
      Left = 23
      Top = 107
      Width = 51
      Height = 14
      Caption = 'Cancelled'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlCancelledClick
    end
    object urlRejected: TRzURLLabel
      Left = 23
      Top = 131
      Width = 49
      Height = 14
      Caption = 'Rejected'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRejectedClick
    end
    object urlClosed: TRzURLLabel
      Left = 23
      Top = 155
      Width = 35
      Height = 14
      Caption = 'Closed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlClosedClick
    end
  end
end
