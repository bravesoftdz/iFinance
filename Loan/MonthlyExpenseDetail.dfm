inherited frmMonthlyExpDetail: TfrmMonthlyExpDetail
  Caption = 'frmMonthlyExpDetail'
  ClientHeight = 152
  ClientWidth = 297
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 297
  ExplicitHeight = 152
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 297
    ExplicitWidth = 297
    inherited imgClose: TImage
      Left = 276
      ExplicitLeft = 282
    end
    inherited lblCaption: TRzLabel
      Width = 97
      Caption = 'Monthly expense'
      ExplicitWidth = 97
    end
  end
  inherited pnlMain: TRzPanel
    Width = 297
    Height = 131
    ExplicitWidth = 297
    ExplicitHeight = 131
    inherited pnlDetail: TRzPanel
      Width = 281
      Height = 85
      ExplicitWidth = 281
      ExplicitHeight = 85
      inherited pcDetail: TRzPageControl
        Width = 279
        Height = 83
        ExplicitWidth = 279
        ExplicitHeight = 83
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 279
          ExplicitHeight = 83
          object JvLabel1: TJvLabel
            Left = 19
            Top = 23
            Width = 48
            Height = 14
            Caption = 'Expense'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 50
            Width = 45
            Height = 14
            Caption = 'Monthly'
            Transparent = True
          end
          object dbluType: TRzDBLookupComboBox
            Tag = 1
            Left = 81
            Top = 17
            Width = 168
            Height = 22
            DataField = 'exp_type'
            DataSource = dmLoan.dscMonExp
            KeyField = 'exp_type'
            ListField = 'exp_name'
            ListSource = dmLoansAux.dscExpType
            TabOrder = 0
            AllowNull = True
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object edMonthly: TRzDBNumericEdit
            Left = 81
            Top = 44
            Width = 168
            Height = 22
            DataSource = dmLoan.dscMonExp
            DataField = 'monthly'
            Alignment = taLeftJustify
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 240
      Top = 101
      ExplicitLeft = 240
      ExplicitTop = 101
    end
    inherited pnlSave: TRzPanel
      Left = 184
      Top = 101
      ExplicitLeft = 184
      ExplicitTop = 101
    end
  end
end
