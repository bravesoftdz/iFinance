inherited frmLoanClassChargeDetail: TfrmLoanClassChargeDetail
  Caption = 'frmLoanClassChargeDetail'
  ClientHeight = 185
  ClientWidth = 303
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 303
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 303
    ExplicitWidth = 303
    inherited imgClose: TImage
      Left = 282
      ExplicitLeft = 349
    end
    inherited lblCaption: TRzLabel
      Width = 145
      Caption = 'Loan classification charge'
      ExplicitWidth = 145
    end
  end
  inherited pnlMain: TRzPanel
    Width = 303
    Height = 164
    ExplicitWidth = 303
    ExplicitHeight = 164
    inherited pnlDetail: TRzPanel
      Width = 287
      Height = 118
      ExplicitWidth = 287
      ExplicitHeight = 118
      inherited pcDetail: TRzPageControl
        Width = 285
        Height = 116
        ExplicitWidth = 285
        ExplicitHeight = 116
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 285
          ExplicitHeight = 116
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
          object rbgValueType: TRzDBRadioGroup
            Left = 73
            Top = 65
            Width = 196
            Height = 40
            DataField = 'value_type'
            DataSource = dmLoansAux.dscClassCharges
            Items.Strings = (
              'Fixed amount'
              'Percentage')
            Values.Strings = (
              '0'
              '1')
            BorderColor = 15263976
            BorderSides = []
            Caption = ''
            Color = 14273211
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 2
            TabStop = True
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
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 245
      Top = 133
      ExplicitLeft = 245
      ExplicitTop = 133
    end
    inherited pnlSave: TRzPanel
      Left = 190
      Top = 133
      ExplicitLeft = 190
      ExplicitTop = 133
    end
  end
end
