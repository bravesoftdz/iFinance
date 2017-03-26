inherited frmEmployerList: TfrmEmployerList
  Caption = 'frmEmployerList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Employer list'
      ExplicitWidth = 78
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmEntities.dscEmployers
      OnCellClick = grListCellClick
      OnKeyUp = grListKeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_add'
          Title.Alignment = taCenter
          Title.Caption = 'Address'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'grp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Group'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end>
    end
  end
  inherited pnlSearch: TRzPanel
    inherited Label1: TLabel
      Caption = 'Branch'
    end
    inherited edSearchKey: TRzEdit
      Top = 49
      Enabled = False
      ExplicitTop = 49
    end
    object cmbBranch: TRzComboBox
      Left = 51
      Top = 9
      Width = 438
      Height = 22
      AllowEdit = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 6572079
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      ReadOnlyColor = clWhite
      Sorted = True
      TabOrder = 1
      OnChange = cmbBranchChange
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 118
      Width = 35
      Height = 14
      Caption = 'Group'
      Transparent = True
    end
    object JvLabel3: TJvLabel [2]
      Left = 13
      Top = 63
      Width = 45
      Height = 14
      Caption = 'Address'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 3
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 4
    end
    object edEmployerName: TRzDBEdit
      Left = 63
      Top = 33
      Width = 201
      Height = 22
      DataSource = dmEntities.dscEmployers
      DataField = 'emp_name'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 63
      Top = 57
      Width = 201
      Height = 53
      DataField = 'emp_add'
      DataSource = dmEntities.dscEmployers
      TabOrder = 1
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object bteGroup: TRzButtonEdit
      Tag = 1
      Left = 63
      Top = 112
      Width = 201
      Height = 22
      Text = ''
      Color = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentShowHint = False
      ReadOnly = True
      ReadOnlyColor = clWhite
      ShowHint = True
      TabOnEnter = True
      TabOrder = 2
      AllowKeyEdit = False
      AltBtnHint = 'Clear referee'
      ButtonHint = 'Find group'
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      FlatButtonColor = 8675134
      HideButtonsOnReadOnly = False
      OnButtonClick = bteGroupButtonClick
    end
  end
end
