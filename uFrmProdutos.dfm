inherited FrmCadProdutos: TFrmCadProdutos
  Caption = 'Produtos'
  FormStyle = fsMDIChild
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelPrincipal: TPanel
    inherited PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 454
      Height = 337
      Align = alClient
      TabHeight = 1
      TabWidth = 1
      OnChanging = PageControl1Changing
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 454
      ExplicitHeight = 337
      inherited TabSheet1: TTabSheet
        Caption = ''
        ExplicitTop = 7
        ExplicitWidth = 446
        ExplicitHeight = 326
        inherited DBGridDados: TDBGrid
          Width = 440
          Height = 279
          ReadOnly = True
        end
        inherited PnlCabecalho: TPanel
          Width = 446
          ExplicitWidth = 446
          inherited lblPesquisa: TLabel
            Width = 118
            Caption = 'Pesquisa (por Descri'#231#227'o)'
            ExplicitWidth = 118
          end
          inherited EditPesqNome: TEdit
            Width = 444
            OnChange = EditPesqNomeChange
            ExplicitWidth = 444
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = ''
        ExplicitTop = 7
        ExplicitWidth = 446
        ExplicitHeight = 327
        object lblDescricao: TLabel [0]
          Left = 16
          Top = 16
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        inherited BtnConfirma: TBitBtn
          Left = 16
          Top = 59
          TabOrder = 1
          ExplicitLeft = 16
          ExplicitTop = 59
        end
        object dbEditDescricao: TDBEdit
          Left = 16
          Top = 32
          Width = 393
          Height = 21
          DataField = 'Descricao'
          DataSource = dsPadrao
          TabOrder = 0
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPesq
  end
  object cdsPesq: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT DESCRICAO FROM PRODUTOS'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 348
    Top = 184
    object cdsPesqDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object DataSetProvider: TDataSetProvider
    DataSet = DmPrincipal.SQLDsConsulta
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 348
    Top = 240
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
