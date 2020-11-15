object DM: TDM
  OldCreateOrder = False
  Height = 516
  Width = 841
  object fdcConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\iband\OneDrive - Universidade Luterana do Bras' +
        'il\Documentos\Embarcadero\Studio\Projects\ProjetoAnexo\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    Transaction = fdtTransacao
    Left = 104
    Top = 104
  end
  object fdtTransacao: TFDTransaction
    Connection = fdcConexao
    Left = 216
    Top = 104
  end
  object sqlCliente: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    Left = 224
    Top = 216
  end
  object dsCiente: TDataSource
    DataSet = sqlCliente
    Left = 232
    Top = 304
  end
end
