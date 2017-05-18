inherited frmPaymentDetail: TfrmPaymentDetail
  Caption = 'frmPaymentDetail'
  ClientHeight = 341
  ClientWidth = 343
  OnCreate = FormCreate
  ExplicitWidth = 343
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 343
    ExplicitWidth = 343
    inherited imgClose: TImage
      Left = 322
      ExplicitLeft = 318
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Payment details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 343
    Height = 320
    ExplicitWidth = 343
    ExplicitHeight = 294
    inherited pnlDetail: TRzPanel
      Width = 326
      Height = 271
      ExplicitWidth = 326
      ExplicitHeight = 245
      inherited pcDetail: TRzPageControl
        Width = 324
        Height = 269
        ExplicitWidth = 324
        ExplicitHeight = 243
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitTop = -3
          ExplicitWidth = 324
          ExplicitHeight = 295
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
            Left = 184
            Top = 23
            Width = 57
            Height = 14
            Caption = 'Account:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Anchors = [akTop, akRight]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel4: TJvLabel
            Left = 184
            Top = 47
            Width = 52
            Height = 14
            Caption = 'Balance:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Anchors = [akTop, akRight]
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
            Left = 248
            Top = 23
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Anchors = [akTop, akRight]
            ParentFont = False
            Transparent = True
          end
          object lblBalance: TJvLabel
            Left = 248
            Top = 47
            Width = 32
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Anchors = [akTop, akRight]
            ParentFont = False
            Transparent = True
          end
          object JvLabel5: TJvLabel
            Left = 19
            Top = 117
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
            Left = 18
            Top = 154
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
            Left = 19
            Top = 236
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
            ExplicitTop = 213
          end
          object JvLabel7: TJvLabel
            Left = 19
            Top = 89
            Width = 44
            Height = 14
            Caption = 'Method'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvLabel8: TJvLabel
            Left = 18
            Top = 191
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
            Left = 83
            Top = 111
            Width = 221
            Height = 31
            Anchors = [akLeft, akTop, akRight]
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
            Left = 83
            Top = 148
            Width = 221
            Height = 31
            Anchors = [akLeft, akTop, akRight]
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
          object cmbPaymentMethod: TRzComboBox
            Left = 83
            Top = 83
            Width = 221
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
            TabOrder = 2
          end
          object edPenalty: TRzNumericEdit
            Left = 83
            Top = 185
            Width = 221
            Height = 31
            Anchors = [akLeft, akTop, akRight]
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
            TabOrder = 3
            OnChange = edInterestChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 284
      Top = 288
      ExplicitLeft = 284
      ExplicitTop = 262
    end
    inherited pnlSave: TRzPanel
      Left = 228
      Top = 288
      ExplicitLeft = 228
      ExplicitTop = 262
      inherited btnSave: TRzShapeButton
        Caption = 'Add'
      end
    end
  end
end
