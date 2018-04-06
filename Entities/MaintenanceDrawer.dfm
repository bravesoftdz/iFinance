inherited frmMaintenanceDrawer: TfrmMaintenanceDrawer
  Caption = 'frmMaintenanceDrawer'
  ClientHeight = 421
  ClientWidth = 919
  ExplicitWidth = 935
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 919
    ExplicitWidth = 919
    inherited lblTitle: TRzLabel
      Width = 78
      Caption = 'Maintenance'
      ExplicitWidth = 78
    end
  end
  object pnlMenu: TRzPanel
    Left = 0
    Top = 28
    Width = 175
    Height = 393
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 1
    DesignSize = (
      175
      393)
    object lblDate: TLabel
      Left = 16
      Top = 11
      Width = 28
      Height = 14
      Caption = 'Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cmbType: TRzComboBox
      Left = 16
      Top = 32
      Width = 145
      Height = 22
      Ctl3D = False
      FrameColor = 14272955
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      TabOrder = 0
      Text = 'Entities'
      OnChange = cmbTypeClick
      OnClick = cmbTypeClick
      Items.Strings = (
        'Entities'
        'Loan-related')
      ItemIndex = 0
    end
    object pcType: TRzPageControl
      Left = 10
      Top = 65
      Width = 155
      Height = 314
      Hint = ''
      ActivePage = tsEntities
      ActivePageDefault = tsEntities
      Anchors = [akLeft, akTop, akRight, akBottom]
      FlatColor = 15327448
      ShowCardFrame = False
      ShowShadow = False
      TabOrder = 1
      TabOrientation = toBottom
      FixedDimension = 20
      object tsEntities: TRzTabSheet
        Color = 15327448
        TabVisible = False
        Caption = 'Entities'
        object urlBanks: TRzURLLabel
          Left = 7
          Top = 51
          Width = 31
          Height = 14
          Caption = 'Banks'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlBanksClick
        end
        object urlEmployer: TRzURLLabel
          Left = 7
          Top = 29
          Width = 50
          Height = 14
          Caption = 'Employer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlEmployerClick
        end
        object urlGroups: TRzURLLabel
          Left = 7
          Top = 7
          Width = 38
          Height = 14
          Caption = 'Groups'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlGroupsClick
        end
        object urlDesignation: TRzURLLabel
          Left = 7
          Top = 75
          Width = 63
          Height = 14
          Caption = 'Designation'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlDesignationClick
        end
        object urlCompetitors: TRzURLLabel
          Left = 7
          Top = 99
          Width = 66
          Height = 14
          Caption = 'Competitors'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlCompetitorsClick
        end
        object urlInformationSources: TRzURLLabel
          Left = 7
          Top = 123
          Width = 108
          Height = 14
          Caption = 'Information sources'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlInformationSourcesClick
        end
      end
      object tsLoanRelated: TRzTabSheet
        Color = 15327448
        TabVisible = False
        Caption = 'Loan-related'
        object urlLoanTypes: TRzURLLabel
          Left = 7
          Top = 7
          Width = 60
          Height = 14
          Caption = 'Loan types'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlLoanTypesClick
        end
        object urlAccountTypes: TRzURLLabel
          Left = 7
          Top = 29
          Width = 80
          Height = 14
          Caption = 'Account types'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlAccountTypesClick
        end
        object urlLoanClassification: TRzURLLabel
          Left = 7
          Top = 51
          Width = 95
          Height = 14
          Caption = 'Loan classification'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlLoanClassificationClick
        end
        object urlPurpose: TRzURLLabel
          Left = 7
          Top = 75
          Width = 74
          Height = 14
          Caption = 'Loan purpose'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlPurposeClick
        end
        object urlCancellationReasons: TRzURLLabel
          Left = 7
          Top = 99
          Width = 109
          Height = 14
          Caption = 'Cancellation reasons'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlCancellationReasonsClick
        end
        object urlRejectionReasons: TRzURLLabel
          Left = 7
          Top = 123
          Width = 96
          Height = 14
          Caption = 'Rejection reasons'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlRejectionReasonsClick
        end
        object urlChargeTypes: TRzURLLabel
          Left = 7
          Top = 147
          Width = 101
          Height = 14
          Caption = 'Loan charge types'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlChargeTypesClick
        end
        object urlClosureReasons: TRzURLLabel
          Left = 7
          Top = 171
          Width = 84
          Height = 14
          Caption = 'Closure reasons'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6572079
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = urlClosureReasonsClick
        end
      end
    end
  end
  object DockPanel: TRzPanel
    Left = 175
    Top = 28
    Width = 744
    Height = 393
    Align = alClient
    BorderOuter = fsNone
    BorderSides = []
    BorderColor = 14272955
    BorderWidth = 1
    Color = 15327448
    TabOrder = 2
  end
end
