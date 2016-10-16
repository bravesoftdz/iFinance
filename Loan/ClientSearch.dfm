inherited frmClientSearch: TfrmClientSearch
  Caption = 'frmClientSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Client search'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
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
    inherited btnNew: TButton
      Visible = False
    end
  end
end
