object FListarClientes: TFListarClientes
  Left = 0
  Top = 0
  Caption = 'Lista de Clientes'
  ClientHeight = 500
  ClientWidth = 712
  Color = clInactiveBorder
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
  object lbInstrucao: TLabel
    Left = 24
    Top = 12
    Width = 330
    Height = 19
    Caption = 'Duplo clique no cliente para seleciona-lo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgClientes: TDBGrid
    Left = 0
    Top = 83
    Width = 712
    Height = 364
    Align = alBottom
    DataSource = DM.dsCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODCLI'
        Title.Caption = 'C'#243'd.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLI'
        Title.Caption = 'NOME DO CLIENTE'
        Width = 457
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONECLI'
        Title.Caption = 'TELEFONE'
        Width = 125
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 447
    Width = 712
    Height = 53
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 407
    object cbPesquisa: TComboBox
      Left = 78
      Top = 14
      Width = 145
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'C'#243'digo igual a'
        'Nome iniciando por')
    end
    object edtPesquisa: TEdit
      Left = 264
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 512
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 42
    Width = 712
    Height = 41
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 223
    ExplicitWidth = 700
    object lbOrdem: TLabel
      Left = 32
      Top = 10
      Width = 58
      Height = 18
      Caption = 'Ordenar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
        'Menor telefone '
        'Maior telefone')
    end
  end
end
