inherited frmImmHeadDetail: TfrmImmHeadDetail
  Caption = 'frmImmHeadDetail'
  ClientHeight = 227
  ClientWidth = 370
  ExplicitWidth = 370
  ExplicitHeight = 227
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 370
    inherited imgClose: TImage
      Left = 349
    end
    inherited lblCaption: TRzLabel
      Width = 94
      Caption = 'Immediate head'
      ExplicitWidth = 94
    end
  end
  inherited pnlMain: TRzPanel
    Width = 370
    Height = 206
    inherited lblStatus: TLabel
      Top = 177
    end
    inherited pcDetail: TRzPageControl
      Width = 353
      Height = 152
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        Caption = 'Immediate head details'
        ExplicitLeft = 1
        ExplicitTop = 20
        ExplicitWidth = 512
        ExplicitHeight = 155
        object JvLabel1: TJvLabel
          Left = 19
          Top = 23
          Width = 48
          Height = 13
          Caption = 'Lastname'
          Transparent = True
        end
        object JvLabel2: TJvLabel
          Left = 19
          Top = 47
          Width = 49
          Height = 13
          Caption = 'Firstname'
          Transparent = True
        end
        object JvLabel3: TJvLabel
          Left = 19
          Top = 71
          Width = 32
          Height = 13
          Caption = 'Middle'
          Transparent = True
        end
        object JvLabel22: TJvLabel
          Left = 19
          Top = 95
          Width = 71
          Height = 13
          Caption = 'Mobile/tel. no.'
          Transparent = True
        end
        object RzDBEdit11: TRzDBEdit
          Left = 114
          Top = 89
          Width = 102
          Height = 21
          DataSource = dmEntities.dscIHContact
          DataField = 'mobile_no'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object RzDBEdit10: TRzDBEdit
          Left = 219
          Top = 89
          Width = 102
          Height = 21
          DataSource = dmEntities.dscIHContact
          DataField = 'home_phone'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 4
        end
        object edMiddle: TRzDBEdit
          Left = 114
          Top = 65
          Width = 207
          Height = 21
          DataSource = dmEntities.dscIHPersonal
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object edFirstname: TRzDBEdit
          Left = 114
          Top = 41
          Width = 207
          Height = 21
          DataSource = dmEntities.dscIHPersonal
          DataField = 'firstname'
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edLastname: TRzDBEdit
          Left = 114
          Top = 17
          Width = 207
          Height = 21
          DataSource = dmEntities.dscIHPersonal
          DataField = 'lastname'
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
    end
    inherited btnSave: TRzButton
      Left = 204
      Top = 169
      ExplicitLeft = 204
      ExplicitTop = 169
    end
    inherited btnCancel: TRzButton
      Left = 285
      Top = 171
    end
  end
end
