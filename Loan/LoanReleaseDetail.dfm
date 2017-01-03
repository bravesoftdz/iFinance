inherited frmBasePopupDetail2: TfrmBasePopupDetail2
  Caption = 'frmBasePopupDetail2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TRzPanel
    inherited pcDetail: TRzPageControl
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 512
        ExplicitHeight = 174
        object JvLabel25: TJvLabel
          Tag = -1
          Left = 34
          Top = 16
          Width = 74
          Height = 13
          Caption = 'Date approved'
          Transparent = True
        end
        object JvLabel26: TJvLabel
          Tag = -1
          Left = 34
          Top = 40
          Width = 88
          Height = 13
          Caption = 'Approved amount'
          Transparent = True
        end
        object JvLabel13: TJvLabel
          Tag = -1
          Left = 355
          Top = 99
          Width = 46
          Height = 13
          Caption = 'Recipient'
          Transparent = True
        end
        object RzDBDateTimeEdit1: TRzDBDateTimeEdit
          Tag = 5
          Left = 151
          Top = 10
          Width = 80
          Height = 21
          DisabledColor = clWhite
          Enabled = False
          TabOnEnter = True
          TabOrder = 0
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
        object RzDBNumericEdit3: TRzDBNumericEdit
          Tag = 5
          Left = 151
          Top = 34
          Width = 80
          Height = 21
          Alignment = taLeftJustify
          DisabledColor = clWhite
          Enabled = False
          TabOnEnter = True
          TabOrder = 1
          DisplayFormat = '###,##0.00'
        end
        object RzButton1: TRzButton
          Tag = 7
          Left = 416
          Top = 92
          Width = 57
          Height = 20
          Caption = 'Add'
          Enabled = False
          TabOrder = 2
        end
        object RzButton2: TRzButton
          Tag = 7
          Left = 455
          Top = 92
          Width = 57
          Height = 20
          Caption = 'Remove'
          Enabled = False
          TabOrder = 3
        end
        object RzDBGrid1: TRzDBGrid
          Tag = -1
          Left = 266
          Top = 10
          Width = 246
          Height = 47
          DataSource = dmLoan.dscLoanComaker
          Options = [dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AltRowShadingColor = 15854564
          Columns = <
            item
              Expanded = False
              FieldName = 'name'
              Title.Caption = 'Name'
              Width = 220
              Visible = True
            end>
        end
      end
    end
  end
end
