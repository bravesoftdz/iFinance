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
    Top = 36
    Height = 432
    ExplicitTop = 36
    ExplicitHeight = 432
    inherited grList: TRzDBGrid
      Height = 430
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
      Height = 430
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
    ExplicitTop = 0
    inherited Label1: TLabel
      Top = 13
      Caption = 'Branch'
      ExplicitTop = 13
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
      Top = 7
      Width = 438
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
    end
  end
  inherited pnlDetail: TRzPanel
    Top = 7
    Height = 461
    ExplicitTop = 7
    ExplicitHeight = 461
    object Label2: TLabel [0]
      Left = 13
      Top = 23
      Width = 31
      Height = 14
      Caption = 'Name'
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 50
      Width = 36
      Height = 14
      Caption = 'Parent'
    end
    object Label4: TLabel [2]
      Left = 13
      Top = 134
      Width = 79
      Height = 14
      Caption = 'Maximum total'
    end
    object Label5: TLabel [3]
      Left = 13
      Top = 161
      Width = 55
      Height = 14
      Caption = 'Loan type'
    end
    object Label6: TLabel [4]
      Left = 13
      Top = 188
      Width = 61
      Height = 14
      Caption = 'Concurrent'
    end
    object Label7: TLabel [5]
      Left = 13
      Top = 215
      Width = 69
      Height = 14
      Caption = 'ID'#39's required'
    end
    inherited pnlAdd: TRzPanel
      Top = 431
      TabOrder = 9
      ExplicitTop = 431
    end
    object edGroupName: TRzDBEdit
      Left = 60
      Top = 17
      Width = 204
      Height = 22
      DataSource = dmEntities.dscGroups
      DataField = 'grp_name'
      CharCase = ecUpperCase
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
    end
    object cbxPublic: TRzDBCheckBox
      Tag = 1
      Left = 112
      Top = 236
      Width = 50
      Height = 16
      DataField = 'is_gov'
      DataSource = dmEntities.dscGroupAttribute
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Public'
      FrameColor = 8675134
      TabOnEnter = True
      TabOrder = 7
    end
    object cbxActive: TRzDBCheckBox
      Left = 60
      Top = 71
      Width = 53
      Height = 16
      DataField = 'is_active'
      DataSource = dmEntities.dscGroups
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Active'
      FrameColor = 14272955
      TabOnEnter = True
      TabOrder = 2
    end
    object dbluParentGroup: TRzDBLookupComboBox
      Left = 60
      Top = 44
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
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edMaxTotal: TRzDBNumericEdit
      Tag = 1
      Left = 112
      Top = 128
      Width = 152
      Height = 22
      DataSource = dmEntities.dscGroupAttribute
      DataField = 'max_tot_amt'
      Alignment = taLeftJustify
      DisabledColor = 15327448
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 3
      DisplayFormat = '###,##0.00'
      FlatButtons = True
    end
    object RzGroupBox1: TRzGroupBox
      Left = 13
      Top = 104
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
      Color = 15327448
      FlatColor = 12493963
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientColorStyle = gcsCustom
      GroupStyle = gsUnderline
      ParentFont = False
      TabOrder = 8
    end
    object dbluLoanType: TRzDBLookupComboBox
      Tag = 1
      Left = 112
      Top = 155
      Width = 152
      Height = 22
      DataField = 'loan_type'
      DataSource = dmEntities.dscGroupAttribute
      KeyField = 'loan_type'
      ListField = 'loan_type_name'
      ListSource = dmAux.dscLoanType
      TabOrder = 4
      FlatButtons = True
      DisabledColor = 15327448
      FrameColor = 14272955
      FrameHotColor = clBlack
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
    end
    object edConcurrent: TRzDBEdit
      Tag = 1
      Left = 112
      Top = 182
      Width = 49
      Height = 22
      DataSource = dmEntities.dscGroupAttribute
      DataField = 'concurrent'
      CharCase = ecUpperCase
      DisabledColor = 15327448
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 5
    end
    object edIdentityDocs: TRzDBEdit
      Left = 112
      Top = 209
      Width = 49
      Height = 22
      DataSource = dmEntities.dscGroupAttribute
      DataField = 'ident_docs'
      CharCase = ecUpperCase
      DisabledColor = 15327448
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 6
    end
  end
end
