inherited frmEmployerSearch: TfrmEmployerSearch
  Caption = 'frmEmployerSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Employer search'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    inherited grSearch: TRzDBGrid
      DataSource = dmEntities.dscEmployers
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Caption = 'Employer name'
          Width = 250
          Visible = True
        end>
    end
    inherited btnNew: TButton
      Visible = False
    end
  end
end
