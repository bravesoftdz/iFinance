inherited frmReferenceSearch: TfrmReferenceSearch
  Caption = 'frmReferenceSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited imgClose: TImage
      ExplicitLeft = 476
    end
    inherited lblCaption: TRzLabel
      Width = 99
      Caption = 'Reference search'
      ExplicitWidth = 99
    end
  end
  inherited pnlMain: TRzPanel
    inherited grSearch: TRzDBGrid
      DataSource = dmRef.dscEntities
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 350
          Visible = True
        end>
    end
  end
end
