object FrmPadrao: TFrmPadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 339
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TPanel
    Left = 456
    Top = 0
    Width = 136
    Height = 339
    Align = alRight
    TabOrder = 0
    object BtnNovo: TBitBtn
      Left = 19
      Top = 24
      Width = 105
      Height = 41
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
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnEdita: TBitBtn
      Left = 19
      Top = 71
      Width = 105
      Height = 41
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
      TabOrder = 1
      OnClick = BtnEditaClick
    end
    object BtnExcluir: TBitBtn
      Left = 19
      Top = 118
      Width = 105
      Height = 41
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
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnCancela: TBitBtn
      Left = 19
      Top = 165
      Width = 105
      Height = 41
      Caption = 'Cancelar'
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
      TabOrder = 3
      OnClick = BtnCancelaClick
    end
    object BtnSair: TBitBtn
      Left = 19
      Top = 212
      Width = 105
      Height = 41
      Caption = 'Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 339
    Align = alClient
    Caption = 'PanelPrincipal'
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 450
      Height = 297
      ActivePage = TabSheet2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGridDados: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 44
          Width = 436
          Height = 222
          Align = alClient
          DataSource = dsPadrao
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object PnlCabecalho: TPanel
          Left = 0
          Top = 0
          Width = 442
          Height = 41
          Align = alTop
          TabOrder = 1
          object lblPesquisa: TLabel
            Left = 3
            Top = 1
            Width = 99
            Height = 13
            Caption = 'Pesquisa (por Nome)'
          end
          object EditPesqNome: TEdit
            Left = 1
            Top = 19
            Width = 440
            Height = 21
            Align = alBottom
            TabOrder = 0
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object BtnConfirma: TBitBtn
          Left = 352
          Top = 232
          Width = 87
          Height = 34
          Caption = '&Confirma'
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
          TabOrder = 0
          OnClick = BtnConfirmaClick
        end
      end
    end
  end
  object dsPadrao: TDataSource
    Left = 512
    Top = 272
  end
end
