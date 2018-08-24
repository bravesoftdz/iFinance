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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acct_type_name'
          Title.Alignment = taCenter
          Title.Caption = 'Account'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'loan_type_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 170
          Visible = True
        end>
    end
  end
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 23
      Width = 31
      Height = 14
      Caption = 'Name'
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 50
      Width = 46
      Height = 14
      Caption = 'Account'
    end
    object Label4: TLabel [2]
      Left = 13
      Top = 77
      Width = 30
      Height = 14
      Caption = 'Desc.'
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 3
      ExplicitTop = 429
    end
    object edTypeName: TRzDBEdit
      Left = 80
      Top = 17
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscLoanTypes
      DataField = 'loan_type_name'
      CharCase = ecUpperCase
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 80
      Top = 71
      Width = 184
      Height = 46
      DataField = 'loan_type_desc'
      DataSource = dmLoansAux.dscLoanTypes
      TabOrder = 2
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object dbluAccountType: TRzDBLookupComboBox
      Tag = 1
      Left = 80
      Top = 44
      Width = 184
      Height = 22
      DataField = 'acct_type'
      DataSource = dmLoansAux.dscLoanTypes
      KeyField = 'acct_type'
      ListField = 'acct_type_name'
      ListSource = dmLoansAux.dscAcctTypes
      TabOrder = 1
      FlatButtons = True
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
  end
end
