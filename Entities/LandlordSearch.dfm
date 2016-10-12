inherited frmLandlordSearch: TfrmLandlordSearch
  Caption = 'frmLandlordSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 90
      Caption = 'Landlord search'
      ExplicitWidth = 90
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
