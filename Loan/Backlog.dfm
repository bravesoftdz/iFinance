inherited frmBacklog: TfrmBacklog
  Caption = 'frmBacklog'
  ClientHeight = 230
  ClientWidth = 300
  OnCreate = FormCreate
  ExplicitWidth = 300
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 300
    ExplicitWidth = 300
    inherited imgClose: TImage
      Left = 279
      ExplicitLeft = 279
    end
    inherited lblCaption: TRzLabel
      Width = 44
      Caption = 'Backlog'
      ExplicitWidth = 44
    end
  end
  inherited pnlMain: TRzPanel
    Width = 300
    Height = 209
    ExplicitWidth = 300
    ExplicitHeight = 209
    inherited pnlDetail: TRzPanel
      Width = 283
      Height = 160
      ExplicitWidth = 283
      ExplicitHeight = 160
      inherited pcDetail: TRzPageControl
        Width = 281
        Height = 158
        ExplicitWidth = 281
        ExplicitHeight = 158
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 281
          ExplicitHeight = 158
          object JvLabel5: TJvLabel
            Tag = -1
            Left = 19
            Top = 20
            Width = 73
            Height = 14
            Caption = 'Loan balance'
            Transparent = True
          end
          object JvLabel7: TJvLabel
            Tag = -1
            Left = 19
            Top = 47
            Width = 117
            Height = 14
            Caption = 'Last transaction date'
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 19
            Top = 73
            Width = 70
            Height = 14
            Caption = 'Amortization'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Tag = -1
            Left = 19
            Top = 99
            Width = 83
            Height = 14
            Caption = 'Interest deficit'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Tag = -1
            Left = 19
            Top = 125
            Width = 82
            Height = 14
            Caption = 'Principal deficit'
            Transparent = True
          end
          object edAppAmount: TRzDBNumericEdit
            Tag = 1
            Left = 146
            Top = 14
            Width = 105
            Height = 22
            DataSource = dmLoan.dscLoan
            DataField = 'balance'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object dteLastTransactionDate: TRzDBDateTimeEdit
            Tag = 1
            Left = 146
            Top = 41
            Width = 105
            Height = 22
            DataSource = dmLoan.dscLoan
            DataField = 'last_trans_date'
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object RzDBNumericEdit1: TRzDBNumericEdit
            Tag = 1
            Left = 146
            Top = 67
            Width = 105
            Height = 22
            DataSource = dmLoan.dscLoan
            DataField = 'amort'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object RzDBNumericEdit2: TRzDBNumericEdit
            Tag = 1
            Left = 146
            Top = 93
            Width = 105
            Height = 22
            DataSource = dmLoan.dscLoan
            DataField = 'int_deficit'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 3
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object RzDBNumericEdit3: TRzDBNumericEdit
            Tag = 1
            Left = 146
            Top = 119
            Width = 105
            Height = 22
            DataSource = dmLoan.dscLoan
            DataField = 'prc_deficit'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 4
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 241
      Top = 177
      ExplicitLeft = 241
      ExplicitTop = 177
    end
    inherited pnlSave: TRzPanel
      Left = 185
      Top = 177
      ExplicitLeft = 185
      ExplicitTop = 177
    end
  end
end
