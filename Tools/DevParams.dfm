inherited frmDevParams: TfrmDevParams
  Caption = 'frmDevParams'
  ClientHeight = 216
  ClientWidth = 374
  OnCreate = FormCreate
  ExplicitWidth = 374
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 374
    ExplicitWidth = 374
    inherited imgClose: TImage
      Left = 353
      ExplicitLeft = 353
    end
    inherited lblCaption: TRzLabel
      Width = 146
      Caption = 'Development parameters'
      ExplicitWidth = 146
    end
  end
  inherited pnlMain: TRzPanel
    Width = 374
    Height = 195
    ExplicitWidth = 374
    ExplicitHeight = 195
    inherited pnlDetail: TRzPanel
      Width = 357
      Height = 146
      ExplicitWidth = 357
      ExplicitHeight = 146
      inherited pcDetail: TRzPageControl
        Width = 355
        Height = 144
        ExplicitWidth = 355
        ExplicitHeight = 144
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 355
          ExplicitHeight = 144
          object JvLabel7: TJvLabel
            Tag = -1
            Left = 19
            Top = 23
            Width = 90
            Height = 14
            Caption = 'Application date'
            Transparent = True
          end
          object JvLabel1: TJvLabel
            Tag = -1
            Left = 19
            Top = 95
            Width = 347
            Height = 32
            AutoSize = False
            Caption = 
              'Note: This form is for TESTING purposes only and will be disable' +
              'd on rollout.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object urlNextMonth: TRzURLLabel
            Tag = 1
            Left = 263
            Top = 23
            Width = 66
            Height = 14
            Caption = 'Next month'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = urlNextMonthClick
          end
          object dteApplicationDate: TRzDateTimeEdit
            Left = 127
            Top = 15
            Width = 121
            Height = 22
            EditType = etDate
            Format = 'mm/dd/yyyy'
            FlatButtons = True
            FrameColor = 14272955
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 0
          end
          object cbxUpdateDeficits: TRzCheckBox
            Left = 19
            Top = 49
            Width = 101
            Height = 16
            Caption = 'Update deficits'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 315
      Top = 163
      ExplicitLeft = 315
      ExplicitTop = 163
    end
    inherited pnlSave: TRzPanel
      Left = 259
      Top = 163
      ExplicitLeft = 259
      ExplicitTop = 163
    end
  end
end
