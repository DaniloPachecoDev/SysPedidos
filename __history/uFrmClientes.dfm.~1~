inherited FrmCadCliente: TFrmCadCliente
  Caption = 'Clientes'
  ClientWidth = 625
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  ExplicitWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Left = 489
  end
  inherited PanelPrincipal: TPanel
    Width = 489
    inherited PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 487
      Height = 337
      ActivePage = TabSheet1
      Align = alClient
      TabHeight = 1
      TabPosition = tpBottom
      TabWidth = 1
      OnChanging = PageControl1Changing
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 487
      ExplicitHeight = 337
      inherited TabSheet1: TTabSheet
        Caption = ''
        ExplicitLeft = 4
        ExplicitTop = 4
        ExplicitWidth = 479
        ExplicitHeight = 328
        inherited DBGridDados: TDBGrid
          Width = 473
          Height = 281
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
        end
        inherited PnlCabecalho: TPanel
          Width = 479
          ExplicitWidth = 479
          inherited EditPesqNome: TEdit
            Width = 477
            OnChange = EditPesqNomeChange
            ExplicitWidth = 477
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = ''
        ExplicitLeft = 4
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
          Left = 322
          Top = 113
          TabOrder = 2
          ExplicitLeft = 322
          ExplicitTop = 113
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
        object edtCNPJCPF: TEdit
          Left = 16
          Top = 80
          Width = 177
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          OnEnter = edtCNPJCPFEnter
          OnExit = edtCNPJCPFExit
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
    CommandText = 'SELECT CODIGO, RAZAO, INSCRICAO FROM CLIENTES'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 332
    Top = 152
    object cdsPesqCodigo: TIntegerField
      DisplayWidth = 6
      FieldName = 'Codigo'
    end
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
    CommandText = 'SELECT CODIGO, INSCRICAO FROM CLIENTES'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 220
    Top = 204
    object cdsAuxCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsAuxINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 30
    end
  end
  object cdsAuxPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 317
    Top = 77
  end
end
