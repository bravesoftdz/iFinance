inherited frmPaymentList: TfrmPaymentList
  Caption = 'frmPaymentList'
  ClientHeight = 479
  ClientWidth = 977
  OnCreate = FormCreate
  ExplicitWidth = 993
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 977
    ExplicitWidth = 977
    inherited lblTitle: TRzLabel
      Width = 82
      Caption = 'Payments list'
      ExplicitWidth = 82
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 35
    Width = 682
    Height = 438
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 680
      Height = 436
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = dmApplication.dscPayments
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
      FrameColor = 15327448
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
          FieldName = 'payment_date'
          Title.Alignment = taCenter
          Title.Caption = 'Date'
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
          FieldName = 'receipt_no'
          Title.Alignment = taCenter
          Title.Caption = 'Receipt No.'
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
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'wd_amt'
          Title.Alignment = taCenter
          Title.Caption = 'Withdrawn'
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
          FieldName = 'total_amount'
          Title.Alignment = taCenter
          Title.Caption = 'Amount'
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
          FieldName = 'change'
          Title.Alignment = taCenter
          Title.Caption = 'Change'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel
    Left = 694
    Top = 35
    Width = 276
    Height = 438
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      438)
    object JvLabel1: TJvLabel
      Left = 13
      Top = 71
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 13
      Top = 23
      Width = 63
      Height = 14
      Caption = 'Date range'
      Transparent = True
    end
    object cmbBranch: TRzComboBox
      Left = 13
      Top = 90
      Width = 248
      Height = 22
      AllowEdit = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      ReadOnlyColor = clWhite
      Sorted = True
      TabOrder = 2
    end
    object dteFrom: TRzDateTimeEdit
      Left = 13
      Top = 42
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtonColor = 6572079
      FlatButtons = True
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
    end
    object dteUntil: TRzDateTimeEdit
      Left = 140
      Top = 42
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtonColor = 6572079
      FlatButtons = True
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
    object pnlGo: TRzPanel
      Left = 13
      Top = 146
      Width = 50
      Height = 22
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 3
      object btnGo: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Go'
        Caption = 'Go'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGoClick
      end
    end
  end
end
