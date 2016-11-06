inherited frmComakerSearch: TfrmComakerSearch
  Caption = 'frmComakerSearch'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 92
      Caption = 'Comaker search'
      ExplicitWidth = 92
    end
  end
  inherited pnlMain: TRzPanel
    inherited grSearch: TRzDBGrid
      DataSource = dmLoan.dscComakers
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
