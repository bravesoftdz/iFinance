inherited frmReleaseRecipientDetail: TfrmReleaseRecipientDetail
  Caption = 'frmReleaseRecipientDetail'
  ClientHeight = 214
  ClientWidth = 327
  OnCreate = FormCreate
  ExplicitWidth = 327
  ExplicitHeight = 214
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 327
    ExplicitWidth = 327
    inherited imgClose: TImage
      Left = 306
      ExplicitLeft = 306
    end
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Recipient details'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    Width = 327
    Height = 193
    ExplicitWidth = 327
    ExplicitHeight = 193
    inherited pcDetail: TRzPageControl
      Width = 310
      Height = 139
      ExplicitWidth = 310
      ExplicitHeight = 139
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 306
        ExplicitHeight = 135
        object JvLabel1: TJvLabel
          Left = 19
          Top = 71
          Width = 38
          Height = 13
          Caption = 'Method'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 95
          Width = 39
          Height = 13
          Caption = 'Amount'
          Transparent = True
        end
        object c: TJvLabel
          Tag = -1
          Left = 19
          Top = 47
          Width = 46
          Height = 13
          Caption = 'Recipient'
          Transparent = True
        end
        object JvLabel17: TJvLabel
          Tag = -1
          Left = 19
          Top = 23
          Width = 69
          Height = 13
          Caption = 'Date released'
          Transparent = True
        end
        object edAmount: TRzDBNumericEdit
          Left = 107
          Top = 89
          Width = 175
          Height = 21
          DataSource = dmLoan.dscLoanRelease
          DataField = 'rel_amt'
          Alignment = taLeftJustify
          TabOnEnter = True
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = '###,##0.00'
        end
        object dbluMethod: TRzDBLookupComboBox
          Tag = 1
          Left = 107
          Top = 65
          Width = 175
          Height = 21
          DataField = 'rel_method'
          DataSource = dmLoan.dscLoanRelease
          KeyField = 'value'
          ListField = 'display'
          ListSource = dmLoansAux.dscReleaseMethod
          TabOrder = 2
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object bteRecipient: TRzButtonEdit
          Left = 107
          Top = 41
          Width = 175
          Height = 21
          Text = ''
          Color = clInfoBk
          DisabledColor = clWhite
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOnEnter = True
          TabOrder = 1
          AllowKeyEdit = False
          ButtonHint = 'Find client'
          AltBtnKind = bkReject
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          FlatButtons = True
          HideButtonsOnReadOnly = False
          OnButtonClick = bteRecipientButtonClick
        end
        object dteDateReleased: TRzDBDateTimeEdit
          Left = 107
          Top = 17
          Width = 80
          Height = 21
          DataSource = dmLoan.dscLoanRelease
          DataField = 'date_rel'
          DisabledColor = clWhite
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 161
      Top = 158
      ExplicitLeft = 161
      ExplicitTop = 158
    end
    inherited btnCancel: TRzButton
      Left = 242
      Top = 158
      ExplicitLeft = 242
      ExplicitTop = 158
    end
  end
end
