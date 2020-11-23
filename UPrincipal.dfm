object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'In'#237'cio'
  ClientHeight = 365
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuPrincipal
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object pCadastro: TPanel
    Left = 64
    Top = 24
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
  end
  object pRelatorios: TPanel
    Left = 383
    Top = 24
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
  end
  object btCadOS: TBitBtn
    Left = 128
    Top = 88
    Width = 86
    Height = 28
    Caption = 'OS'
    TabOrder = 2
    OnClick = btCadOSClick
  end
  object btRelServico: TBitBtn
    Left = 452
    Top = 296
    Width = 86
    Height = 28
    Caption = 'Servi'#231'o'
    TabOrder = 3
    OnClick = btRelServicoClick
  end
  object btRelProduto: TBitBtn
    Left = 452
    Top = 255
    Width = 86
    Height = 29
    Caption = 'Produto'
    TabOrder = 4
    OnClick = btRelProdutoClick
  end
  object btRelMarca: TBitBtn
    Left = 435
    Top = 212
    Width = 121
    Height = 31
    Caption = 'Marca de Ve'#237'culo'
    TabOrder = 5
    OnClick = btRelMarcaClick
  end
  object btRelVeiculo: TBitBtn
    Left = 452
    Top = 170
    Width = 86
    Height = 30
    Caption = 'Ve'#237'culo'
    TabOrder = 6
    OnClick = btRelVeiculoClick
  end
  object btRelCliente: TBitBtn
    Left = 451
    Top = 128
    Width = 86
    Height = 30
    Caption = 'Cliente'
    TabOrder = 7
    OnClick = btRelClienteClick
  end
  object btRelOS: TBitBtn
    Left = 452
    Top = 88
    Width = 86
    Height = 28
    Caption = 'OS'
    TabOrder = 8
    OnClick = btRelOSClick
  end
  object menuPrincipal: TMainMenu
    Left = 8
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object OS1: TMenuItem
        Caption = 'OS'
        OnClick = OS1Click
      end
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
      object Servio1: TMenuItem
        Caption = 'Servi'#231'o'
        OnClick = Servio1Click
      end
      object Veculo1: TMenuItem
        Caption = 'Ve'#237'culo'
        OnClick = Veculo1Click
      end
      object Marca1: TMenuItem
        Caption = 'Marca'
        OnClick = Marca1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Produto2: TMenuItem
        Caption = 'Produto'
        OnClick = Produto2Click
      end
      object Servio2: TMenuItem
        Caption = 'Servi'#231'o'
        OnClick = Servio2Click
      end
      object Cliente2: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente2Click
      end
      object Veculo2: TMenuItem
        Caption = 'Ve'#237'culo'
        OnClick = Veculo2Click
      end
      object Marca2: TMenuItem
        Caption = 'Marca'
        OnClick = Marca2Click
      end
      object OS2: TMenuItem
        Caption = 'OS'
        OnClick = OS2Click
      end
    end
  end
end
