inherited frmAssignRights: TfrmAssignRights
  Caption = 'frmAssignRights'
  ClientHeight = 408
  ClientWidth = 539
  Position = poOwnerFormCenter
  ExplicitWidth = 539
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 539
    ExplicitWidth = 539
    inherited imgClose: TImage
      Left = 518
      ExplicitLeft = 668
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Assign rights'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 539
    Height = 387
    ExplicitWidth = 539
    ExplicitHeight = 387
    inherited pnlDetail: TRzPanel
      Width = 522
      Height = 338
      ExplicitWidth = 522
      ExplicitHeight = 338
      inherited pcDetail: TRzPageControl
        Width = 520
        Height = 336
        ExplicitWidth = 520
        ExplicitHeight = 336
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 520
          ExplicitHeight = 336
          object chlRights: TRzCheckList
            Left = 16
            Top = 16
            Width = 487
            Height = 304
            OnChange = chlRightsChange
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = 15327448
            Columns = 1
            FrameColor = 15327448
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ItemHeight = 17
            ParentColor = True
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 480
      Top = 355
      ExplicitLeft = 480
      ExplicitTop = 355
    end
    inherited pnlSave: TRzPanel
      Left = 424
      Top = 355
      ExplicitLeft = 424
      ExplicitTop = 355
    end
  end
end
