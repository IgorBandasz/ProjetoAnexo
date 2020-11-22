object DM: TDM
  OldCreateOrder = False
  Height = 516
  Width = 841
  object fdcConexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\iband\Desktop\Git\ProjetoAnexo\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    Transaction = fdtTransacao
    Left = 24
    Top = 24
  end
  object fdtTransacao: TFDTransaction
    Connection = fdcConexao
    Left = 136
    Top = 24
  end
  object sqlCliente: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbcliente')
    Left = 136
    Top = 136
  end
  object dsCliente: TDataSource
    DataSet = sqlCliente
    Left = 136
    Top = 224
  end
  object fdtTransacaoAltera: TFDTransaction
    Connection = fdcConexao
    Left = 616
    Top = 24
  end
  object sqlAltera: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacaoAltera
    Left = 616
    Top = 136
  end
  object sqlServico: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbservico')
    Left = 216
    Top = 136
  end
  object dsServico: TDataSource
    DataSet = sqlServico
    Left = 216
    Top = 224
  end
  object sqlProduto: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbproduto')
    Left = 288
    Top = 136
  end
  object dsProduto: TDataSource
    DataSet = sqlProduto
    Left = 288
    Top = 224
  end
  object sqlMarca: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbmarca')
    Left = 360
    Top = 136
  end
  object dsMarca: TDataSource
    DataSet = sqlMarca
    Left = 360
    Top = 224
  end
  object sqlVeiculo: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbveiculo v'
      'inner join tbmarca m on m.pkcodmarca = v.fkcodmarca')
    Left = 432
    Top = 136
  end
  object dsVeiculo: TDataSource
    DataSet = sqlVeiculo
    Left = 432
    Top = 224
  end
  object sqlGeral: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      '')
    Left = 64
    Top = 136
  end
  object sqlOS: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select * from tbos o'
      'inner join tbcliente c on c.pkcodcli = o.fkcodcli'
      'inner join tbveiculo v on v.pkcodveiculo = o.fkcodveiculo')
    Left = 504
    Top = 136
  end
  object dsOS: TDataSource
    DataSet = sqlOS
    Left = 504
    Top = 224
  end
  object sqlRelatorioProd: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      
        'select p.pkcodprod, p.nomeprod, count(*), sum(r.quantidade) from' +
        ' tbproduto p'
      'inner join tbrelprodutoos r on p.pkcodprod = r.fkcodprod'
      'group by p.nomeprod,p.pkcodprod')
    Left = 96
    Top = 304
  end
  object dsRelatorioProd: TDataSource
    DataSet = sqlRelatorioProd
    Left = 96
    Top = 392
  end
  object sqlRelatorioServ: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      
        'select s.pkcodservico, s.descricaoservico, count(*) from tbservi' +
        'co s'
      'inner join tbrelservicoos r on s.pkcodservico = r.fkcodservico'
      'group by s.descricaoservico, s.pkcodservico')
    Left = 184
    Top = 304
  end
  object dsRelatorioServ: TDataSource
    DataSet = sqlRelatorioServ
    Left = 184
    Top = 392
  end
  object sqlRelatorioCli: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      
        'select c.pkcodcli, c.nomecli, count(*), sum(o.valortotal), avg(o' +
        '.valortotal) from tbcliente c'
      'inner join tbos o on c.pkcodcli = o.fkcodcli'
      'group by c.pkcodcli, c.nomecli')
    Left = 272
    Top = 304
  end
  object dsRelatorioCli: TDataSource
    DataSet = sqlRelatorioCli
    Left = 272
    Top = 392
  end
  object sqlRelatorioVei: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      
        'select v.pkcodveiculo, v.placaveiculo, m.nomemarca, count(*), av' +
        'g(o.valortotal), sum(o.valortotal) from tbveiculo v'
      'inner join tbos o on v.pkcodveiculo = o.fkcodveiculo'
      'inner join tbmarca m on m.pkcodmarca = v.fkcodmarca'
      'group by v.pkcodveiculo, v.placaveiculo, m.nomemarca')
    Left = 360
    Top = 304
  end
  object dsRelatorioVei: TDataSource
    DataSet = sqlRelatorioVei
    Left = 360
    Top = 392
  end
  object sqlRelatorioMarca: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      
        'select m.pkcodmarca, m.nomemarca, count(*), avg(o.valortotal), s' +
        'um(o.valortotal) from tbmarca m'
      'inner join tbveiculo v on m.pkcodmarca = v.fkcodmarca'
      'inner join tbos o on v.pkcodveiculo = o.fkcodveiculo'
      'group by m.nomemarca, m.pkcodmarca'
      '')
    Left = 448
    Top = 304
  end
  object dsRelatorioMarca: TDataSource
    DataSet = sqlRelatorioMarca
    Left = 448
    Top = 392
  end
  object sqlRelatorioOS: TFDQuery
    Connection = fdcConexao
    Transaction = fdtTransacao
    SQL.Strings = (
      'select '
      '  extract(MONTH from dataos) AS MES,'
      '  extract(YEAR from dataos) AS ANO,'
      '  count(*), avg(valortotal), sum(valortotal)'
      'from tbos'
      'group by extract(MONTH from dataos),extract(YEAR from dataos)')
    Left = 536
    Top = 304
  end
  object dsRelatorioOS: TDataSource
    DataSet = sqlRelatorioOS
    Left = 536
    Top = 392
  end
end
