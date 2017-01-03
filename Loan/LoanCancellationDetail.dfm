inherited frmLoanCancellationDetail: TfrmLoanCancellationDetail
  Caption = 'frmLoanCancellationDetail'
  ClientHeight = 211
  ClientWidth = 355
  OnCreate = FormCreate
  ExplicitWidth = 355
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 355
    inherited imgClose: TImage
      Left = 334
    end
    inherited lblCaption: TRzLabel
      Width = 110
      Caption = 'Cancellation details'
      ExplicitWidth = 110
    end
  end
  inherited pnlMain: TRzPanel
    Width = 355
    Height = 190
    inherited pcDetail: TRzPageControl
      Width = 338
      Height = 136
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitTop = -5
        ExplicitWidth = 512
        ExplicitHeight = 174
        object JvLabel17: TJvLabel
          Tag = -1
          Left = 19
          Top = 23
          Width = 74
          Height = 13
          Caption = 'Date Cancelled'
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
        object dbluReason: TRzDBLookupComboBox
          Left = 113
          Top = 41
          Width = 193
          Height = 21
          DataField = 'reason_id'
          DataSource = dmLoan.dscLoanCancel
          KeyField = 'reason_id'
          ListField = 'reason_name'
          ListSource = dmLoansAux.dscCancelReason
          TabOrder = 1
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object dteDateCancelled: TRzDBDateTimeEdit
          Left = 113
          Top = 17
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanCancel
          DataField = 'cancelled_date'
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object mmRemarks: TRzDBMemo
          Left = 113
          Top = 65
          Width = 193
          Height = 45
          DataField = 'remarks'
          DataSource = dmLoan.dscLoanCancel
          TabOrder = 2
          TabOnEnter = True
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 189
      Top = 155
    end
    inherited btnCancel: TRzButton
      Left = 270
      Top = 155
    end
  end
end
