inherited frmLoanLedger: TfrmLoanLedger
  Caption = 'frmLoanLedger'
  ClientHeight = 400
  ClientWidth = 410
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 410
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 410
    inherited imgClose: TImage
      Left = 389
    end
    inherited lblCaption: TRzLabel
      Width = 39
      Caption = 'Ledger'
      ExplicitWidth = 39
    end
  end
  inherited pnlMain: TRzPanel
    Width = 410
    Height = 379
    object pnlLedger: TRzPanel
      Left = 8
      Top = 8
      Width = 394
      Height = 363
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 8675134
      BorderWidth = 1
      ParentColor = True
      TabOrder = 0
      ExplicitWidth = 483
      ExplicitHeight = 403
      object grLedger: TRzDBGrid
        Left = 1
        Top = 1
        Width = 392
        Height = 361
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmLoan.dscLedger
        DrawingStyle = gdsGradient
        FixedColor = 12955288
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            FieldName = 'Interest'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 90
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
            Width = 90
            Visible = True
          end>
      end
    end
  end
end
