object DmPrincipal: TDmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 357
  Width = 559
  object SQLConn: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=FTS-DEV-FIS-NTB\LOCAL'
      'DataBase=Base'
      'User_Name=sa'
      'Password=dan021130'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False')
    Connected = True
    Left = 112
    Top = 56
  end
  object SQLDsConsulta: TSQLDataSet
    CommandText = 'SELECT * FROM ITEMPED'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 112
    Top = 128
  end
  object SQLDsAux: TSQLDataSet
    CommandText = 
      'SELECT COD_PEDIDO, FORMA_PAG, DAT_VENCIMENTO, VAL_PARCELA FROM P' +
      'ARPED'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 216
    Top = 144
  end
end
