inherited frmLoanAppvDetail: TfrmLoanAppvDetail
  Caption = 'frmLoanAppvDetail'
  ClientHeight = 258
  ClientWidth = 411
  OnCreate = FormCreate
  ExplicitWidth = 411
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 411
    ExplicitWidth = 411
    inherited imgClose: TImage
      Left = 390
      ExplicitLeft = 525
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Approval details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 411
    Height = 237
    ExplicitWidth = 411
    ExplicitHeight = 237
    inherited pcDetail: TRzPageControl
      Width = 394
      Height = 183
      ExplicitWidth = 394
      ExplicitHeight = 183
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 390
        ExplicitHeight = 179
        object JvLabel8: TJvLabel
          Tag = -1
          Left = 19
          Top = 23
          Width = 74
          Height = 13
          Caption = 'Date approved'
          Transparent = True
        end
        object JvLabel14: TJvLabel
          Tag = -1
          Left = 19
          Top = 47
          Width = 88
          Height = 13
          Caption = 'Approved amount'
          Transparent = True
        end
        object JvLabel10: TJvLabel
          Tag = -1
          Left = 19
          Top = 71
          Width = 74
          Height = 13
          Caption = 'Approved term'
          Transparent = True
        end
        object JvLabel24: TJvLabel
          Tag = -1
          Left = 19
          Top = 119
          Width = 43
          Height = 13
          Caption = 'Remarks'
          Transparent = True
        end
        object JvLabel16: TJvLabel
          Tag = -1
          Left = 19
          Top = 95
          Width = 84
          Height = 13
          Caption = 'Approval method'
          Transparent = True
        end
        object JvLabel1: TJvLabel
          Tag = -1
          Left = 217
          Top = 47
          Width = 88
          Height = 13
          Caption = 'Recommendation:'
          Transparent = True
        end
        object urlRecommendedAmount: TRzURLLabel
          Tag = 1
          Left = 310
          Top = 47
          Width = 22
          Height = 13
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlRecommendedAmountClick
        end
        object JvLabel2: TJvLabel
          Tag = -1
          Left = 217
          Top = 71
          Width = 67
          Height = 13
          Caption = 'Desired term:'
          Transparent = True
        end
        object urlDesiredTerm: TRzURLLabel
          Tag = 1
          Left = 310
          Top = 71
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlDesiredTermClick
        end
        object edAppvTerm: TRzDBNumericEdit
          Tag = 5
          Left = 122
          Top = 65
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanAppv
          DataField = 'terms'
          Alignment = taLeftJustify
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 2
          DisplayFormat = '0'
        end
        object edAppvAmount: TRzDBNumericEdit
          Tag = 5
          Left = 122
          Top = 41
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanAppv
          DataField = 'amt_appv'
          Alignment = taLeftJustify
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '###,##0.00'
        end
        object dteDateApproved: TRzDBDateTimeEdit
          Tag = 5
          Left = 122
          Top = 17
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanAppv
          DataField = 'date_appv'
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object dbluAppvMethod: TRzDBLookupComboBox
          Tag = 5
          Left = 122
          Top = 89
          Width = 247
          Height = 21
          DataField = 'appv_method'
          DataSource = dmLoan.dscLoanAppv
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmLoansAux.dscAppvMethod
          TabOrder = 3
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object mmRemarks: TRzDBMemo
          Left = 122
          Top = 113
          Width = 247
          Height = 45
          DataField = 'remarks'
          DataSource = dmLoan.dscLoanAppv
          TabOrder = 4
          TabOnEnter = True
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 245
      Top = 202
      ExplicitLeft = 245
      ExplicitTop = 202
    end
    inherited btnCancel: TRzButton
      Left = 326
      Top = 202
      ExplicitLeft = 326
      ExplicitTop = 202
    end
  end
end
