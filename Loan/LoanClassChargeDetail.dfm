inherited frmLoanClassChargeDetail: TfrmLoanClassChargeDetail
  Caption = 'frmLoanClassChargeDetail'
  ClientHeight = 261
  ClientWidth = 292
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 292
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 292
    ExplicitWidth = 303
    inherited imgClose: TImage
      Left = 271
      ExplicitLeft = 349
    end
    inherited lblCaption: TRzLabel
      Width = 145
      Caption = 'Loan classification charge'
      ExplicitWidth = 145
    end
  end
  inherited pnlMain: TRzPanel
    Width = 292
    Height = 240
    ExplicitWidth = 303
    ExplicitHeight = 240
    inherited pnlDetail: TRzPanel
      Width = 276
      Height = 194
      ExplicitWidth = 287
      ExplicitHeight = 194
      inherited pcDetail: TRzPageControl
        Width = 274
        Height = 192
        ExplicitWidth = 285
        ExplicitHeight = 192
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 285
          ExplicitHeight = 192
          object JvLabel1: TJvLabel
            Left = 19
            Top = 23
            Width = 30
            Height = 14
            Caption = 'Type'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 47
            Width = 32
            Height = 14
            Caption = 'Value'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Left = 19
            Top = 133
            Width = 33
            Height = 14
            Caption = 'Ratio '
            Transparent = True
          end
          object JvLabel4: TJvLabel
            Left = 19
            Top = 157
            Width = 52
            Height = 14
            Caption = 'Maximum'
            Transparent = True
          end
          object rbgValueType: TRzDBRadioGroup
            Left = 73
            Top = 65
            Width = 196
            Height = 56
            DataField = 'value_type'
            DataSource = dmLoansAux.dscClassCharges
            Items.Strings = (
              'Fixed amount'
              'Percentage'
              'Ratio')
            Values.Strings = (
              '0'
              '1'
              '2')
            OnChange = rbgValueTypeChange
            BorderColor = 15263976
            BorderSides = []
            Caption = ''
            Color = 14273211
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 2
            TabStop = True
            OnClick = rbgValueTypeChange
          end
          object edValue: TRzDBNumericEdit
            Left = 81
            Top = 41
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'charge_value'
            Alignment = taLeftJustify
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object dbluType: TRzDBLookupComboBox
            Tag = 1
            Left = 81
            Top = 17
            Width = 168
            Height = 22
            DataField = 'charge_type'
            DataSource = dmLoansAux.dscClassCharges
            KeyField = 'charge_type'
            ListField = 'charge_name'
            ListSource = dmLoansAux.dscChargeType
            TabOrder = 0
            AllowNull = True
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object edRatio: TRzDBNumericEdit
            Left = 81
            Top = 127
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'ratio_amt'
            ReadOnly = True
            Alignment = taLeftJustify
            Color = clWhite
            DisabledColor = 14273211
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = 14273211
            TabOnEnter = True
            TabOrder = 3
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object edMaximum: TRzDBNumericEdit
            Left = 81
            Top = 151
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'max_amt'
            ReadOnly = True
            Alignment = taLeftJustify
            Color = clWhite
            DisabledColor = clWindow
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = 14273211
            TabOnEnter = True
            TabOrder = 4
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 234
      Top = 209
      ExplicitLeft = 245
      ExplicitTop = 209
    end
    inherited pnlSave: TRzPanel
      Left = 179
      Top = 209
      ExplicitLeft = 190
      ExplicitTop = 209
    end
  end
end
