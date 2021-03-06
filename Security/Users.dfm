inherited frmUsers: TfrmUsers
  Caption = 'frmUsers'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 81
      Caption = 'System users'
      ExplicitWidth = 81
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmSecurity.dscUser
      OnDblClick = grListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'employee_name'
          Title.Alignment = taCenter
          Title.Caption = 'Employee'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'username'
          Title.Alignment = taCenter
          Title.Caption = 'Username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'password'
          Title.Alignment = taCenter
          Title.Caption = 'Password'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end>
    end
  end
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 23
      Width = 54
      Height = 14
      Caption = 'Username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 71
      Width = 51
      Height = 14
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object urlRoles: TRzURLLabel [2]
      Left = 13
      Top = 181
      Width = 77
      Height = 14
      Caption = 'Assigned roles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRolesClick
    end
    object JvLabel14: TJvLabel [3]
      Left = 13
      Top = 121
      Width = 59
      Height = 14
      Caption = 'Credit limit'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      Visible = False
      ExplicitTop = 429
    end
    object edUsername: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 43
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscUser
      DataField = 'USERNAME'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = 15794175
      DisabledColor = 15794175
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 1
    end
    object edPassword: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 91
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscUser
      DataField = 'password'
      ReadOnly = True
      Color = 15794175
      DisabledColor = 15794175
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      PasswordChar = '*'
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 2
    end
    object edCreditLimit: TRzDBNumericEdit
      Left = 13
      Top = 141
      Width = 140
      Height = 22
      DataSource = dmSecurity.dscUser
      DataField = 'credit_limit'
      Alignment = taLeftJustify
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
  end
end
