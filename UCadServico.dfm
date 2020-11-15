object FCadServico: TFCadServico
  Left = 0
  Top = 0
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 501
  ClientWidth = 700
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
  object pDados: TPanel
    Left = 8
    Top = 8
    Width = 689
    Height = 138
    TabOrder = 0
    object lbCodigo: TLabel
      Left = 75
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbValor: TLabel
      Left = 31
      Top = 99
      Width = 74
      Height = 18
      Caption = 'Valor Base:'
    end
    object lbDescricao: TLabel
      Left = 38
      Top = 54
      Width = 67
      Height = 18
      Caption = 'Descri'#231#227'o:'
    end
    object edtDescricaoServico: TEdit
      Left = 120
      Top = 51
      Width = 369
      Height = 26
      TabOrder = 0
      Text = 'edtDescricaoServico'
    end
    object edtPkCodServico: TEdit
      Left = 120
      Top = 8
      Width = 57
      Height = 26
      Enabled = False
      TabOrder = 1
      Text = 'edtPkCodServico'
    end
    object edtValorBase: TEdit
      Left = 120
      Top = 96
      Width = 121
      Height = 26
      TabOrder = 2
      Text = 'edtValorBase'
      OnKeyPress = edtValorBaseKeyPress
    end
    object dbedtPkCodServico: TDBEdit
      Left = 595
      Top = 11
      Width = 65
      Height = 26
      DataField = 'PKCODSERVICO'
      DataSource = DM.dsServico
      TabOrder = 3
      Visible = False
      OnChange = dbedtPkCodServicoChange
    end
  end
  object pBotoes: TPanel
    Left = 0
    Top = 166
    Width = 700
    Height = 63
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 152
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
    Top = 229
    Width = 700
    Height = 219
    Align = alBottom
    DataSource = DM.dsServico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
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
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 463
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
    Top = 448
    Width = 700
    Height = 53
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 435
    object cbPesquisa: TComboBox
      Left = 30
      Top = 13
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
end
