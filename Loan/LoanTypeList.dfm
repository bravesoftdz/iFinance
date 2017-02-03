inherited frmLoanTypeList: TfrmLoanTypeList
  Caption = 'frmLoanTypeList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 84
      Caption = 'Loan type list'
      ExplicitWidth = 84
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmLoansAux.dscLoanTypes
      Columns = <
        item
          Expanded = False
          FieldName = 'loan_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loan_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Width = 300
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 63
      Width = 32
      Height = 14
      Caption = 'Desc.'
      Transparent = True
    end
    object edTypeName: TRzDBEdit
      Left = 60
      Top = 33
      Width = 204
      Height = 22
      DataSource = dmLoansAux.dscLoanTypes
      DataField = 'loan_type_name'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 2
    end
    object RzDBMemo1: TRzDBMemo
      Left = 60
      Top = 57
      Width = 204
      Height = 46
      DataField = 'loan_type_desc'
      DataSource = dmLoansAux.dscLoanTypes
      TabOrder = 3
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
  end
end
