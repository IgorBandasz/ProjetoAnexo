object FRelatorioCliente: TFRelatorioCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 430
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object dbgRelatorioCliente: TDBGrid
    Left = 0
    Top = 41
    Width = 811
    Height = 328
    Align = alTop
    DataSource = DM.dsRelatorioCli
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PKCODCLI'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLI'
        Title.Alignment = taCenter
        Title.Caption = 'NOME DO CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 368
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNT'
        Title.Alignment = taCenter
        Title.Caption = 'Quant. OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVG'
        Title.Alignment = taCenter
        Title.Caption = 'M'#233'dia OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM'
        Title.Alignment = taCenter
        Title.Caption = 'Somat'#243'rio OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 133
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 369
    Width = 811
    Height = 53
    Align = alTop
    TabOrder = 1
    object cbPesquisa: TComboBox
      Left = 30
      Top = 14
      Width = 179
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'C'#243'digo igual a'
        'Nome iniciando por'
        'Quant. OS maior que'
        'Quant. OS menor que'
        'M'#233'dia OS maior que'
        'M'#233'dia OS menor que'
        'Somat'#243'rio OS maior que'
        'Somat'#243'rio OS menor que')
    end
    object edtPesquisa: TEdit
      Left = 256
      Top = 15
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 504
      Top = 10
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
    object btSair: TBitBtn
      Left = 712
      Top = 10
      Width = 75
      Height = 34
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btSairClick
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbOrdem: TLabel
      Left = 32
      Top = 10
      Width = 58
      Height = 18
      Caption = 'Ordenar:'
    end
    object cbOrdem: TComboBox
      Left = 114
      Top = 7
      Width = 199
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'A-Z'
      OnChange = cbOrdemChange
      Items.Strings = (
        'A-Z'
        'Z-A'
        'Menor c'#243'digo'
        'Maior c'#243'digo'
        'Maior quant. OS'
        'Menor quant. OS'
        'Maior m'#233'dia OS'
        'Menor m'#233'dia OS'
        'Maior somat'#243'rio OS'
        'Menor somat'#243'rio OS')
    end
  end
end
