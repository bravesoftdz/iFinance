inherited frmImmHeadDetail: TfrmImmHeadDetail
  Caption = 'frmImmHeadDetail'
  ClientHeight = 183
  ClientWidth = 370
  ExplicitWidth = 370
  ExplicitHeight = 183
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
      Width = 94
      Caption = 'Immediate head'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    Width = 370
    Height = 162
    ExplicitWidth = 370
    ExplicitHeight = 155
    inherited pnlDetail: TRzPanel
      Width = 353
      Height = 116
      ExplicitWidth = 353
      ExplicitHeight = 109
      inherited pcDetail: TRzPageControl
        Width = 351
        Height = 114
        ExplicitWidth = 351
        ExplicitHeight = 107
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          Caption = 'Immediate head details'
          ExplicitWidth = 351
          ExplicitHeight = 107
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
          object edMiddle: TRzDBEdit
            Left = 114
            Top = 71
            Width = 207
            Height = 22
            DataSource = dmEntities.dscIHPersonal
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
            DataSource = dmEntities.dscIHPersonal
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
            DataSource = dmEntities.dscIHPersonal
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
      Top = 132
      ExplicitLeft = 311
      ExplicitTop = 125
    end
    inherited pnlSave: TRzPanel
      Left = 255
      Top = 132
      ExplicitLeft = 255
      ExplicitTop = 125
    end
  end
end
