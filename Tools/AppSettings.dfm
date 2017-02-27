inherited frmAppSettings: TfrmAppSettings
  Caption = 'frmAppSettings'
  ClientHeight = 467
  ClientWidth = 803
  ExplicitWidth = 819
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 14
  object JvLabel1: TJvLabel [0]
    Left = 41
    Top = 80
    Width = 70
    Height = 14
    Caption = 'Branch code'
    Transparent = True
  end
  object JvLabel2: TJvLabel [1]
    Left = 41
    Top = 105
    Width = 73
    Height = 14
    Caption = 'Branch prefix'
    Transparent = True
  end
  object JvLabel3: TJvLabel [2]
    Left = 41
    Top = 193
    Width = 117
    Height = 14
    Caption = 'Maximum no. of days'
    Transparent = True
  end
  object JvLabel4: TJvLabel [3]
    Left = 41
    Top = 257
    Width = 147
    Height = 14
    Caption = 'Maximum comakered loans'
    Transparent = True
  end
  inherited pnlTitle: TRzPanel
    Width = 803
    ExplicitWidth = 803
    inherited lblTitle: TRzLabel
      Width = 52
      Caption = 'Settings'
      ExplicitWidth = 52
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 26
    Top = 52
    Width = 231
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'General'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 14273211
    FlatColor = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 1
  end
  object edSearchKey: TRzEdit
    Left = 136
    Top = 74
    Width = 121
    Height = 22
    Text = ''
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 2
  end
  object RzEdit1: TRzEdit
    Left = 136
    Top = 99
    Width = 121
    Height = 22
    Text = ''
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 3
  end
  object RzGroupBox2: TRzGroupBox
    Left = 26
    Top = 140
    Width = 231
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Loans'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 14273211
    FlatColor = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 4
  end
  object RzEdit2: TRzEdit
    Left = 216
    Top = 187
    Width = 41
    Height = 22
    Text = ''
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 5
  end
  object cbxNew: TRzCheckBox
    Left = 41
    Top = 166
    Width = 176
    Height = 16
    Caption = 'Auto-cancel loan applications'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object RzGroupBox3: TRzGroupBox
    Left = 26
    Top = 228
    Width = 231
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Comakers'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 14273211
    FlatColor = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 7
  end
  object RzEdit3: TRzEdit
    Left = 216
    Top = 251
    Width = 41
    Height = 22
    Text = ''
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 8
  end
end
