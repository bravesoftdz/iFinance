inherited frmEmployerSearch: TfrmEmployerSearch
  Caption = 'frmEmployerSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Employer search'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
        DataSource = dmEntities.dscEmployers
        Columns = <
          item
            Expanded = False
            FieldName = 'emp_name'
            Title.Alignment = taCenter
            Title.Caption = 'Employer'
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
