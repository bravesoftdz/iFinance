inherited frmRefereeSearch: TfrmRefereeSearch
  Caption = 'frmRefereeSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Referee search'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    inherited grSearch: TRzDBGrid
      DataSource = dmEntities.dscEntities
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Width = 250
          Visible = True
        end>
    end
    inherited btnNew: TButton
      Visible = False
    end
  end
end
