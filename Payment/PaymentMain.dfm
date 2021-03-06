inherited frmPaymentMain: TfrmPaymentMain
  Caption = 'frmPaymentMain'
  ClientHeight = 382
  ClientWidth = 906
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 922
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 14
  object c: TJvLabel [0]
    Tag = -1
    Left = 310
    Top = 59
    Width = 32
    Height = 14
    Caption = 'Client'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object JvLabel7: TJvLabel [1]
    Left = 22
    Top = 59
    Width = 28
    Height = 14
    Caption = 'Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object JvLabel1: TJvLabel [2]
    Left = 22
    Top = 89
    Width = 65
    Height = 14
    Caption = 'Receipt no.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblTotalAmount: TJvLabel [3]
    Tag = -1
    Left = 876
    Top = 280
    Width = 6
    Height = 14
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akRight, akBottom]
    ParentFont = False
    Transparent = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvLabel2: TJvLabel [4]
    Left = 23
    Top = 360
    Width = 91
    Height = 14
    Caption = 'Reference no.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Transparent = True
    Visible = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    ExplicitTop = 372
  end
  object lblReferenceNo: TJvLabel [5]
    Left = 119
    Top = 360
    Width = 6
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Transparent = True
    Visible = False
    ExplicitTop = 372
  end
  object JvLabel4: TJvLabel [6]
    Left = 264
    Top = 360
    Width = 49
    Height = 14
    Caption = 'Posted:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Transparent = True
    Visible = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    ExplicitTop = 372
  end
  object lblPosted: TJvLabel [7]
    Left = 322
    Top = 360
    Width = 6
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Transparent = True
    Visible = False
    ExplicitTop = 372
  end
  object JvLabel3: TJvLabel [8]
    Left = 310
    Top = 89
    Width = 44
    Height = 14
    Caption = 'Method'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblWithdrawn: TJvLabel [9]
    Tag = -1
    Left = 435
    Top = 281
    Width = 6
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akRight, akBottom]
    ParentFont = False
    Transparent = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object lblAdvancePayment: TJvLabel [10]
    Left = 549
    Top = 91
    Width = 157
    Height = 14
    Caption = 'This is an advance payment.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object lblChange: TJvLabel [11]
    Tag = -1
    Left = 435
    Top = 312
    Width = 6
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akRight, akBottom]
    ParentFont = False
    Transparent = True
    Visible = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  inherited pnlTitle: TRzPanel
    Width = 906
    ExplicitWidth = 906
    inherited lblTitle: TRzLabel
      Width = 54
      Caption = 'Payment'
      ExplicitWidth = 54
    end
  end
  object pnlDetail: TRzPanel
    Left = 22
    Top = 136
    Width = 860
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 14273211
    TabOrder = 1
    object grDetailStringGrid: TRzStringGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 131
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ColCount = 8
      Ctl3D = False
      FixedColor = clWhite
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = grDetailStringGridDrawCell
      FrameColor = 8675134
      FramingPreference = fpCustomFraming
      FixedLineColor = 14272955
      LineColor = clWindow
      UseDrawingStyle = False
      OnResize = grDetailStringGridResize
      ColWidths = (
        60
        60
        60
        60
        60
        60
        60
        60)
      RowHeights = (
        18)
    end
    object grDetail: TRzDBGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 131
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = dmPayment.dscDetail
      FixedColor = clWhite
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FrameColor = 14272955
      FrameSides = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = 6572079
      AltRowShadingColor = 15854564
      AltRowShadingFixed = False
      Columns = <
        item
          Expanded = False
          FieldName = 'LoanId'
          Title.Alignment = taCenter
          Title.Caption = 'Loan ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LoanType'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AccountType'
          Title.Alignment = taCenter
          Title.Caption = 'Account'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Interest'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Principal'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Penalty'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TotalAmount'
          Title.Alignment = taCenter
          Title.Caption = 'Total amount'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end>
    end
  end
  object pnlAddPayment: TRzPanel
    Left = 22
    Top = 308
    Width = 40
    Height = 40
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 2
    object imgAddPayment: TImage
      Left = 4
      Top = 4
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Add payment'
      AutoSize = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
        097048597300000048000000480046C96B3E0000000976704167000000200000
        00200087FA9C9D000007024944415478DAC5970B50545518C7FFF7EEDD852510
        445EBEB0424D1CA326A7EC614E4D690A8202A2A4A6449938A6389A2F7C9B9A86
        599A1665858869C5537CD4A03553694F35454433261315BACB222C8AECE33EFA
        CEBDB02E45238D399EE1CCC2B9F77EE777BEFFFFFBF6C2A9AA8ADB39B8DB0EE0
        F1BB90B6313E9FE3D451B70A8AE338A82AB73B2BBD680CFD29790218A66E88CB
        1B3A78687CBFDEFDA128CA2D01E0791E672A2B70E0D081A2F7669724D192CC00
        84E99B128A1E8A1A3032BC6B0F48B2845B9901C120A0AAE6227E2A2BDFBB6566
        613C03F09B9995D8B826650B6DEE722745C5BF4370AD896BCD9F8A8E3F43F708
        062332B64DC7A6B4824E6C357856D618CBAAE7DFC68CCD2930194D5015154EC9
        05A59D4CB0403CCF69E96427D242D27D4C364551DB85E0E93E93600447CF395D
        4EBCFDF2362CCE9E81B7D2F243588490D95B93C4E5933660CDC7F360144C5AA0
        618F3C0E99827A06D437E771A5E90A8E9D3E0DCBE53A6D3D24B00B1E888C84DF
        1D7E1AC8DF9F31D033A5DF7FAB81BB24273226BC8EE5DB6763C394BC500D60EE
        07C962C684B5D858B802662F6F984C6644F5656694DDA1B89693B0EC947CF325
        BA05052134A88B764DB4D6A1DA6A45DC90A7B453AA1A84C773BC0127CE56D0E9
        ED6876D8919EB08C0EBB00992F7EA203CCFF68BC383779259664CF437274225C
        B2AA9DBE55020A099EA691821F2B3F4EA770A15B70B0FB3A03ABAEADA5EC0918
        D8FF3E7A566E47361E8260C0AECF8BB022753D323F598A75A93B758085DB268A
        339396605DEE62CCEA1B063FEB05F0B2C31D40E64DB005F6C0A53B1FA6D397A2
        FFDD1130919114556901E0B5D456FC5E89B8279F812C2B6E8F307FB402090603
        F24A8BB178D26ABC99B71AAFA5ECD00116E54C12A724CC8773FF7CF48C0C031F
        1408D568B87E02970CC55A8F6B3512565F92F150E4BD5064D9AD75EB098F56FC
        82D14FC7325762EFD7A56868B421A0933F62860CD3200C045078A01873C72FC5
        96824CAC9ABC5D0758BC63B23829F615743DB40A3E517790F68C9C676763C5CB
        7E601078388FD76089351083FA451180D416C0C0E3D8A923887D2A4E5BDB7DA0
        44AB79D65746119424EB004504903E3603EF97BC819513737480653B52C5E4D8
        7484EC9D85C0E49D906BB6426D3C421BEB00BCB13338A509578EDBB14EED8901
        E111305230965EAEA5C1B01E72FAF70A8C181CADADFF70E2309A9BAFC26CF6C3
        C3518F6A723180E2AF0A90963017D97B3661F9846C1D60C5AE17C4A4E8E908DD
        3B0701096F813745E8A7775441B97A1CDCB572708E32D8CA78E4860E86EA6C46
        585057BA87B4A6CD048A62B15CD42A6040DFFB0940D17CA17B80B51EDA9C2AC1
        48BD60F7C13CA4C4CD40EEBE77B0E4D90F7580573F7D498C1F3E15DDC80342AF
        2EF00ABB07826F7F02F80D5C533954471D9AAA8D70347A81AC47A726F3D12612
        6F44AD7F77FC68EE896ACB053C31682861735A75701E9D924951585A80862B0D
        9A94B3276660E7FEF7B068DC561D60CD676962ECF05474DF9701A1CF68C8B60B
        3004F6A3CF3FE0AA3B4B7BD961A6EA3086F883137877EFE52432676D3DC4CA3A
        9C1BF81C02BC7D6873B94D7B66FE11E8E4BB4AB69104BA275E1A3B139FEECFC6
        C2B1593AC0DAFC69E2F061A908DFB78024D808CE74A7E66438CF03CD2751F7DD
        7E04DC472D5AC63FCCC91390E3E845AC7786C3A8B83459FED103480E569AEC7E
        893EC7C6BC88E2D21CCC1BF3AE0EB0BE7886F8CCD0E7D173CF02F0BD3AC39B24
        30F84602769280002C471A113A2E87CCF97E5B730A644EF52A6C47AFE15CCC52
        9814A7D6B4DAFD2A6A91831954A0BEB2E7602EE6C46FD6008297E74C293405F8
        0E9EEE38033E6224A486AAEB125CFE158AA31EC1A333C99C77B73527F983739E
        446319B099AE79AB127BC5C28D0633676383FDF0B294ADFAD731CD709ADD6C79
        D1A59D466502C65E2D12545116CA207EB11DE6707FCA4C5FB739A199F332E4AB
        3C9AFFF4414062D1088AE1BAE1EEFA606F43569A55DA0B094D33CDB0BAFCD8B3
        C6EEBEB4511F0F09CA517B8CEAB94F0CE496CC4894194933A703E640035C0D0A
        BA2416F4A318F51D046069B2D36CF67C270CA9CD8F15BDEE1A411B9D6F2381EA
        B42138613D387766C89C4D27816BA7280C0196090849CC0FA518960E0278B8C3
        03C09237520C1AF5BABE11AE5781E58B1C78F7F2879924D0335349FA9F84E2AC
        874412D86AFC10FA7F005417C6FFEADBC32FC0ECAE82B3D4054F6855A04B70BE
        5D09EC36152109370F1040B3F7CFEF0CDB181EECFD28EB74D0CA8DA622511578
        64C6C12428734B602109FE8F0C186906D2644DDE1FBA39B5F5F33B63733BF7EE
        1C64F6E80FA032642D9A4960BDE8D3D03DA9F09E9B0500AE5784B7C7351F0645
        99C9A4CC3CE6CE0CE87D81BE60AA2C4DDF3D38EDF3745AA8A4D970B300ED8DD6
        CC84B5C824785C63F56CA35943F3323ADE07FE13806766BCA0B542F770D7730B
        CC7F1E1D05B865E3B6FF77FC173B442C99DC311D280000003D74455874636F6D
        6D656E7400506C616E20636F737420746F74616C2066726F6D2049636F6E2047
        616C6C65727920687474703A2F2F69636F6E67616C2E636F6D2F5CC301760000
        002574455874646174653A63726561746500323031312D30382D32315431343A
        31303A34322D30363A3030627BD0EE0000002574455874646174653A6D6F6469
        667900323031312D30382D32315431343A31303A34322D30363A303013266852
        0000001974455874536F6674776172650041646F626520496D61676552656164
        7971C9653C0000000049454E44AE426082}
      ShowHint = True
      OnClick = imgAddPaymentClick
      OnMouseDown = imgAddPaymentMouseDown
      OnMouseUp = imgAddPaymentMouseUp
    end
  end
  object edClient: TRzEdit
    Left = 377
    Top = 53
    Width = 505
    Height = 22
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Color = clWhite
    DisabledColor = clWhite
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnly = True
    ReadOnlyColor = clWhite
    TabOrder = 6
  end
  object pnlDeletePayment: TRzPanel
    Left = 65
    Top = 308
    Width = 40
    Height = 40
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 3
    object imgDeletePayment: TImage
      Left = 4
      Top = 4
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Delete payment'
      AutoSize = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
        097048597300000048000000480046C96B3E0000000976704167000000200000
        00200087FA9C9D000006B34944415478DAED977954555514877FF7DEF79EA032
        C4A854684622845884688E994296F8E0A1544E88954939909A96F39043495240
        B4485D8A84B332A5E290954AE184031222A9CB2CC527382012CA1B6EFB9CFBA0
        E790A90B97FF74D6DA6BC1E1ECBDBFB3A77B106459C6A35CC2FF00563FAB6212
        74EB05410E7B58508220409685EC94D8CCFEF4ABD11A401A11AF5D17DC2558D7
        C6CB1766B3F9A10088A2889213C5D89EB73DF39B713991B4656200AA91891199
        41FE7EA19ECD9F80D164C4C38C804A52E14CD99FD85758B431794C868E01D88D
        49E977755E74323937D40745C6BF43087581AB8B9F8C7BD7A1332A498DC9A923
        9118B3C19EEDBA7E90D2FFC29C614918FD5534346A0D64B38C5AA301E63B4482
        191245818793DD889BA4732C6D66B37C470891CE69546A08A4576BA845D2A854
        4C5D361A5FC6AC776316DCC62D8ED4CF8C8AC7BC1513A15669B8A19017BBC244
        46AD0D2ACE45545557E1E0B163B870E922DF77737246808F0FEC9AD871905B75
        24D2D996BF9B831B8CB5983C680166A68D43FCF075EE1C60C29237F593077D8A
        848C59B06D644351B041BBD6AC184DF5A6D841810CB1E8E4ECDA010F1717B8BB
        38F3BFE92B2EE25C4505B4DD7AF25BCA1CE21F3D519470A4B4986E7F1D3537AE
        233662065DF663C4BDB35A01F868E940FD84376763C6D20F31E0551D8C46D36D
        37614B224305C547E8164678B8BAD6A78885F85C7939454F85177CDB51E44C77
        489B08954AC2AADC4CCC7AEB73C4AD9E8ECFDE5AA9004C4A1DAC1F1B390573D2
        A62032249C8AD154EF50E95D25C7922422E7C7ADF06DE5A5A44A365B00441EDA
        E25327A0EDF10A4C26737D8D30DD3A20952461DDB62C4C8D9A8B2FD6CDC5FCE8
        740560EAF228FDC87E1310B772362282C3C980893BDFB46B1BAE5CAD84A3BD03
        42BB87B03E42D6F7DFD12D9FBF294275372C283E84F05E5ABEBF91EB5E255D7B
        84760BB1D81491B13D1B13064E43F28638CC199AA6004C4F1FAA7F573B1E096B
        E741670160B4D9E48CF52D9B0D61C15AEEECBB1D39087836106693158020F03C
        179414401BA2834C91CAA07312A5C444BABA5E6130190C50D1F1CCDC0D888D9C
        8445D90B317BF0720560E68A61FA617DC72025230EE12FF7E3002CAC7B0A7F41
        4D4D156C6D9BA263BBCEDC516EDE66F8B4F2859A7AB92E05AC380DB209C7CEFE
        86DE0EDE30AEDA0E7157210402E129A09A91BBB5837A6008B2CA0FE3FDD0B148
        CD4AC0CC414B15804F56BDAD1FD2E77DA4E62421AC5724E5D3C0F346F7625157
        6A809C090455547A98774233570F05800E08545C655515704EFF092D0EE9E1D1
        BB371EF3F787AA49130E68BC568DCB470B71764B2E8EFBD8A3D3A214ACCC48C4
        F4D7172B0073D70CD70F7C6D04E2D3E711AD198E768E8808E9C7435F37E9644B
        B5B3C0EFDEB315EE6E4FC2D5D9836DE27C75391C92B2D1F2BC09BEA36251FB5B
        11AEEFDB05637999527CAECD6113D40D9A67FCF06BE217107B0661535B605A68
        9202307F6D8CFE8DD78661D1DA449E7396B701DA686A470364EB86669D2148B8
        4669293D7514972B2F42564B7028ABC673CB0BE0377E3C6A36AE81E1EC693AA8
        62034051621F37B2A97EBC256C425F47D1C278EC1DEC8FD131961A58B0FE3D7D
        78C850ACDDB4840044EE94B51C0BF1ADB380553C4B056F3312B38D1ADECBF6A0
        43C02BB02D2B45EDC912A6CC5373D3C78219A5DAD23CDD06351EDEC82FFE01BA
        D49D0AC0C2CC51FABEBD86C068AEB59AEF565F993B7D11586D3080C68D70D957
        87C089E3F157561A6456707C8EC8B7EB1098409DD138221AFBBE4E46F77D251C
        C07556EAF04C7B479BCEF7FB19962501C6268DD0E9830C04F5EF8B9A823C3864
        1FB8AB4E655820D54357E46FDE861EBF1473003B124F1217562FF745A02CF5EE
        80D6B9412F75C48DDF4FC26E7DDE5D0F57F5EF02CD535EC8CF2F408F9F8B3800
        736A4B62839B9F68F7BA1EDBD9D1B7A4BD9F1785DE08F3F51A9E06DC1A4DDEAE
        2A8836B6940A35F6969C428FBCA3EE0FE2F0D6E59ADDC1674B7B2FCF00174707
        9A909617D5ED25A04C4CEA8E8A2B95D87FF28F83617B8A7B370480C3C8561EDA
        C12D9BA5B56FEBC33778F7DC1E003E5DD9DA7FF418D24F9F8F4A3E752EA72100
        34241EDF067A27783BD96B03FD9EE5C38945A1AEA8D9CD7977D1043D50F42B8E
        5FBA9A33E4C0F158FAD3B98600A82BE416A901ADE77B3BD9F5F16AE909177AB0
        D0034039413551410F9613A7CF90F3AA4DD1074B27D1EEEF24550D01C096C452
        41F27894A75B176D73A7186795E46F3D442F1A4D8539659752D2CE5C606D7296
        A412966779432D06C1BE3E4E505ABAA9658F2D3699AE9154905C22A9B6EC3D50
        DBFD573AD450DA5A839B1FEEB52435240658F5484303DC3FF1A3FEE7F46F7FF7
        E0CE6D5A80B00000003A74455874636F6D6D656E740044656C657465206D6F6E
        65792066726F6D2049636F6E2047616C6C65727920687474703A2F2F69636F6E
        67616C2E636F6D2F40DEE05F0000002574455874646174653A63726561746500
        323031312D30382D32315431343A31313A32312D30363A30307A3EA8CA000000
        2574455874646174653A6D6F6469667900323031312D30382D32315431343A31
        313A32312D30363A30300B6310760000001974455874536F6674776172650041
        646F626520496D616765526561647971C9653C0000000049454E44AE426082}
      ShowHint = True
      OnClick = imgDeletePaymentClick
      OnMouseDown = imgAddPaymentMouseDown
      OnMouseUp = imgAddPaymentMouseUp
    end
  end
  object dtePaymentDate: TRzDBDateTimeEdit
    Left = 105
    Top = 53
    Width = 152
    Height = 22
    DataSource = dmPayment.dscPayment
    DataField = 'payment_date'
    ReadOnly = True
    Color = clWhite
    DisabledColor = clWhite
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOrder = 4
    OnChange = dtePaymentDateChange
    EditType = etDate
    Format = 'mm/dd/yyyy'
    FlatButtonColor = 14273211
    FlatButtons = True
  end
  object edReceipt: TRzDBEdit
    Left = 105
    Top = 83
    Width = 152
    Height = 22
    DataSource = dmPayment.dscPayment
    DataField = 'receipt_no'
    ReadOnly = True
    Color = clWhite
    DisabledColor = clWhite
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOrder = 5
  end
  object cmbPaymentMethod: TRzComboBox
    Left = 377
    Top = 83
    Width = 152
    Height = 22
    AllowEdit = False
    Color = clWhite
    Ctl3D = False
    DisabledColor = clWhite
    FrameColor = 14272955
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    ReadOnlyColor = clWhite
    Sorted = True
    TabOrder = 7
  end
end
