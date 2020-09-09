unit uFrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, uDados, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, DBXCommon, ppReport, ppPrnabl, ppClass, ppStrtch, ppSubRpt,
  ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppCtrls, ppVar;

type
  TFrmPedidos = class(TFrmPadrao)
    GroupBox1: TGroupBox;
    GrpItens: TGroupBox;
    GrpPagamento: TGroupBox;
    dbEditReferencia: TDBEdit;
    dbEditPedido: TDBEdit;
    dtpDataPedido: TDateTimePicker;
    Refer�ncia: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dblcbxCliente: TDBLookupComboBox;
    Label3: TLabel;
    cbxOperacao: TComboBox;
    Label4: TLabel;
    dsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cbxTipPag: TComboBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PnlItens: TPanel;
    PgCtrlItens: TPageControl;
    TabListaItens: TTabSheet;
    DBGridListaItens: TDBGrid;
    btnNovoItem: TBitBtn;
    btnEditaItem: TBitBtn;
    btnExcluiItem: TBitBtn;
    TabEditarItens: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dblcbxProduto: TDBLookupComboBox;
    btnConfItem: TBitBtn;
    btnCancItem: TBitBtn;
    cdsProdutoCODIGO: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsClientesCODIGO: TIntegerField;
    cdsClientesRAZAO: TStringField;
    dspServer: TDataSetProvider;
    cdsTempItens: TClientDataSet;
    cdsTempItensCOD_PRODUTO: TIntegerField;
    cdsTempItensQUANTIDADE: TIntegerField;
    cdsTempItensVALOR_UNITARIO: TFloatField;
    cdsTempItensVALOR_TOTAL: TFloatField;
    dsTempItem: TDataSource;
    cdsPedido: TClientDataSet;
    dspPedidos: TDataSetProvider;
    cdsPedidoREFERENCIA: TIntegerField;
    cdsPedidoNUM_Pedido: TIntegerField;
    cdsPedidoTIP_OPERACAO: TStringField;
    dsPedidos: TDataSource;
    cdsAux: TClientDataSet;
    cdsTempItensCOD_PEDIDO: TIntegerField;
    dtpDatVencimento: TDateTimePicker;
    cdsAuxItem: TClientDataSet;
    edtQtd: TEdit;
    edtVrUnit: TEdit;
    edtVrTotal: TEdit;
    dsParPed: TDataSource;
    cdsPedidoCODIGO: TIntegerField;
    cdsPedidoCOD_Cliente: TIntegerField;
    edtValorTotalPedido: TEdit;
    Label10: TLabel;
    cdsTempItensDESC_PROD: TStringField;
    cdsParcelamento: TClientDataSet;
    cdsParcelamentoCOD_PEDIDO: TIntegerField;
    cdsParcelamentoFORMA_PAG: TIntegerField;
    edtValorTotalPar: TEdit;
    cdsPedidoData_Emissao: TDateTimeField;
    cdsPedidoTOT_Pedido: TBCDField;
    cdsParcelamentoDAT_VENCIMENTO: TDateTimeField;
    cdsParcelamentoVAL_PARCELA: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure btnConfItemClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure btnEditaItemClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure btnCancItemClick(Sender: TObject);
    procedure cdsPedidoTIP_OPERACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cbxTipPagExit(Sender: TObject);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure dbEditValorParcelasExit(Sender: TObject);
    procedure edtVrTotalEnter(Sender: TObject);
    procedure edtVrUnitExit(Sender: TObject);
    procedure cbxOperacaoExit(Sender: TObject);
  private
    pValorTotalPedido: Double;
    pInsere: Boolean;
    pInsereProduto: Boolean;
    function Valida: Boolean;
    function ValidaItem: Boolean;
    procedure AtualizaValorTotal(pClientDataSet: TClientDataSet);
    procedure PreencheAuxiliarItem(pCodigo: Integer);
    procedure PreencheAuxiliarPagamento(pCodigo: Integer);
  public
    pTipOperacao: Integer;
    pProxCodigo: String;
  end;

var
  FrmPedidos: TFrmPedidos;

implementation

uses uCrudPedidos;

{$R *.dfm}

procedure TFrmPedidos.FormShow(Sender: TObject);
begin
  inherited;
  cdsClientes.Open;
  cdsProduto.Open;
  cdsParcelamento.Open;
  pValorTotalPedido := 0;
  PgCtrlItens.ActivePage := TabListaItens;
  cdsTempItens.CreateDataSet;

  dtpDataPedido.DateTime    := Now;
  dtpDatVencimento.DateTime := Now;
end;


// FUN��ES DOS ITENS DENTRO DO PEDIDO.
procedure TFrmPedidos.btnNovoItemClick(Sender: TObject);
begin
  PgCtrlItens.ActivePage := TabEditarItens;
  pInsereProduto := True;

  dblcbxProduto.KeyValue := -1;
  edtQtd.Text     := '';
  edtVrUnit.Text  := '';
  edtVrTotal.Text := '';
end;

procedure TFrmPedidos.btnEditaItemClick(Sender: TObject);
begin
  inherited;
  PgCtrlItens.ActivePage := TabEditarItens;
  pInsereProduto := False;

  dblcbxProduto.KeyValue := cdsTempItens.FieldByName('COD_PRODUTO').AsInteger;
  edtQtd.Text            := cdsTempItens.FieldByName('QUANTIDADE').AsString;
  edtVrUnit.Text         := cdsTempItens.FieldByName('VALOR_UNITARIO').AsString;
  edtVrTotal.Text        := cdsTempItens.FieldByName('VALOR_TOTAL').AsString;
end;

procedure TFrmPedidos.btnExcluiItemClick(Sender: TObject);
var
  Resp: Integer;
begin
  Resp := MessageBoxEx(Handle,'Deseja Excluir o registro?', 'Confirma��o', MB_YESNO,LANG_PORTUGUESE);
  if Resp = IDYES then
  begin
    if cdsTempItens.Locate('COD_PRODUTO',DBGridListaItens.Columns.Items[0].Field.Value,[loCaseInsensitive]) then
    begin
      cdsTempItens.Delete;
      ShowMessage('Produto do pedido excluido com sucesso.');
      AtualizaValorTotal(cdsTempItens);
    end;
  end;
end;

// Cancela temporariamente o item do pedido
procedure TFrmPedidos.btnCancItemClick(Sender: TObject);
begin
  PgCtrlItens.ActivePage := TabListaItens;
end;

// Inserindo temporariamente os itens do pedido
procedure TFrmPedidos.btnConfItemClick(Sender: TObject);
begin
  if ValidaItem then
  begin
    try
      try
        if not cdsTempItens.Locate('COD_PRODUTO',dblcbxProduto.KeyValue,[loCaseInsensitive]) then
          cdsTempItens.Append
        else
          cdsTempItens.Edit;

          cdsTempItens.FieldByName('COD_PEDIDO').AsInteger   := StrToInt(pProxCodigo);
          cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := dblcbxProduto.KeyValue;
          cdsTempItens.FieldByName('DESC_PROD').AsString     := dblcbxProduto.Text;
          cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := StrToInt(edtQtd.Text);
          cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := StrToFloat(edtVrUnit.Text);
          cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := StrToFloat(edtVrTotal.Text);
          cdsTempItens.Post;

          AtualizaValorTotal(cdsTempItens);
      except
        cdsTempItens.Delete;
      end;
    finally
      edtQtd.Clear;
      edtVrUnit.Clear;
      edtVrTotal.Clear;
      PgCtrlItens.ActivePage := TabListaItens;
    end;
  end;
end;

procedure TFrmPedidos.edtVrUnitExit(Sender: TObject);
begin
  inherited;
  if edtVrUnit.Text <> '' then
    edtVrUnit.Text := StringReplace(edtVrUnit.Text,'.',',',[rfReplaceAll]);
end;

procedure TFrmPedidos.edtVrTotalEnter(Sender: TObject);
var
  ValorCalculado: Currency;
begin
  //inherited;
  if (edtQtd.Text <> '') and (edtVrUnit.Text <> '')then
  begin
    ValorCalculado := (StrToFloat(edtQtd.Text) *
                       StrToFLoat(edtVrUnit.Text));

    edtVrTotal.Text := FloatToStrF(ValorCalculado,ffFixed,18,2);
    pValorTotalPedido := pValorTotalPedido + ValorCalculado;
  end;
end;

function TFrmPedidos.ValidaItem: Boolean;
begin
  Result := True;
  if dblcbxProduto.ListFieldIndex = -1 then
  begin
    ShowMessage('Campo PRODUTO inv�lido');
    dblcbxProduto.SetFocus;
    Result := False;
  end
  else
  if edtQtd.Text = '' then
  begin
    ShowMessage('Campo QUANTIDADE inv�lido');
    edtQtd.SetFocus;
    Result := False;
  end
  else
  if edtVrUnit.Text = '' then
  begin
    ShowMessage('Campo VALOR UNIT�RIO inv�lido');
    edtVrUnit.SetFocus;
    Result := False;
  end;
end;

procedure TFrmPedidos.AtualizaValorTotal(pClientDataSet: TClientDataSet);
begin
  // Atualiza o Edit do Valor Total com os restantes dos produtos do pedido
  edtValorTotalPedido.Text := '0';
  pClientDataSet.First;
  while not pClientDataSet.Eof do
  begin
    edtValorTotalPedido.Text := FloatToStrF(StrToFloat(edtValorTotalPedido.Text) + StrToFloat(pClientDataSet.FieldByName('VALOR_TOTAL').AsString),ffFixed,18,2);
    edtValorTotalPedido.Text := FormatCurr('#,##0.00',StrToFloat(edtValorTotalPedido.Text));
    edtValorTotalPedido.Refresh;
    pClientDataSet.Next;
  end;
end;

// FIM - DAS FUN��ES DOS ITENS

procedure TFrmPedidos.PreencheAuxiliarItem(pCodigo: Integer);
begin
  cdsAuxItem.Close;
  cdsAuxItem.CommandText := 'SELECT I.COD_PEDIDO,  '+
                            '       I.COD_PRODUTO, '+
                            '       I.QTD,         '+
                            '       I.VR_UNIT,     '+
                            '       I.TOT_ITEM,    '+
                            '       P.DESCRICAO    '+
                            'FROM ITEMPED I        '+
                            'INNER JOIN PRODUTOS P ON P.CODIGO = I.COD_PRODUTO '+
                            'WHERE COD_PEDIDO = :pCODPEDIDO ';
  cdsAuxItem.Params.ParamByName('pCODPEDIDO').AsInteger := pCodigo;
  cdsAuxItem.Open;
end;

procedure TFrmPedidos.PreencheAuxiliarPagamento(pCodigo: Integer);
begin
  cdsParcelamento.Close;
  cdsParcelamento.CommandText := 'SELECT COD_PEDIDO,             '+
                                 '       FORMA_PAG,              '+
                                 '       DAT_VENCIMENTO,         '+
                                 '       VAL_PARCELA             '+
                                 'FROM PARPED                    '+
                                 'WHERE COD_PEDIDO = :pCodPedido ';
  cdsParcelamento.Params.ParamByName('pCodPedido').AsInteger := pCodigo;
  cdsParcelamento.Open;
end;

procedure TFrmPedidos.cbxOperacaoExit(Sender: TObject);
begin
  inherited;
  if cbxOperacao.ItemIndex = -1 then
  begin
    ShowMessage('Escolha as op��es: "Entrada" ou "Saida" ');
    cbxOperacao.SetFocus;
  end;
end;

procedure TFrmPedidos.cbxTipPagExit(Sender: TObject);
begin
  inherited;
  dtpDatVencimento.Enabled := True;
  if cbxTipPag.ItemIndex = 0 then
  begin
    dtpDatVencimento.DateTime := Now;
    dtpDatVencimento.Enabled  := False;
    edtValorTotalPar.SetFocus;
  end;
  edtValorTotalPar.Text := edtValorTotalPedido.Text;
end;

procedure TFrmPedidos.dbEditValorParcelasExit(Sender: TObject);
begin
  inherited;
  BtnConfirma.SetFocus;
end;

procedure TFrmPedidos.cdsPedidoTIP_OPERACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if Sender.Value = 0 then
    Text := 'Entrada'
  else
  if Sender.Value = 1 then
    Text := 'Saida';
end;

function TFrmPedidos.Valida: Boolean;
begin
  Result := True;
  if edtValorTotalPar.Text <> edtValorTotalPedido.Text then
  begin
    ShowMessage('Valor total da Forma de Pagamento est� diferente do Valor total do PEDIDO');
    cbxTipPag.SetFocus;
    Result := False;
  end;

  if cbxTipPag.ItemIndex = 1 then
  begin
    if FormatDateTime('dd/mm/yyyy', dtpDatVencimento.DateTime) < FormatDateTime('dd/mm/yyyy', Now) then
    begin
      ShowMessage('Data de Vencimento n�o pode ser inferior a HOJE.');
      dtpDatVencimento.SetFocus;
      Result := False;
    end;
  end;

end;

procedure TFrmPedidos.BtnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  pInsere := True;
  edtValorTotalPar.Text    := '';
  edtValorTotalPedido.Text := '';
  cbxOperacao.ItemIndex    := -1;
  dblcbxCliente.KeyValue   := -1;
  inherited;

  dbEditReferencia.SetFocus;
  cdsAux.Close;
  cdsAux.CommandText := 'DECLARE @NextId INT '+
                        'SET @NextId = IDENT_CURRENT(''PEDIDO'') + 1 '+
                        'SELECT @NextId as ProxCod ';
  cdsAux.Open;
  pProxCodigo := cdsAux.FieldByName('ProxCod').AsString;

  cdsTempItens.EmptyDataSet;
end;

procedure TFrmPedidos.BtnEditaClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  pInsere := False;
  edtValorTotalPar.Text  := '';
  // Pega o c�digo do PEDIDO a parte devido ao mesmo ser IDENTITY
  cdsAux.Close;
  cdsAux.CommandText := 'SELECT COD_CLIENTE, CODIGO, TOT_Pedido FROM PEDIDO WHERE NUM_PEDIDO = '+QuotedStr(cdsPedido.FieldByName('NUM_PEDIDO').AsString);
  cdsAux.Open;
  dblcbxCliente.KeyValue := cdsAux.FieldByName('COD_CLIENTE').AsInteger;
  pValorTotalPedido      := cdsAux.FieldByName('TOT_Pedido').AsFloat;
  edtValorTotalPedido.Text := FloatToStrF(cdsAux.FieldByName('TOT_Pedido').AsFloat,ffFixed,18,2);
  //
  PreencheAuxiliarItem(cdsAux.FieldByName('CODIGO').AsInteger);
  cdsAuxItem.First;
  while not cdsAuxItem.Eof do
  begin
    if cdsTempItens.Locate('COD_PRODUTO',cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger,[loCaseInsensitive]) then
      cdsTempItens.Edit
    else
      cdsTempItens.Append;

    cdsTempItens.FieldByName('COD_PEDIDO').AsInteger   := cdsAux.FieldByName('CODIGO').AsInteger;
    cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger;
    cdsTempItens.FieldByName('DESC_PROD').AsString     := cdsAuxItem.FieldByName('DESCRICAO').AsString;
    cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := cdsAuxItem.FieldByName('QTD').AsInteger;
    cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := cdsAuxItem.FieldByName('VR_UNIT').AsFloat;
    cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := cdsAuxItem.FieldByName('TOT_ITEM').AsFloat;
    cdsTempItens.Post;
    cdsAuxItem.Next;
  end;
  //
  PreencheAuxiliarPagamento(cdsAux.FieldByName('CODIGO').AsInteger);
  cbxTipPag.ItemIndex       := cdsParcelamento.FieldByName('FORMA_PAG').AsInteger;
  dtpDatVencimento.DateTime := cdsParcelamento.FieldByName('DAT_VENCIMENTO').AsDateTime;
  edtValorTotalPar.Text     := FloatToStrF(cdsParcelamento.FieldByName('VAL_PARCELA').AsFloat,ffFixed,18,2);
  //
  pProxCodigo := IntToStr(cdsAux.FieldByName('CODIGO').AsInteger);
  inherited;
end;

procedure TFrmPedidos.BtnExcluirClick(Sender: TObject);
var
  Crud: TPedidoCrud;
begin
  try
    // Pega o c�digo do PEDIDO a parte devido ao mesmo ser IDENTITY
    cdsAux.Close;
    cdsAux.CommandText := 'SELECT CODIGO FROM PEDIDO WHERE NUM_PEDIDO = '+QuotedStr(cdsPedido.FieldByName('NUM_PEDIDO').AsString);
    cdsAux.Open;
    //
    PreencheAuxiliarItem(cdsAux.FieldByName('CODIGO').AsInteger);
    cdsAuxItem.First;
    while not cdsAuxItem.Eof do
    begin
      if cdsTempItens.Locate('COD_PRODUTO',cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger,[loCaseInsensitive]) then
        cdsTempItens.Edit
      else
        cdsTempItens.Append;

      cdsTempItens.FieldByName('COD_PEDIDO').AsInteger   := cdsAux.FieldByName('CODIGO').AsInteger;
      cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger;
      cdsTempItens.FieldByName('DESC_PROD').AsString     := cdsAuxItem.FieldByName('DESCRICAO').AsString;
      cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := cdsAuxItem.FieldByName('QTD').AsInteger;
      cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := cdsAuxItem.FieldByName('VR_UNIT').AsFloat;
      cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := cdsAuxItem.FieldByName('TOT_ITEM').AsFloat;
      cdsTempItens.Post;
      cdsAuxItem.Next;
    end;
    //
    PreencheAuxiliarPagamento(cdsAux.FieldByName('CODIGO').AsInteger);
    cbxTipPag.ItemIndex       := cdsParcelamento.FieldByName('FORMA_PAG').AsInteger;
    dtpDatVencimento.DateTime := cdsParcelamento.FieldByName('DAT_VENCIMENTO').AsDateTime;
    edtValorTotalPar.Text     := FloatToStrF(cdsParcelamento.FieldByName('VAL_PARCELA').AsFloat,ffFixed,18,2);

    Crud        := TPedidoCrud.Create(DmPrincipal);
    Crud.Codigo := cdsAux.FieldByName('CODIGO').AsInteger;
    PageControl1.ActivePage := TabSheet2;
    inherited;
    Crud.Exclui;
  finally
    PageControl1.ActivePage := TabSheet1;
  end;
end;

procedure TFrmPedidos.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmPedidos.BtnConfirmaClick(Sender: TObject);
var
  Crud: TPedidoCrud;
  CrudItem: TItemPedidoCrud;
  CrudPagamento: TPagamentoPedidoCrud;
  //Trans : TadDBXTransaction;

  procedure Habilita;
  begin
    BtnNovo.Enabled     := not(dsPadrao.DataSet.State in [dsInsert, dsEdit]);
    BtnConfirma.Enabled := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
    BtnEdita.Enabled    := (dsPadrao.DataSet.State in [dsBrowse]);
    BtnExcluir.Enabled  := (dsPadrao.DataSet.State in [dsBrowse, dsEdit]);
    BtnCancela.Enabled  := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
  end;

begin
  // Valida os campos da tela para evitar problemas futuros.
  if Valida then
  begin
    try
      try
        DmPrincipal.ADOConn.BeginTrans;

        edtValorTotalPedido.Text := StringReplace(edtValorTotalPedido.Text,'.','',[rfReplaceAll]);
        edtValorTotalPar.Text    := StringReplace(edtValorTotalPar.Text,'.','',[rfReplaceAll]);

        Crud := TPedidoCrud.Create(DmPrincipal);
        Crud.Referencia   := dbEditReferencia.Text;
        Crud.Num_Pedido   := dbEditPedido.Text;
        Crud.Data_Emissao := dtpDataPedido.DateTime;
        Crud.Cod_Cliente  := dblcbxCliente.KeyValue;
        Crud.Tip_Operacao := cbxOperacao.ItemIndex;
        Crud.Tot_Pedido   := StrToFloat(edtValorTotalPedido.Text);

        CrudItem := TItemPedidoCrud.Create(DmPrincipal);

        CrudPagamento := TPagamentoPedidoCrud.Create(DmPrincipal);
        CrudPagamento.Forma_Pag      := cbxTipPag.ItemIndex;
        CrudPagamento.Dat_Vencimento := dtpDatVencimento.DateTime;
        CrudPagamento.Val_Parcela    := StrToFloat(edtValorTotalPar.Text);

        if pInsere then
        begin
          CrudPagamento.Cod_Pedido   := StrToInt(pProxCodigo);
          if Crud.Insere then
          begin
            if CrudItem.Insere(cdsTempItens) then
            begin
              if CrudPagamento.Insere then
                ShowMessage('Pedido INCLUIDO com sucesso.');
            end;
          end;
        end
        else
        begin
          Crud.Codigo := StrToInt(cdsAux.FieldByName('CODIGO').AsString);
          CrudPagamento.Cod_Pedido := StrToInt(cdsAux.FieldByName('CODIGO').AsString);
          if Crud.Altera then
          begin
            if CrudItem.Altera(cdsTempItens) then
            begin
              if CrudPagamento.Altera then
                ShowMessage('Pedido ALTERADO com sucesso.');
            end;
          end;
        end;
      DmPrincipal.ADOConn.CommitTrans;
      except
        DmPrincipal.ADOConn.RollbackTrans;
      end;
    finally
      Crud.Free;
      CrudItem.Free;
      CrudPagamento.Free;
      cdsPedido.Close;
      cdsPedido.Open;
      cdsTempItens.EmptyDataSet;
      PageControl1.ActivePage := TabSheet1;
    end;
    Habilita;
  end;
end;

procedure TFrmPedidos.EditPesqNomeChange(Sender: TObject);
begin
  try
    if EditPesqNome.Text = '' then
      EditPesqNome.Text := '0';

    cdsPedido.Locate('NUM_Pedido',StrToInt(EditPesqNome.Text),[loCaseInsensitive]);
    inherited;
  finally
   //
  end;
end;

end.
