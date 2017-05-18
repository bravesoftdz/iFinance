inherited frmPaymentList: TfrmPaymentList
  Caption = 'frmPaymentList'
  ClientHeight = 479
  ClientWidth = 786
  OnCreate = FormCreate
  ExplicitWidth = 802
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 786
    ExplicitWidth = 786
    inherited lblTitle: TRzLabel
      Width = 82
      Caption = 'Payments list'
      ExplicitWidth = 82
    end
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 35
    Width = 491
    Height = 438
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    Color = 14273211
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 489
      Height = 436
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = True
      DataSource = dmApplication.dscPayments
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
          FieldName = 'ref_no'
          Title.Alignment = taCenter
          Title.Caption = 'Reference no.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 140
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel
    Left = 503
    Top = 35
    Width = 276
    Height = 438
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      276
      438)
    object JvLabel1: TJvLabel
      Left = 13
      Top = 87
      Width = 39
      Height = 14
      Caption = 'Branch'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 13
      Top = 39
      Width = 63
      Height = 14
      Caption = 'Date range'
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
      Left = 13
      Top = 106
      Width = 248
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
      TabOrder = 3
    end
    object dteFrom: TRzDateTimeEdit
      Left = 13
      Top = 58
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtonColor = 6572079
      FlatButtons = True
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
    object dteUntil: TRzDateTimeEdit
      Left = 140
      Top = 58
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtonColor = 6572079
      FlatButtons = True
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
    object pnlGo: TRzPanel
      Left = 219
      Top = 410
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6572079
      BorderWidth = 1
      Color = 12955288
      TabOrder = 4
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
