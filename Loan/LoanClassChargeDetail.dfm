inherited frmLoanClassChargeDetail: TfrmLoanClassChargeDetail
  Caption = 'frmLoanClassChargeDetail'
  ClientHeight = 364
  ClientWidth = 292
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 292
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 292
    ExplicitWidth = 292
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
    Height = 343
    ExplicitWidth = 292
    ExplicitHeight = 315
    inherited pnlDetail: TRzPanel
      Width = 276
      Height = 297
      ExplicitWidth = 276
      ExplicitHeight = 269
      inherited pcDetail: TRzPageControl
        Width = 274
        Height = 295
        ExplicitWidth = 274
        ExplicitHeight = 267
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 274
          ExplicitHeight = 267
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
            Top = 50
            Width = 32
            Height = 14
            Caption = 'Value'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Left = 19
            Top = 124
            Width = 33
            Height = 14
            Caption = 'Ratio '
            Transparent = True
          end
          object JvLabel4: TJvLabel
            Left = 19
            Top = 151
            Width = 52
            Height = 14
            Caption = 'Maximum'
            Transparent = True
          end
          object rbgValueType: TRzDBRadioGroup
            Left = 73
            Top = 70
            Width = 176
            Height = 40
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
            Color = 15327448
            Columns = 2
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 2
            TabStop = True
            OnClick = rbgValueTypeChange
          end
          object edValue: TRzDBNumericEdit
            Left = 81
            Top = 44
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'charge_value'
            Alignment = taLeftJustify
            FrameColor = 14272955
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
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object edRatio: TRzDBNumericEdit
            Left = 81
            Top = 118
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'ratio_amt'
            Alignment = taLeftJustify
            DisabledColor = 15327448
            Enabled = False
            FocusColor = clWhite
            FrameColor = 14272955
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
            Top = 145
            Width = 168
            Height = 22
            DataSource = dmLoansAux.dscClassCharges
            DataField = 'max_value'
            Alignment = taLeftJustify
            DisabledColor = 15327448
            Enabled = False
            FocusColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ReadOnlyColor = 14273211
            TabOnEnter = True
            TabOrder = 4
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object RzGroupBox2: TRzGroupBox
            Left = 19
            Top = 206
            Width = 230
            Height = 22
            BorderColor = 6572079
            BorderSides = []
            BorderWidth = 1
            Caption = 'Loan applicability'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clRed
            CaptionFont.Height = -12
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            Color = 15327448
            FlatColor = 12493963
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientColorStyle = gcsCustom
            GroupStyle = gsUnderline
            ParentFont = False
            TabOrder = 6
          end
          object chbForNew: TRzDBCheckBox
            Left = 19
            Top = 232
            Width = 44
            Height = 16
            DataField = 'for_new'
            DataSource = dmLoansAux.dscClassCharges
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'New'
            TabOrder = 7
          end
          object chbForRenewal: TRzDBCheckBox
            Left = 115
            Top = 232
            Width = 65
            Height = 16
            DataField = 'for_renew'
            DataSource = dmLoansAux.dscClassCharges
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Renewal'
            TabOrder = 8
          end
          object chbForRestructure: TRzDBCheckBox
            Left = 19
            Top = 254
            Width = 83
            Height = 16
            DataField = 'for_restructure'
            DataSource = dmLoansAux.dscClassCharges
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Restructure'
            TabOrder = 9
          end
          object chbForReloan: TRzDBCheckBox
            Left = 115
            Top = 254
            Width = 55
            Height = 16
            DataField = 'for_reloan'
            DataSource = dmLoansAux.dscClassCharges
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Reloan'
            TabOrder = 10
          end
          object rbgMaxValueType: TRzDBRadioGroup
            Left = 73
            Top = 171
            Width = 160
            Height = 23
            DataField = 'max_value_type'
            DataSource = dmLoansAux.dscClassCharges
            Items.Strings = (
              'Months'
              'Amount')
            Values.Strings = (
              '0'
              '1'
              '2')
            OnChange = rbgValueTypeChange
            BorderColor = 15263976
            BorderSides = []
            Caption = ''
            Color = 15327448
            Columns = 2
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 5
            TabStop = True
            OnClick = rbgValueTypeChange
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 234
      Top = 312
      ExplicitLeft = 234
      ExplicitTop = 284
    end
    inherited pnlSave: TRzPanel
      Left = 179
      Top = 312
      ExplicitLeft = 179
      ExplicitTop = 284
    end
  end
end
