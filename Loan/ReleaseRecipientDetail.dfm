inherited frmReleaseRecipientDetail: TfrmReleaseRecipientDetail
  Caption = 'frmReleaseRecipientDetail'
  ClientHeight = 204
  ClientWidth = 330
  OnCreate = FormCreate
  ExplicitWidth = 330
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 330
    ExplicitWidth = 327
    inherited imgClose: TImage
      Left = 309
      ExplicitLeft = 306
    end
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Recipient details'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    Width = 330
    Height = 183
    ExplicitWidth = 327
    ExplicitHeight = 193
    inherited pnlDetail: TRzPanel
      Width = 314
      Height = 135
      ExplicitWidth = 314
      ExplicitHeight = 135
      inherited pcDetail: TRzPageControl
        Width = 312
        Height = 133
        ExplicitWidth = 312
        ExplicitHeight = 133
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 514
          ExplicitHeight = 181
          object JvLabel1: TJvLabel
            Left = 19
            Top = 71
            Width = 44
            Height = 14
            Caption = 'Method'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 95
            Width = 46
            Height = 14
            Caption = 'Amount'
            Transparent = True
          end
          object c: TJvLabel
            Tag = -1
            Left = 19
            Top = 47
            Width = 52
            Height = 14
            Caption = 'Recipient'
            Transparent = True
          end
          object JvLabel17: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 77
            Height = 14
            Caption = 'Date released'
            Transparent = True
          end
          object edAmount: TRzDBNumericEdit
            Left = 107
            Top = 89
            Width = 175
            Height = 22
            DataSource = dmLoan.dscLoanRelease
            DataField = 'rel_amt'
            Alignment = taLeftJustify
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
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
            Height = 22
            Ctl3D = True
            DataField = 'rel_method'
            DataSource = dmLoan.dscLoanRelease
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmLoansAux.dscReleaseMethod
            ParentCtl3D = False
            TabOrder = 2
            AllowNull = True
            FlatButtons = True
            FrameColor = 8675134
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object bteRecipient: TRzButtonEdit
            Left = 107
            Top = 41
            Width = 175
            Height = 22
            Text = ''
            Color = clWhite
            DisabledColor = clWhite
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentShowHint = False
            ReadOnly = True
            ReadOnlyColor = clWhite
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
            Width = 94
            Height = 22
            DataSource = dmLoan.dscLoanRelease
            DataField = 'date_rel'
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
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 272
      Top = 152
      ExplicitLeft = 272
      ExplicitTop = 152
    end
    inherited pnlSave: TRzPanel
      Left = 216
      Top = 152
      ExplicitLeft = 216
      ExplicitTop = 152
    end
  end
end
