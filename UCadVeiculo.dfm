object FCadVeiculo: TFCadVeiculo
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ve'#237'culo'
  ClientHeight = 492
  ClientWidth = 705
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
    Top = 116
    Width = 705
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 113
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
  object dbgVeiculos: TDBGrid
    Left = 0
    Top = 220
    Width = 705
    Height = 219
    Align = alBottom
    DataSource = DM.dsVeiculo
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
        FieldName = 'PKCODVEICULO'
        Title.Caption = 'C'#243'd.'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACAVEICULO'
        Title.Alignment = taCenter
        Title.Caption = 'PLACA DO VE'#205'CULO'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEMARCA'
        Title.Alignment = taCenter
        Title.Caption = 'MARCA DO VE'#205'CULO'
        Width = 407
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 439
    Width = 705
    Height = 53
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 395
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
        'Placa iniciando por'
        'Marca iniciando por')
    end
    object edtPesquisa: TEdit
      Left = 224
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
    Height = 97
    TabOrder = 3
    object lbCodigo: TLabel
      Left = 84
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbMarca: TLabel
      Left = 253
      Top = 54
      Width = 45
      Height = 18
      Caption = 'Marca:'
    end
    object lbPlaca: TLabel
      Left = 76
      Top = 54
      Width = 38
      Height = 18
      Caption = 'Placa:'
    end
    object edtPkCodVeiculo: TEdit
      Left = 129
      Top = 8
      Width = 72
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object cbNomeMarca: TComboBox
      Left = 317
      Top = 51
      Width = 145
      Height = 26
      Style = csDropDownList
      TabOrder = 1
      OnExit = cbNomeMarcaExit
    end
    object cbFkCodMarca: TComboBox
      Left = 507
      Top = 51
      Width = 81
      Height = 26
      Style = csDropDownList
      TabOrder = 2
      Visible = False
    end
    object dbedtPkCodVeiculo: TDBEdit
      Left = 611
      Top = 8
      Width = 63
      Height = 26
      DataField = 'PKCODVEICULO'
      DataSource = DM.dsVeiculo
      TabOrder = 3
      Visible = False
      OnChange = dbedtPkCodVeiculoChange
    end
    object medtPlacaVeiculo: TMaskEdit
      Left = 129
      Top = 51
      Width = 70
      Height = 26
      EditMask = '>LLL-0A00;1;_'
      MaxLength = 8
      TabOrder = 4
      Text = '   -    '
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 179
    Width = 705
    Height = 41
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 239
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
      Text = 'Placa A-Z'
      OnChange = cbOrdemChange
      Items.Strings = (
        'Placa A-Z'
        'Placa Z-A'
        'Marca A-Z'
        'Marca Z-A'
        'Menor c'#243'digo'
        'Maior c'#243'digo')
    end
  end
end
