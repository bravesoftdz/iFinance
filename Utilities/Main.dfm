object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'PhotoUtil'
  ClientHeight = 322
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shMain: TShape
    Left = 0
    Top = 21
    Width = 393
    Height = 301
    Align = alClient
    Pen.Color = clSilver
    ExplicitLeft = -3
    ExplicitTop = 0
    ExplicitWidth = 768
    ExplicitHeight = 561
  end
  object pnlMain: TPanel
    Left = 0
    Top = 21
    Width = 393
    Height = 301
    Align = alClient
    BorderWidth = 1
    Caption = 'pnlMain'
    Color = 14408667
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      393
      301)
    object lbImageDevice: TLabel
      Left = 4
      Top = 325
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object imgSnapshot: TImage
      Left = 232
      Top = 152
      Width = 105
      Height = 105
    end
    object lblStatus: TLabel
      Left = 259
      Top = 275
      Width = 121
      Height = 13
      Caption = 'No imaging device found.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ListBox2: TListBox
      Left = 152
      Top = 120
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 2
    end
    object ListBox: TListBox
      Left = 48
      Top = 75
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 0
    end
    object VideoWindow: TVideoWindow
      Left = 13
      Top = 12
      Width = 367
      Height = 249
      FilterGraph = CaptureGraph
      VMROptions.Mode = vmrWindowed
      Color = clBlack
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
    object btnGetPhoto: TButton
      Left = 13
      Top = 269
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Get photo'
      TabOrder = 3
      OnClick = btnGetPhotoClick
    end
    object btnClose: TButton
      Left = 94
      Top = 269
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 4
      OnClick = btnCloseClick
    end
  end
  object pnlTitle: TAdvPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    Color = 9660740
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.2.0.2'
    BorderWidth = 1
    Caption.Color = clBlack
    Caption.ColorTo = clWhite
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.ShadeType = stVShade
    ColorTo = 11110503
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      393
      21)
    FullHeight = 21
    object lblTitle: TLabel
      Left = 10
      Top = 4
      Width = 115
      Height = 13
      Caption = 'Capture client photo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgClose: TImage
      Left = 372
      Top = 2
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Close'
      Anchors = [akRight, akBottom]
      AutoSize = True
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        1974455874536F6674776172650041646F626520496D616765526561647971C9
        653C0000018B49444154384FA5D23F48026118C7F167B3204A458E085D1C0C75
        CBA0DDA1C1219D9340AE3527E7A65A1A5A0C1A22A282A2A2C1411B2C6A0AA55E
        0E6DE80FA8430D49842D05DEF4F4FC7CA1A9EC22E10372EFF37DEE388E98F95F
        E880880E89868E8872A22CD42F30934383B6B740E42A9148F36D7EDEFEC866F9
        27EF0B0BDC314DFB321C6EA2E92DD8D3CAAF998CFD944EB313CFE9B48D062DED
        6AEAC534F92E9974E4717696D1A0A52D4DE1E2553CEEC8EDCC0CA3414B1B9ABA
        4FA5F8626AEA4B7962820BE3E3BCEFF7F3B661F0A6D7DB83FFA56894D1A0A575
        4DDD24127C1A8B71B7DBE556ABC5966571BD5EE746A3C1ED769B3B9D4ECF8EC7
        C3C78100A3414B794D59D3D35C0A85B856ABB152EADB188E6441617494D1A0A5
        554D552627B9288F782003FD14C589CFC768D0D28AA6AAC1209FCBA123722334
        6869595396BCACAA1C3A85062D2D6AE56BC3B0EB72E0447564C446839602222B
        9FE5DAC04053B9DDF6830CF4A324CEBB5C4D3468F1F30E13C512444B73446742
        FDE20CB368D062C1A030C4D81F4943839F560DCB2B8FADDBF50000000049454E
        44AE426082}
      ShowHint = True
      OnClick = btnCloseClick
      ExplicitLeft = 585
    end
  end
  object VideoSourceFilter: TFilter
    BaseFilter.data = {00000000}
    Left = 176
    Top = 65489
  end
  object CaptureGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 208
    Top = 65489
  end
  object SampleGrabber: TSampleGrabber
    FilterGraph = CaptureGraph
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 240
    Top = 65489
  end
end
