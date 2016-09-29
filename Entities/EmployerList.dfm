inherited frmEmployerList: TfrmEmployerList
  Caption = 'frmEmployerList'
  PixelsPerInch = 96
  TextHeight = 13
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
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Caption = 'Employer name'
          Width = 400
          Visible = True
        end>
    end
    inherited pcDetail: TRzPageControl
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        Caption = 'Employer details'
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 75
          Height = 13
          Caption = 'Employer name'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 103
          Width = 31
          Height = 13
          Caption = 'Group'
          Transparent = True
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 47
          Width = 41
          Height = 13
          Caption = 'Address'
          Transparent = True
        end
        object RzDBLookupComboBox7: TRzDBLookupComboBox
          Left = 105
          Top = 97
          Width = 207
          Height = 21
          DataField = 'grp_id'
          DataSource = dmEntities.dscEmployers
          KeyField = 'grp_id'
          ListField = 'grp_name'
          ListSource = dmEntities.dscGroups
          TabOrder = 2
          AllowNull = True
          FrameColor = clBlack
          FrameHotColor = clBlack
        end
        object edEmployerName: TRzDBEdit
          Left = 105
          Top = 17
          Width = 207
          Height = 21
          DataSource = dmEntities.dscEmployers
          DataField = 'emp_name'
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object RzDBMemo1: TRzDBMemo
          Left = 105
          Top = 41
          Width = 207
          Height = 53
          DataField = 'emp_add'
          DataSource = dmEntities.dscEmployers
          TabOrder = 1
        end
      end
    end
  end
end
