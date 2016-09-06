inherited frmLandlordDetail: TfrmLandlordDetail
  Caption = 'frmLandlordDetail'
  ClientHeight = 233
  ClientWidth = 350
  ExplicitWidth = 350
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TRzPanel
    Width = 350
    inherited imgClose: TImage
      Left = 329
    end
    inherited lblCaption: TRzLabel
      Width = 49
      Caption = 'Landlord'
      ExplicitWidth = 49
    end
  end
  inherited pnlMain: TRzPanel
    Width = 350
    Height = 212
    inherited lblStatus: TLabel
      Top = 149
    end
    inherited pcDetail: TRzPageControl
      Width = 333
      Height = 130
      FixedDimension = 19
      inherited tsDetail: TRzTabSheet
        Caption = 'Landlord details'
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
        object edMiddle: TRzDBEdit
          Left = 114
          Top = 65
          Width = 187
          Height = 21
          TabOrder = 2
        end
        object edFirstname: TRzDBEdit
          Left = 114
          Top = 41
          Width = 187
          Height = 21
          DataSource = dmEntities.dscLlPersonal
          DataField = 'firstname'
          TabOrder = 1
        end
        object edLastname: TRzDBEdit
          Left = 114
          Top = 17
          Width = 187
          Height = 21
          DataSource = dmEntities.dscLlPersonal
          DataField = 'lastname'
          TabOrder = 0
        end
      end
    end
    inherited btnSave: TRzButton
      Top = 179
    end
    inherited btnCancel: TRzButton
      Top = 179
    end
  end
end
