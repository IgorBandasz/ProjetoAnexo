object FCadProduto: TFCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 485
  ClientWidth = 704
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
    Top = 150
    Width = 704
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -3
    ExplicitTop = 166
    ExplicitWidth = 700
    object btNovo: TBitBtn
      Left = 30
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btNovoClick
    end
    object btAlterar: TBitBtn
      Left = 137
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btRemover: TBitBtn
      Left = 247
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Remover'
      TabOrder = 2
      OnClick = btRemoverClick
    end
    object btSalvar: TBitBtn
      Left = 357
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btSalvarClick
    end
    object btCancelar: TBitBtn
      Left = 471
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btCancelarClick
    end
    object btSair: TBitBtn
      Left = 585
      Top = 12
      Width = 83
      Height = 42
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btSairClick
    end
  end
  object dbgServicos: TDBGrid
    Left = 0
    Top = 213
    Width = 704
    Height = 219
    Align = alBottom
    DataSource = DM.dsProduto
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'PKCODPROD'
        Title.Caption = 'C'#243'd.'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPROD'
        Title.Caption = 'NOME DO PRODUTO'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORVENDAPROD'
        Title.Caption = 'VALOR DE VENDA'
        Width = 152
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 432
    Width = 704
    Height = 53
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -3
    ExplicitTop = 391
    ExplicitWidth = 700
    object cbPesquisa: TComboBox
      Left = 30
      Top = 13
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
        'Nome iniciando por'
        'Valor acima de'
        'Valor abaixo de')
    end
    object edtPesquisa: TEdit
      Left = 208
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
  object pDados: TPanel
    Left = 8
    Top = 8
    Width = 689
    Height = 138
    TabOrder = 3
    object lbCodigo: TLabel
      Left = 84
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbValor: TLabel
      Left = 10
      Top = 99
      Width = 104
      Height = 18
      Caption = 'Valor de Venda:'
    end
    object lbNome: TLabel
      Left = 70
      Top = 54
      Width = 44
      Height = 18
      Caption = 'Nome:'
    end
    object edtNomeProd: TEdit
      Left = 129
      Top = 51
      Width = 369
      Height = 26
      TabOrder = 0
      Text = 'edtNomeProd'
    end
    object edtPkCodProd: TEdit
      Left = 129
      Top = 8
      Width = 57
      Height = 26
      Enabled = False
      TabOrder = 1
      Text = 'edtPkCodProd'
    end
    object edtValorVendaProd: TEdit
      Left = 129
      Top = 96
      Width = 121
      Height = 26
      TabOrder = 2
      Text = 'edtValorVendaProd'
      OnKeyPress = edtValorVendaProdKeyPress
    end
    object dbedtPkCodProd: TDBEdit
      Left = 577
      Top = 8
      Width = 100
      Height = 26
      DataField = 'PKCODPROD'
      DataSource = DM.dsProduto
      TabOrder = 3
      Visible = False
      OnChange = dbedtPkCodProdChange
    end
  end
end
