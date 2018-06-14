inherited frmAppSettings: TfrmAppSettings
  Caption = 'frmAppSettings'
  ClientHeight = 467
  ClientWidth = 803
  OnCreate = FormCreate
  ExplicitWidth = 819
  ExplicitHeight = 506
  PixelsPerInch = 96
  TextHeight = 14
  object JvLabel1: TJvLabel [0]
    Left = 41
    Top = 82
    Width = 70
    Height = 14
    Caption = 'Branch code'
    Transparent = True
  end
  object JvLabel2: TJvLabel [1]
    Left = 41
    Top = 109
    Width = 73
    Height = 14
    Caption = 'Branch prefix'
    Transparent = True
  end
  object JvLabel3: TJvLabel [2]
    Left = 41
    Top = 299
    Width = 117
    Height = 14
    Caption = 'Maximum no. of days'
    Transparent = True
  end
  object JvLabel4: TJvLabel [3]
    Left = 41
    Top = 203
    Width = 65
    Height = 14
    Caption = 'Cutoff date'
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
    Color = 15327448
    FlatColor = 12493963
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
  object edBranchCode: TRzEdit
    Left = 136
    Top = 76
    Width = 121
    Height = 22
    Text = ''
    CharCase = ecUpperCase
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 2
  end
  object edBranchPrefix: TRzEdit
    Tag = 1
    Left = 136
    Top = 103
    Width = 121
    Height = 22
    Text = ''
    CharCase = ecUpperCase
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 3
  end
  object RzGroupBox2: TRzGroupBox
    Left = 26
    Top = 246
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
    Color = 15327448
    FlatColor = 12493963
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 6
  end
  object RzEdit2: TRzEdit
    Tag = -1
    Left = 216
    Top = 293
    Width = 41
    Height = 22
    Text = ''
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 7
  end
  object cbxNew: TRzCheckBox
    Tag = -1
    Left = 41
    Top = 272
    Width = 176
    Height = 16
    Caption = 'Auto-cancel loan applications'
    State = cbUnchecked
    TabOrder = 8
  end
  object cbxEnableBacklog: TRzCheckBox
    Tag = 2
    Left = 41
    Top = 172
    Width = 133
    Height = 16
    Caption = 'Enable backlog entry'
    State = cbUnchecked
    TabOrder = 4
  end
  object RzGroupBox3: TRzGroupBox
    Left = 26
    Top = 148
    Width = 231
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Backlogs'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 15327448
    FlatColor = 12493963
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 9
  end
  object dteCutoff: TRzDateTimeEdit
    Tag = 3
    Left = 136
    Top = 197
    Width = 121
    Height = 22
    EditType = etDate
    Format = 'mm/dd/yyyy'
    FlatButtons = True
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 5
  end
end
