inherited frmLoanLedger: TfrmLoanLedger
  Caption = 'frmLoanLedger'
  ClientHeight = 400
  ClientWidth = 561
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 561
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 561
    ExplicitWidth = 561
    inherited imgClose: TImage
      Left = 540
      ExplicitLeft = 389
    end
    inherited lblCaption: TRzLabel
      Width = 39
      Caption = 'Ledger'
      ExplicitWidth = 39
    end
  end
  inherited pnlMain: TRzPanel
    Width = 561
    Height = 379
    ExplicitWidth = 561
    ExplicitHeight = 379
    object pnlLedger: TRzPanel
      Left = 8
      Top = 8
      Width = 545
      Height = 363
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 8675134
      BorderWidth = 1
      ParentColor = True
      TabOrder = 0
      object grLedger: TRzDBGrid
        Left = 1
        Top = 1
        Width = 543
        Height = 361
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmLoan.dscLedger
        DefaultDrawing = False
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
            FieldName = 'Due'
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
            FieldName = 'Principal'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'Interest'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Color = clBtnHighlight
            Expanded = False
            FieldName = 'Balance_Principal'
            Title.Alignment = taCenter
            Title.Caption = 'Balance (P)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Color = 12040191
            Expanded = False
            FieldName = 'Balance_Interest'
            Title.Alignment = taCenter
            Title.Caption = 'Balance (I)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end>
      end
    end
  end
end
