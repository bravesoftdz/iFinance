inherited frmLoanRejectionDetail: TfrmLoanRejectionDetail
  Caption = 'frmLoanRejectionDetail'
  ClientHeight = 211
  ClientWidth = 346
  OnCreate = FormCreate
  ExplicitWidth = 346
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 346
    inherited imgClose: TImage
      Left = 325
    end
    inherited lblCaption: TRzLabel
      Width = 95
      Caption = 'Rejection details'
      ExplicitWidth = 95
    end
  end
  inherited pnlMain: TRzPanel
    Width = 346
    Height = 190
    inherited pcDetail: TRzPageControl
      Width = 329
      Height = 136
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 512
        ExplicitHeight = 174
        object JvLabel17: TJvLabel
          Tag = -1
          Left = 19
          Top = 23
          Width = 68
          Height = 13
          Caption = 'Date rejected'
          Transparent = True
        end
        object JvLabel18: TJvLabel
          Tag = -1
          Left = 19
          Top = 48
          Width = 38
          Height = 13
          Caption = 'Reason'
          Transparent = True
        end
        object JvLabel24: TJvLabel
          Tag = -1
          Left = 19
          Top = 72
          Width = 43
          Height = 13
          Caption = 'Remarks'
          Transparent = True
        end
        object dteDateRejected: TRzDBDateTimeEdit
          Left = 113
          Top = 17
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanReject
          DataField = 'date_rejected'
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object dbluReason: TRzDBLookupComboBox
          Left = 113
          Top = 41
          Width = 193
          Height = 21
          DataField = 'reason_id'
          DataSource = dmLoan.dscLoanReject
          KeyField = 'reason_id'
          ListField = 'reason_name'
          ListSource = dmLoansAux.dscRejectReason
          TabOrder = 1
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
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
          TabOnEnter = True
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 180
      Top = 155
    end
    inherited btnCancel: TRzButton
      Left = 261
      Top = 155
    end
  end
end
