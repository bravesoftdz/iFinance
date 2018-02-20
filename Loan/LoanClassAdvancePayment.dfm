inherited frmLoanClassAdvancePaymentDetail: TfrmLoanClassAdvancePaymentDetail
  Caption = 'frmLoanClassAdvancePaymentDetail'
  ClientHeight = 271
  ClientWidth = 288
  OnCreate = FormCreate
  ExplicitWidth = 288
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 288
    ExplicitWidth = 288
    inherited imgClose: TImage
      Left = 267
      ExplicitLeft = 270
    end
    inherited lblCaption: TRzLabel
      Width = 144
      Caption = 'Advance payment details'
      ExplicitWidth = 144
    end
  end
  inherited pnlMain: TRzPanel
    Width = 288
    Height = 250
    ExplicitWidth = 288
    ExplicitHeight = 250
    inherited pnlDetail: TRzPanel
      Width = 271
      Height = 201
      ExplicitWidth = 271
      ExplicitHeight = 201
      inherited pcDetail: TRzPageControl
        Width = 269
        Height = 199
        ExplicitWidth = 269
        ExplicitHeight = 199
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 269
          ExplicitHeight = 199
          object JvLabel14: TJvLabel
            Tag = -1
            Left = 19
            Top = 119
            Width = 105
            Height = 14
            Caption = 'Number of months'
            Transparent = True
          end
          object edNumberOfMonths: TRzNumericEdit
            Left = 138
            Top = 113
            Width = 31
            Height = 22
            DisabledColor = 14273211
            Enabled = False
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 2
            DisplayFormat = '0'
          end
          object RzGroupBox2: TRzGroupBox
            Left = 19
            Top = 23
            Width = 230
            Height = 22
            BorderColor = 6572079
            BorderSides = []
            BorderWidth = 1
            Caption = 'Interest'
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clRed
            CaptionFont.Height = -12
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            Color = 14273211
            FlatColor = 6572079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6572079
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientColorStyle = gcsCustom
            GroupStyle = gsUnderline
            ParentFont = False
            TabOrder = 0
          end
          object rbgMethod: TRzDBRadioGroup
            Left = 9
            Top = 42
            Width = 240
            Height = 63
            DataField = 'advance_method'
            DataSource = dmLoansAux.dscAdvancePayment
            Items.Strings = (
              'None'
              'To be determined upon release'
              'Preset')
            Values.Strings = (
              '0'
              '1'
              '2')
            OnChange = rbgMethodChange
            BorderColor = 15263976
            BorderSides = []
            Caption = ''
            Color = 14273211
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 1
            TabStop = True
            OnClick = rbgMethodChange
          end
          object cbxIncludePrincipal: TRzDBCheckBox
            Left = 19
            Top = 151
            Width = 106
            Height = 16
            DataField = 'include_principal'
            DataSource = dmLoansAux.dscAdvancePayment
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Caption = 'Include principal'
            TabOrder = 3
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 229
      Top = 218
      ExplicitLeft = 229
      ExplicitTop = 218
    end
    inherited pnlSave: TRzPanel
      Left = 173
      Top = 218
      ExplicitLeft = 173
      ExplicitTop = 218
    end
  end
end
