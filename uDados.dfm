object DmPrincipal: TDmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 159
  Width = 242
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 48
    Top = 24
  end
  object QryConsulta: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 48
    Top = 80
  end
end
