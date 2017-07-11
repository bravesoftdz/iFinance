inherited frmRecipientSearch: TfrmRecipientSearch
  Caption = 'frmRecipientSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Recipient search'
      ExplicitWidth = 94
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
