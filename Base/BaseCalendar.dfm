inherited frmBaseCalendar: TfrmBaseCalendar
  Caption = 'frmBaseCalendar'
  ClientHeight = 397
  ClientWidth = 857
  ExplicitWidth = 873
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel [0]
    Left = 8
    Top = 45
    Width = 22
    Height = 13
    Caption = 'Year'
  end
  inherited pnlTitle: TRzPanel
    Width = 857
  end
  object grCalendar: TRzStringGrid
    Left = 8
    Top = 69
    Width = 835
    Height = 320
    BevelEdges = [beLeft, beTop]
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = 14273211
    ColCount = 32
    DefaultColWidth = 20
    FixedColor = 8806462
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ScrollBars = ssNone
    TabOrder = 1
    FixedLineColor = 8806462
    ColWidths = (
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20)
  end
  object cmbYear: TRzComboBox
    Left = 48
    Top = 39
    Width = 87
    Height = 21
    TabOrder = 2
  end
end
