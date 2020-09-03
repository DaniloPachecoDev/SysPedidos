unit uConexao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  IniFiles, Windows, Messages, Variants, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, uDados;

type
  TAcesso = class
    private
      FConexao: TConexao;
      FQuery: TSQLQuery;
    public
      constructor Create;
      destructor Destroy; override;
      property Query: TSQLQuery read FQuery write FQuery;

  end;


implementation


{ TAcesso }

constructor TAcesso.Create;
begin
  FConexao := TConexao.Create;
  FQuery := TSQLQuery.Create(Application);
  FQuery.SQLConnection := FConexao.Conexao;
end;

destructor TAcesso.Destroy;
begin
  inherited;
end;

end.
