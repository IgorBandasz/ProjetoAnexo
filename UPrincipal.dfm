object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'In'#237'cio'
  ClientHeight = 482
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object lbTitulo: TLabel
    Left = 16
    Top = 16
    Width = 176
    Height = 38
    Caption = 'Bem-Vindo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object pCadastro: TPanel
    Left = 64
    Top = 112
    Width = 217
    Height = 313
    TabOrder = 0
    object lbCadastro: TLabel
      Left = 61
      Top = 15
      Width = 94
      Height = 29
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = -96
      Width = 41
      Height = 18
      Caption = 'Label1'
    end
    object btCadCliente: TBitBtn
      Left = 64
      Top = 104
      Width = 86
      Height = 30
      Caption = 'Cliente'
      TabOrder = 0
      OnClick = btCadClienteClick
    end
    object btCadVeiculo: TBitBtn
      Left = 64
      Top = 146
      Width = 86
      Height = 30
      Caption = 'Ve'#237'culo'
      TabOrder = 1
      OnClick = btCadVeiculoClick
    end
    object btCadMarca: TBitBtn
      Left = 46
      Top = 188
      Width = 121
      Height = 31
      Caption = 'Marca de Ve'#237'culo'
      TabOrder = 2
      OnClick = btCadMarcaClick
    end
    object btCadProduto: TBitBtn
      Left = 64
      Top = 231
      Width = 86
      Height = 29
      Caption = 'Produto'
      TabOrder = 3
      OnClick = btCadProdutoClick
    end
    object btCadServico: TBitBtn
      Left = 64
      Top = 272
      Width = 86
      Height = 28
      Caption = 'Servi'#231'o'
      TabOrder = 4
      OnClick = btCadServicoClick
    end
    object btCadOS: TBitBtn
      Left = 64
      Top = 64
      Width = 86
      Height = 28
      Caption = 'OS'
      TabOrder = 5
      OnClick = btCadOSClick
    end
  end
  object pRelatorios: TPanel
    Left = 383
    Top = 112
    Width = 217
    Height = 313
    TabOrder = 1
    object lbRelatorios: TLabel
      Left = 58
      Top = 15
      Width = 105
      Height = 29
      Caption = 'Relat'#243'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btRelCliente: TBitBtn
      Left = 67
      Top = 104
      Width = 86
      Height = 30
      Caption = 'Cliente'
      TabOrder = 0
      OnClick = btRelClienteClick
    end
    object btRelMarca: TBitBtn
      Left = 50
      Top = 188
      Width = 121
      Height = 31
      Caption = 'Marca de Ve'#237'culo'
      TabOrder = 1
      OnClick = btRelMarcaClick
    end
    object btRelOS: TBitBtn
      Left = 67
      Top = 64
      Width = 86
      Height = 28
      Caption = 'OS'
      TabOrder = 2
      OnClick = btRelOSClick
    end
    object btRelProduto: TBitBtn
      Left = 67
      Top = 231
      Width = 86
      Height = 29
      Caption = 'Produto'
      TabOrder = 3
      OnClick = btRelProdutoClick
    end
    object btRelServico: TBitBtn
      Left = 67
      Top = 272
      Width = 86
      Height = 28
      Caption = 'Servi'#231'o'
      TabOrder = 4
      OnClick = btRelServicoClick
    end
    object btRelVeiculo: TBitBtn
      Left = 67
      Top = 146
      Width = 86
      Height = 30
      Caption = 'Ve'#237'culo'
      TabOrder = 5
      OnClick = btRelVeiculoClick
    end
  end
end
