inherited frmRefereeDetail: TfrmRefereeDetail
  Caption = 'frmRefereeDetail'
  ClientHeight = 216
  ClientWidth = 370
  ExplicitWidth = 370
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 370
    ExplicitWidth = 370
    inherited imgClose: TImage
      Left = 349
      ExplicitLeft = 349
    end
    inherited lblCaption: TRzLabel
      Width = 45
      Caption = 'Referee'
      ExplicitWidth = 45
    end
  end
  inherited pnlMain: TRzPanel
    Width = 370
    Height = 195
    ExplicitWidth = 370
    ExplicitHeight = 187
    inherited pnlDetail: TRzPanel
      Width = 353
      Height = 146
      ExplicitWidth = 353
      ExplicitHeight = 138
      inherited pcDetail: TRzPageControl
        Width = 351
        Height = 144
        ExplicitWidth = 351
        ExplicitHeight = 136
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 351
          ExplicitHeight = 136
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
            Top = 50
            Width = 54
            Height = 14
            Caption = 'Firstname'
            Transparent = True
          end
          object JvLabel3: TJvLabel
            Left = 19
            Top = 77
            Width = 36
            Height = 14
            Caption = 'Middle'
            Transparent = True
          end
          object JvLabel22: TJvLabel
            Left = 19
            Top = 104
            Width = 65
            Height = 14
            Caption = 'Cell/tel. no.'
            Transparent = True
          end
          object RzDBEdit11: TRzDBEdit
            Left = 114
            Top = 98
            Width = 102
            Height = 22
            DataSource = dmEntities.dscRefContact
            DataField = 'mobile_no'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 3
          end
          object RzDBEdit10: TRzDBEdit
            Left = 221
            Top = 98
            Width = 100
            Height = 22
            DataSource = dmEntities.dscRefContact
            DataField = 'home_phone'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 4
          end
          object edMiddleName: TRzDBEdit
            Left = 114
            Top = 71
            Width = 207
            Height = 22
            DataSource = dmEntities.dscRefPersonal
            DataField = 'middlename'
            CharCase = ecUpperCase
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 2
          end
          object edFirstname: TRzDBEdit
            Left = 114
            Top = 44
            Width = 207
            Height = 22
            DataSource = dmEntities.dscRefPersonal
            DataField = 'firstname'
            CharCase = ecUpperCase
            FrameColor = 14272955
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
            DataSource = dmEntities.dscRefPersonal
            DataField = 'lastname'
            CharCase = ecUpperCase
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 311
      Top = 163
      ExplicitLeft = 311
      ExplicitTop = 155
    end
    inherited pnlSave: TRzPanel
      Left = 255
      Top = 163
      ExplicitLeft = 255
      ExplicitTop = 155
    end
  end
end
