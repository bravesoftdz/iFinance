inherited frmBankSearch: TfrmBankSearch
  Caption = 'frmBankSearch'
  ClientHeight = 371
  ClientWidth = 548
  ExplicitWidth = 548
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 548
    ExplicitWidth = 548
    inherited imgClose: TImage
      Left = 527
      ExplicitLeft = 527
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
    ExplicitWidth = 548
    ExplicitHeight = 350
    inherited edSearchKey: TRzEdit
      Width = 491
      ExplicitWidth = 491
    end
    inherited pnlSearch: TRzPanel
      Width = 530
      Height = 274
      ExplicitWidth = 530
      ExplicitHeight = 274
      inherited grSearch: TRzDBGrid
        Width = 528
        Height = 272
        DataSource = dmAux.dscBranches
        Columns = <
          item
            Expanded = False
            FieldName = 'bank_name'
            Title.Alignment = taCenter
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'branch'
            Title.Alignment = taCenter
            Width = 250
            Visible = True
          end>
      end
    end
    inherited pnlSelect: TRzPanel
      Top = 318
      ExplicitTop = 318
    end
    inherited pnlNew: TRzPanel
      Top = 318
      Visible = False
      ExplicitTop = 318
    end
    inherited pnlCancel: TRzPanel
      Left = 488
      Top = 318
      ExplicitLeft = 488
      ExplicitTop = 318
    end
  end
end
