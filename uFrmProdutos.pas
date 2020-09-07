unit uFrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uDados, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmCadProdutos = class(TFrmPadrao)
    dbEditDescricao: TDBEdit;
    lblDescricao: TLabel;
    cdsPesq: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    cdsPesqDescricao: TStringField;
    cdsAux: TClientDataSet;
    cdsPesqCodigo: TIntegerField;
    dbEditCodigo: TDBEdit;
    Label1: TLabel;
    cdsAuxPed: TClientDataSet;
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure EditPesqNomeChange(Sender: TObject);
  private
    pProxCodigo: String;
    function Validacao: Boolean;
    { Private declarations }
  public
    pInsere: Boolean;
    pMudaTab: Boolean;
  end;

var
  FrmCadProdutos: TFrmCadProdutos;

implementation

uses uCrudProduto;

{$R *.dfm}

function TFrmCadProdutos.Validacao: Boolean;
begin
  Result := True;
  if dbEditDescricao.Text = '' then
  begin
    ShowMessage('Campo Descrição inválido');
    dbEditDescricao.SetFocus;
    Result := False;
  end;
end;

procedure TFrmCadProdutos.BtnConfirmaClick(Sender: TObject);
var
  Crud: TProdutoCrud;
begin
  // Valida os campos da tela para evitar problemas futuros.
  if Validacao then
  begin
    try
      Crud := TProdutoCrud.Create(DmPrincipal);
      Crud.Descricao := dbEditDescricao.Text;
      if pInsere then
      begin
        if Crud.Insere then
          ShowMessage('Produto INCLUIDO com sucesso.');
      end
      else
      begin
        Crud.Codigo := cdsAux.FieldByName('CODIGO').AsString;
        if Crud.Altera then
          ShowMessage('Produto ALTERADO com sucesso.');
      end;
      inherited;
    finally
      Crud.Free;
      //cdsPesq.Close;
      //cdsPesq.Open;
      PageControl1.ActivePage := TabSheet1;
    end;
  end;
end;

procedure TFrmCadProdutos.BtnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  pInsere := True;
  inherited;
  cdsAux.Close;
  cdsAux.CommandText := 'DECLARE @NextId INT '+
                        'SET @NextId = IDENT_CURRENT(''PRODUTOS'') + 1 '+
                        'SELECT @NextId as ProxCod ';
  cdsAux.Open;
  pProxCodigo := cdsAux.FieldByName('ProxCod').AsString;
  if pProxCodigo <> '' then
    begin
      dbEditCodigo.Text     := pProxCodigo;
      dbEditCodigo.ReadOnly := True;
      dbEditCodigo.Enabled  := False;
    end;

  dbEditDescricao.SetFocus;
  pMudaTab := True;
end;

procedure TFrmCadProdutos.BtnEditaClick(Sender: TObject);
begin
  pMudaTab := True;
  PageControl1.ActivePage := TabSheet2;
  pInsere := False;
  // Pega o código do cliente a parte devido ao mesmo ser IDENTITY
  cdsAux.Close;
  cdsAux.CommandText := 'SELECT CODIGO FROM PRODUTOS WHERE DESCRICAO = '+QuotedStr(cdsPesqDescricao.AsString);
  cdsAux.Open;

  inherited;
end;

procedure TFrmCadProdutos.BtnExcluirClick(Sender: TObject);
var
  Crud: TProdutoCrud;
begin
  try
    // Pega o código do cliente a parte devido ao mesmo ser IDENTITY
    cdsAux.Close;
    cdsAux.CommandText := 'SELECT CODIGO FROM PRODUTOS WHERE DESCRICAO = '+QuotedStr(cdsPesqDescricao.AsString);
    cdsAux.Open;

    cdsAuxPed.Close;
    cdsAuxPed.CommandText := 'SELECT COD_PRODUTO FROM ITEMPED WHERE COD_PRODUTO = :pCodProduto';
    cdsAuxPed.Params.ParamByName('pCodProduto').AsInteger := cdsAux.FieldByName('CODIGO').AsInteger;
    cdsAuxPed.Open;
    if cdsAuxPed.RecordCount > 0 then
    begin
      MessageDlg('Produto associado a um PEDIDO, não pode ser excluido.',mtWarning,[mbOK],0);
    end
    else
    begin
      Crud        := TProdutoCrud.Create(DmPrincipal);
      Crud.Codigo := cdsAux.FieldByName('CODIGO').AsString;
      PageControl1.ActivePage := TabSheet2;
      pMudaTab    := True;
      inherited;
      Crud.Exclui;
    end;
  finally
    PageControl1.ActivePage := TabSheet1;
  end;
end;

procedure TFrmCadProdutos.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  pMudaTab := True;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet2.TabVisible    := False;
end;

procedure TFrmCadProdutos.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := pMudaTab;
end;

procedure TFrmCadProdutos.EditPesqNomeChange(Sender: TObject);
begin
  try
    cdsPesq.Locate('DESCRICAO',EditPesqNome.Text,[loPartialKey]);
    inherited;
  finally
   //
  end;
end;

end.
