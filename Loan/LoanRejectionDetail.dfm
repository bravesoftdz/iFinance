inherited frmBasePopupDetail3: TfrmBasePopupDetail3
  Caption = 'frmBasePopupDetail3'
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
        object JvLabel19: TJvLabel
          Tag = -1
          Left = 34
          Top = 26
          Width = 25
          Height = 13
          Caption = 'Date'
          Transparent = True
        end
        object JvLabel20: TJvLabel
          Tag = -1
          Left = 34
          Top = 55
          Width = 38
          Height = 13
          Caption = 'Reason'
          Transparent = True
        end
        object RzDBLookupComboBox1: TRzDBLookupComboBox
          Tag = 11
          Left = 110
          Top = 48
          Width = 193
          Height = 21
          Enabled = False
          KeyField = 'value'
          ListField = 'display'
          TabOrder = 0
          DisabledColor = clWhite
          FrameColor = clBlack
          FrameHotColor = clBlack
          TabOnEnter = True
        end
        object RzDBDateTimeEdit3: TRzDBDateTimeEdit
          Tag = 11
          Left = 113
          Top = 21
          Width = 80
          Height = 21
          DisabledColor = clWhite
          Enabled = False
          TabOnEnter = True
          TabOrder = 1
          EditType = etDate
          Format = 'mm/dd/yyyy'
        end
      end
    end
  end
end
