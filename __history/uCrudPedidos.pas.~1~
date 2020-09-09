unit uCrudPedidos;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, DBXCommon,
  ComCtrls, uDados, Datasnap.DBClient, Data.DB, Vcl.StdCtrls;

type
  TPedidoCrud = class
    private
      FCodigo: Integer;
      FReferencia: String;
      FNum_Pedido: String;
      FData_Emissao: TDatetime;
      FCod_Cliente: Integer;
      FTip_Operacao: Integer;
      FTot_Pedido: Double;
      FConexao: TDmPrincipal;
    public
      constructor Create(pConexao: TDmPrincipal);
      destructor Destroy; override;

      function Insere: Boolean;
      function Altera: Boolean;
      function Exclui: Boolean;
      function Pesquisa(pNum: String): TPedidoCrud;

      property Codigo: Integer         read FCodigo       write FCodigo;
      property Referencia: String      read FReferencia   write FReferencia;
      property Num_Pedido: String      read FNum_Pedido   write FNum_Pedido;
      property Data_Emissao: TDatetime read FData_Emissao write FData_Emissao;
      property Cod_Cliente: Integer    read FCod_Cliente  write FCod_Cliente;
      property Tip_Operacao: Integer   read FTip_Operacao write FTip_Operacao;
      property Tot_Pedido: Double      read FTot_Pedido   write FTot_Pedido;

  end;

type
  TItemPedidoCrud = class
    private
      FCodigo: Integer;
      FCod_Pedido: Integer;
      FCod_Produto: Integer;
      FQTD: Integer;
      FVR_Unit: Double;
      FTOT_Item: Double;
      FConexao: TDmPrincipal;
    public
      constructor Create(pConexao: TDmPrincipal);
      destructor Destroy; override;

      function Insere(pClientDataSet: TClientDataSet): Boolean;
      function Altera(pClientDataSet: TClientDataSet): Boolean;
      function Exclui: Boolean;

      property Codigo: Integer read FCodigo write FCodigo;
      property Cod_Pedido: Integer read FCod_Pedido write FCod_Pedido;
      property Cod_Produto: Integer read FCod_Produto write FCod_Produto;
      property QTD: Integer read FQTD write FQTD;
      property VR_Unit: Double read FVR_Unit write FVR_Unit;
      property TOT_Item: Double read FTOT_Item write FTOT_Item;
      //property Pedido: TPedidoCrud read FPedido write FPedido;
  end;

type
  TPagamentoPedidoCrud = class
    private
      FCodigo: Integer;
      FCod_Pedido: Integer;
      FForma_Pag: Integer;
      FDat_Vencimento: TDatetime;
      FVal_Parcela: Double;
      FConexao: TDmPrincipal;
    public
      constructor Create(pConexao: TDmPrincipal);
      destructor Destroy; override;

      function Insere: Boolean;
      function Altera: Boolean;
      function Exclui: Boolean;

      property Codigo: Integer           read FCodigo         write FCodigo;
      property Cod_Pedido: Integer       read FCod_Pedido     write FCod_Pedido;
      property Forma_Pag: Integer        read FForma_Pag      write FForma_Pag;
      property Dat_Vencimento: TDatetime read FDat_Vencimento write FDat_Vencimento;
      property Val_Parcela: Double       read FVal_Parcela    write FVal_Parcela;
      //property Pedido: TPedidoCrud       read FPedido         write FPedido;
  end;


implementation

{ TPedidoCrud }

constructor TPedidoCrud.Create(pConexao: TDmPrincipal);
begin
  FConexao := pConexao;
end;

destructor TPedidoCrud.Destroy;
begin
  //
  inherited;
end;

function TPedidoCrud.Insere: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'INSERT INTO PEDIDO     '+
                                 '      (REFERENCIA,     '+
                                 '       NUM_Pedido,     '+
                                 '       Data_Emissao,   '+
                                 '       COD_Cliente,    '+
                                 '       TIP_OPERACAO,   '+
                                 '       TOT_Pedido)     '+
                                 'VALUES                 '+
                                 '      (:pREFERENCIA,   '+
                                 '       :pNUM_Pedido,   '+
                                 '       :pData_Emissao, '+
                                 '       :pCOD_Cliente,  '+
                                 '       :pTIP_OPERACAO, '+
                                 '       :pTOT_Pedido)   ';

    SQLDsConsulta.Params.ParamByName('pREFERENCIA').AsInteger    := StrToInt(Self.FReferencia);
    SQLDsConsulta.Params.ParamByName('pNUM_Pedido').AsInteger    := StrToInt(Self.FNum_Pedido);
    SQLDsConsulta.Params.ParamByName('pData_Emissao').AsDateTime := Self.FData_Emissao;
    SQLDsConsulta.Params.ParamByName('pCOD_Cliente').AsInteger   := Self.FCod_Cliente;
    SQLDsConsulta.Params.ParamByName('pTIP_OPERACAO').AsString   := IntToStr(Self.FTip_Operacao);
    SQLDsConsulta.Params.ParamByName('pTOT_Pedido').AsFloat      := Self.FTot_Pedido;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TPedidoCrud.Altera: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'UPDATE PEDIDO                      '+
                                 'SET REFERENCIA = :pREFERENCIA,     '+
                                 '    NUM_Pedido = :pNUM_Pedido,     '+
                                 '    Data_Emissao = :pData_Emissao, '+
                                 '    COD_Cliente = :pCOD_Cliente,   '+
                                 '    TIP_OPERACAO = :pTIP_OPERACAO, '+
                                 '    TOT_Pedido = :pTOT_Pedido      '+
                                 'WHERE CODIGO = :pCODIGO            ';

    SQLDsConsulta.Params.ParamByName('pREFERENCIA').AsInteger    := StrToInt(Self.FReferencia);
    SQLDsConsulta.Params.ParamByName('pNUM_Pedido').AsInteger    := StrToInt(Self.FNum_Pedido);
    SQLDsConsulta.Params.ParamByName('pData_Emissao').AsDateTime := Self.FData_Emissao;
    SQLDsConsulta.Params.ParamByName('pCOD_Cliente').AsInteger   := Self.FCod_Cliente;
    SQLDsConsulta.Params.ParamByName('pTIP_OPERACAO').AsString   := IntToStr(Self.FTip_Operacao);
    SQLDsConsulta.Params.ParamByName('pTOT_Pedido').AsFloat      := Self.FTot_Pedido;
    SQLDsConsulta.Params.ParamByName('pCodigo').AsInteger        := Self.FCodigo;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TPedidoCrud.Exclui: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'DELETE FROM PEDIDO '+
                                 'WHERE CODIGO = :pCodigo ';
    SQLDsConsulta.Params.ParamByName('pCodigo').AsInteger := Self.Codigo;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TPedidoCrud.Pesquisa(pNum: String): TPedidoCrud;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'SELECT CODIGO,       '+
                                 '       REFERENCIA,   '+
                                 '       NUM_Pedido,   '+
                                 '       Data_Emissao, '+
                                 '       COD_Cliente,  '+
                                 '       TIP_OPERACAO, '+
                                 '       TOT_Pedido,   '+
                                 'FROM PEDIDO          '+
                                 'WHERE NUM_PEDIDO LIKE '+QuotedStr('%'+pNum);
    SQLDsConsulta.Open;
    if SQLDsConsulta.IsEmpty then
      Self.Num_Pedido := ''
    else
      begin
        Self.Num_Pedido  := SQLDsConsulta.FieldByName('NUM_Pedido').AsString;
      end;
  end;
end;

{ TPagamentoPedidoCrud }

constructor TPagamentoPedidoCrud.Create(pConexao: TDmPrincipal);
begin
  FConexao := pConexao;
end;

destructor TPagamentoPedidoCrud.Destroy;
begin
  //
  inherited;
end;

function TPagamentoPedidoCrud.Insere: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'INSERT INTO PARPED       '+
                                 '      (COD_PEDIDO,       '+
                                 '       FORMA_PAG,        '+
                                 '       DAT_VENCIMENTO,   '+
                                 '       VAL_PARCELA)      '+
                                 'VALUES                   '+
                                 '      (:pCOD_PEDIDO,     '+
                                 '       :pFORMA_PAG,      '+
                                 '       :pDAT_VENCIMENTO, '+
                                 '       :pVAL_PARCELA)    ';

    SQLDsConsulta.Params.ParamByName('pCOD_PEDIDO').AsInteger      := Self.FCod_Pedido;
    SQLDsConsulta.Params.ParamByName('pFORMA_PAG').AsInteger       := Self.FForma_Pag;
    SQLDsConsulta.Params.ParamByName('pDAT_VENCIMENTO').AsDateTime := Self.FDat_Vencimento;
    SQLDsConsulta.Params.ParamByName('pVAL_PARCELA').AsFloat       := Self.FVal_Parcela;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TPagamentoPedidoCrud.Altera: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'UPDATE PARPED                         '+
                                 'SET FORMA_PAG = :pFORMA_PAG,          '+
                                 '    DAT_VENCIMENTO = :pDAT_VENCIMENTO,'+
                                 '    VAL_PARCELA = :pVAL_PARCELA       '+
                                 'WHERE COD_PEDIDO = :pCOD_PEDIDO       ';

    SQLDsConsulta.Params.ParamByName('pFORMA_PAG').AsInteger       := Self.FForma_Pag;
    SQLDsConsulta.Params.ParamByName('pDAT_VENCIMENTO').AsDateTime := Self.FDat_Vencimento;
    SQLDsConsulta.Params.ParamByName('pVAL_PARCELA').AsFloat       := Self.FVal_Parcela;
    SQLDsConsulta.Params.ParamByName('pCOD_PEDIDO').AsInteger      := Self.FCod_Pedido;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TPagamentoPedidoCrud.Exclui: Boolean;
begin
  // Será excluido junto do ON CASCADE da tabela principal
end;


{ TItemPedidoCrud }

constructor TItemPedidoCrud.Create(pConexao: TDmPrincipal);
begin
  FConexao := pConexao;
end;

destructor TItemPedidoCrud.Destroy;
begin
   //
  inherited;
end;

function TItemPedidoCrud.Insere(pClientDataSet: TClientDataSet): Boolean;
begin
  with FConexao do
  begin
    pClientDataSet.First;
    while not pClientDataSet.Eof do
    begin
      SQLDsConsulta.Close;
      SQLDsConsulta.CommandText := '';
      SQLDsConsulta.CommandText := 'INSERT INTO ITEMPED  '+
                                   '      (COD_PEDIDO,   '+
                                   '       COD_PRODUTO,  '+
                                   '       QTD,          '+
                                   '       VR_UNIT,      '+
                                   '       TOT_ITEM)     '+
                                   'VALUES               '+
                                   '      (:pCOD_PEDIDO, '+
                                   '       :pCOD_PRODUTO,'+
                                   '       :pQTD,        '+
                                   '       :pVR_UNIT,    '+
                                   '       :pTOT_ITEM)   ';
      SQLDsConsulta.Params.ParamByName('pCOD_PEDIDO').AsInteger  := pClientDataSet.FieldByName('Cod_Pedido').AsInteger;
      SQLDsConsulta.Params.ParamByName('pCOD_PRODUTO').AsInteger := pClientDataSet.FieldByName('COD_PRODUTO').AsInteger;
      SQLDsConsulta.Params.ParamByName('pQTD').AsInteger         := pClientDataSet.FieldByName('QUANTIDADE').AsInteger;
      SQLDsConsulta.Params.ParamByName('pVR_UNIT').AsFloat       := pClientDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
      SQLDsConsulta.Params.ParamByName('pTOT_ITEM').AsFloat      := pClientDataSet.FieldByName('VALOR_TOTAL').AsFloat;
      try
        SQLDsConsulta.ExecSQL;
        Result := True;
      except
        Result := False;
      end;
      pClientDataSet.Next;
    end;
  end;
end;

function TItemPedidoCrud.Altera(pClientDataSet: TClientDataSet): Boolean;
begin
  with FConexao do
  begin
    pClientDataSet.First;
    while not pClientDataSet.Eof do
    begin
      // Na EDIÇÃO do pedido o usuario pode incluir um novo ITEM, portanto faço a condição abaixo de pesquisa.
      SQLDsAux.Close;
      SQLDsAux.CommandText := '';
      SQLDsAux.CommandText := 'SELECT COD_PRODUTO FROM ITEMPED  '+
                              'WHERE COD_PRODUTO = :pCODPRODUTO '+
                              '  AND COD_PEDIDO = :pCODPEDIDO   ';
      SQLDsAux.Params.ParamByName('pCODPRODUTO').AsInteger  := pClientDataSet.FieldByName('COD_PRODUTO').AsInteger;
      SQLDsAux.Params.ParamByName('pCODPEDIDO').AsInteger   := pClientDataSet.FieldByName('COD_PEDIDO').AsInteger;
      SQLDsAux.Open;

      if SQLDsAux.FieldByName('COD_PRODUTO').AsInteger <= 0 then
      begin
        SQLDsConsulta.Close;
        SQLDsConsulta.CommandText := '';
        SQLDsConsulta.CommandText := 'INSERT INTO ITEMPED  '+
                                     '      (COD_PEDIDO,   '+
                                     '       COD_PRODUTO,  '+
                                     '       QTD,          '+
                                     '       VR_UNIT,      '+
                                     '       TOT_ITEM)     '+
                                     'VALUES               '+
                                     '      (:pCOD_PEDIDO, '+
                                     '       :pCOD_PRODUTO,'+
                                     '       :pQTD,        '+
                                     '       :pVR_UNIT,    '+
                                     '       :pTOT_ITEM)   ';
        SQLDsConsulta.Params.ParamByName('pCOD_PEDIDO').AsInteger  := pClientDataSet.FieldByName('Cod_Pedido').AsInteger;
        SQLDsConsulta.Params.ParamByName('pCOD_PRODUTO').AsInteger := pClientDataSet.FieldByName('COD_PRODUTO').AsInteger;
        SQLDsConsulta.Params.ParamByName('pQTD').AsInteger         := pClientDataSet.FieldByName('QUANTIDADE').AsInteger;
        SQLDsConsulta.Params.ParamByName('pVR_UNIT').AsFloat       := pClientDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
        SQLDsConsulta.Params.ParamByName('pTOT_ITEM').AsFloat      := pClientDataSet.FieldByName('VALOR_TOTAL').AsFloat;
      end
      else
      begin
        SQLDsConsulta.Close;
        SQLDsConsulta.CommandText := '';
        SQLDsConsulta.CommandText := 'UPDATE ITEMPED                   '+
                                     'SET COD_PRODUTO = :pCOD_PRODUTO, '+
                                     '    QTD = :pQTD,                 '+
                                     '    VR_UNIT = :pVR_UNIT,         '+
                                     '    TOT_ITEM = :pTOT_ITEM        '+
                                     'WHERE COD_PEDIDO = :pCOD_PEDIDO  ';
        SQLDsConsulta.Params.ParamByName('pCOD_PRODUTO').AsInteger := pClientDataSet.FieldByName('COD_PRODUTO').AsInteger;
        SQLDsConsulta.Params.ParamByName('pQTD').AsInteger         := pClientDataSet.FieldByName('QUANTIDADE').AsInteger;
        SQLDsConsulta.Params.ParamByName('pVR_UNIT').AsFloat       := pClientDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
        SQLDsConsulta.Params.ParamByName('pTOT_ITEM').AsFloat      := pClientDataSet.FieldByName('VALOR_TOTAL').AsFloat;
        SQLDsConsulta.Params.ParamByName('pCOD_PEDIDO').AsInteger  := pClientDataSet.FieldByName('Cod_Pedido').AsInteger;
      end;

      try
        SQLDsConsulta.ExecSQL;
        Result := True;
      except
        Result := False;
      end;
      pClientDataSet.Next;
    end;
  end;
end;

function TItemPedidoCrud.Exclui: Boolean;
begin
 // Será excluido junto do ON CASCADE da tabela principal
end;

end.
