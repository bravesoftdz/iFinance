inherited frmReferenceDetail: TfrmReferenceDetail
  Caption = 'frmReferenceDetail'
  ClientHeight = 202
  ClientWidth = 360
  ExplicitWidth = 360
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 360
    ExplicitWidth = 370
    inherited imgClose: TImage
      Left = 339
      ExplicitLeft = 349
    end
    inherited lblCaption: TRzLabel
      Width = 58
      Caption = 'Reference'
      ExplicitWidth = 58
    end
  end
  inherited pnlMain: TRzPanel
    Width = 360
    Height = 181
    ExplicitWidth = 370
    ExplicitHeight = 206
    inherited pnlDetail: TRzPanel
      Width = 345
      Height = 133
      ExplicitWidth = 345
      ExplicitHeight = 133
      inherited pcDetail: TRzPageControl
        Width = 343
        Height = 131
        ExplicitWidth = 343
        ExplicitHeight = 131
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          Caption = 'Reference details'
          ExplicitWidth = 514
          ExplicitHeight = 181
          object JvLabel1: TJvLabel
            Left = 19
            Top = 23
            Width = 54
            Height = 14
            Caption = 'Lastname'
            Transparent = True
          end
          object JvLabel2: TJvLabel
            Left = 19
            Top = 47
            Width = 54
            Height = 14
            Caption = 'Firstname'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Left = 19
            Top = 71
            Width = 36
            Height = 14
            Caption = 'Middle'
            Transparent = True
          end
          object JvLabel22: TJvLabel
            Left = 19
            Top = 95
            Width = 81
            Height = 14
            Caption = 'Mobile/tel. no.'
            Transparent = True
          end
          object RzDBEdit11: TRzDBEdit
            Left = 114
            Top = 89
            Width = 102
            Height = 22
            DataSource = dmRef.dscRefContactInfo
            DataField = 'mobile_no'
            Ctl3D = True
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 3
          end
          object RzDBEdit10: TRzDBEdit
            Left = 219
            Top = 89
            Width = 102
            Height = 22
            DataSource = dmRef.dscRefContactInfo
            DataField = 'home_phone'
            Ctl3D = True
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 4
          end
          object edMiddle: TRzDBEdit
            Left = 114
            Top = 65
            Width = 207
            Height = 22
            DataSource = dmRef.dscRefPersonalInfo
            DataField = 'middlename'
            CharCase = ecUpperCase
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
          end
          object edFirstname: TRzDBEdit
            Left = 114
            Top = 41
            Width = 207
            Height = 22
            DataSource = dmRef.dscRefPersonalInfo
            DataField = 'firstname'
            CharCase = ecUpperCase
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 1
          end
          object edLastname: TRzDBEdit
            Left = 114
            Top = 17
            Width = 207
            Height = 22
            DataSource = dmRef.dscRefPersonalInfo
            DataField = 'lastname'
            CharCase = ecUpperCase
            FrameColor = 8675134
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 303
      Top = 150
      ExplicitLeft = 303
      ExplicitTop = 150
    end
    inherited pnlSave: TRzPanel
      Left = 247
      Top = 150
      ExplicitLeft = 247
      ExplicitTop = 150
    end
  end
end
