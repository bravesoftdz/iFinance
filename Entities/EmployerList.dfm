inherited frmEmployerList: TfrmEmployerList
  Caption = 'frmEmployerList'
  ClientWidth = 1011
  ExplicitWidth = 1027
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
    Width = 716
    ParentCtl3D = False
    inherited grList: TRzDBGrid
      Width = 714
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
    Width = 1011
    ExplicitTop = 0
    inherited Label1: TLabel
      Caption = 'Branch'
    end
    inherited edSearchKey: TRzEdit
      Top = 49
      Width = 670
      Enabled = False
      ExplicitTop = 49
    end
    object cmbBranch: TRzComboBox
      Left = 51
      Top = 9
      Width = 671
      Height = 22
      AllowEdit = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      ReadOnlyColor = clWhite
      Sorted = True
      TabOrder = 1
      OnChange = cmbBranchChange
      ExplicitWidth = 438
    end
  end
  inherited pnlDetail: TRzPanel
    Left = 728
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 23
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    object JvLabel2: TJvLabel [1]
      Left = 13
      Top = 108
      Width = 35
      Height = 14
      Caption = 'Group'
      Transparent = True
    end
    object JvLabel3: TJvLabel [2]
      Left = 13
      Top = 50
      Width = 45
      Height = 14
      Caption = 'Address'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 3
      ExplicitTop = 429
    end
    object edEmployerName: TRzDBEdit
      Left = 63
      Top = 17
      Width = 201
      Height = 22
      DataSource = dmEntities.dscEmployers
      DataField = 'emp_name'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object RzDBMemo1: TRzDBMemo
      Left = 63
      Top = 44
      Width = 201
      Height = 53
      DataField = 'emp_add'
      DataSource = dmEntities.dscEmployers
      TabOrder = 1
      DisabledColor = clWhite
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object bteGroup: TRzButtonEdit
      Tag = 1
      Left = 63
      Top = 102
      Width = 201
      Height = 22
      Text = ''
      Color = clWhite
      FrameColor = 14272955
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
