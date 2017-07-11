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
    object JvLabel14: TJvLabel [2]
      Left = 13
      Top = 145
      Width = 81
      Height = 14
      Caption = 'Maximum total'
      Transparent = True
    end
    object JvLabel2: TJvLabel [3]
      Left = 13
      Top = 169
      Width = 57
      Height = 14
      Caption = 'Loan type'
      Transparent = True
    end
    object JvLabel5: TJvLabel [4]
      Left = 13
      Top = 193
      Width = 63
      Height = 14
      Caption = 'Concurrent'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      TabOrder = 8
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 7
      ExplicitWidth = 275
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
    object cbxPublic: TRzDBCheckBox
      Tag = 1
      Left = 112
      Top = 213
      Width = 50
      Height = 16
      DataField = 'is_gov'
      DataSource = dmEntities.dscGroupAttribute
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Public'
      FrameColor = 8675134
      TabOnEnter = True
      TabOrder = 6
    end
    object cbxActive: TRzDBCheckBox
      Left = 60
      Top = 84
      Width = 53
      Height = 16
      DataField = 'is_active'
      DataSource = dmEntities.dscGroups
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Active'
      FrameColor = 8675134
      TabOnEnter = True
      TabOrder = 2
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
    object edMaxTotal: TRzDBNumericEdit
      Tag = 1
      Left = 112
      Top = 139
      Width = 152
      Height = 22
      DataSource = dmEntities.dscGroupAttribute
      DataField = 'max_tot_amt'
      Alignment = taLeftJustify
      DisabledColor = 14273211
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
    object RzGroupBox1: TRzGroupBox
      Left = 13
      Top = 117
      Width = 251
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      BorderColor = 6572079
      BorderSides = []
      BorderWidth = 1
      Caption = 'Attributes'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clRed
      CaptionFont.Height = -12
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = [fsBold]
      Color = 14273211
      FlatColor = 6572079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientColorStyle = gcsCustom
      GroupStyle = gsUnderline
      ParentFont = False
      TabOrder = 9
    end
    object dbluLoanType: TRzDBLookupComboBox
      Tag = 1
      Left = 112
      Top = 163
      Width = 152
      Height = 22
      DataField = 'loan_type'
      DataSource = dmEntities.dscGroupAttribute
      KeyField = 'loan_type'
      ListField = 'loan_type_name'
      ListSource = dmAux.dscLoanType
      TabOrder = 4
      FlatButtons = True
      DisabledColor = 14273211
      FrameColor = 8675134
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edConcurrent: TRzDBEdit
      Tag = 1
      Left = 112
      Top = 187
      Width = 49
      Height = 22
      DataSource = dmEntities.dscGroupAttribute
      DataField = 'concurrent'
      CharCase = ecUpperCase
      DisabledColor = 14273211
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 5
    end
  end
end
