inherited frmClientSearch: TfrmClientSearch
  Caption = 'frmClientSearch'
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
    ExplicitHeight = 321
    inherited pnlSearch: TRzPanel
      ExplicitHeight = 245
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
    inherited pnlSelect: TRzPanel
      ExplicitTop = 289
    end
    inherited pnlNew: TRzPanel
      Visible = False
      ExplicitTop = 289
      inherited btnNew: TRzShapeButton
        Visible = False
      end
    end
    inherited pnlCancel: TRzPanel
      ExplicitTop = 289
    end
  end
end
