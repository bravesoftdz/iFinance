inherited frmDesignationList: TfrmDesignationList
  Caption = 'frmDesignationList'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 95
      Caption = 'Designation list'
      ExplicitWidth = 95
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmAux.dscDesignations
      Columns = <
        item
          Expanded = False
          FieldName = 'designation'
          Title.Alignment = taCenter
          Title.Caption = 'Designation'
          Width = 350
          Visible = True
        end>
    end
  end
  inherited pcDetail: TRzPageControl
    Visible = False
    FixedDimension = 20
    inherited tsDetail: TRzTabSheet
      Caption = 'Designation details'
    end
  end
  inherited pnlDetail: TRzPanel
    object JvLabel1: TJvLabel [0]
      Left = 13
      Top = 39
      Width = 65
      Height = 14
      Caption = 'Designation'
      Transparent = True
    end
    object edDesignation: TRzDBEdit
      Left = 82
      Top = 33
      Width = 182
      Height = 22
      DataSource = dmAux.dscDesignations
      DataField = 'designation'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FrameColor = 8675134
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
  end
end
