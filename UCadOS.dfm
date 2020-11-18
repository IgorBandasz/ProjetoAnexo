object FCadOS: TFCadOS
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ordem de Servi'#231'o'
  ClientHeight = 840
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object lbValor: TLabel
    Left = 727
    Top = 750
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
    Left = 833
    Top = 750
    Width = 32
    Height = 21
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pBotoes: TPanel
    Left = 0
    Top = 777
    Width = 918
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 169
    ExplicitWidth = 839
    object btSalvar: TBitBtn
      Left = 697
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Salvar'
      TabOrder = 0
    end
    object btCancelar: TBitBtn
      Left = 811
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object dbgServicos: TDBGrid
    Left = 8
    Top = 87
    Width = 900
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
    Width = 907
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
      Left = 424
      Top = 11
      Width = 91
      Height = 18
      Caption = 'lbNomeCliente'
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
    end
    object edtFkCodCli: TEdit
      Left = 314
      Top = 8
      Width = 70
      Height = 26
      TabOrder = 3
      Text = 'edtFkCodCli'
      OnChange = edtFkCodCliChange
    end
    object btProcuraCliente: TBitBtn
      Left = 390
      Top = 9
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 4
    end
  end
  object pInsereProduto: TPanel
    Left = 8
    Top = 342
    Width = 900
    Height = 67
    TabOrder = 3
    object lbCodProd: TLabel
      Left = 25
      Top = 7
      Width = 64
      Height = 18
      Caption = 'C'#243'd. Prod'
    end
    object lbnomeprod: TLabel
      Left = 121
      Top = 7
      Width = 50
      Height = 18
      Caption = 'Produto'
    end
    object lbQuantidade: TLabel
      Left = 449
      Top = 7
      Width = 45
      Height = 18
      Caption = 'Quant.'
    end
    object lbValorUnit: TLabel
      Left = 585
      Top = 7
      Width = 67
      Height = 18
      Caption = 'Valor Unit.'
    end
    object edtfkcodprod: TEdit
      Left = 25
      Top = 32
      Width = 82
      Height = 31
      TabOrder = 0
    end
    object edtNomeProduto: TEdit
      Left = 121
      Top = 32
      Width = 304
      Height = 31
      Enabled = False
      TabOrder = 1
    end
    object edtQuantidade: TEdit
      Left = 449
      Top = 32
      Width = 121
      Height = 31
      TabOrder = 2
    end
    object edtValorUnit: TEdit
      Left = 585
      Top = 32
      Width = 121
      Height = 31
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 780
      Top = 14
      Width = 106
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 432
    Width = 902
    Height = 233
    DataSource = dsCdTbRelServicoOS
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
        Title.Caption = 'DESCRI'#199#195'O DO SERVI'#199'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 649
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
        Visible = True
      end>
  end
  object pInsereServico: TPanel
    Left = 8
    Top = 671
    Width = 902
    Height = 66
    TabOrder = 5
    object lbCodServ: TLabel
      Left = 25
      Top = 8
      Width = 64
      Height = 18
      Caption = 'C'#243'd. Serv'
    end
    object lbDescricaoServ: TLabel
      Left = 121
      Top = 8
      Width = 134
      Height = 18
      Caption = 'Descri'#231#227'o do Servi'#231'o'
    end
    object lbValorServ: TLabel
      Left = 585
      Top = 8
      Width = 104
      Height = 18
      Caption = 'Valor do Servi'#231'o'
    end
    object edtFkCodServico: TEdit
      Left = 25
      Top = 32
      Width = 82
      Height = 26
      TabOrder = 0
      Text = 'edtFkCodServico'
    end
    object edtValorServico: TEdit
      Left = 584
      Top = 32
      Width = 121
      Height = 26
      TabOrder = 1
      Text = 'edtValorServico'
    end
    object btAdicionarServico: TBitBtn
      Left = 780
      Top = 13
      Width = 107
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 2
    end
  end
  object edtDescricaoServico: TEdit
    Left = 129
    Top = 703
    Width = 449
    Height = 26
    TabOrder = 6
    Text = 'Edit1'
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
    Left = 552
    Top = 16
  end
  object dsCdTbRelProdutoOS: TDataSource
    DataSet = cdTbRelProdutoOS
    Left = 617
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
