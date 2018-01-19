inherited frmLoanClassChargeTypeList: TfrmLoanClassChargeTypeList
  Caption = 'frmLoanClassChargeTypeList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 161
      Caption = 'Loan class charge type list'
      ExplicitWidth = 161
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmLoansAux.dscChargeTypes
      Columns = <
        item
          Expanded = False
          FieldName = 'charge_type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Type'
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
          FieldName = 'charge_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel3: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 30
      Height = 14
      Caption = 'Type'
      Transparent = True
    end
    object JvLabel1: TJvLabel [1]
      Left = 13
      Top = 63
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    inherited pnlDetailHead: TRzPanel
      ExplicitWidth = 275
    end
    object edType: TRzDBEdit
      Left = 80
      Top = 33
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscChargeTypes
      DataField = 'charge_type'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 2
    end
    object edName: TRzDBEdit
      Left = 80
      Top = 57
      Width = 184
      Height = 22
      DataSource = dmLoansAux.dscChargeTypes
      DataField = 'charge_name'
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
    end
  end
end
