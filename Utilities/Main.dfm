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
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
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
    BevelOuter = bvNone
    Caption = 'pnlMain'
    Color = 14273211
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
    object Shape1: TShape
      Left = 0
      Top = -1
      Width = 393
      Height = 302
      Align = alCustom
      Brush.Color = 12955288
      Pen.Color = 6572079
    end
    object lblStatus: TLabel
      Left = 241
      Top = 275
      Width = 139
      Height = 14
      Alignment = taRightJustify
      Caption = 'No imaging device found.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object shCapture: TShape
      Left = 13
      Top = 270
      Width = 50
      Height = 22
      Brush.Style = bsClear
      Pen.Color = 6572079
    end
    object shClose: TShape
      Left = 69
      Top = 270
      Width = 50
      Height = 22
      Brush.Style = bsClear
      Pen.Color = 6572079
    end
    object ListBox2: TListBox
      Left = 152
      Top = 120
      Width = 121
      Height = 97
      ItemHeight = 14
      TabOrder = 2
    end
    object ListBox: TListBox
      Left = 48
      Top = 75
      Width = 121
      Height = 97
      ItemHeight = 14
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
    object pnlCapture: TPanel
      Left = 14
      Top = 271
      Width = 48
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      BorderWidth = 1
      Caption = 'Capture'
      Color = 14273211
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      OnClick = pnlCaptureClick
    end
    object pnlClose: TPanel
      Left = 70
      Top = 271
      Width = 48
      Height = 20
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      BorderWidth = 1
      Caption = 'Close'
      Color = 14273211
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      OnClick = pnlCloseClick
    end
  end
  object pnlTitle: TAdvPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    Color = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    OnMouseDown = pnlTitleMouseDown
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
    ColorTo = 8675134
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
        653C000001C549444154384FA5D23D481B7118C7F16753417C897248318B82A0
        824B047707870CEA6C1024AE66CAECA44B07170B1D147C2908BE54284545A2E8
        540CED9F8374482BC96548210DA1A44B25DCF4F3F9DDDF4028515B3CF872B9E7
        9ECFFF9608801725FB227220D27E2892D4529A7926EE2469688303B4E4CDC888
        F77B71D1BF4B24F0587F9696508DC7FD4FC3C31E4D70C09E2DF56B61C1FF118B
        E15FFA198BF934B4F2CE662AF138BECDCC04F1AAFF6E362BCECD818656B66C86
        C3CF9393C162FDE273B359767A1A34B4B26133DF6767713D3181A3C1C160B156
        ABA15C2EA350282097CBC1F33C6C767763C771703A3A0A1A5A796B335FA3515C
        4422381F1BC3764F0F5CD745269341369B453E9FC796E2DD87DE87C3A0A19575
        9B71A7A6703A3484A3DE5E1CEA52232E168BC1ACDE87BE3ED0D0CA9ACDDC8C8F
        E32414C249135C2A9550A9548277EC4C3F42432BAF6D263D3080ABBFF0B13E33
        E26AB51AC49D2BFD100DADACDA8CDBDF8FB4BEFCA811F3CEE7FA8CB87146432B
        CBB6D417C7F133FA829D3DDC1B6B9CA53B3B7D1A5A096B09FD5BBE696DF54C57
        977FAB0B4F6514AFB7B47834B4BC421D2291A8C8CABCC8A5669EE992BB34B43C
        A04D73B457FF991A69BB071100EBB41EE44A3B0000000049454E44AE426082}
      ShowHint = True
      OnClick = imgCloseClick
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
