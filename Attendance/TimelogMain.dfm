inherited frmTimelogMain: TfrmTimelogMain
  Caption = 'frmTimelogMain'
  ClientHeight = 484
  ClientWidth = 965
  Color = 14273211
  Font.Height = -13
  OnCreate = FormCreate
  ExplicitWidth = 981
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 16
  inherited RzLabel1: TRzLabel
    Left = 30
    Top = 49
    Width = 26
    Height = 16
    ExplicitLeft = 30
    ExplicitTop = 49
    ExplicitWidth = 26
    ExplicitHeight = 16
  end
  inherited pnlTitle: TRzPanel
    Width = 965
    BorderSides = [sdBottom]
    ExplicitWidth = 849
    inherited lblTitle: TRzLabel
      Width = 47
      Caption = 'Timelog'
      ExplicitWidth = 47
    end
  end
  inherited grCalendar: TRzStringGrid
    Left = 30
    Top = 79
    Width = 862
    DrawingStyle = gdsGradient
    ExplicitLeft = 30
    ExplicitTop = 79
    ExplicitWidth = 862
    RowHeights = (
      18
      18)
  end
  inherited cmbYear: TRzComboBox
    Left = 69
    Top = 43
    Height = 24
    ExplicitLeft = 69
    ExplicitTop = 43
    ExplicitHeight = 24
  end
end
