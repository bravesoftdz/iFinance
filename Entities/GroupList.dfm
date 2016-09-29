inherited frmGroupList: TfrmGroupList
  Caption = 'frmGroupList'
  PixelsPerInch = 96
  TextHeight = 13
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
          Title.Caption = 'Group name'
          Width = 400
          Visible = True
        end>
    end
    inherited pcDetail: TRzPageControl
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        Caption = 'Group details'
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 60
          Height = 13
          Caption = 'Group name'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 47
          Width = 65
          Height = 13
          Caption = 'Parent group'
          Transparent = True
        end
        object edGroupName: TRzDBEdit
          Left = 105
          Top = 17
          Width = 207
          Height = 21
          DataSource = dmEntities.dscGroups
          DataField = 'grp_name'
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object RzDBLookupComboBox7: TRzDBLookupComboBox
          Left = 105
          Top = 41
          Width = 207
          Height = 21
          DataField = 'par_grp_id'
          DataSource = dmEntities.dscGroups
          KeyField = 'grp_id'
          ListField = 'grp_name'
          ListSource = dmEntities.dscParGroup
          TabOrder = 1
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object RzDBCheckBox1: TRzDBCheckBox
          Left = 105
          Top = 66
          Width = 46
          Height = 15
          DataField = 'is_gov'
          DataSource = dmEntities.dscGroups
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Public'
          TabOrder = 2
        end
        object RzDBCheckBox2: TRzDBCheckBox
          Left = 105
          Top = 85
          Width = 49
          Height = 15
          DataField = 'is_active'
          DataSource = dmEntities.dscGroups
          ValueChecked = '1'
          ValueUnchecked = '0'
          Caption = 'Active'
          TabOrder = 3
        end
      end
    end
  end
end
