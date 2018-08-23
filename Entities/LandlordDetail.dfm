inherited frmLandlordDetail: TfrmLandlordDetail
  Caption = 'frmLandlordDetail'
  ClientHeight = 208
  ClientWidth = 370
  ExplicitWidth = 370
  ExplicitHeight = 208
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
      Width = 49
      Caption = 'Landlord'
      ExplicitWidth = 49
    end
  end
  inherited pnlMain: TRzPanel
    Width = 370
    Height = 187
    ExplicitWidth = 370
    ExplicitHeight = 187
    inherited pnlDetail: TRzPanel
      Width = 353
      Height = 141
      ExplicitWidth = 353
      ExplicitHeight = 141
      inherited pcDetail: TRzPageControl
        Width = 351
        Height = 139
        ExplicitWidth = 351
        ExplicitHeight = 139
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          Caption = 'Landlord details'
          ExplicitWidth = 351
          ExplicitHeight = 139
          object Label1: TLabel
            Left = 19
            Top = 23
            Width = 52
            Height = 14
            Caption = 'Lastname'
          end
          object Label2: TLabel
            Left = 19
            Top = 50
            Width = 52
            Height = 14
            Caption = 'Firstname'
          end
          object Label3: TLabel
            Left = 19
            Top = 77
            Width = 34
            Height = 14
            Caption = 'Middle'
          end
          object Label4: TLabel
            Left = 19
            Top = 103
            Width = 82
            Height = 14
            Caption = 'Mobile/Tel. no.'
          end
          object edMiddle: TRzDBEdit
            Left = 114
            Top = 71
            Width = 207
            Height = 22
            DataSource = dmEntities.dscLlPersonal
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
            DataSource = dmEntities.dscLlPersonal
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
            DataSource = dmEntities.dscLlPersonal
            DataField = 'lastname'
            CharCase = ecUpperCase
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOnEnter = True
            TabOrder = 0
          end
          object RzDBEdit11: TRzDBEdit
            Left = 114
            Top = 98
            Width = 100
            Height = 22
            DataSource = dmEntities.dscLlContact
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
            DataSource = dmEntities.dscLlContact
            DataField = 'home_phone'
            Ctl3D = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ParentCtl3D = False
            TabOnEnter = True
            TabOrder = 4
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 311
      Top = 157
      ExplicitLeft = 311
      ExplicitTop = 157
    end
    inherited pnlSave: TRzPanel
      Left = 255
      Top = 157
      ExplicitLeft = 255
      ExplicitTop = 157
    end
  end
end
