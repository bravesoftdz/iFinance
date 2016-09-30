inherited frmAppSettings: TfrmAppSettings
  Caption = 'frmAppSettings'
  ClientHeight = 327
  ClientWidth = 589
  ExplicitWidth = 605
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 589
    inherited lblTitle: TRzLabel
      Width = 52
      Caption = 'Settings'
      ExplicitWidth = 52
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 28
    Width = 589
    Height = 299
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    ExplicitLeft = -42
    ExplicitTop = 16
    ExplicitWidth = 569
    ExplicitHeight = 226
    object JvGroupHeader1: TJvGroupHeader
      Left = 19
      Top = 20
      Width = 302
      Height = 12
      Caption = 'General'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel1: TJvLabel
      Left = 35
      Top = 40
      Width = 76
      Height = 13
      Caption = 'Photo directory'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 35
      Top = 64
      Width = 36
      Height = 13
      Caption = 'Recent'
      Transparent = True
    end
    object edLastname: TRzDBEdit
      Left = 114
      Top = 34
      Width = 207
      Height = 21
      DataSource = dmClient.dscPersonalInfo
      DataField = 'lastname'
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object RzDBEdit1: TRzDBEdit
      Left = 114
      Top = 58
      Width = 39
      Height = 21
      DataSource = dmClient.dscPersonalInfo
      DataField = 'lastname'
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
  end
end
