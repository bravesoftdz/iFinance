inherited frmLoanClassChargeDetail: TfrmLoanClassChargeDetail
  Caption = 'frmLoanClassChargeDetail'
  ClientHeight = 177
  ClientWidth = 303
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 303
  ExplicitHeight = 177
  PixelsPerInch = 96
  TextHeight = 13
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
    Height = 156
    ExplicitWidth = 303
    ExplicitHeight = 156
    inherited lblStatus: TLabel
      Top = 121
      Width = 122
      ExplicitTop = 125
      ExplicitWidth = 122
    end
    inherited pcDetail: TRzPageControl
      Width = 286
      Height = 102
      ExplicitWidth = 286
      ExplicitHeight = 102
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 282
        ExplicitHeight = 98
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 26
          Height = 13
          Caption = 'Type'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 47
          Width = 28
          Height = 13
          Caption = 'Value'
          Transparent = True
        end
        object rbgValueType: TRzDBRadioGroup
          Left = 81
          Top = 65
          Width = 184
          Height = 24
          DataField = 'value_type'
          DataSource = dmLoansAux.dscClassCharges
          Items.Strings = (
            'Fixed amount'
            'Percentage')
          Values.Strings = (
            '0'
            '1')
          BorderColor = 15263976
          Caption = ''
          Color = 15263976
          Columns = 2
          GroupStyle = gsCustom
          TabOnEnter = True
          TabOrder = 2
          TabStop = True
        end
        object edValue: TRzDBNumericEdit
          Left = 81
          Top = 41
          Width = 168
          Height = 21
          DataSource = dmLoansAux.dscClassCharges
          DataField = 'charge_value'
          Alignment = taLeftJustify
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
          Height = 21
          DataField = 'charge_type'
          DataSource = dmLoansAux.dscClassCharges
          KeyField = 'charge_type'
          ListField = 'charge_name'
          ListSource = dmLoansAux.dscChargeType
          TabOrder = 0
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 137
      Top = 121
      ExplicitLeft = 137
      ExplicitTop = 121
    end
    inherited btnCancel: TRzButton
      Left = 218
      Top = 121
      ExplicitLeft = 218
      ExplicitTop = 121
    end
  end
end
