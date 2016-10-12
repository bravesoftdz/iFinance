inherited frmImmHeadSearch: TfrmImmHeadSearch
  Caption = 'frmImmHeadSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 135
      Caption = 'Immediate head search'
      ExplicitWidth = 135
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
  end
end
