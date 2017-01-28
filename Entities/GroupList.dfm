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
  end
  inherited pcDetail: TRzPageControl
    Left = 52
    Top = 296
    Width = 366
    Height = 137
    Visible = False
    ExplicitLeft = 52
    ExplicitTop = 296
    ExplicitWidth = 366
    ExplicitHeight = 137
    FixedDimension = 20
    inherited tsDetail: TRzTabSheet
      ExplicitWidth = 362
      ExplicitHeight = 110
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
    inherited pnlAdd: TRzPanel
      TabOrder = 4
    end
    inherited pnlDetailHead: TRzPanel
      TabOrder = 3
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
      TabOrder = 0
    end
    object cbxPrivate: TRzDBCheckBox
      Left = 60
      Top = 62
      Width = 56
      Height = 16
      DataField = 'is_gov'
      DataSource = dmEntities.dscGroups
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Private'
      FrameColor = 8675134
      TabOrder = 1
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
      TabOrder = 2
    end
  end
end
