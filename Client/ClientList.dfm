inherited frmClientList: TfrmClientList
  Caption = 'frmClientList'
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 28
    Width = 527
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 1
    ExplicitTop = 27
    DesignSize = (
      527
      41)
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 33
      Height = 13
      Caption = 'Search'
    end
    object RzEdit1: TRzEdit
      Left = 47
      Top = 16
      Width = 475
      Height = 21
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 69
    Width = 527
    Height = 173
    Align = alClient
    BorderOuter = fsNone
    BorderWidth = 5
    TabOrder = 2
    ExplicitTop = 36
    ExplicitHeight = 41
    object RzDBGrid1: TRzDBGrid
      Left = 5
      Top = 5
      Width = 517
      Height = 163
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
