inherited frmWithdrawalDetail: TfrmWithdrawalDetail
  Caption = 'frmWithdrawalDetail'
  ClientHeight = 224
  ClientWidth = 387
  ExplicitWidth = 387
  ExplicitHeight = 224
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 387
    inherited imgClose: TImage
      Left = 366
    end
    inherited lblCaption: TRzLabel
      Width = 105
      Caption = 'Withdrawal details'
      ExplicitWidth = 105
    end
  end
  inherited pnlMain: TRzPanel
    Width = 387
    Height = 203
    inherited pnlDetail: TRzPanel
      Width = 370
      Height = 154
      inherited pcDetail: TRzPageControl
        Width = 368
        Height = 152
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitTop = -3
          ExplicitWidth = 312
          ExplicitHeight = 152
          object JvLabel7: TJvLabel
            Tag = -1
            Left = 19
            Top = 21
            Width = 28
            Height = 14
            Caption = 'Date'
            Transparent = True
          end
          object c: TJvLabel
            Tag = -1
            Left = 19
            Top = 45
            Width = 32
            Height = 14
            Caption = 'Client'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 19
            Top = 69
            Width = 70
            Height = 14
            Caption = 'Account no.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvLabel5: TJvLabel
            Tag = -1
            Left = 19
            Top = 119
            Width = 46
            Height = 14
            Caption = 'Amount'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Tag = -1
            Left = 19
            Top = 93
            Width = 48
            Height = 14
            Caption = 'Card no.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object dteWithdrawalDate: TRzDBDateTimeEdit
            Tag = 1
            Left = 114
            Top = 15
            Width = 105
            Height = 22
            DataSource = dmPayment.dscWithdrawal
            DataField = 'wd_date'
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object edWithdrawn: TRzDBNumericEdit
            Tag = 1
            Left = 114
            Top = 111
            Width = 105
            Height = 22
            DataSource = dmPayment.dscWithdrawal
            DataField = 'wd_amt'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 4
            DisplayFormat = '###,##0.00'
          end
          object edCardNo: TRzEdit
            Left = 114
            Top = 87
            Width = 231
            Height = 22
            Text = ''
            CharCase = ecUpperCase
            Color = 14273211
            DisabledColor = 14273211
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnly = True
            ReadOnlyColor = 14273211
            TabOrder = 3
          end
          object bteClient: TRzButtonEdit
            Left = 114
            Top = 39
            Width = 231
            Height = 22
            Text = ''
            Color = clWhite
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentShowHint = False
            ReadOnly = True
            ReadOnlyColor = clWhite
            ShowHint = True
            TabOnEnter = True
            TabOrder = 1
            AllowKeyEdit = False
            ButtonHint = 'Find client'
            AltBtnKind = bkReject
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtons = True
            HideButtonsOnReadOnly = False
            OnButtonClick = bteClientButtonClick
          end
          object dbluAccount: TRzDBLookupComboBox
            Tag = 1
            Left = 114
            Top = 63
            Width = 231
            Height = 22
            DataField = 'acct_no'
            DataSource = dmPayment.dscWithdrawal
            Enabled = False
            KeyField = 'acct_no'
            ListField = 'bank_details'
            ListSource = dmPayment.dscAcctInfo
            TabOrder = 2
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 328
      Top = 171
    end
    inherited pnlSave: TRzPanel
      Left = 272
      Top = 171
    end
  end
end
