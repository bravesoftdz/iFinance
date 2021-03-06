inherited frmFinInfoDetail: TfrmFinInfoDetail
  Caption = 'frmFinInfoDetail'
  ClientHeight = 187
  ClientWidth = 298
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 298
  ExplicitHeight = 187
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 298
    ExplicitWidth = 298
    inherited imgClose: TImage
      Left = 277
      ExplicitLeft = 282
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Financial info'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 298
    Height = 166
    ExplicitWidth = 298
    ExplicitHeight = 162
    inherited pnlDetail: TRzPanel
      Width = 281
      Height = 117
      ExplicitWidth = 281
      ExplicitHeight = 113
      inherited pcDetail: TRzPageControl
        Width = 279
        Height = 115
        Anchors = [akLeft, akTop]
        ExplicitWidth = 279
        ExplicitHeight = 111
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 279
          ExplicitHeight = 111
          object JvLabel1: TJvLabel
            Left = 19
            Top = 23
            Width = 52
            Height = 14
            Caption = 'Company'
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
          object JvLabel3: TJvLabel
            Left = 19
            Top = 77
            Width = 43
            Height = 14
            Caption = 'Balance'
            Transparent = True
          end
          object dbluCompany: TRzDBLookupComboBox
            Tag = 1
            Left = 81
            Top = 17
            Width = 168
            Height = 22
            DataField = 'comp_id'
            DataSource = dmLoan.dscFinInfo
            KeyField = 'comp_id'
            ListField = 'comp_name'
            ListSource = dmLoansAux.dscCompetitors
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
            DataSource = dmLoan.dscFinInfo
            DataField = 'mon_due'
            Alignment = taLeftJustify
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
            IntegersOnly = False
            Max = 100000.000000000000000000
            DisplayFormat = '###,##0.00'
          end
          object edBalance: TRzDBNumericEdit
            Left = 81
            Top = 71
            Width = 168
            Height = 22
            DataSource = dmLoan.dscFinInfo
            DataField = 'loan_bal'
            Alignment = taLeftJustify
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
            IntegersOnly = False
            Max = 900000.000000000000000000
            DisplayFormat = '###,##0.00'
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 239
      Top = 134
      ExplicitLeft = 239
      ExplicitTop = 130
    end
    inherited pnlSave: TRzPanel
      Left = 183
      Top = 134
      ExplicitLeft = 183
      ExplicitTop = 130
    end
  end
end
