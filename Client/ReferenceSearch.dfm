inherited frmReferenceSearch: TfrmReferenceSearch
  Caption = 'frmReferenceSearch'
  PixelsPerInch = 96
  TextHeight = 14
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
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
        Ctl3D = True
        DataSource = dmRef.dscEntities
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = 'Name'
            Width = 250
            Visible = True
          end>
      end
    end
  end
end
