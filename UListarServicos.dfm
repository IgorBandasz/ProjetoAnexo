object FListarServicos: TFListarServicos
  Left = 0
  Top = 0
  Caption = 'Lista de Servi'#231'os'
  ClientHeight = 500
  ClientWidth = 778
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
    Width = 332
    Height = 19
    Caption = 'Duplo clique no servi'#231'o para seleciona-lo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgServicos: TDBGrid
    Left = 0
    Top = 84
    Width = 778
    Height = 363
    Align = alBottom
    DataSource = DM.dsServico
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
    OnDblClick = dbgServicosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODSERVICO'
        Title.Caption = 'C'#243'd.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAOSERVICO'
        Title.Caption = 'DESCRI'#199#195'O DO SERVI'#199'O'
        Width = 541
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORBASE'
        Title.Caption = 'VALOR BASE'
        Width = 110
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 447
    Width = 778
    Height = 53
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 407
    object cbPesquisa: TComboBox
      Left = 107
      Top = 14
      Width = 155
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'C'#243'digo igual a'
        'Descri'#231#227'o inicianda por'
        'Valor acima de'
        'Valor abaixo de')
    end
    object edtPesquisa: TEdit
      Left = 285
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 541
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
    Top = 43
    Width = 778
    Height = 41
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 220
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
        'Maior valor'
        'Menor valor')
    end
  end
end
