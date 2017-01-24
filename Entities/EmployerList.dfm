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
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Caption = 'Employer name'
          Width = 400
          Visible = True
        end>
    end
  end
  inherited pcDetail: TRzPageControl
    FixedDimension = 20
    inherited tsDetail: TRzTabSheet
      Caption = 'Employer details'
      ExplicitTop = 24
      ExplicitHeight = 191
      object JvLabel1: TJvLabel [0]
        Left = 19
        Top = 23
        Width = 86
        Height = 14
        Caption = 'Employer name'
        Transparent = True
      end
      object JvLabel2: TJvLabel [1]
        Left = 19
        Top = 103
        Width = 35
        Height = 14
        Caption = 'Group'
        Transparent = True
      end
      object JvLabel3: TJvLabel [2]
        Left = 19
        Top = 47
        Width = 45
        Height = 14
        Caption = 'Address'
        Transparent = True
      end
      inherited btnNew: TRzButton
        Caption = 'New employer'
        TabOrder = 3
      end
      object dbluGroup: TRzDBLookupComboBox
        Left = 105
        Top = 97
        Width = 207
        Height = 22
        DataField = 'grp_id'
        DataSource = dmEntities.dscEmployers
        KeyField = 'grp_id'
        ListField = 'grp_name'
        ListSource = dmEntities.dscGroups
        TabOrder = 2
        FrameColor = clBlack
        FrameHotColor = clBlack
      end
      object edEmployerName: TRzDBEdit
        Left = 105
        Top = 17
        Width = 207
        Height = 22
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
  inherited pnlDetail: TRzPanel
    inherited pnlAdd: TRzPanel
      inherited imgAdd: TImage
        OnClick = nil
        OnMouseDown = nil
        OnMouseUp = nil
      end
    end
  end
end
