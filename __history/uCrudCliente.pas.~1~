unit uCrudCliente;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uDados;

type
  TClienteCrud = class
    private
      FCodigo: String;
      FRazao: String;
      FInscricao: String;
      FConexao: TDmPrincipal;

    public
      constructor Create(pConexao: TDmPrincipal);
      destructor Destroy; override;

      function Insere: Boolean;
      function Altera: Boolean;
      function Exclui: Boolean;
      function Pesquisa(pRazao: String): TClienteCrud;

      property Codigo: String read FCodigo write FCodigo;
      property Razao: String read FRazao write FRazao;
      property Inscricao: String read FInscricao write FInscricao;
  end;


implementation

{ TClienteCrud }

function TClienteCrud.Altera: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'UPDATE CLIENTES '+
                                 ' SET RAZAO = :pRazao, '+
                                 '     INSCRICAO = :pInscricao '+
                                 'WHERE CODIGO = :pCodigo ';

    SQLDsConsulta.Params.ParamByName('pCodigo').AsString    := Self.Codigo;
    SQLDsConsulta.Params.ParamByName('pRazao').AsString     := Self.Razao;
    SQLDsConsulta.Params.ParamByName('pInscricao').AsString := Self.Inscricao;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

constructor TClienteCrud.Create(pConexao: TDmPrincipal);
begin
  FConexao := pConexao;
end;

destructor TClienteCrud.Destroy;
begin
  //
  inherited;
end;

function TClienteCrud.Exclui: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'DELETE FROM CLIENTES '+
                                 'WHERE CODIGO = :pCodigo ';
    SQLDsConsulta.Params.ParamByName('pCodigo').AsString := Self.Codigo;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TClienteCrud.Insere: Boolean;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'INSERT INTO CLIENTES '+
                                 ' ( RAZAO, INSCRICAO ) '+
                                 'VALUES '+
                                 ' ( :pRazao, :pInscricao ) ';

    SQLDsConsulta.Params.ParamByName('pRazao').AsString     := Self.Razao;
    SQLDsConsulta.Params.ParamByName('pInscricao').AsString := Self.Inscricao;
    try
      SQLDsConsulta.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TClienteCrud.Pesquisa(pRazao: String): TClienteCrud;
begin
  with FConexao do
  begin
    SQLDsConsulta.Close;
    SQLDsConsulta.CommandText := '';
    SQLDsConsulta.CommandText := 'SELECT RAZAO, INSCRICAO '+
                                 'FROM CLIENTES           '+
                                 'WHERE RAZAO LIKE '+QuotedStr('%'+pRazao);
    SQLDsConsulta.Open;
    if SQLDsConsulta.IsEmpty then
      Self.Codigo := ''
    else
      begin
        Self.Razao     := SQLDsConsulta.FieldByName('RAZAO').AsString;
        Self.Inscricao := SQLDsConsulta.FieldByName('INSCRICAO').AsString;
      end;
  end;
end;

end.
