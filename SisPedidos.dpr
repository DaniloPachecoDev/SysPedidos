program SisPedidos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'C:\SisPedidos\uFrmPrincipal.pas' {FrmPrincipal},
  uDados in 'C:\SisPedidos\uDados.pas' {DmPrincipal: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uCrudCliente in 'C:\SisPedidos\uCrudCliente.pas',
  uFrmPadrao in 'C:\SisPedidos\uFrmPadrao.pas' {FrmPadrao},
  uFrmClientes in 'C:\SisPedidos\uFrmClientes.pas' {FrmCadCliente},
  uCrudProduto in 'C:\SisPedidos\uCrudProduto.pas',
  uFrmProdutos in 'C:\SisPedidos\uFrmProdutos.pas' {FrmCadProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Emissão de Pedidos';
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
