program SisPedidos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uDados in 'uDados.pas' {DmPrincipal: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uCrudCliente in 'uCrudCliente.pas',
  uFrmPadrao in 'uFrmPadrao.pas' {FrmPadrao},
  uFrmClientes in 'uFrmClientes.pas' {FrmCadCliente},
  uCrudProduto in 'uCrudProduto.pas',
  uFrmProdutos in 'uFrmProdutos.pas' {FrmCadProdutos},
  uFrmPedidos in 'uFrmPedidos.pas' {FrmPedidos},
  uCrudPedidos in 'uCrudPedidos.pas',
  uFrmRelPedidos in 'uFrmRelPedidos.pas' {FrmRelPedidos},
  uFrmRelClientes in 'uFrmRelClientes.pas' {FrmRelClientes},
  uFrmRelProdutos in 'uFrmRelProdutos.pas' {FrmRelProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Pedidos';
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
