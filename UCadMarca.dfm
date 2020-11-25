object FCadMarca: TFCadMarca
  Left = 0
  Top = 0
  Caption = 'Cadastro de Marca'
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
  object pBotoes: TPanel
    Left = 0
    Top = 112
    Width = 700
    Height = 63
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 110
    ExplicitWidth = 690
    object btNovo: TBitBtn
      Left = 26
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btNovoClick
    end
    object btAlterar: TBitBtn
      Left = 133
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btRemover: TBitBtn
      Left = 243
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Remover'
      TabOrder = 2
      OnClick = btRemoverClick
    end
    object btSalvar: TBitBtn
      Left = 353
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btSalvarClick
    end
    object btCancelar: TBitBtn
      Left = 465
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btCancelarClick
    end
    object btSair: TBitBtn
      Left = 578
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btSairClick
    end
  end
  object dbgMarcas: TDBGrid
    Left = 0
    Top = 216
    Width = 700
    Height = 331
    Align = alBottom
    DataSource = DM.dsMarca
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
        FieldName = 'PKCODMARCA'
        Title.Caption = 'C'#243'd.'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEMARCA'
        Title.Caption = 'NOME DA MARCA'
        Width = 546
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
    TabOrder = 2
    ExplicitTop = 433
    ExplicitWidth = 690
    object cbPesquisa: TComboBox
      Left = 36
      Top = 13
      Width = 149
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
      Left = 214
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 470
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
  object pDados: TPanel
    Left = 8
    Top = 8
    Width = 684
    Height = 89
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lbCodigo: TLabel
      Left = 84
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbNome: TLabel
      Left = 70
      Top = 54
      Width = 44
      Height = 18
      Caption = 'Nome:'
    end
    object edtNomeMarca: TEdit
      Left = 129
      Top = 51
      Width = 369
      Height = 26
      TabOrder = 0
    end
    object edtPkCodMarca: TEdit
      Left = 129
      Top = 8
      Width = 57
      Height = 26
      Enabled = False
      TabOrder = 1
    end
    object dbedtPkCodMarca: TDBEdit
      Left = 572
      Top = 8
      Width = 50
      Height = 26
      DataField = 'PKCODMARCA'
      DataSource = DM.dsMarca
      TabOrder = 2
      Visible = False
      OnChange = dbedtPkCodMarcaChange
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 175
    Width = 700
    Height = 41
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 173
    ExplicitWidth = 690
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
        'Maior c'#243'digo')
    end
  end
end
