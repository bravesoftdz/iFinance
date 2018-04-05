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
        DataSource = dmRef.dscEntities
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Title.Alignment = taCenter
            Title.Caption = 'Name'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end>
      end
    end
  end
end
