﻿inherited FrmPedidos: TFrmPedidos
  BorderIcons = [biSystemMenu]
  Caption = 'Pedidos'
  ClientHeight = 511
  ClientWidth = 679
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  ExplicitWidth = 695
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Left = 543
    Height = 511
    ExplicitLeft = 543
    ExplicitHeight = 511
    inherited BtnSair: TBitBtn
      Top = 213
      ExplicitTop = 213
    end
  end
  inherited PanelPrincipal: TPanel
    Width = 543
    Height = 511
    ExplicitWidth = 543
    ExplicitHeight = 511
    inherited PageControl1: TPageControl
      Width = 541
      Height = 497
      TabHeight = 1
      TabWidth = 1
      ExplicitWidth = 541
      ExplicitHeight = 497
      inherited TabSheet1: TTabSheet
        Caption = ''
        ExplicitLeft = 4
        ExplicitTop = 7
        ExplicitWidth = 533
        ExplicitHeight = 486
        inherited DBGridDados: TDBGrid
          Width = 527
          Height = 422
          Align = alTop
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
        end
        inherited PnlCabecalho: TPanel
          Width = 533
          ExplicitWidth = 533
          inherited lblPesquisa: TLabel
            Width = 134
            Caption = 'Pesquisa (por N'#186' do pedido)'
            ExplicitWidth = 134
          end
          inherited EditPesqNome: TEdit
            Width = 531
            OnChange = EditPesqNomeChange
            ExplicitWidth = 531
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = ''
        ExplicitLeft = 4
        ExplicitTop = 7
        ExplicitWidth = 533
        ExplicitHeight = 486
        inherited BtnConfirma: TBitBtn
          Left = 438
          Top = 449
          TabOrder = 1
          ExplicitLeft = 438
          ExplicitTop = 449
        end
        object GroupBox1: TGroupBox
          Left = 5
          Top = 1
          Width = 525
          Height = 442
          Caption = 'Pedido '
          TabOrder = 0
          object Referência: TLabel
            Left = 16
            Top = 23
            Width = 52
            Height = 13
            Caption = 'Refer'#234'ncia'
          end
          object Label1: TLabel
            Left = 157
            Top = 23
            Width = 87
            Height = 13
            Caption = 'N'#250'mero do pedido'
          end
          object Label2: TLabel
            Left = 264
            Top = 23
            Width = 73
            Height = 13
            Caption = 'Data do pedido'
          end
          object Label3: TLabel
            Left = 16
            Top = 74
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object Label4: TLabel
            Left = 390
            Top = 23
            Width = 47
            Height = 13
            Caption = 'Opera'#231#227'o'
          end
          object Label10: TLabel
            Left = 390
            Top = 74
            Width = 51
            Height = 13
            Caption = 'Valor Total'
          end
          object GrpItens: TGroupBox
            Left = 3
            Top = 141
            Width = 519
            Height = 204
            Caption = 'Item(s) do pedido '
            TabOrder = 6
            object PnlItens: TPanel
              Left = 3
              Top = 15
              Width = 518
              Height = 186
              BevelOuter = bvNone
              TabOrder = 0
              object PgCtrlItens: TPageControl
                Left = 1
                Top = 0
                Width = 511
                Height = 169
                ActivePage = TabEditarItens
                TabOrder = 0
                object TabListaItens: TTabSheet
                  Caption = 'Lista de Itens'
                  object DBGridListaItens: TDBGrid
                    Left = 3
                    Top = 3
                    Width = 416
                    Height = 127
                    DataSource = dsTempItem
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object btnNovoItem: TBitBtn
                    Left = 425
                    Top = 3
                    Width = 75
                    Height = 25
                    Caption = 'Novo'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFC4C4C45959591C1C1C0606061C1C1C5A5A5AC6C6C6FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB6B6B6B202020989898E2E2E2F9
                      F9F9E1E1E19696961F1F1F6D6D6DFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      6B6B6B474747F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F14545456D6D
                      6DFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3222222F2F2F2FFFFFFFFFFFFFFFFFF00
                      0000FFFFFFFFFFFFFFFFFFF1F1F11F1F1FC6C6C6FFFFFFFFFFFFFFFFFF585858
                      999999FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF9696
                      965A5A5AFFFFFFFFFFFFFFFFFF1A1A1AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFF00
                      0000FFFFFFFFFFFFFFFFFFFFFFFFE0E0E01C1C1CFFFFFFFFFFFFFFFFFF060606
                      F9F9F9FFFFFF000000000000000000000000000000000000000000FFFFFFF8F8
                      F8070707FFFFFFFFFFFFFFFFFF1A1A1AE3E3E3FFFFFFFFFFFFFFFFFFFFFFFF00
                      0000FFFFFFFFFFFFFFFFFFFFFFFFE1E1E11B1B1BFFFFFFFFFFFFFFFFFF575757
                      9A9A9AFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF9898
                      98595959FFFFFFFFFFFFFFFFFFC2C2C2232323F3F3F3FFFFFFFFFFFFFFFFFF00
                      0000FFFFFFFFFFFFFFFFFFF2F2F2202020C4C4C4FFFFFFFFFFFFFFFFFFFFFFFF
                      686868494949F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F34747476B6B
                      6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB6868682222229A9A9AE3E3E3FA
                      FAFAE3E3E39999992121216B6B6BFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFC2C2C25757571A1A1A0606061B1B1B585858C4C4C4FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 1
                    OnClick = btnNovoItemClick
                  end
                  object btnEditaItem: TBitBtn
                    Left = 425
                    Top = 34
                    Width = 75
                    Height = 25
                    Caption = 'Editar'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF959595A5A5A5F2F2F2FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2
                      0707070F0F0F4F4F4FC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F00F0F0FE2E2E29D9D9D161616BFBFBFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      4E4E4E9D9D9DFFFFFFC0C0C0161616BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5161616BFBFBFFFFFFFC1C1C116
                      1616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFC3C3C3161616BDBDBDFFFFFFC4C4C4171717BBBBBBFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3171717BCBCBCFF
                      FFFFC4C4C4171717BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFC4C4C4171717BBBBBBFFFFFFC5C5C5141414B4B4B4FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C417
                      1717BBBBBBFFFFFFC5C5C5141414B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BABABAC3C3C30C0C0C0808
                      08BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFC4C4C41616160C0C0C0000000000001F1F1FFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50E0E0E0000000000
                      00202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFCACACA2C2C2C262626C5C5C5FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 2
                    OnClick = btnEditaItemClick
                  end
                  object btnExcluiItem: TBitBtn
                    Left = 425
                    Top = 65
                    Width = 75
                    Height = 25
                    Caption = 'Excluir'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF7A7A7A0606060000000000000000000000000000000606067B7B7BFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF06060600000000000000000000
                      0000000000000000000000070707FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF000000000000FFFFFF000000FFFFFF000000FFFFFF000000000000FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FF
                      FFFF000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF000000000000FFFFFF000000FFFFFF000000FFFFFF000000000000FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FF
                      FFFF000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF000000000000FFFFFF000000FFFFFF000000FFFFFF000000000000FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FF
                      FFFF000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF000000000000FFFFFF000000FFFFFF000000FFFFFF000000000000FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
                      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      0000000000000000000000000000000000000000000000000000000000000000
                      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF060606EDEDEDFF
                      FFFFEDEDED070707FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFF7979790606060000000606067B7B7BFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 3
                    OnClick = btnExcluiItemClick
                  end
                end
                object TabEditarItens: TTabSheet
                  Caption = 'Movimenta Itens'
                  ImageIndex = 1
                  object Label5: TLabel
                    Left = 3
                    Top = 7
                    Width = 38
                    Height = 13
                    Caption = 'Produto'
                  end
                  object Label6: TLabel
                    Left = 3
                    Top = 53
                    Width = 56
                    Height = 13
                    Caption = 'Quantidade'
                  end
                  object Label7: TLabel
                    Left = 83
                    Top = 53
                    Width = 64
                    Height = 13
                    Caption = 'Valor Unit'#225'rio'
                  end
                  object Label8: TLabel
                    Left = 220
                    Top = 53
                    Width = 51
                    Height = 13
                    Caption = 'Valor Total'
                  end
                  object dblcbxProduto: TDBLookupComboBox
                    Left = 3
                    Top = 24
                    Width = 454
                    Height = 21
                    KeyField = 'CODIGO'
                    ListField = 'DESCRICAO'
                    ListSource = dsProduto
                    TabOrder = 0
                  end
                  object btnConfItem: TBitBtn
                    Left = 347
                    Top = 101
                    Width = 110
                    Height = 25
                    Caption = 'Confirma item'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFCECECE656565282828111111282828646464D1D1D1FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD7777771A1A1A8B8B8BD4D4D4EE
                      EEEED2D2D28B8B8B1A1A1A797979FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      7474743E3E3EEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECEC3D3D3D7777
                      77FFFFFFFFFFFFFFFFFFFFFFFFC9C9C91D1D1DEEEEEEFFFFFFFFFFFFF4F4F4FF
                      FFFFFFFFFFFFFFFFFFFFFFEEEEEE1C1C1CCACACAFFFFFFFFFFFFFFFFFF5B5B5B
                      949494FFFFFFFFFFFFBFBFBF161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF9292
                      925E5E5EFFFFFFFFFFFFFFFFFF1B1B1BE0E0E0FFFFFFC0C0C01616168B8B8B16
                      1616BFBFBFFFFFFFFFFFFFFFFFFFDEDEDE1E1E1EFFFFFFFFFFFFFFFFFF070707
                      F9F9F9F4F4F4212121C0C0C0FFFFFFBFBFBF161616BFBFBFFFFFFFFFFFFFF8F8
                      F8060606FFFFFFFFFFFFFFFFFF1A1A1AE5E5E5FFFFFFF4F4F4FFFFFFFFFFFFFF
                      FFFFBFBFBF161616BFBFBFFFFFFFEAEAEA1B1B1BFFFFFFFFFFFFFFFFFF535353
                      9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF161616BFBFBFFFFF
                      FFD3D3D3FFFFFFFFFFFFFFFFFFBCBCBC262626F7F7F7FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFBFBFBF161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      606060505050F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF2020
                      20F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFF9F9F95D5D5D2A2A2AA6A6A6F0F0F0FF
                      FFFFE9E9E99F9F9F757575FDFDFDF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFB6B6B64B4B4B0D0D0D0505051919194F4F4FC1C1C1FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
                      FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 4
                    OnClick = btnConfItemClick
                  end
                  object btnCancItem: TBitBtn
                    Left = 3
                    Top = 101
                    Width = 110
                    Height = 25
                    Caption = 'Cancela item'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      656565BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBF
                      BF656565FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF161616BFBFBFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFBFBFBF151515BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBD
                      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFF
                      FFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDC3C3C3161616BDBDBDFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF16
                      1616161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF161616161616BFBFBFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BD
                      BDBDC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFC3C3C3161616BDBDBDFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3171717BDBDBDFFFFFFFF
                      FFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      C0C0C0161616C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF1616
                      16BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF656565C0C0C0FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF656565FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 5
                    OnClick = btnCancItemClick
                  end
                  object edtQtd: TEdit
                    Left = 3
                    Top = 70
                    Width = 56
                    Height = 21
                    MaxLength = 4
                    NumbersOnly = True
                    TabOrder = 1
                  end
                  object edtVrUnit: TEdit
                    Left = 83
                    Top = 70
                    Width = 121
                    Height = 21
                    TabOrder = 2
                    OnExit = edtVrUnitExit
                  end
                  object edtVrTotal: TEdit
                    Left = 220
                    Top = 70
                    Width = 121
                    Height = 21
                    TabOrder = 3
                    OnEnter = edtVrTotalEnter
                  end
                end
              end
            end
          end
          object GrpPagamento: TGroupBox
            Left = 3
            Top = 350
            Width = 519
            Height = 87
            Caption = 'Forma de pagamento '
            TabOrder = 7
            object Label9: TLabel
              Left = 13
              Top = 23
              Width = 92
              Height = 13
              Caption = 'Tipo de Pagamento'
            end
            object Label11: TLabel
              Left = 122
              Top = 23
              Width = 96
              Height = 13
              Caption = 'Data de Vencimento'
            end
            object Label12: TLabel
              Left = 233
              Top = 23
              Width = 87
              Height = 13
              Caption = 'Valor das parcelas'
            end
            object cbxTipPag: TComboBox
              Left = 13
              Top = 39
              Width = 92
              Height = 21
              ItemIndex = 0
              TabOrder = 0
              Text = 'A Vista'
              OnExit = cbxTipPagExit
              Items.Strings = (
                'A Vista'
                'A Prazo')
            end
            object dtpDatVencimento: TDateTimePicker
              Left = 122
              Top = 39
              Width = 98
              Height = 21
              Date = 0.863366157413110800
              Time = 0.863366157413110800
              TabOrder = 1
            end
            object edtValorTotalPar: TEdit
              Left = 233
              Top = 40
              Width = 121
              Height = 21
              TabOrder = 2
            end
          end
          object dbEditReferencia: TDBEdit
            Left = 16
            Top = 38
            Width = 121
            Height = 21
            DataField = 'REFERENCIA'
            DataSource = dsPedidos
            MaxLength = 8
            TabOrder = 0
          end
          object dbEditPedido: TDBEdit
            Left = 157
            Top = 38
            Width = 87
            Height = 21
            DataField = 'NUM_Pedido'
            DataSource = dsPedidos
            MaxLength = 10
            TabOrder = 1
          end
          object dtpDataPedido: TDateTimePicker
            Left = 264
            Top = 38
            Width = 98
            Height = 21
            Date = 44077.863366157410000000
            Time = 44077.863366157410000000
            TabOrder = 2
          end
          object dblcbxCliente: TDBLookupComboBox
            Left = 16
            Top = 91
            Width = 289
            Height = 21
            KeyField = 'CODIGO'
            ListField = 'RAZAO'
            ListSource = dsClientes
            TabOrder = 4
          end
          object cbxOperacao: TComboBox
            Left = 390
            Top = 38
            Width = 98
            Height = 21
            ItemIndex = 0
            TabOrder = 3
            Text = 'Entrada'
            OnExit = cbxOperacaoExit
            Items.Strings = (
              'Entrada'
              'Saida')
          end
          object edtValorTotalPedido: TEdit
            Left = 390
            Top = 93
            Width = 98
            Height = 21
            Hint = 'Valor total ser'#225' calculado de acordo com os itens do pedido'
            TabStop = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPedido
    Left = 728
    Top = 384
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 694
    Top = 464
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT CODIGO, RAZAO FROM CLIENTES'
    Params = <>
    ProviderName = 'dspServer'
    Left = 694
    Top = 440
    object cdsClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 774
    Top = 464
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT CODIGO, DESCRICAO FROM PRODUTOS'
    Params = <>
    ProviderName = 'dspServer'
    Left = 774
    Top = 440
    object cdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object dspServer: TDataSetProvider
    DataSet = DmPrincipal.SQLDsConsulta
    Options = [poAllowMultiRecordUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 728
    Top = 320
  end
  object cdsTempItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 408
    object cdsTempItensCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
      Visible = False
    end
    object cdsTempItensCOD_PRODUTO: TIntegerField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PRODUTO'
    end
    object cdsTempItensDESC_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESC_PROD'
    end
    object cdsTempItensQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
    end
    object cdsTempItensVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unitario'
      FieldName = 'VALOR_UNITARIO'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object cdsTempItensVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      EditFormat = '#,##0.00'
      currency = True
    end
  end
  object dsTempItem: TDataSource
    DataSet = cdsTempItens
    Left = 104
    Top = 432
  end
  object cdsPedido: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'SELECT CODIGO, REFERENCIA, NUM_Pedido, Data_Emissao, COD_Cliente' +
      ', TIP_OPERACAO, TOT_Pedido FROM PEDIDO'
    Params = <>
    ProviderName = 'dspPedidos'
    Left = 24
    Top = 408
    object cdsPedidoREFERENCIA: TIntegerField
      DisplayLabel = 'Referencia'
      DisplayWidth = 9
      FieldName = 'REFERENCIA'
    end
    object cdsPedidoNUM_Pedido: TIntegerField
      DisplayLabel = 'Num. do Pedido'
      DisplayWidth = 15
      FieldName = 'NUM_Pedido'
      Required = True
    end
    object cdsPedidoData_Emissao: TSQLTimeStampField
      DisplayLabel = 'Data de Emiss'#227'o'
      DisplayWidth = 19
      FieldName = 'Data_Emissao'
    end
    object cdsPedidoCOD_Cliente: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      DisplayWidth = 9
      FieldName = 'COD_Cliente'
      Required = True
    end
    object cdsPedidoTIP_OPERACAO: TStringField
      DisplayLabel = 'Tip. Opera'#231#227'o'
      DisplayWidth = 8
      FieldName = 'TIP_OPERACAO'
      OnGetText = cdsPedidoTIP_OPERACAOGetText
      Size = 8
    end
    object cdsPedidoTOT_Pedido: TFMTBCDField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'TOT_Pedido'
      EditFormat = '#,##0.00'
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
  end
  object dspPedidos: TDataSetProvider
    DataSet = DmPrincipal.SQLDsConsulta
    Options = [poFetchBlobsOnDemand, poFetchDetailsOnDemand, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 24
    Top = 432
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedido
    Left = 24
    Top = 456
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServer'
    Left = 694
    Top = 264
  end
  object cdsAuxItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServer'
    Left = 758
    Top = 264
  end
  object dsParPed: TDataSource
    DataSet = cdsParcelamento
    Left = 176
    Top = 432
  end
  object cdsParcelamento: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT COD_PEDIDO, FORMA_PAG, DAT_VENCIMENTO, VAL_PARCELA FROM P' +
      'ARPED'
    Params = <>
    ProviderName = 'dspServer'
    Left = 176
    Top = 408
    object cdsParcelamentoCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
      Required = True
    end
    object cdsParcelamentoFORMA_PAG: TIntegerField
      FieldName = 'FORMA_PAG'
    end
    object cdsParcelamentoDAT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DAT_VENCIMENTO'
    end
    object cdsParcelamentoVAL_PARCELA: TFMTBCDField
      FieldName = 'VAL_PARCELA'
      Precision = 15
      Size = 2
    end
  end
end
