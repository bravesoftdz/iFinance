inherited frmLoanCancellationDetail: TfrmLoanCancellationDetail
  Caption = 'frmLoanCancellationDetail'
  ClientHeight = 211
  ClientWidth = 347
  OnCreate = FormCreate
  ExplicitWidth = 347
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 347
    ExplicitWidth = 347
    inherited imgClose: TImage
      Left = 326
      ExplicitLeft = 334
    end
    inherited lblCaption: TRzLabel
      Width = 110
      Caption = 'Cancellation details'
      ExplicitWidth = 110
    end
  end
  inherited pnlMain: TRzPanel
    Width = 347
    Height = 190
    ExplicitWidth = 347
    ExplicitHeight = 175
    inherited pnlDetail: TRzPanel
      Width = 331
      Height = 143
      ExplicitWidth = 331
      ExplicitHeight = 128
      inherited pcDetail: TRzPageControl
        Width = 329
        Height = 141
        ExplicitWidth = 329
        ExplicitHeight = 126
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 329
          ExplicitHeight = 126
          object JvLabel17: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 82
            Height = 14
            Caption = 'Date cancelled'
            Transparent = True
          end
          object JvLabel18: TJvLabel
            Tag = -1
            Left = 19
            Top = 51
            Width = 41
            Height = 14
            Caption = 'Reason'
            Transparent = True
          end
          object JvLabel24: TJvLabel
            Tag = -1
            Left = 19
            Top = 78
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
          end
          object dbluReason: TRzDBLookupComboBox
            Left = 113
            Top = 44
            Width = 193
            Height = 22
            DataField = 'reason_id'
            DataSource = dmLoan.dscLoanCancel
            KeyField = 'reason_id'
            ListField = 'reason_name'
            ListSource = dmLoansAux.dscCancelReason
            TabOrder = 1
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object dteDateCancelled: TRzDBDateTimeEdit
            Left = 113
            Top = 17
            Width = 96
            Height = 22
            DataSource = dmLoan.dscLoanCancel
            DataField = 'cancelled_date'
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
          object mmRemarks: TRzDBMemo
            Left = 113
            Top = 71
            Width = 193
            Height = 45
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanCancel
            TabOrder = 2
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 289
      Top = 160
      ExplicitLeft = 289
      ExplicitTop = 145
    end
    inherited pnlSave: TRzPanel
      Left = 233
      Top = 160
      ExplicitLeft = 233
      ExplicitTop = 145
    end
  end
end
