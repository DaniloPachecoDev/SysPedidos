unit uFrmRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uDados;

type
  TFrmRelProdutos = class(TForm)
    btnFechar: TBitBtn;
    DBGridDados: TDBGrid;
    btnImprimir: TBitBtn;
    btnImprimeTodos: TBitBtn;
    cdsProdutoSel: TClientDataSet;
    dsProdutoSel: TDataSource;
    dspProdutos: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoCODIGO: TIntegerField;
    dsProduto: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppReportProdutos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoSelCODIGO: TIntegerField;
    cdsProdutoSelDESCRICAO: TStringField;
    ppDBText3: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure btnImprimeTodosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutos: TFrmRelProdutos;

implementation

{$R *.dfm}
procedure TFrmRelProdutos.FormShow(Sender: TObject);
begin
  cdsProduto.Close;
  cdsProduto.CommandText := 'SELECT CODIGO, DESCRICAO '+
                            'FROM PRODUTOS            ';
  cdsProduto.Open;
end;

procedure TFrmRelProdutos.btnImprimeTodosClick(Sender: TObject);
begin
  cdsProdutoSel.Close;
  cdsProdutoSel.CommandText := 'SELECT CODIGO, DESCRICAO '+
                               'FROM PRODUTOS            ';
  cdsProdutoSel.Open;
  ppReportProdutos.Print;
end;

procedure TFrmRelProdutos.btnImprimirClick(Sender: TObject);
begin
  cdsProdutoSel.Close;
  cdsProdutoSel.CommandText := 'SELECT CODIGO, DESCRICAO    '+
                               'FROM PRODUTOS               '+
                               'WHERE CODIGO = :pCodProduto ';
  cdsProdutoSel.Params.ParamByName('pCodProduto').AsInteger := cdsProduto.FieldByName('CODIGO').AsInteger;

  cdsProdutoSel.Open;
  ppReportProdutos.Print;
end;

procedure TFrmRelProdutos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TFrmRelProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
