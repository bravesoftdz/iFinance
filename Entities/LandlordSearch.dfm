inherited frmLandlordSearch: TfrmLandlordSearch
  Caption = 'frmLandlordSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 90
      Caption = 'Landlord search'
      ExplicitWidth = 90
    end
  end
  inherited pnlMain: TRzPanel
    ExplicitHeight = 321
    inherited pnlSearch: TRzPanel
      ExplicitHeight = 245
      inherited grSearch: TRzDBGrid
        DataSource = dmEntities.dscEntities
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Title.Alignment = taCenter
            Title.Caption = 'Name'
            Width = 250
            Visible = True
          end>
      end
    end
    inherited pnlSelect: TRzPanel
      ExplicitTop = 289
    end
    inherited pnlNew: TRzPanel
      ExplicitTop = 289
    end
    inherited pnlCancel: TRzPanel
      ExplicitTop = 289
    end
  end
end
