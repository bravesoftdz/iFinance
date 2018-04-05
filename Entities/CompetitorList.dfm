inherited frmCompetitorList: TfrmCompetitorList
  Caption = 'frmCompetitorList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 92
      Caption = 'Competitor list'
      ExplicitWidth = 92
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscCompetitors
      Columns = <
        item
          Expanded = False
          FieldName = 'comp_name'
          Title.Alignment = taCenter
          Title.Caption = 'Competitor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 350
          Visible = True
        end>
    end
  end
  inherited pnlSearch: TRzPanel
    ExplicitTop = 0
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
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 23
      Width = 33
      Height = 14
      Caption = 'Name'
      Transparent = True
    end
    inherited pnlAdd: TRzPanel
      ExplicitTop = 429
    end
    object edCompName: TRzDBEdit
      Left = 58
      Top = 17
      Width = 207
      Height = 22
      DataSource = dmAux.dscCompetitors
      DataField = 'comp_name'
      CharCase = ecUpperCase
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 1
    end
  end
end
