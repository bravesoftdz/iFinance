inherited frmLoanRejectionDetail: TfrmLoanRejectionDetail
  Caption = 'frmLoanRejectionDetail'
  ClientHeight = 200
  ClientWidth = 347
  OnCreate = FormCreate
  ExplicitWidth = 347
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 347
    ExplicitWidth = 346
    inherited imgClose: TImage
      Left = 326
      ExplicitLeft = 325
    end
    inherited lblCaption: TRzLabel
      Width = 95
      Caption = 'Rejection details'
      ExplicitWidth = 95
    end
  end
  inherited pnlMain: TRzPanel
    Width = 347
    Height = 179
    ExplicitWidth = 346
    ExplicitHeight = 190
    inherited pnlDetail: TRzPanel
      Width = 331
      Height = 131
      ExplicitWidth = 331
      ExplicitHeight = 131
      inherited pcDetail: TRzPageControl
        Width = 329
        Height = 129
        ExplicitWidth = 329
        ExplicitHeight = 129
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 514
          ExplicitHeight = 181
          object JvLabel17: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 78
            Height = 14
            Caption = 'Date rejected'
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
          object dteDateRejected: TRzDBDateTimeEdit
            Left = 113
            Top = 17
            Width = 96
            Height = 22
            DataSource = dmLoan.dscLoanReject
            DataField = 'date_rejected'
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
            DataSource = dmLoan.dscLoanReject
            KeyField = 'reason_id'
            ListField = 'reason_name'
            ListSource = dmLoansAux.dscRejectReason
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
            DataSource = dmLoan.dscLoanReject
            TabOrder = 2
            FrameColor = 8675134
            FrameHotColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 289
      Top = 148
      ExplicitLeft = 289
      ExplicitTop = 148
    end
    inherited pnlSave: TRzPanel
      Left = 233
      Top = 148
      ExplicitLeft = 233
      ExplicitTop = 148
    end
  end
end
