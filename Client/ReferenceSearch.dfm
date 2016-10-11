inherited frmReferenceSearch: TfrmReferenceSearch
  Caption = 'frmReferenceSearch'
  ClientWidth = 496
  ExplicitWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 496
    ExplicitWidth = 496
    inherited imgClose: TImage
      Left = 475
      ExplicitLeft = 476
    end
    inherited lblCaption: TRzLabel
      Width = 99
      Caption = 'Reference search'
      ExplicitWidth = 99
    end
  end
  inherited pnlMain: TRzPanel
    Width = 496
    ExplicitWidth = 496
    inherited edSearchKey: TRzEdit
      Width = 439
      ExplicitWidth = 439
    end
    inherited grSearch: TRzDBGrid
      Width = 478
      DataSource = dmRef.dscClients
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 350
          Visible = True
        end>
    end
    inherited btnClose: TButton
      Left = 411
      ExplicitLeft = 411
    end
  end
end
