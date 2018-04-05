inherited frmReleaseRecipientDetail: TfrmReleaseRecipientDetail
  Caption = 'frmReleaseRecipientDetail'
  ClientHeight = 245
  ClientWidth = 330
  OnCreate = FormCreate
  ExplicitWidth = 330
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 330
    ExplicitWidth = 330
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
    Height = 224
    ExplicitWidth = 330
    ExplicitHeight = 200
    inherited pnlDetail: TRzPanel
      Width = 314
      Height = 176
      ExplicitWidth = 314
      ExplicitHeight = 152
      inherited pcDetail: TRzPageControl
        Width = 312
        Height = 174
        ExplicitWidth = 312
        ExplicitHeight = 150
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 312
          ExplicitHeight = 150
          object JvLabel1: TJvLabel
            Left = 19
            Top = 104
            Width = 44
            Height = 14
            Caption = 'Method'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 131
            Width = 46
            Height = 14
            Caption = 'Amount'
            Transparent = True
          end
          object c: TJvLabel
            Tag = -1
            Left = 19
            Top = 50
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
          object JvLabel9: TJvLabel
            Tag = -1
            Left = 19
            Top = 77
            Width = 39
            Height = 14
            Caption = 'Branch'
            Transparent = True
          end
          object edAmount: TRzDBNumericEdit
            Left = 107
            Top = 125
            Width = 175
            Height = 22
            DataSource = dmLoan.dscLoanRelease
            DataField = 'rel_amt'
            Alignment = taLeftJustify
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 4
            IntegersOnly = False
            DisplayFormat = '###,##0.00'
          end
          object dbluMethod: TRzDBLookupComboBox
            Tag = 1
            Left = 107
            Top = 98
            Width = 175
            Height = 22
            DataField = 'rel_method'
            DataSource = dmLoan.dscLoanRelease
            KeyField = 'value'
            ListField = 'display'
            ListSource = dmLoansAux.dscReleaseMethod
            TabOrder = 3
            AllowNull = True
            FlatButtons = True
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
          object bteRecipient: TRzButtonEdit
            Left = 107
            Top = 44
            Width = 175
            Height = 22
            Text = ''
            Color = clWhite
            DisabledColor = clWhite
            FrameColor = 14272955
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
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
          end
          object dbluBranch: TRzDBLookupComboBox
            Tag = 1
            Left = 107
            Top = 71
            Width = 175
            Height = 22
            DataField = 'loc_code'
            DataSource = dmLoan.dscLoanRelease
            KeyField = 'location_code'
            ListField = 'location_name'
            ListSource = dmLoansAux.dscBranches
            TabOrder = 2
            FlatButtons = True
            DisabledColor = clWhite
            FrameColor = 14272955
            FrameHotColor = clBlack
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 272
      Top = 193
      ExplicitLeft = 272
      ExplicitTop = 169
    end
    inherited pnlSave: TRzPanel
      Left = 216
      Top = 193
      ExplicitLeft = 216
      ExplicitTop = 169
    end
  end
end
