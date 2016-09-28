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
          FieldName = 'lastname'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'firstname'
          Width = 180
          Visible = True
        end>
    end
  end
end
