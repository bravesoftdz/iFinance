inherited frmImmHeadSearch: TfrmImmHeadSearch
  Caption = 'frmImmHeadSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 135
      Caption = 'Immediate head search'
      ExplicitWidth = 135
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
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
  end
end
