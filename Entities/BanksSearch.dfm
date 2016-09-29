inherited frmBankSearch: TfrmBankSearch
  Caption = 'frmBankSearch'
  ClientHeight = 371
  ClientWidth = 548
  ExplicitWidth = 548
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 548
    inherited imgClose: TImage
      Left = 527
    end
    inherited lblCaption: TRzLabel
      Width = 69
      Caption = 'Bank search'
      ExplicitWidth = 69
    end
  end
  inherited pnlMain: TRzPanel
    Width = 548
    Height = 350
    inherited edSearchKey: TRzEdit
      Width = 491
    end
    inherited grSearch: TRzDBGrid
      Width = 530
      Height = 274
      DataSource = dmAux.dscBranches
      Columns = <
        item
          Expanded = False
          FieldName = 'bank_name'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'branch'
          Width = 250
          Visible = True
        end>
    end
    inherited btnSelect: TButton
      Top = 317
    end
    inherited btnNew: TButton
      Top = 317
      Visible = False
    end
    inherited btnClose: TButton
      Left = 463
      Top = 317
    end
  end
end
