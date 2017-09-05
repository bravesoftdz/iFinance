inherited frmPaymentDetail: TfrmPaymentDetail
  Caption = 'frmPaymentDetail'
  ClientHeight = 415
  ClientWidth = 571
  OnCreate = FormCreate
  ExplicitWidth = 571
  ExplicitHeight = 415
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 571
    ExplicitWidth = 343
    inherited imgClose: TImage
      Left = 550
      ExplicitLeft = 318
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Payment details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 571
    Height = 394
    ExplicitWidth = 343
    ExplicitHeight = 297
    inherited pnlDetail: TRzPanel
      Width = 554
      Height = 345
      ExplicitWidth = 326
      ExplicitHeight = 248
      inherited pcDetail: TRzPageControl
        Width = 552
        Height = 343
        ExplicitWidth = 324
        ExplicitHeight = 246
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 324
          ExplicitHeight = 246
          object JvLabel1: TJvLabel
            Left = 19
            Top = 23
            Width = 54
            Height = 14
            Caption = 'Loan ID:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 47
            Width = 35
            Height = 14
            Caption = 'Type:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel3: TJvLabel
            Left = 315
            Top = 23
            Width = 57
            Height = 14
            Caption = 'Account:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel4: TJvLabel
            Left = 315
            Top = 47
            Width = 52
            Height = 14
            Caption = 'Balance:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lblLoanId: TJvLabel
            Left = 83
            Top = 23
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lblType: TJvLabel
            Left = 83
            Top = 47
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lblAccount: TJvLabel
            Left = 379
            Top = 23
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lblBalance: TJvLabel
            Left = 379
            Top = 47
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvLabel5: TJvLabel
            Left = 315
            Top = 85
            Width = 45
            Height = 14
            Caption = 'Principal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvLabel6: TJvLabel
            Left = 315
            Top = 142
            Width = 46
            Height = 14
            Caption = 'Interest'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lblTotal: TJvLabel
            Left = 315
            Top = 298
            Width = 162
            Height = 23
            Caption = 'Total amount: 0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Anchors = [akLeft, akBottom]
            ParentFont = False
            Transparent = True
          end
          object JvLabel8: TJvLabel
            Left = 315
            Top = 199
            Width = 42
            Height = 14
            Caption = 'Penalty'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object edPrincipal: TRzNumericEdit
            Left = 315
            Top = 105
            Width = 214
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentFont = False
            TabOnEnter = True
            TabOrder = 0
            OnChange = edPrincipalChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object edInterest: TRzNumericEdit
            Left = 315
            Top = 162
            Width = 214
            Height = 31
            Color = 13290239
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentFont = False
            TabOrder = 1
            OnChange = edInterestChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object edPenalty: TRzNumericEdit
            Left = 315
            Top = 219
            Width = 214
            Height = 31
            Color = 13290239
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentFont = False
            TabOrder = 2
            OnChange = edPenaltyChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object pnlLedger: TRzPanel
            Left = 19
            Top = 87
            Width = 264
            Height = 234
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderOuter = fsNone
            BorderColor = 8675134
            BorderWidth = 1
            ParentColor = True
            TabOrder = 3
            ExplicitWidth = 268
            object grLedger: TRzDBGrid
              Left = 1
              Top = 1
              Width = 262
              Height = 232
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
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 512
      Top = 362
      ExplicitLeft = 284
      ExplicitTop = 265
    end
    inherited pnlSave: TRzPanel
      Left = 456
      Top = 362
      ExplicitLeft = 228
      ExplicitTop = 265
      inherited btnSave: TRzShapeButton
        Caption = 'Add'
      end
    end
  end
end
