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
    ExplicitWidth = 589
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
    object JvGroupHeader1: TJvGroupHeader
      Left = 19
      Top = 22
      Width = 214
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
      Width = 61
      Height = 13
      Caption = 'Branch code'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 35
      Top = 64
      Width = 64
      Height = 13
      Caption = 'Branch name'
      Transparent = True
    end
    object JvGroupHeader2: TJvGroupHeader
      Left = 19
      Top = 94
      Width = 214
      Height = 12
      Caption = 'Display'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9134911
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 35
      Top = 112
      Width = 61
      Height = 13
      Caption = 'Branch code'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Left = 35
      Top = 136
      Width = 64
      Height = 13
      Caption = 'Branch name'
      Transparent = True
    end
    object edLastname: TRzDBEdit
      Left = 114
      Top = 34
      Width = 119
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
      Width = 119
      Height = 21
      DataSource = dmClient.dscPersonalInfo
      DataField = 'lastname'
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object RzDBEdit2: TRzDBEdit
      Left = 114
      Top = 130
      Width = 119
      Height = 21
      DataSource = dmClient.dscPersonalInfo
      DataField = 'lastname'
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object RzDBEdit3: TRzDBEdit
      Left = 114
      Top = 106
      Width = 119
      Height = 21
      DataSource = dmClient.dscPersonalInfo
      DataField = 'lastname'
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
