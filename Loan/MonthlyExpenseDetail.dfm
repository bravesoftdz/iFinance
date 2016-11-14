inherited frmMonthlyExpDetail: TfrmMonthlyExpDetail
  Caption = 'frmMonthlyExpDetail'
  ClientHeight = 166
  ClientWidth = 303
  OnShow = FormShow
  ExplicitWidth = 303
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 303
    inherited imgClose: TImage
      Left = 282
    end
    inherited lblCaption: TRzLabel
      Width = 97
      Caption = 'Monthly expense'
      ExplicitWidth = 97
    end
  end
  inherited pnlMain: TRzPanel
    Width = 303
    Height = 145
    inherited lblStatus: TLabel
      Top = 110
    end
    inherited pcDetail: TRzPageControl
      Width = 286
      Height = 91
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 43
          Height = 13
          Caption = 'Expense'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 47
          Width = 40
          Height = 13
          Caption = 'Monthly'
          Transparent = True
        end
        object dbluType: TRzDBLookupComboBox
          Tag = 1
          Left = 81
          Top = 17
          Width = 168
          Height = 21
          DataField = 'exp_type'
          DataSource = dmLoan.dscMonExp
          KeyField = 'exp_type'
          ListField = 'exp_name'
          ListSource = dmLoansAux.dscExpType
          TabOrder = 0
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object edMonthly: TRzDBNumericEdit
          Left = 81
          Top = 41
          Width = 168
          Height = 21
          DataSource = dmLoan.dscMonExp
          DataField = 'monthly'
          Alignment = taLeftJustify
          TabOnEnter = True
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '###,##0.00'
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 137
      Top = 110
    end
    inherited btnCancel: TRzButton
      Left = 218
      Top = 110
    end
  end
end
