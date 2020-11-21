object FCadOS: TFCadOS
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ordem de Servi'#231'o'
  ClientHeight = 849
  ClientWidth = 1005
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object pBotoes: TPanel
    Left = 0
    Top = 786
    Width = 1005
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 777
    ExplicitWidth = 919
    object btSalvar: TBitBtn
      Left = 783
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btSalvarClick
    end
    object btCancelar: TBitBtn
      Left = 897
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
  object dbgServicos: TDBGrid
    Left = 8
    Top = 87
    Width = 989
    Height = 249
    DataSource = dsCdTbRelProdutoOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'FkCodProd'
        Title.Caption = 'C'#243'd. Prod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProduto'
        Title.Alignment = taCenter
        Title.Caption = 'NOME DO PRODUTO'
        Width = 509
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Title.Caption = 'V. Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Title.Alignment = taCenter
        Title.Caption = 'V. Total'
        Visible = True
      end>
  end
  object pDados: TPanel
    Left = 1
    Top = 8
    Width = 996
    Height = 73
    TabOrder = 2
    object lbCodigo: TLabel
      Left = 29
      Top = 11
      Width = 46
      Height = 18
      Caption = 'N'#176' OS:'
    end
    object lbData: TLabel
      Left = 39
      Top = 43
      Width = 36
      Height = 18
      Caption = 'Data:'
    end
    object lbPlaca: TLabel
      Left = 261
      Top = 43
      Width = 38
      Height = 18
      Caption = 'Placa:'
    end
    object lbCliente: TLabel
      Left = 217
      Top = 11
      Width = 82
      Height = 18
      Caption = 'C'#243'd. Cliente:'
    end
    object lbNomeCliente: TLabel
      Left = 495
      Top = 11
      Width = 97
      Height = 18
      Caption = 'NomeCliente'
    end
    object lbFkCodVeiculo: TLabel
      Left = 426
      Top = 43
      Width = 69
      Height = 18
      Caption = 'CodVeiculo'
    end
    object lbCod: TLabel
      Left = 390
      Top = 43
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object edtPkCodOS: TEdit
      Left = 92
      Top = 8
      Width = 86
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object medtDataOs: TMaskEdit
      Left = 92
      Top = 40
      Width = 86
      Height = 26
      EditMask = '!90/90/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object medtPlacaVeiculo: TMaskEdit
      Left = 314
      Top = 40
      Width = 70
      Height = 26
      EditMask = '>LLL-0A00;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = '   -    '
      OnExit = medtPlacaVeiculoExit
    end
    object edtFkCodCli: TEdit
      Left = 314
      Top = 8
      Width = 70
      Height = 26
      TabOrder = 3
      OnExit = edtFkCodCliExit
      OnKeyPress = edtFkCodCliKeyPress
    end
    object btProcuraCliente: TBitBtn
      Left = 390
      Top = 9
      Width = 99
      Height = 25
      Caption = 'Listar Clientes'
      TabOrder = 4
      OnClick = btProcuraClienteClick
    end
  end
  object pInsereProduto: TPanel
    Left = 8
    Top = 342
    Width = 989
    Height = 67
    TabOrder = 3
    object lbCodProd: TLabel
      Left = 111
      Top = 7
      Width = 64
      Height = 18
      Caption = 'C'#243'd. Prod'
    end
    object lbnomeprod: TLabel
      Left = 207
      Top = 7
      Width = 50
      Height = 18
      Caption = 'Produto'
    end
    object lbQuantidade: TLabel
      Left = 559
      Top = 8
      Width = 45
      Height = 18
      Caption = 'Quant.'
    end
    object lbValorUnit: TLabel
      Left = 670
      Top = 8
      Width = 85
      Height = 18
      Caption = 'Valor Unit'#225'rio'
    end
    object edtFkCodProd: TEdit
      Left = 111
      Top = 32
      Width = 82
      Height = 26
      TabOrder = 0
      OnExit = edtFkCodProdExit
      OnKeyPress = edtFkCodProdKeyPress
    end
    object edtNomeProduto: TEdit
      Left = 207
      Top = 32
      Width = 328
      Height = 26
      Enabled = False
      TabOrder = 1
    end
    object edtQuantidade: TEdit
      Left = 559
      Top = 32
      Width = 90
      Height = 26
      TabOrder = 2
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtValorUnit: TEdit
      Left = 671
      Top = 32
      Width = 121
      Height = 26
      TabOrder = 3
      OnKeyPress = edtValorUnitKeyPress
    end
    object btAdicionarProduto: TBitBtn
      Left = 809
      Top = 14
      Width = 70
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 4
      OnClick = btAdicionarProdutoClick
    end
    object btRemoverProduto: TBitBtn
      Left = 898
      Top = 14
      Width = 74
      Height = 41
      Caption = 'Remover'
      TabOrder = 5
      OnClick = btRemoverProdutoClick
    end
    object btListarProdutos: TBitBtn
      Left = 0
      Top = 17
      Width = 105
      Height = 25
      Caption = 'Listar Produtos'
      TabOrder = 6
      OnClick = btListarProdutosClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 432
    Width = 989
    Height = 233
    DataSource = dsCdTbRelServicoOS
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FkCodServico'
        Title.Caption = 'C'#243'd. Serv'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoServico'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO SERVI'#199'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 639
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorServico'
        Title.Caption = 'VALOR SERVI'#199'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 144
        Visible = True
      end>
  end
  object pInsereServico: TPanel
    Left = 8
    Top = 676
    Width = 989
    Height = 66
    TabOrder = 5
    object lbCodServ: TLabel
      Left = 111
      Top = 8
      Width = 64
      Height = 18
      Caption = 'C'#243'd. Serv'
    end
    object lbDescricaoServ: TLabel
      Left = 207
      Top = 8
      Width = 134
      Height = 18
      Caption = 'Descri'#231#227'o do Servi'#231'o'
    end
    object lbValorServ: TLabel
      Left = 671
      Top = 8
      Width = 104
      Height = 18
      Caption = 'Valor do Servi'#231'o'
    end
    object edtFkCodServico: TEdit
      Left = 111
      Top = 32
      Width = 82
      Height = 26
      TabOrder = 0
      OnExit = edtFkCodServicoExit
      OnKeyPress = edtFkCodServicoKeyPress
    end
    object edtValorServico: TEdit
      Left = 670
      Top = 32
      Width = 121
      Height = 26
      TabOrder = 1
      OnKeyPress = edtValorServicoKeyPress
    end
    object btAdicionarServico: TBitBtn
      Left = 809
      Top = 13
      Width = 70
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = btAdicionarServicoClick
    end
    object btRemoverServico: TBitBtn
      Left = 898
      Top = 13
      Width = 74
      Height = 41
      Caption = 'Remover'
      TabOrder = 3
      OnClick = btRemoverServicoClick
    end
    object btListarServicos: TBitBtn
      Left = 4
      Top = 16
      Width = 101
      Height = 25
      Caption = 'Listar Servi'#231'os'
      TabOrder = 4
      OnClick = btListarServicosClick
    end
  end
  object edtDescricaoServico: TEdit
    Left = 215
    Top = 708
    Width = 449
    Height = 26
    Enabled = False
    TabOrder = 6
  end
  object pValorOS: TPanel
    Left = 782
    Top = 743
    Width = 215
    Height = 41
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 7
    object lbValor: TLabel
      Left = 21
      Top = 9
      Width = 87
      Height = 21
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbValorTotal: TLabel
      Left = 166
      Top = 9
      Width = 32
      Height = 21
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object cdTbRelProdutoOS: TClientDataSet
    PersistDataPacket.Data = {
      BB0000009619E0BD010000001800000008000000000003000000BB0009506B43
      6F6452656C50040001000000000007466B436F644F5304000100000000000946
      6B436F6450726F6404000100000000000A5175616E7469646164650400010000
      0000000D56616C6F72556E69746172696F08000400000000000A56616C6F7254
      6F74616C08000400000000000B4E6F6D6550726F6475746F0100490000000100
      05574944544802000200500008636F6E74726F6C6504000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PkCodRelP'
        DataType = ftInteger
      end
      item
        Name = 'FkCodOS'
        DataType = ftInteger
      end
      item
        Name = 'FkCodProd'
        DataType = ftInteger
      end
      item
        Name = 'Quantidade'
        DataType = ftInteger
      end
      item
        Name = 'ValorUnitario'
        DataType = ftFloat
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'controle'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 592
    Top = 16
  end
  object dsCdTbRelProdutoOS: TDataSource
    DataSet = cdTbRelProdutoOS
    Left = 657
    Top = 32
  end
  object cdTbRelServicoOS: TClientDataSet
    PersistDataPacket.Data = {
      9C0000009619E0BD0100000018000000060000000000030000009C0009506B43
      6F6452656C53040001000000000007466B436F644F5304000100000000000C46
      6B436F645365727669636F04000100000000000C56616C6F725365727669636F
      08000400000000001044657363726963616F5365727669636F01004900000001
      0005574944544802000200140008636F6E74726F6C6504000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PkCodRelS'
        DataType = ftInteger
      end
      item
        Name = 'FkCodOS'
        DataType = ftInteger
      end
      item
        Name = 'FkCodServico'
        DataType = ftInteger
      end
      item
        Name = 'ValorServico'
        DataType = ftFloat
      end
      item
        Name = 'DescricaoServico'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'controle'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 737
    Top = 16
  end
  object dsCdTbRelServicoOS: TDataSource
    DataSet = cdTbRelServicoOS
    Left = 809
    Top = 32
  end
end
