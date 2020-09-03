unit uDados;

interface

uses
  IniFiles, System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Windows, Messages, Variants, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, Data.DBXMSSQL;

type
  TDmPrincipal = class(TDataModule)
    SQLConn: TSQLConnection;
    SQLDsConsulta: TSQLDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TConexao = class
    private
      FConexao: TSQLConnection;
    public
      constructor Create;
      destructor Destroy; override;
      function GetConexao: TSQLConnection;
      property Conexao: TSQLConnection read GetConexao;
  end;
var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TConexao }

constructor TConexao.Create;
begin
//
end;

destructor TConexao.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TConexao.GetConexao: TSQLConnection;
begin
  Result := FConexao;
end;

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
var
  Arquivo, Server, Path, Driver, User, Password: String;
  Config: TIniFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + 'base.ini';

  if not FileExists(Arquivo) then
  begin
    ShowMessage('Não existe arquivo INI com as informações.');
    Abort;
  end;

  config := TIniFile.Create(Arquivo);
  try
    Server   := Config.ReadString('Parametro', 'Server', Server);
    Path     := Config.ReadString('Parametro', 'DataBase', Path);
    Driver   := Config.ReadString('Parametro', 'Driver', Driver);
    User     := Config.ReadString('Parametro', 'User', User);
    Password := Config.ReadString('Parametro', 'Password', Password);
  finally
    Config.Free;
  end;

  try
    SQLConn.ConnectionName := 'MSSQLConnection';
    SQLConn.DriverName     := 'MSSQL';
    SQLConn.LoginPrompt    := False;
    try
      SQLConn.Connected := False;
      SQLConn.Params.Values['Server']     := Server;
      SQLConn.Params.Values['DataBase']   := Path;
      SQLConn.Params.Values['User_Name']  := User;
      SQLConn.Params.Values['Password']   := Password;
      SQLConn.Connected := True;
    except
      ShowMessage('Erro ao conectar com o banco de dados.');
    end;
  except
    raise;
  end;
end;

end.
