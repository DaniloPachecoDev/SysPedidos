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
    cdsAuxCodigo: TIntegerField;
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure EditPesqNomeChange(Sender: TObject);
  private
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
    ShowMessage('Campo Descri��o inv�lido');
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
      cdsPesq.Close;
      cdsPesq.Open;
      PageControl1.ActivePage := TabSheet1;
    end;
  end;
end;

procedure TFrmCadProdutos.BtnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  pInsere := True;
  inherited;

  dbEditDescricao.SetFocus;
  pMudaTab := True;
end;

procedure TFrmCadProdutos.BtnEditaClick(Sender: TObject);
begin
  pMudaTab := True;
  PageControl1.ActivePage := TabSheet2;
  pInsere := False;
  // Pega o c�digo do cliente a parte devido ao mesmo ser IDENTITY
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
    // Pega o c�digo do cliente a parte devido ao mesmo ser IDENTITY
    cdsAux.Close;
    cdsAux.CommandText := 'SELECT CODIGO FROM PRODUTOS WHERE DESCRICAO = '+QuotedStr(cdsPesqDescricao.AsString);
    cdsAux.Open;

    Crud        := TProdutoCrud.Create(DmPrincipal);
    Crud.Codigo := cdsAux.FieldByName('CODIGO').AsString;
    PageControl1.ActivePage := TabSheet2;
    pMudaTab := True;

    inherited;
    Crud.Exclui;
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
