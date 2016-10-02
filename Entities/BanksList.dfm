inherited frmBanksList: TfrmBanksList
  Caption = 'frmBanksList'
  ClientHeight = 498
  ClientWidth = 877
  OnShow = FormShow
  ExplicitWidth = 893
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 877
    ExplicitWidth = 877
    inherited lblTitle: TRzLabel
      Width = 58
      Caption = 'Banks list'
      ExplicitWidth = 58
    end
  end
  object pnlList: TRzPanel
    Left = 0
    Top = 28
    Width = 877
    Height = 470
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdLeft, sdRight, sdBottom]
    BorderWidth = 5
    TabOrder = 1
    DesignSize = (
      877
      470)
    object grList: TRzDBGrid
      Left = 6
      Top = 5
      Width = 324
      Height = 228
      DataSource = dmAux.dscBanks
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AltRowShading = True
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'bank_code'
          Title.Caption = 'Code'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bank_name'
          Title.Caption = 'Name'
          Width = 215
          Visible = True
        end>
    end
    object pcDetail: TRzPageControl
      Left = 6
      Top = 269
      Width = 867
      Height = 195
      Hint = ''
      ActivePage = tsDetail
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseColoredTabs = True
      TabIndex = 0
      TabOrder = 1
      FixedDimension = 19
      object tsDetail: TRzTabSheet
        Color = 15263976
        Caption = 'Branch details'
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 54
          Height = 13
          Caption = 'Bank name'
          Transparent = True
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 47
          Width = 35
          Height = 13
          Caption = 'Branch'
          Transparent = True
        end
        object edBankName: TRzDBEdit
          Left = 105
          Top = 17
          Width = 207
          Height = 21
          DataSource = dmAux.dscBanks
          DataField = 'bank_name'
          ReadOnly = True
          CharCase = ecUpperCase
          Color = clInfoBk
          TabOrder = 0
        end
        object mmBranch: TRzDBMemo
          Left = 105
          Top = 41
          Width = 207
          Height = 53
          DataField = 'branch'
          DataSource = dmAux.dscBranches
          TabOrder = 1
        end
      end
    end
    object grBranches: TRzDBGrid
      Left = 336
      Top = 6
      Width = 536
      Height = 227
      Anchors = [akLeft, akTop, akRight]
      DataSource = dmAux.dscBranches
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AltRowShading = True
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'branch'
          Title.Caption = 'Branch'
          Width = 450
          Visible = True
        end>
    end
    object btnNew: TRzButton
      Left = 6
      Top = 239
      Width = 324
      Hint = 'New branch'
      FrameColor = clBlack
      ShowFocusRect = False
      Caption = 'New branch'
      HotTrackColor = clMoneyGreen
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = btnNewClick
    end
  end
end
