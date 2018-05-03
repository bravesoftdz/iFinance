inherited frmGroupSearch: TfrmGroupSearch
  Caption = 'frmGroupSearch'
  ClientHeight = 342
  ClientWidth = 314
  OnCreate = FormCreate
  ExplicitWidth = 314
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 314
    ExplicitWidth = 314
    DesignSize = (
      314
      21)
    inherited imgClose: TImage
      Left = 293
      ExplicitLeft = 293
    end
    inherited lblCaption: TRzLabel
      Width = 75
      Caption = 'Group search'
      ExplicitWidth = 75
    end
  end
  inherited pnlMain: TRzPanel
    Width = 314
    Height = 321
    ExplicitWidth = 314
    ExplicitHeight = 321
    DesignSize = (
      314
      321)
    object pnlSearch: TRzPanel
      Left = 8
      Top = 8
      Width = 296
      Height = 272
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 14273211
      TabOrder = 0
      object tvGroup: TRzTreeView
        Left = 1
        Top = 1
        Width = 294
        Height = 270
        SelectionPen.Color = clBtnShadow
        Align = alClient
        BorderStyle = bsNone
        DragMode = dmAutomatic
        FramingPreference = fpCustomFraming
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnDblClick = tvGroupDblClick
      end
    end
    object pnlSelect: TRzPanel
      Left = 9
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 1
      object btnSelect: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelectClick
      end
    end
    object pnlCancel: TRzPanel
      Left = 254
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 2
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Cancel'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelClick
      end
    end
  end
end
