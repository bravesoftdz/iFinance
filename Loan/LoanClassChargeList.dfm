inherited frmLoanClassChargeList: TfrmLoanClassChargeList
  Caption = 'frmLoanClassChargeList'
  ClientWidth = 689
  OnCreate = FormCreate
  ExplicitWidth = 689
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 689
    ExplicitWidth = 689
    inherited imgClose: TImage
      Left = 668
      ExplicitLeft = 668
    end
    inherited lblCaption: TRzLabel
      Width = 126
      Caption = 'Loan class charges list'
      ExplicitWidth = 126
    end
  end
  inherited pnlMain: TRzPanel
    Width = 689
    ExplicitWidth = 689
    object pnlCharges: TRzPanel
      Left = 8
      Top = 8
      Width = 673
      Height = 212
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
      object grCharges: TRzDBGrid
        Left = 1
        Top = 1
        Width = 671
        Height = 210
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmLoansAux.dscClassCharges
        FixedColor = clWhite
        GradientEndColor = 12955288
        GradientStartColor = 12955288
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FrameColor = 14273211
        FrameSides = []
        FrameStyle = fsNone
        FramingPreference = fpCustomFraming
        FixedLineColor = clWhite
        LineColor = 14273211
        AltRowShadingColor = 15854564
        Columns = <
          item
            Expanded = False
            FieldName = 'charge_name'
            Title.Alignment = taCenter
            Title.Caption = 'Charge'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 130
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'charge_value_f'
            Title.Alignment = taCenter
            Title.Caption = 'Value'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'value_type_desc'
            Title.Alignment = taCenter
            Title.Caption = 'Type'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ratio_amt_f'
            Title.Alignment = taCenter
            Title.Caption = 'Ratio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'max_value_f'
            Title.Alignment = taCenter
            Title.Caption = 'Maximum'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'for_new_f'
            Title.Alignment = taCenter
            Title.Caption = 'New'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'for_renew_f'
            Title.Alignment = taCenter
            Title.Caption = 'Renew'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'for_restructure_f'
            Title.Alignment = taCenter
            Title.Caption = 'Restructure'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'for_reloan_f'
            Title.Alignment = taCenter
            Title.Caption = 'Reloan'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end>
      end
    end
    object RzPanel1: TRzPanel
      Left = 8
      Top = 229
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 1
      object btnAddCharge: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Add a new charge'
        BorderStyle = bsNone
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAddChargeClick
      end
    end
    object RzPanel2: TRzPanel
      Left = 64
      Top = 229
      Width = 60
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14272955
      BorderWidth = 1
      Color = 15327448
      TabOrder = 2
      object btnRemoveCharge: TRzShapeButton
        Left = 0
        Top = 0
        Width = 60
        Height = 22
        Hint = 'Remove selected charge'
        BorderStyle = bsNone
        Caption = 'Remove'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnRemoveChargeClick
      end
    end
    object cbxNew: TRzCheckBox
      Left = 485
      Top = 232
      Width = 95
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'For new loans'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbxNewClick
    end
    object cbxRenewal: TRzCheckBox
      Left = 593
      Top = 232
      Width = 83
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'For renewal'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbxRenewalClick
    end
  end
end
