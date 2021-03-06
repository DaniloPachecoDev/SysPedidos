unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, MidasLib;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Pedidos1: TMenuItem;
    Pedidos2: TMenuItem;
    Clientes2: TMenuItem;
    Produtos2: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uFrmClientes, uFrmProdutos, uFrmPedidos,
     uFrmRelPedidos, uFrmRelClientes, uFrmRelProdutos;
{$R *.dfm}

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
var
  Produtos: TFrmCadProdutos;
begin
  Produtos := TFrmCadProdutos.Create(Self);
  Produtos.Show;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
var
  Resp: Integer;
begin
  Resp := MessageBoxEx(Handle,'Deseja SAIR do sistema?', 'Confirmação', MB_YESNO,LANG_PORTUGUESE);
  case Resp of
    IDYES: Close;
  end;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
var
  Clientes: TFrmCadCliente;
begin
  Clientes := TFrmCadCliente.Create(Self);
  Clientes.Show;
end;


procedure TFrmPrincipal.Pedidos1Click(Sender: TObject);
var
  Pedidos: TFrmPedidos;
begin
  Pedidos := TFrmPedidos.Create(Self);
  Pedidos.Show;
end;

procedure TFrmPrincipal.Pedidos2Click(Sender: TObject);
var
  RelPedidos: TFrmRelPedidos;
begin
  RelPedidos := TFrmRelPedidos.Create(Self);
  RelPedidos.Show;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
var
  RelClientes: TFrmRelClientes;
begin
  RelClientes := TFrmRelClientes.Create(Self);
  RelClientes.Show;
end;

procedure TFrmPrincipal.Produtos2Click(Sender: TObject);
var
  RelProdutos: TFrmRelProdutos;
begin
  RelProdutos := TFrmRelProdutos.Create(Self);
  RelProdutos.Show;
end;


end.
