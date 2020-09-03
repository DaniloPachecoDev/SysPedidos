unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

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
    NotasFiscais1: TMenuItem;
    Sadas1: TMenuItem;
    Entradas1: TMenuItem;
    NotasFiscais2: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uFrmClientes, uFrmProdutos;
{$R *.dfm}

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
var
  Produtos: TFrmCadProdutos;
begin
  Produtos := TFrmCadProdutos.Create(Self);
  Produtos.Show;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
var
  Clientes: TFrmCadCliente;
begin
  Clientes := TFrmCadCliente.Create(Self);
  Clientes.Show;
end;


end.
