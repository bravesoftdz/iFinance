inherited frmLoanRejectionDetail: TfrmLoanRejectionDetail
  Caption = 'frmLoanRejectionDetail'
  ClientHeight = 213
  ClientWidth = 347
  OnCreate = FormCreate
  ExplicitWidth = 347
  ExplicitHeight = 213
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 347
    ExplicitWidth = 347
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
    Height = 192
    ExplicitWidth = 347
    ExplicitHeight = 192
    inherited pnlDetail: TRzPanel
      Width = 331
      Height = 144
      ExplicitWidth = 331
      ExplicitHeight = 144
      inherited pcDetail: TRzPageControl
        Width = 329
        Height = 142
        ExplicitWidth = 329
        ExplicitHeight = 142
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 329
          ExplicitHeight = 142
          object Label1: TLabel
            Left = 19
            Top = 23
            Width = 76
            Height = 14
            Caption = 'Date rejected'
          end
          object Label2: TLabel
            Left = 19
            Top = 51
            Width = 39
            Height = 14
            Caption = 'Reason'
          end
          object Label3: TLabel
            Left = 19
            Top = 78
            Width = 45
            Height = 14
            Caption = 'Remarks'
          end
          object dteDateRejected: TRzDBDateTimeEdit
            Left = 113
            Top = 17
            Width = 96
            Height = 22
            DataSource = dmLoan.dscLoanReject
            DataField = 'date_rejected'
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
          object dbluReason: TRzDBLookupComboBox
            Left = 113
            Top = 44
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
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object mmRemarks: TRzDBMemo
            Left = 113
            Top = 71
            Width = 193
            Height = 45
            DataField = 'remarks'
            DataSource = dmLoan.dscLoanReject
            TabOrder = 2
            FrameColor = 14272955
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
      Top = 161
      ExplicitLeft = 289
      ExplicitTop = 161
    end
    inherited pnlSave: TRzPanel
      Left = 233
      Top = 161
      ExplicitLeft = 233
      ExplicitTop = 161
    end
  end
end
