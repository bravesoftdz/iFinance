inherited frmRecipientSearch: TfrmRecipientSearch
  Caption = 'frmRecipientSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Recipient search'
      ExplicitWidth = 94
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
