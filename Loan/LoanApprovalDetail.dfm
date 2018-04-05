inherited frmLoanAppvDetail: TfrmLoanAppvDetail
  Caption = 'frmLoanAppvDetail'
  ClientHeight = 283
  ClientWidth = 443
  OnCreate = FormCreate
  ExplicitWidth = 443
  ExplicitHeight = 283
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 443
    ExplicitWidth = 443
    inherited imgClose: TImage
      Left = 422
      ExplicitLeft = 525
    end
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Approval details'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    Width = 443
    Height = 262
    ExplicitWidth = 443
    ExplicitHeight = 244
    inherited pnlDetail: TRzPanel
      Width = 426
      Height = 216
      ExplicitWidth = 426
      ExplicitHeight = 198
      inherited pcDetail: TRzPageControl
        Width = 424
        Height = 214
        ExplicitWidth = 424
        ExplicitHeight = 196
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 424
          ExplicitHeight = 196
          object JvLabel8: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 83
            Height = 14
            Caption = 'Date approved'
            Transparent = True
          end
          object JvLabel14: TJvLabel
            Tag = -1
            Left = 19
            Top = 50
            Width = 101
            Height = 14
            Caption = 'Approved amount'
            Transparent = True
          end
          object JvLabel10: TJvLabel
            Tag = -1
            Left = 19
            Top = 77
            Width = 85
            Height = 14
            Caption = 'Approved term'
            Transparent = True
          end
          object JvLabel24: TJvLabel
            Tag = -1
            Left = 19
            Top = 131
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
          end
          object JvLabel16: TJvLabel
            Tag = -1
            Left = 19
            Top = 104
            Width = 96
            Height = 14
            Caption = 'Approval method'
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 217
            Top = 50
            Width = 84
            Height = 14
            Caption = 'Rec. amount:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object urlRecommendedAmount: TRzURLLabel
            Tag = 1
            Left = 311
            Top = 50
            Width = 25
            Height = 14
            Caption = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlRecommendedAmountClick
          end
          object JvLabel2: TJvLabel
            Tag = -1
            Left = 217
            Top = 77
            Width = 84
            Height = 14
            Caption = 'Desired term:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object urlDesiredTerm: TRzURLLabel
            Tag = 1
            Left = 311
            Top = 77
            Width = 7
            Height = 14
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlDesiredTermClick
          end
          object JvLabel3: TJvLabel
            Tag = -1
            Left = 217
            Top = 23
            Width = 104
            Height = 14
            Caption = 'Applied amount:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lblAppliedAmount: TJvLabel
            Tag = -1
            Left = 335
            Top = 23
            Width = 27
            Height = 14
            Caption = '0.00'
            Transparent = True
          end
          object edAppvTerm: TRzDBNumericEdit
            Tag = 5
            Left = 122
            Top = 71
            Width = 80
            Height = 22
            DataSource = dmLoan.dscLoanAppv
            DataField = 'terms'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
            DisplayFormat = '0'
          end
          object edAppvAmount: TRzDBNumericEdit
            Tag = 5
            Left = 122
            Top = 44
            Width = 80
            Height = 22
            DataSource = dmLoan.dscLoanAppv
            DataField = 'amt_appv'
            Alignment = taLeftJustify
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
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
            Height = 22
            DataSource = dmLoan.dscLoanAppv
            DataField = 'date_appv'
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object dbluAppvMethod: TRzDBLookupComboBox
            Tag = 5
            Left = 122
            Top = 98
            Width = 279
            Height = 22
            DataField = 'appv_method'
            DataSource = dmLoan.dscLoanAppv
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmLoansAux.dscAppvMethod
            TabOrder = 3
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object mmRemarks: TRzDBMemo
            Left = 122
            Top = 125
            Width = 279
            Height = 64
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanAppv
            TabOrder = 4
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 384
      Top = 232
      ExplicitLeft = 384
      ExplicitTop = 214
    end
    inherited pnlSave: TRzPanel
      Left = 328
      Top = 232
      ExplicitLeft = 328
      ExplicitTop = 214
    end
  end
end
