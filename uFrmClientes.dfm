inherited FrmCadCliente: TFrmCadCliente
  Caption = 'Clientes'
  FormStyle = fsMDIChild
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    inherited BtnSair: TBitBtn
      OnClick = BtnSairClick
    end
  end
  inherited PanelPrincipal: TPanel
    inherited PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 454
      Height = 337
      Align = alClient
      TabHeight = 1
      TabPosition = tpBottom
      TabWidth = 1
      OnChanging = PageControl1Changing
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 454
      ExplicitHeight = 337
      inherited TabSheet1: TTabSheet
        Caption = ''
        ExplicitLeft = 3
        ExplicitTop = 0
        ExplicitWidth = 446
        ExplicitHeight = 328
        inherited DBGridDados: TDBGrid
          Width = 440
          Height = 281
          ReadOnly = True
        end
        inherited PnlCabecalho: TPanel
          Width = 446
          ExplicitWidth = 446
          inherited EditPesqNome: TEdit
            Width = 444
            ExplicitWidth = 444
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = ''
        ExplicitTop = 4
        ExplicitWidth = 446
        ExplicitHeight = 328
        object lblNome: TLabel [0]
          Left = 16
          Top = 13
          Width = 60
          Height = 13
          Caption = 'Raz'#227'o Social'
        end
        object lblInscricao: TLabel [1]
          Left = 16
          Top = 63
          Width = 54
          Height = 13
          Caption = 'CPF / CNPJ'
        end
        inherited BtnConfirma: TBitBtn
          Left = 16
          Top = 118
          TabOrder = 2
          ExplicitLeft = 16
          ExplicitTop = 118
        end
        object dbEditNome: TDBEdit
          Left = 16
          Top = 32
          Width = 393
          Height = 21
          DataField = 'Razao'
          DataSource = dsPadrao
          TabOrder = 0
        end
        object dbEditInscricao: TDBEdit
          Left = 16
          Top = 82
          Width = 201
          Height = 21
          Hint = 'Preencha apenas com os numeros.'
          DataField = 'Inscricao'
          DataSource = dsPadrao
          MaxLength = 14
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnEnter = dbEditInscricaoEnter
          OnExit = dbEditInscricaoExit
          OnKeyPress = dbEditInscricaoKeyPress
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPesq
  end
  object dsData: TDataSource
    DataSet = cdsPesq
    Left = 380
    Top = 184
  end
  object DataSetProvider: TDataSetProvider
    DataSet = DmPrincipal.SQLDsConsulta
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 328
    Top = 200
  end
  object cdsPesq: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 'SELECT RAZAO, INSCRICAO FROM CLIENTES'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 332
    Top = 152
    object cdsPesqRazao: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 45
      FieldName = 'Razao'
      Size = 45
    end
    object cdsPesqInscricao: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'Inscricao'
    end
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT CODIGO FROM CLIENTES'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 220
    Top = 204
    object cdsAuxCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
end