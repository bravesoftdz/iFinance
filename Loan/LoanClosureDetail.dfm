inherited frmLoanClosureDetail: TfrmLoanClosureDetail
  Caption = 'TfrmBasePopupDetail1'
  ClientHeight = 196
  ClientWidth = 347
  OnCreate = FormCreate
  ExplicitWidth = 347
  ExplicitHeight = 196
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 347
    ExplicitWidth = 347
    inherited imgClose: TImage
      Left = 326
      ExplicitLeft = 326
    end
    inherited lblCaption: TRzLabel
      Width = 83
      Caption = 'Closure details'
      ExplicitWidth = 83
    end
  end
  inherited pnlMain: TRzPanel
    Width = 347
    Height = 175
    ExplicitWidth = 347
    ExplicitHeight = 175
    inherited pnlDetail: TRzPanel
      Width = 330
      Height = 126
      ExplicitWidth = 330
      ExplicitHeight = 126
      inherited pcDetail: TRzPageControl
        Width = 328
        Height = 124
        ExplicitWidth = 328
        ExplicitHeight = 124
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 328
          ExplicitHeight = 124
          object JvLabel17: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 66
            Height = 14
            Caption = 'Date closed'
            Transparent = True
          end
          object JvLabel18: TJvLabel
            Tag = -1
            Left = 19
            Top = 48
            Width = 41
            Height = 14
            Caption = 'Reason'
            Transparent = True
          end
          object JvLabel24: TJvLabel
            Tag = -1
            Left = 19
            Top = 72
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
          end
          object dteDateClosed: TRzDBDateTimeEdit
            Left = 113
            Top = 17
            Width = 96
            Height = 22
            DataSource = dmLoan.dscLoanClose
            DataField = 'date_closed'
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object dbluReason: TRzDBLookupComboBox
            Left = 113
            Top = 41
            Width = 193
            Height = 22
            DataField = 'reason_id'
            DataSource = dmLoan.dscLoanClose
            KeyField = 'reason_id'
            ListField = 'reason_name'
            ListSource = dmLoansAux.dscCloseReason
            TabOrder = 1
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object mmRemarks: TRzDBMemo
            Left = 113
            Top = 65
            Width = 193
            Height = 45
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanClose
            TabOrder = 2
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 288
      Top = 143
      ExplicitLeft = 288
      ExplicitTop = 143
    end
    inherited pnlSave: TRzPanel
      Left = 232
      Top = 143
      ExplicitLeft = 232
      ExplicitTop = 143
    end
  end
end
