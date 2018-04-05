inherited frmLoanClassAdvancePaymentDetail: TfrmLoanClassAdvancePaymentDetail
  Caption = 'frmLoanClassAdvancePaymentDetail'
  ClientHeight = 250
  ClientWidth = 288
  OnCreate = FormCreate
  ExplicitWidth = 288
  ExplicitHeight = 250
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
    Height = 229
    ExplicitWidth = 288
    ExplicitHeight = 229
    inherited pnlDetail: TRzPanel
      Width = 271
      Height = 180
      ExplicitWidth = 271
      ExplicitHeight = 180
      inherited pcDetail: TRzPageControl
        Width = 269
        Height = 178
        ExplicitWidth = 269
        ExplicitHeight = 178
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 269
          ExplicitHeight = 178
          object JvLabel14: TJvLabel
            Tag = -1
            Left = 19
            Top = 111
            Width = 105
            Height = 14
            Caption = 'Number of months'
            Transparent = True
          end
          object edNumberOfMonths: TRzNumericEdit
            Left = 138
            Top = 105
            Width = 31
            Height = 22
            DisabledColor = 15327448
            Enabled = False
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 2
            DisplayFormat = '0'
          end
          object RzGroupBox2: TRzGroupBox
            Left = 19
            Top = 15
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
            TabOrder = 0
          end
          object rbgMethod: TRzDBRadioGroup
            Left = 9
            Top = 34
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
            Color = 15327448
            FlatColor = 14273211
            GroupStyle = gsCustom
            TabOnEnter = True
            TabOrder = 1
            TabStop = True
            OnClick = rbgMethodChange
          end
          object cbxIncludePrincipal: TRzDBCheckBox
            Left = 19
            Top = 143
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
      Top = 197
      ExplicitLeft = 229
      ExplicitTop = 197
    end
    inherited pnlSave: TRzPanel
      Left = 173
      Top = 197
      ExplicitLeft = 173
      ExplicitTop = 197
    end
  end
end
