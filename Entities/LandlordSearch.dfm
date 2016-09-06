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
