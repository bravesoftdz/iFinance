inherited frmPaymentDetail: TfrmPaymentDetail
  Caption = 'frmPaymentDetail'
  ClientHeight = 222
  ClientWidth = 339
  OnCreate = FormCreate
  ExplicitWidth = 339
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 339
    inherited imgClose: TImage
      Left = 318
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Payment details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 339
    Height = 201
    inherited pnlDetail: TRzPanel
      Width = 322
      Height = 152
      inherited pcDetail: TRzPageControl
        Width = 320
        Height = 150
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
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
            Left = 188
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
            Left = 188
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
            Left = 252
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
            Left = 252
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
            Top = 71
            Width = 56
            Height = 14
            Caption = 'Amount:'
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
          object edAmount: TRzNumericEdit
            Left = 19
            Top = 91
            Width = 281
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
            TabOrder = 0
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
            ExplicitWidth = 232
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 280
      Top = 169
    end
    inherited pnlSave: TRzPanel
      Left = 224
      Top = 169
      inherited btnSave: TRzShapeButton
        Caption = 'Add'
      end
    end
  end
end
