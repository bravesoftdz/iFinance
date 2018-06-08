inherited frmAssignRoles: TfrmAssignRoles
  Caption = 'frmAssignRoles'
  ClientHeight = 408
  ClientWidth = 618
  ExplicitWidth = 618
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 618
    inherited imgClose: TImage
      Left = 597
    end
    inherited lblCaption: TRzLabel
      Width = 104
      Caption = 'Assigned roles for '
      ExplicitWidth = 104
    end
  end
  inherited pnlMain: TRzPanel
    Width = 618
    Height = 387
    inherited pnlDetail: TRzPanel
      Width = 601
      Height = 338
      inherited pcDetail: TRzPageControl
        Width = 599
        Height = 336
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          object chlRoles: TRzCheckList
            Left = 16
            Top = 16
            Width = 566
            Height = 304
            OnChange = chlRolesChange
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = 15327448
            Columns = 3
            FrameColor = 15327448
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ItemHeight = 17
            ParentColor = True
            TabOrder = 0
            ExplicitWidth = 718
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 559
      Top = 355
    end
    inherited pnlSave: TRzPanel
      Left = 503
      Top = 355
    end
  end
end
