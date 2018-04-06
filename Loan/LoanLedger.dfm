inherited frmLoanLedger: TfrmLoanLedger
  Caption = 'frmLoanLedger'
  ClientHeight = 494
  ClientWidth = 709
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 709
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 709
    ExplicitWidth = 709
    DesignSize = (
      709
      21)
    inherited imgClose: TImage
      Left = 688
      ExplicitLeft = 389
    end
    inherited lblCaption: TRzLabel
      Width = 39
      Caption = 'Ledger'
      ExplicitWidth = 39
    end
  end
  inherited pnlMain: TRzPanel
    Width = 709
    Height = 473
    ExplicitWidth = 709
    ExplicitHeight = 473
    object RzLabel3: TRzLabel
      Left = 248
      Top = 437
      Width = 77
      Height = 14
      Caption = 'Total deficit:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblPrincipalDeficit: TRzLabel
      Left = 390
      Top = 437
      Width = 25
      Height = 14
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblInterestDeficit: TRzLabel
      Left = 654
      Top = 437
      Width = 25
      Height = 14
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 504
      Top = 437
      Width = 77
      Height = 14
      Caption = 'Total deficit:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object pnlLedger: TRzPanel
      Left = 8
      Top = 32
      Width = 693
      Height = 387
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      ParentColor = True
      TabOrder = 0
      object grLedger: TRzDBGrid
        Left = 1
        Top = 1
        Width = 691
        Height = 385
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = dmLoan.dscLedger
        FixedColor = clWhite
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grLedgerDrawColumnCell
        DisabledColor = clWhite
        FrameColor = 6572079
        FrameStyle = fsNone
        FramingPreference = fpCustomFraming
        FixedLineColor = clWhite
        LineColor = clWhite
        AltRowShadingColor = 15854564
        Columns = <
          item
            Expanded = False
            FieldName = 'due'
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
            FieldName = 'document_no'
            Title.Alignment = taCenter
            Title.Caption = 'Document #'
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
            FieldName = 'debit_amt_p'
            Title.Alignment = taCenter
            Title.Caption = 'DR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Color = 15134950
            Expanded = False
            FieldName = 'credit_amt_p'
            Title.Alignment = taCenter
            Title.Caption = 'CR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Color = clBtnHighlight
            Expanded = False
            FieldName = 'balance_p'
            Title.Alignment = taCenter
            Title.Caption = 'Balance'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Color = clBtnHighlight
            Expanded = False
            FieldName = 'debit_amt_i'
            Title.Alignment = taCenter
            Title.Caption = 'DR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Color = 15134950
            Expanded = False
            FieldName = 'credit_amt_i'
            Title.Alignment = taCenter
            Title.Caption = 'CR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'balance_i'
            Title.Alignment = taCenter
            Title.Caption = 'Balance'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end>
      end
    end
    object RzPanel1: TRzPanel
      Left = 202
      Top = 13
      Width = 238
      Height = 19
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight]
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      GradientColorStyle = gcsCustom
      GradientColorStart = 12955288
      GradientColorStop = 12955288
      GradientDirection = gdVerticalEnd
      TabOrder = 1
      VisualStyle = vsClassic
      object RzLabel1: TRzLabel
        Left = 95
        Top = 3
        Width = 60
        Height = 13
        Caption = 'PRINCIPAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object RzPanel2: TRzPanel
      Left = 439
      Top = 13
      Width = 238
      Height = 19
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight]
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      GradientColorStyle = gcsCustom
      GradientColorStart = 12955288
      GradientColorStop = 12955288
      GradientDirection = gdVerticalEnd
      TabOrder = 2
      VisualStyle = vsClassic
      object RzLabel2: TRzLabel
        Left = 95
        Top = 3
        Width = 53
        Height = 13
        Caption = 'INTEREST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
end
