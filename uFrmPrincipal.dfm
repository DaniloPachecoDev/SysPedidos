object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Pedidos'
  ClientHeight = 242
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 184
    Top = 48
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
      object NotasFiscais1: TMenuItem
        Caption = 'Pedidos'
        object Sadas1: TMenuItem
          Caption = 'Sa'#237'das'
        end
        object Entradas1: TMenuItem
          Caption = 'Entradas'
        end
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object NotasFiscais2: TMenuItem
        Caption = 'Notas Fiscais'
      end
    end
  end
end