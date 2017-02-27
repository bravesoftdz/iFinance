inherited frmGroupList: TfrmGroupList
  Caption = 'frmGroupList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 59
      Caption = 'Group list'
      ExplicitWidth = 59
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      Anchors = [akLeft, akTop, akRight]
      Columns = <
        item
          Expanded = False
          FieldName = 'grp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Width = 400
          Visible = True
        end>
    end
    object tvGroup: TRzTreeView
      Left = 1
      Top = 1
      Width = 481
      Height = 401
      SelectionPen.Color = clBtnShadow
      Align = alClient
      BorderStyle = bsNone
      DragMode = dmAutomatic
      FramingPreference = fpCustomFraming
      Indent = 19
      ReadOnly = True
      RowSelect = True
      SortType = stText
      TabOrder = 1
      OnChange = tvGroupChange
      OnDragDrop = tvGroupDragDrop
      OnDragOver = tvGroupDragOver
    end
  end
  inherited pnlSearch: TRzPanel
    inherited Label1: TLabel
      Caption = 'Branch'
    end
    inherited edSearchKey: TRzEdit
      Top = 41
      TabStop = False
      Enabled = False
      Visible = False
      ExplicitTop = 41
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
    object JvLabel12: TJvLabel [1]
      Left = 13
      Top = 63
      Width = 38
      Height = 14
      Caption = 'Parent'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 5
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 4
    end
    object edGroupName: TRzDBEdit
      Left = 60
      Top = 33
      Width = 204
      Height = 22
      DataSource = dmEntities.dscGroups
      DataField = 'grp_name'
      CharCase = ecUpperCase
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object cbxPrivate: TRzDBCheckBox
      Left = 60
      Top = 86
      Width = 56
      Height = 16
      DataField = 'is_gov'
      DataSource = dmEntities.dscGroups
      ValueChecked = '0'
      ValueUnchecked = '1'
      Caption = 'Private'
      FrameColor = 8675134
      TabOnEnter = True
      TabOrder = 2
    end
    object cbxActive: TRzDBCheckBox
      Left = 60
      Top = 108
      Width = 53
      Height = 16
      DataField = 'is_active'
      DataSource = dmEntities.dscGroups
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Active'
      FrameColor = 8675134
      TabOnEnter = True
      TabOrder = 3
    end
    object dbluParentGroup: TRzDBLookupComboBox
      Left = 60
      Top = 57
      Width = 204
      Height = 22
      DataField = 'par_grp_id'
      DataSource = dmEntities.dscGroups
      KeyField = 'grp_id'
      ListField = 'grp_name'
      ListSource = dmEntities.dscParGroup
      TabOrder = 1
      AllowNull = True
      FlatButtonColor = 8675134
      FlatButtons = True
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
  end
end
