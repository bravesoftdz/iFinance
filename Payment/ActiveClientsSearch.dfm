inherited frmActiveClientsSearch: TfrmActiveClientsSearch
  Caption = 'frmActiveClientsSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Search client'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
        DataSource = dmApplication.dscClients
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Width = 250
            Visible = True
          end>
      end
    end
    inherited pnlNew: TRzPanel
      Visible = False
    end
  end
end
