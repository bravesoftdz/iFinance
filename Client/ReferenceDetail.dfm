inherited frmReferenceDetail: TfrmReferenceDetail
  Caption = 'frmReferenceDetail'
  ClientHeight = 208
  ClientWidth = 360
  ExplicitWidth = 360
  ExplicitHeight = 208
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 360
    ExplicitWidth = 360
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
    Height = 187
    ExplicitWidth = 360
    ExplicitHeight = 181
    inherited pnlDetail: TRzPanel
      Width = 345
      Height = 139
      ExplicitWidth = 345
      ExplicitHeight = 133
      inherited pcDetail: TRzPageControl
        Width = 343
        Height = 137
        ExplicitWidth = 343
        ExplicitHeight = 131
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          Caption = 'Reference details'
          ExplicitWidth = 343
          ExplicitHeight = 131
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
          object RzDBEdit11: TRzDBEdit
            Left = 114
            Top = 98
            Width = 100
            Height = 22
            DataSource = dmRef.dscRefContactInfo
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
            DataSource = dmRef.dscRefContactInfo
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
            DataSource = dmRef.dscRefPersonalInfo
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
            DataSource = dmRef.dscRefPersonalInfo
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
            DataSource = dmRef.dscRefPersonalInfo
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
      Left = 303
      Top = 156
      ExplicitLeft = 303
      ExplicitTop = 150
    end
    inherited pnlSave: TRzPanel
      Left = 247
      Top = 156
      ExplicitLeft = 247
      ExplicitTop = 150
    end
  end
end
