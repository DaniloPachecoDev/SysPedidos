unit uFrmRelPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, uDados, ppDB, ppDBPipe, ppParameter, ppCtrls, ppBands,
  ppDesignLayer, ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, Datasnap.Provider, Datasnap.DBClient;

type
  TFrmRelPedidos = class(TForm)
    DBGridPedidos: TDBGrid;
    btnImprimir: TBitBtn;
    cdsPedidos: TClientDataSet;
    dsPedidos: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cdsPedSelecionado: TClientDataSet;
    dsPedSel: TDataSource;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel8: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText8: TppDBText;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline1: TppDBPipeline;
    dsImpItens: TDataSource;
    cdsImpItens: TClientDataSet;
    cdsImpItensCODIGO: TIntegerField;
    cdsImpItensCOD_PEDIDO: TIntegerField;
    cdsImpItensCOD_PRODUTO: TIntegerField;
    cdsImpItensQTD: TIntegerField;
    cdsImpItensVR_UNIT: TFMTBCDField;
    cdsImpItensTOT_ITEM: TFMTBCDField;
    cdsImpItensDESCRICAO: TStringField;
    cdsPedSelecionadoCODIGO: TIntegerField;
    cdsPedSelecionadoREFERENCIA: TIntegerField;
    cdsPedSelecionadoNUM_Pedido: TIntegerField;
    cdsPedSelecionadoData_Emissao: TSQLTimeStampField;
    cdsPedSelecionadoCod_Cliente: TIntegerField;
    cdsPedSelecionadoRAZAO: TStringField;
    cdsPedSelecionadoTIP_OPERACAO: TStringField;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    cdsPedSelecionadoTOT_Pedido: TFMTBCDField;
    btnImprimeTodos: TBitBtn;
    cdsPedidosCODIGO: TIntegerField;
    cdsPedidosREFERENCIA: TIntegerField;
    cdsPedidosNUM_Pedido: TIntegerField;
    cdsPedidosData_Emissao: TSQLTimeStampField;
    cdsPedidosTOT_Pedido: TFMTBCDField;
    cdsPedidosCod_Cliente: TIntegerField;
    cdsPedidosRAZAO: TStringField;
    cdsPedidosTIP_OPERACAO: TStringField;
    btnFechar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimeTodosClick(Sender: TObject);
    procedure cdsPedidosAfterScroll(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure cdsPedSelecionadoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPedidos: TFrmRelPedidos;

implementation

{$R *.dfm}

procedure TFrmRelPedidos.FormShow(Sender: TObject);
begin
  cdsPedidos.Close;
  cdsPedidos.CommandText := 'SELECT P.CODIGO, P.REFERENCIA, P.NUM_Pedido, P.Data_Emissao, '+
                            '       P.COD_Cliente, P.TOT_Pedido, C.RAZAO,                 '+
                            '     CASE P.TIP_OPERACAO                                     '+
                            '       WHEN ''0'' THEN ''Entrada''                           '+
                            '         ELSE ''Saida'' end as TIP_OPERACAO                  '+
                            'FROM PEDIDO P                                                '+
                            'INNER JOIN CLIENTES C ON C.CODIGO = P.COD_Cliente            ';
  cdsPedidos.Open;
end;

procedure TFrmRelPedidos.cdsPedidosAfterScroll(DataSet: TDataSet);
begin
  cdsImpItens.Close;
  cdsImpItens.CommandText := 'SELECT I.CODIGO, I.COD_PEDIDO, I.COD_PRODUTO,     '+
                             '       I.QTD, I.VR_UNIT, I.TOT_ITEM, P.DESCRICAO  '+
                             'FROM ITEMPED I                                    '+
                             'INNER JOIN PRODUTOS P ON P.CODIGO = I.COD_PRODUTO '+
                             'WHERE COD_PEDIDO = :pCodPedido ';
  cdsImpItens.Params.ParamByName('pCodPedido').AsInteger := cdsPedidos.FieldByName('CODIGO').AsInteger;
  cdsImpItens.Open;
end;

procedure TFrmRelPedidos.cdsPedSelecionadoAfterScroll(DataSet: TDataSet);
begin
  cdsImpItens.Close;
  cdsImpItens.CommandText := 'SELECT I.CODIGO, I.COD_PEDIDO, I.COD_PRODUTO,     '+
                             '       I.QTD, I.VR_UNIT, I.TOT_ITEM, P.DESCRICAO  '+
                             'FROM ITEMPED I                                    '+
                             'INNER JOIN PRODUTOS P ON P.CODIGO = I.COD_PRODUTO '+
                             'WHERE COD_PEDIDO = :pCodPedido ';
  cdsImpItens.Params.ParamByName('pCodPedido').AsInteger := cdsPedSelecionado.FieldByName('CODIGO').AsInteger;
  cdsImpItens.Open;
end;

procedure TFrmRelPedidos.btnImprimeTodosClick(Sender: TObject);
begin
  cdsPedSelecionado.Close;
  cdsPedSelecionado.CommandText := 'SELECT P.CODIGO, P.REFERENCIA, P.NUM_Pedido, P.Data_Emissao, '+
                                   '       P.COD_Cliente, P.TOT_Pedido, C.RAZAO,                 '+
                                   '     CASE P.TIP_OPERACAO                                     '+
                                   '       WHEN ''0'' THEN ''Entrada''                           '+
                                   '         ELSE ''Saida'' end as TIP_OPERACAO                  '+
                                   'FROM PEDIDO P                                                '+
                                   'INNER JOIN CLIENTES C ON C.CODIGO = P.COD_Cliente            ';
  cdsPedSelecionado.Open;
  ppReport1.Print;
end;

procedure TFrmRelPedidos.btnImprimirClick(Sender: TObject);
begin
  cdsPedSelecionado.Close;
  cdsPedSelecionado.CommandText := 'SELECT P.CODIGO, P.REFERENCIA, P.NUM_Pedido, P.Data_Emissao, '+
                                   '       P.COD_Cliente, P.TOT_Pedido, C.RAZAO,                 '+
                                   '     CASE P.TIP_OPERACAO                                     '+
                                   '       WHEN ''0'' THEN ''Entrada''                           '+
                                   '         ELSE ''Saida'' end as TIP_OPERACAO                  '+
                                   'FROM PEDIDO P                                                '+
                                   'INNER JOIN CLIENTES C ON C.CODIGO = P.COD_Cliente            '+
                                   'WHERE P.CODIGO = :pCodPedido ';
  cdsPedSelecionado.Params.ParamByName('pCodPedido').AsInteger := cdsPedidos.FieldByName('CODIGO').AsInteger;
  cdsPedSelecionado.Open;

  ppReport1.Print;
end;

procedure TFrmRelPedidos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

end.
