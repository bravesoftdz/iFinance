inherited frmFinInfoDetail: TfrmFinInfoDetail
  Caption = 'frmFinInfoDetail'
  ClientHeight = 184
  ClientWidth = 303
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 303
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 303
    inherited imgClose: TImage
      Left = 282
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Financial info'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 303
    Height = 163
    inherited lblStatus: TLabel
      Top = 128
    end
    inherited pcDetail: TRzPageControl
      Width = 286
      Height = 109
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 512
        ExplicitHeight = 174
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 47
          Height = 13
          Caption = 'Company'
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
        object JvLabel3: TJvLabel
          Left = 19
          Top = 72
          Width = 39
          Height = 13
          Caption = 'Balance'
          Transparent = True
        end
        object dbluCompany: TRzDBLookupComboBox
          Tag = 1
          Left = 81
          Top = 17
          Width = 168
          Height = 21
          DataField = 'comp_id'
          DataSource = dmLoan.dscFinInfo
          KeyField = 'comp_id'
          ListField = 'comp_name'
          ListSource = dmLoansAux.dscCompetitors
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
          DataSource = dmLoan.dscFinInfo
          DataField = 'mon_due'
          Alignment = taLeftJustify
          TabOnEnter = True
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '###,##0.00'
        end
        object edBalance: TRzDBNumericEdit
          Left = 81
          Top = 66
          Width = 168
          Height = 21
          DataSource = dmLoan.dscFinInfo
          DataField = 'loan_bal'
          Alignment = taLeftJustify
          TabOnEnter = True
          TabOrder = 2
          IntegersOnly = False
          DisplayFormat = '###,##0.00'
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 137
      Top = 128
    end
    inherited btnCancel: TRzButton
      Left = 218
      Top = 128
    end
  end
end
