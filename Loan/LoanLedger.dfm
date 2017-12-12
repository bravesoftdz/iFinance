inherited frmLoanLedger: TfrmLoanLedger
  Caption = 'frmLoanLedger'
  ClientHeight = 405
  ClientWidth = 689
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 689
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 689
    ExplicitWidth = 679
    DesignSize = (
      689
      21)
    inherited imgClose: TImage
      Left = 668
      ExplicitLeft = 389
    end
    inherited lblCaption: TRzLabel
      Width = 39
      Caption = 'Ledger'
      ExplicitWidth = 39
    end
  end
  inherited pnlMain: TRzPanel
    Width = 689
    Height = 384
    ExplicitWidth = 679
    ExplicitHeight = 384
    object pnlLedger: TRzPanel
      Left = 8
      Top = 24
      Width = 673
      Height = 352
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 8675134
      BorderWidth = 1
      ParentColor = True
      TabOrder = 0
      ExplicitWidth = 663
      object grLedger: TRzDBGrid
        Left = 1
        Top = 1
        Width = 671
        Height = 350
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmLoan.dscLedger
        DrawingStyle = gdsGradient
        FixedColor = 12955288
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
            Color = 14281433
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
            Color = 14281433
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
      Left = 190
      Top = 5
      Width = 238
      Height = 19
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight]
      BorderColor = 8675134
      BorderWidth = 1
      Color = 12955288
      GradientColorStyle = gcsCustom
      GradientColorStart = 12955288
      GradientColorStop = 12955288
      GradientDirection = gdVerticalEnd
      TabOrder = 1
      VisualStyle = vsGradient
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
      Left = 427
      Top = 5
      Width = 238
      Height = 19
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight]
      BorderColor = 8675134
      BorderWidth = 1
      Color = 12955288
      GradientColorStyle = gcsCustom
      GradientColorStart = 12955288
      GradientColorStop = 12955288
      GradientDirection = gdVerticalEnd
      TabOrder = 2
      VisualStyle = vsGradient
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
