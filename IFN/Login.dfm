inherited frmLogin: TfrmLogin
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 204
  ClientWidth = 434
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 434
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 434
    ExplicitWidth = 434
    inherited imgClose: TImage
      Left = 412
      ExplicitLeft = 410
    end
    inherited lblCaption: TRzLabel
      Width = 84
      Caption = 'i-Finance Login'
      ExplicitWidth = 84
    end
    object lblVersion: TLabel
      Left = 70
      Top = 75
      Width = 32
      Height = 13
      Caption = 'V1.0.0'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  inherited pnlMain: TRzPanel
    Width = 434
    Height = 183
    ExplicitWidth = 434
    ExplicitHeight = 183
    object Label4: TLabel
      Left = 71
      Top = 11
      Width = 76
      Height = 23
      Alignment = taCenter
      Caption = 'i-Finance'
      Color = 10196313
      Font.Charset = ANSI_CHARSET
      Font.Color = 6960384
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 71
      Top = 34
      Width = 293
      Height = 14
      Caption = 'Integrated Financial Management Information System'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 9079434
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 115
      Top = 75
      Width = 48
      Height = 13
      Caption = 'Username'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 115
      Top = 99
      Width = 46
      Height = 13
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbErrorMessage: TLabel
      Left = 14
      Top = 164
      Width = 69
      Height = 13
      Caption = 'Error Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object imgLogo: TImage
      Left = 14
      Top = 4
      Width = 50
      Height = 53
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
        003208060000001E3F88B1000004ED4944415478DAED977D4C5B5514C0CF7DAF
        1F08812243074599D2FD21CA360CC3CC2069498C3A5A1C511375618ECDF9CFFE
        1192A12B46D365A334E30FBBBFFCD892E1E69698F8012B45334D60898665ACD9
        92A96C86AFA22BC4B08DEFD2DAF7AEE732E81814FA365ADA6A4FF2F2EE47CFBD
        E777EE39E7DD12F88F0889B401FF4B9072535BAAE899DCC6DA9C32A9B9C95432
        1273200C02044F27C7716AD61745D105BCB2700E266640CA8C2D550AB9C2BCE5
        D9671E60FDF31D17DC5EDF3F7B6D667D632C8258104419719032636B3900DD89
        4F3FAF4C3A303FC68389DED8522CE7B9769E938968B55710844190256C5EF5D0
        62101C075F65AA3315E363E3D3139393CEE6435B9F90A27B3BC9A72E51A01D40
        C85936C62B129B2292EC65467B7BD6236AAD26E771F0F904E8E8380F3E80A75B
        CDFACB4121BC536D945282A7A85BEA14570DE465634B63724ACA8EBCBCA7B891
        9151E8EAEAC208A37BCFD41B3E59D601B5F6E3F82AC113C85F2E142583CC7AE6
        4B6CEAF1B1738AC48A7B897134E81447C81BE8598EF5399E6B157D62115AD087
        A5B4BAC552D6BE08BED66E050A953E02BA602727190417FD39254555B46EDDA3
        E074FE09A3E363ADB6BA52BD44884ADCE8380B25D6572812FB9913663F70568C
        FB9D9442134FB96A81085810601B8EB950673B429604825C0908DDB0210F5253
        55C042E3CA955FE18C591F549F253921F43B0AB06BAE542E94D25A7B3E4FC14A
        0868154A8590B136831F1C1A02AFD7F3A3CD6C78418A7D92406E7BCE7D4D959A
        FC707676360C0C0CC0E8E8383A981EC2103BB2548831036540DB709B23086D92
        E2ACDCDC5C484F4F83E1E19B70F5EAEF13CD7586E49080F8AB069035F86B27A1
        F4394A482B5E12EC40C97B046B2202993069BF58AC37D987B3CD385729C51804
        F94BADCECCD26872A0A7B70F065DAEAEE63AFD932B0699F328C6AF3350E99B85
        AC4263AB90E79240E92939CF57E354B6208A6E5CDC65AB37E44B31E4CE7EF00B
        3613F199C2232F0A96E40141666215E05DD61629EDE309544BF168F9FEEF1FC3
        2435E385EE4DFCE0812A4505DDDD3DD4E399FE0013B55E2AC89C18F6DB745212
        3C20083386F2E26FE9E90FA153283F3C7C831704F1608BC5F091D4CD11A4ADB8
        B868A6CF2A9BD33970CE56AFD7DD2BC8FD881F04E3D39490A0DC5758B83989F5
        3B3B1DD36EB7DB88A16195B2D06C985DC7184F6495ADBBBBD7EBF178DE97AABF
        9C6CFFBC269F97816AE1384F7867E32E4BFF5D20ACD6F31CF9ACA0A040C1FA0E
        87032F66F0BAADBEB449EA862C34E5044E5311B271E56358A9AA42E1ED1D476B
        DA0921DA4513140E9C78E7B0E92E1026AF7CF8C3D73E417895B5653CFFCDB707
        5F7A2D14868402649366BD7663CE7AFFD859C705F8FBE6ADC0204C58AEB07793
        656B7FA4015604128D12078936892A102995276640345959DA9C4CB57FECE21F
        D760646C3CF640821913F3209CCC6B15A87C5320BD93BB1BCEC50C8808623B47
        B8B6407A27F61C2621070957C2CE81543CFFA27F6EE8D60DF8C971317C20E148
        D88880842361A30A6425091B55202B49D8A804B91F63420E32F34F8C838F0386
        C79E86929801A938BA4FC716DC98A3F18F4D4CBBA1D7E50AAB316103596D63E2
        20719038481C240E1207894A90F90A13EE29E81DBCF365CF484BD3AE7D708D7F
        BEC7751D26DD6EBF31ABADBBE45D4B21E33FE57992307F5C10E874E36ECB96B7
        8ED558E572990E1688D7E7B30A025C8E84EEC9B71B1A1781C4B2FC0B944A7B8D
        BD3CEC5D0000000049454E44AE426082}
    end
    object prbStatus: TRzProgressBar
      Left = 14
      Top = 170
      Width = 406
      Height = 6
      BarColor = 6008319
      BarColorStop = 6008319
      BarStyle = bsGradient
      BorderOuter = fsFlat
      BorderWidth = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6008319
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      InteriorOffset = 0
      ParentFont = False
      PartsComplete = 0
      Percent = 0
      ShowPercent = False
      ThemeAware = False
      TotalParts = 0
      Visible = False
    end
    object lblStatus: TLabel
      Left = 14
      Top = 157
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edUsername: TRzEdit
      Left = 179
      Top = 69
      Width = 121
      Height = 21
      Text = ''
      CharCase = ecUpperCase
      TabOnEnter = True
      TabOrder = 0
      OnChange = edUsernameChange
    end
    object edPassword: TRzEdit
      Left = 179
      Top = 93
      Width = 121
      Height = 21
      Text = ''
      PasswordChar = '*'
      TabOnEnter = True
      TabOrder = 1
    end
    object btnLogin: TRzButton
      Left = 138
      Top = 131
      Hint = 'Login'
      ShowFocusRect = False
      Caption = 'Login'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnLoginClick
    end
    object btnCancel: TRzButton
      Left = 219
      Top = 131
      Hint = 'Cancel and close application'
      ShowFocusRect = False
      Caption = 'Cancel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
end
