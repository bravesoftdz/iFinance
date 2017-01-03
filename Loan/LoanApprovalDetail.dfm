inherited frmLoanAppvDetail: TfrmLoanAppvDetail
  Caption = 'frmLoanAppvDetail'
  ClientHeight = 187
  ClientWidth = 506
  OnCreate = FormCreate
  ExplicitWidth = 506
  ExplicitHeight = 187
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 506
    ExplicitWidth = 506
    inherited imgClose: TImage
      Left = 485
      ExplicitLeft = 525
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Approval details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 506
    Height = 166
    ExplicitWidth = 506
    ExplicitHeight = 176
    inherited pcDetail: TRzPageControl
      Width = 489
      Height = 112
      ExplicitWidth = 489
      ExplicitHeight = 122
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitWidth = 485
        ExplicitHeight = 118
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
          Left = 218
          Top = 47
          Width = 43
          Height = 13
          Caption = 'Remarks'
          Transparent = True
        end
        object JvLabel16: TJvLabel
          Tag = -1
          Left = 218
          Top = 23
          Width = 84
          Height = 13
          Caption = 'Approval method'
          Transparent = True
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
          Left = 313
          Top = 17
          Width = 152
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
          Left = 313
          Top = 41
          Width = 152
          Height = 45
          DataField = 'remarks'
          DataSource = dmLoan.dscLoanAppv
          TabOrder = 4
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 340
      Top = 131
      ExplicitLeft = 340
      ExplicitTop = 141
    end
    inherited btnCancel: TRzButton
      Left = 421
      Top = 131
      ExplicitLeft = 421
      ExplicitTop = 141
    end
  end
end
