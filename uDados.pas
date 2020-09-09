unit uDados;

interface

uses
  IniFiles, System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Windows, Messages, Variants, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, Data.DBXMSSQL, Datasnap.DBClient,
  SimpleDS, Data.Win.ADODB;

type
  TDmPrincipal = class(TDataModule)
    ADOConn: TADOConnection;
    QryConsulta: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    pConfiguracao: Boolean;
    property Configuracao: Boolean read pConfiguracao write pConfiguracao;
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
  pConfiguracao     := False;
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Não existe arquivo "BASE.INI" com as informações.');
    exit;
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
    ADOConn.Connected := False;

    ADOConn.ConnectionString := 'Provider=SQLNCLI11.0;'+
                                'Persist Security Info=True;'+
                                'User ID='+User+';'+
                                'Password='+Password+';'+
                                'Initial Catalog='+Path+';'+
                                'Data Source='+Server+';'+
                                'Auto Translate=True;'+
                                'Packet Size=4096;';
   ADOConn.Connected := True;
   pConfiguracao     := True;
   except on E: Exception do
     ShowMessage('Erro ao conectar com o banco de dados.'+#13+E.Message);
   end;
end;

end.
