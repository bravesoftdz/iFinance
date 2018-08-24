inherited frmPaymentDetail: TfrmPaymentDetail
  Caption = 'frmPaymentDetail'
  ClientHeight = 305
  ClientWidth = 775
  OnCreate = FormCreate
  ExplicitWidth = 775
  ExplicitHeight = 305
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 775
    ExplicitWidth = 775
    inherited imgClose: TImage
      Left = 754
      ExplicitLeft = 318
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Payment details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 775
    Height = 284
    ExplicitWidth = 775
    ExplicitHeight = 284
    object urlLedger: TRzURLLabel [0]
      Tag = 1
      Left = 10
      Top = 256
      Width = 68
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'Open ledger'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlLedgerClick
      ExplicitTop = 287
    end
    inherited pnlDetail: TRzPanel
      Width = 758
      Height = 235
      ExplicitWidth = 758
      ExplicitHeight = 235
      inherited pcDetail: TRzPageControl
        Width = 756
        Height = 233
        ExplicitWidth = 756
        ExplicitHeight = 233
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitLeft = 1
          ExplicitTop = -3
          ExplicitWidth = 756
          ExplicitHeight = 233
          object urlPrincipalAmortization: TRzURLLabel
            Tag = 1
            Left = 159
            Top = 120
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlPrincipalAmortizationClick
          end
          object urlInterestAmortization: TRzURLLabel
            Tag = 1
            Left = 159
            Top = 55
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlInterestAmortizationClick
          end
          object urlAmortization: TRzURLLabel
            Tag = 1
            Left = 367
            Top = 81
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlAmortizationClick
          end
          object urlInterestDueOnPaymentDate: TRzURLLabel
            Tag = 1
            Left = 640
            Top = 131
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlInterestDueOnPaymentDateClick
          end
          object urlTotalInterestDue: TRzURLLabel
            Tag = 1
            Left = 600
            Top = 156
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlTotalInterestDueClick
          end
          object Label1: TLabel
            Left = 19
            Top = 55
            Width = 50
            Height = 14
            Caption = 'Interest'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 120
            Top = 55
            Width = 24
            Height = 14
            Caption = 'Due'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 120
            Top = 119
            Width = 24
            Height = 14
            Caption = 'Due'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 19
            Top = 119
            Width = 51
            Height = 14
            Caption = 'Principal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 268
            Top = 31
            Width = 52
            Height = 14
            Caption = 'Loan ID:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 268
            Top = 55
            Width = 33
            Height = 14
            Caption = 'Type:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 268
            Top = 81
            Width = 84
            Height = 14
            Caption = 'Amortization:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 268
            Top = 105
            Width = 84
            Height = 14
            Caption = 'Loan balance:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 268
            Top = 131
            Width = 96
            Height = 14
            Caption = 'Interest deficit:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 268
            Top = 156
            Width = 97
            Height = 14
            Caption = 'Principal deficit:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 474
            Top = 31
            Width = 55
            Height = 14
            Caption = 'Account:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 474
            Top = 81
            Width = 104
            Height = 14
            Caption = 'Last transaction:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 474
            Top = 105
            Width = 33
            Height = 14
            Caption = 'Days:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 474
            Top = 131
            Width = 152
            Height = 14
            Caption = 'Due as of payment date:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 474
            Top = 156
            Width = 114
            Height = 14
            Caption = 'Total interest due:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLoanId: TLabel
            Left = 340
            Top = 31
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblType: TLabel
            Left = 322
            Top = 55
            Width = 30
            Height = 17
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLoanBalance: TLabel
            Left = 372
            Top = 105
            Width = 30
            Height = 15
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblInterestDeficit: TLabel
            Left = 380
            Top = 130
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblPrincipalDeficit: TLabel
            Left = 380
            Top = 156
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblRemainingAmount: TLabel
            Left = 268
            Top = 192
            Width = 127
            Height = 14
            Caption = 'Remaining amount: xxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblAccount: TLabel
            Left = 545
            Top = 31
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLastTransaction: TLabel
            Left = 599
            Top = 81
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDays: TLabel
            Left = 523
            Top = 105
            Width = 30
            Height = 14
            Caption = 'xxxxx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblTotal: TLabel
            Left = 19
            Top = 193
            Width = 119
            Height = 14
            Caption = 'Total amount: 0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPrincipal: TRzNumericEdit
            Left = 19
            Top = 140
            Width = 198
            Height = 31
            DisabledColor = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentFont = False
            TabOnEnter = True
            TabOrder = 2
            OnChange = edPrincipalChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object edInterest: TRzNumericEdit
            Left = 19
            Top = 75
            Width = 198
            Height = 31
            Color = 13290239
            DisabledColor = 13290239
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentFont = False
            TabOrder = 1
            OnChange = edInterestChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object edPenalty: TRzNumericEdit
            Left = 19
            Top = 317
            Width = 198
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
            TabOrder = 3
            Visible = False
            OnChange = edPenaltyChange
            IntegersOnly = False
            DisplayFormat = '###,###,##0.00'
          end
          object cbxFullPayment: TRzCheckBox
            Left = 19
            Top = 21
            Width = 88
            Height = 16
            Caption = 'Full payment'
            State = cbUnchecked
            TabOrder = 0
            OnClick = cbxFullPaymentClick
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 716
      Top = 252
      ExplicitLeft = 716
      ExplicitTop = 252
    end
    inherited pnlSave: TRzPanel
      Left = 660
      Top = 252
      ExplicitLeft = 660
      ExplicitTop = 252
      inherited btnSave: TRzShapeButton
        Caption = 'Add'
      end
    end
  end
end
