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
          Title.Caption = 'Group name'
          Width = 400
          Visible = True
        end>
    end
  end
  inherited pcDetail: TRzPageControl
    Visible = False
    FixedDimension = 20
    inherited tsDetail: TRzTabSheet
      ExplicitWidth = 197
      ExplicitHeight = 424
      object JvLabel1: TJvLabel [0]
        Left = 19
        Top = 23
        Width = 86
        Height = 14
        Caption = 'Employer name'
        Transparent = True
      end
      object edGroupName: TRzDBEdit
        Left = 60
        Top = 17
        Width = 207
        Height = 22
        DataSource = dmEntities.dscEmployers
        DataField = 'emp_name'
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
  inherited pnlDetail: TRzPanel
    inherited pnlAdd: TRzPanel
      Anchors = [akLeft, akBottom]
    end
    inherited pnlSave: TRzPanel
      Anchors = [akLeft, akBottom]
    end
    inherited pnlCancel: TRzPanel
      Anchors = [akLeft, akBottom]
    end
  end
end
