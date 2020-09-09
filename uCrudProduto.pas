unit uCrudProduto;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uDados;

type
  TProdutoCrud = class
    private
      FCodigo: String;
      FDescricao: String;
      FConexao: TDmPrincipal;

    public
      constructor Create(pConexao: TDmPrincipal);
      destructor Destroy; override;

      function Insere: Boolean;
      function Altera: Boolean;
      function Exclui: Boolean;
      function Pesquisa(pDesc: String): TProdutoCrud;

      property Codigo: String read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
  end;


implementation

{ TProdutoCrud }


constructor TProdutoCrud.Create(pConexao: TDmPrincipal);
begin
  FConexao := pConexao;
end;

destructor TProdutoCrud.Destroy;
begin
  //
  inherited;
end;

function TProdutoCrud.Insere: Boolean;
begin
  with FConexao do
  begin
    QryConsulta.Close;
    QryConsulta.SQL.Text := '';
    QryConsulta.SQL.Text := 'INSERT INTO PRODUTOS '+
                                 ' ( DESCRICAO ) '+
                                 'VALUES '+
                                 ' ( :pDescricao ) ';

    QryConsulta.Parameters.ParamByName('pDescricao').Value := Self.Descricao;
    try
      QryConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;
function TProdutoCrud.Altera: Boolean;
begin
  with FConexao do
  begin
    QryConsulta.Close;
    QryConsulta.SQL.Text := '';
    QryConsulta.SQL.Text := 'UPDATE PRODUTOS '+
                                 ' SET DESCRICAO = :pDescricao '+
                                 'WHERE CODIGO = :pCodigo ';

    QryConsulta.Parameters.ParamByName('pCodigo').Value    := Self.Codigo;
    QryConsulta.Parameters.ParamByName('pDescricao').Value := Self.Descricao;
    try
      QryConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TProdutoCrud.Exclui: Boolean;
begin
  with FConexao do
  begin
    QryConsulta.Close;
    QryConsulta.SQL.Text := '';
    QryConsulta.SQL.Text := 'DELETE FROM PRODUTOS '+
                                 'WHERE CODIGO = :pCodigo ';
    QryConsulta.Parameters.ParamByName('pCodigo').Value := Self.Codigo;
    try
      QryConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TProdutoCrud.Pesquisa(pDesc: String): TProdutoCrud;
begin
  with FConexao do
  begin
    QryConsulta.Close;
    QryConsulta.SQL.Text := '';
    QryConsulta.SQL.Text := 'SELECT CODIGO, DESCRICAO '+
                                 'FROM PRODUTOS            '+
                                 'WHERE DESCRICAO LIKE '+QuotedStr('%'+pDesc);
    QryConsulta.Open;
    if QryConsulta.IsEmpty then
      Self.Codigo := ''
    else
      begin
        Self.Descricao  := QryConsulta.FieldByName('Descricao').AsString;
      end;
  end;
end;

end.
