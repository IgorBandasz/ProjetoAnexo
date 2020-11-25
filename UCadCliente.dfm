object FCadCliente: TFCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 600
  ClientWidth = 700
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
  object dbgClientes: TDBGrid
    Left = 0
    Top = 264
    Width = 700
    Height = 283
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
    Top = 547
    Width = 700
    Height = 53
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 535
    object cbPesquisa: TComboBox
      Left = 30
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
      Left = 216
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 464
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
  object pBotoes: TPanel
    Left = 0
    Top = 160
    Width = 700
    Height = 63
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 155
    object btNovo: TBitBtn
      Left = 30
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btNovoClick
    end
    object btAlterar: TBitBtn
      Left = 137
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btRemover: TBitBtn
      Left = 247
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Remover'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btRemoverClick
    end
    object btSalvar: TBitBtn
      Left = 357
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btSalvarClick
    end
    object btCancelar: TBitBtn
      Left = 471
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btCancelarClick
    end
    object btSair: TBitBtn
      Left = 585
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btSairClick
    end
  end
  object pDados: TPanel
    Left = 8
    Top = 8
    Width = 684
    Height = 138
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lbCodigo: TLabel
      Left = 75
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbFone: TLabel
      Left = 43
      Top = 99
      Width = 62
      Height = 18
      Caption = 'Telefone:'
    end
    object lbNome: TLabel
      Left = 61
      Top = 54
      Width = 44
      Height = 18
      Caption = 'Nome:'
    end
    object dbedtCodCli: TDBEdit
      Left = 601
      Top = 5
      Width = 76
      Height = 26
      DataField = 'PKCODCLI'
      DataSource = DM.dsCliente
      TabOrder = 0
      Visible = False
      OnChange = dbedtCodCliChange
    end
    object edtNomeCli: TEdit
      Left = 120
      Top = 51
      Width = 369
      Height = 26
      TabOrder = 1
    end
    object edtPkCodCli: TEdit
      Left = 120
      Top = 8
      Width = 57
      Height = 26
      Enabled = False
      TabOrder = 2
    end
    object medtFoneCli: TMaskEdit
      Left = 120
      Top = 96
      Width = 119
      Height = 26
      EditMask = '(99)99999-9999;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 223
    Width = 700
    Height = 41
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 218
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
