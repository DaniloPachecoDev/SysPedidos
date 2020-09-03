unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDados, uFrmPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.FMTBcd, Data.SqlExpr, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient,
  Datasnap.Provider;

type
  TFrmCadCliente = class(TFrmPadrao)
    dbEditNome: TDBEdit;
    dbEditInscricao: TDBEdit;
    lblNome: TLabel;
    lblInscricao: TLabel;
    dsData: TDataSource;
    DataSetProvider: TDataSetProvider;
    cdsPesq: TClientDataSet;
    cdsPesqRazao: TStringField;
    cdsPesqInscricao: TStringField;
    cdsAux: TClientDataSet;
    cdsAuxCodigo: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure dbEditInscricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbEditInscricaoEnter(Sender: TObject);
    procedure dbEditInscricaoExit(Sender: TObject);
  private
    function VerificaCnpj(pInscricao: String): Boolean;  // Funções oriundas da internet para validação de CNPJ
    function VerificaCpf(pInscricao:String): Boolean;    // Funções oriundas da internet para validação de CPF
    function Validacao: Boolean;
  public
    pInsere: Boolean;
    pMudaTab: Boolean;
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

uses uCrudCliente;

{$R *.dfm}

procedure TFrmCadCliente.BtnConfirmaClick(Sender: TObject);
var
  Crud: TClienteCrud;
begin
  // Valida os campos da tela para evitar problemas futuros.
  if Validacao then
  begin
    try
      Crud := TClienteCrud.Create(DmPrincipal);
      Crud.Razao     := dbEditNome.Text;
      Crud.Inscricao := dbEditInscricao.Text;
      if pInsere then
      begin
        if Crud.Insere then
          ShowMessage('Cliente INCLUIDO com sucesso.');
      end
      else
      begin
        Crud.Codigo := cdsAux.FieldByName('CODIGO').AsString;
        if Crud.Altera then
          ShowMessage('Cliente ALTERADO com sucesso.');
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

procedure TFrmCadCliente.BtnNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  pInsere := True;
  inherited;

  dbEditNome.SetFocus;
  pMudaTab := True;
end;

procedure TFrmCadCliente.BtnEditaClick(Sender: TObject);
begin
  pMudaTab := True;
  PageControl1.ActivePage := TabSheet2;
  pInsere := False;
  // Pega o código do cliente a parte devido ao mesmo ser IDENTITY
  cdsAux.Close;
  cdsAux.CommandText := 'SELECT CODIGO FROM CLIENTES WHERE INSCRICAO = '+QuotedStr(cdsPesqInscricao.AsString);
  cdsAux.Open;

  inherited;
end;

procedure TFrmCadCliente.BtnExcluirClick(Sender: TObject);
var
  Crud: TClienteCrud;
begin
  try
    // Pega o código do cliente a parte devido ao mesmo ser IDENTITY
    cdsAux.Close;
    cdsAux.CommandText := 'SELECT CODIGO FROM CLIENTES WHERE INSCRICAO = '+QuotedStr(cdsPesqInscricao.AsString);
    cdsAux.Open;

    Crud        := TClienteCrud.Create(DmPrincipal);
    Crud.Codigo := cdsAux.FieldByName('CODIGO').AsString;
    PageControl1.ActivePage := TabSheet2;
    pMudaTab := True;

    inherited;
    Crud.Exclui;
  finally
    PageControl1.ActivePage := TabSheet1;
  end;
end;

procedure TFrmCadCliente.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  pMudaTab := True;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmCadCliente.EditPesqNomeChange(Sender: TObject);
begin
  try
    cdsPesq.Locate('RAZAO',EditPesqNome.Text,[loPartialKey]);
    inherited;
  finally
   //
  end;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet2.TabVisible    := False;
end;

procedure TFrmCadCliente.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := pMudaTab;
end;

procedure TFrmCadCliente.dbEditInscricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
    key :=#0;
end;


function TFrmCadCliente.VerificaCnpj(pInscricao: String): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  n1:=StrToInt(pInscricao[1]);
  n2:=StrToInt(pInscricao[2]);
  n3:=StrToInt(pInscricao[3]);
  n4:=StrToInt(pInscricao[4]);
  n5:=StrToInt(pInscricao[5]);
  n6:=StrToInt(pInscricao[6]);
  n7:=StrToInt(pInscricao[7]);
  n8:=StrToInt(pInscricao[8]);
  n9:=StrToInt(pInscricao[9]);
  n10:=StrToInt(pInscricao[10]);
  n11:=StrToInt(pInscricao[11]);
  n12:=StrToInt(pInscricao[12]);
  d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=pInscricao[13]+pInscricao[14];

  if calculado=digitado then
    Result:=true
  else
    Result:=false;
end;

function TFrmCadCliente.VerificaCpf(pInscricao: String): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  n1:=StrToInt(pInscricao[1]);
  n2:=StrToInt(pInscricao[2]);
  n3:=StrToInt(pInscricao[3]);
  n4:=StrToInt(pInscricao[4]);
  n5:=StrToInt(pInscricao[5]);
  n6:=StrToInt(pInscricao[6]);
  n7:=StrToInt(pInscricao[7]);
  n8:=StrToInt(pInscricao[8]);
  n9:=StrToInt(pInscricao[9]);
  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=pInscricao[10]+pInscricao[11];
  if calculado=digitado then
    Result := true
  else
    Result := false;
end;

procedure TFrmCadCliente.dbEditInscricaoEnter(Sender: TObject);
var
 I: integer;
 S, Texto: string;
begin
  S := '';
  Texto := dbEditInscricao.Text;

   for I := 1 to Length(Texto) do
    begin
    if (Texto[I] in ['0'..'9']) then
     begin
      S := S + Copy(Texto, I, 1);
     end;
   end;
   dbEditInscricao.Text := S;
end;

procedure TFrmCadCliente.dbEditInscricaoExit(Sender: TObject);
var
  FormatarCNPJ:String;
  FormatarCPF:String;
begin
  if Length(dbEditInscricao.Text) <> 0 then
  begin
    if Length(dbEditInscricao.Text) = 14 then
    begin
      if VerificaCnpj(dbEditInscricao.Text) then
      begin
        FormatarCNPJ:= Copy(dbEditInscricao.Text, 1,2)
                       + '.' + Copy(dbEditInscricao.Text, 3,3)
                       +'.' + Copy(dbEditInscricao.Text, 6,3)
                       + '/' +Copy(dbEditInscricao.Text, 9,4)
                       + '-' + Copy(dbEditInscricao.Text, 13,2);
        dbEditInscricao.Text:= FormatarCNPJ;
      end
      else
      begin
        ShowMessage('CNPJ com erro. favor verificar');
        dbEditInscricao.SetFocus;
      end;
    end
    else
    if Length(dbEditInscricao.Text) = 11 then
    begin
      if VerificaCpf(dbEditInscricao.Text) Then
      begin
        formatarCPF:= Copy(dbEditInscricao.Text, 1,3)
                      + '.' + Copy(dbEditInscricao.Text, 4,3)
                      + '.' + Copy(dbEditInscricao.Text,7,3)
                      + '-' + Copy(dbEditInscricao.Text, 10,2);
        dbEditInscricao.Text:= FormatarCPF;
      end
      else
      begin
       ShowMessage('CPF com erro. favor verificar');
       dbEditInscricao.SetFocus;
      end;
    end
    else
    begin
     ShowMessage('O CPF tem 11 digitos e CNPJ tem 14 digitos.'#13'Preencha corretamente');
     dbEditInscricao.SetFocus;
     dbEditInscricao.SelectAll;
    end;
  end;
end;

function TFrmCadCliente.Validacao: Boolean;
begin
  Result := True;
  if dbEditNome.Text = '' then
  begin
    ShowMessage('Campo Razão Social inválido');
    dbEditNome.SetFocus;
    Result := False;
  end
  else
  if dbEditInscricao.Text = '' then
  begin
    ShowMessage('Campo CPF/CNPJ inválido');
    dbEditInscricao.SetFocus;
    Result := False;
  end
end;

end.
