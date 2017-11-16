inherited frmClientSearch: TfrmClientSearch
  Caption = 'frmClientSearch'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Client search'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
        DataSource = dmLoan.dscClients
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
      inherited btnNew: TRzShapeButton
        Visible = False
      end
    end
  end
end
