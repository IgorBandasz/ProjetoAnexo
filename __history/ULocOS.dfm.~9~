object FLocOS: TFLocOS
  Left = 0
  Top = 0
  Caption = 'FLocOS'
  ClientHeight = 534
  ClientWidth = 857
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
    Top = 473
    Width = 857
    Height = 63
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 845
    object btNovo: TBitBtn
      Left = 360
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btNovoClick
    end
    object btAlterar: TBitBtn
      Left = 469
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btRemover: TBitBtn
      Left = 579
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Remover'
      TabOrder = 2
      OnClick = btRemoverClick
    end
    object btSair: TBitBtn
      Left = 689
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btSairClick
    end
  end
  object dbgOS: TDBGrid
    Left = 0
    Top = 53
    Width = 857
    Height = 420
    Align = alTop
    DataSource = DM.dsOS
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
        FieldName = 'PKCODOS'
        Title.Caption = 'C'#243'd.'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKCODCLI'
        Title.Caption = 'C'#243'd. CLIENTE'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLI'
        Title.Caption = 'NOME DO CLIENTE'
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACAVEICULO'
        Title.Alignment = taCenter
        Title.Caption = 'PLACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAOS'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR TOTAL'
        Width = 124
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 53
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 845
    object cbPesquisa: TComboBox
      Left = 106
      Top = 14
      Width = 183
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'C'#243'digo OS igual a'
        'C'#243'digo Cliente igual a '
        'C'#243'digo Ve'#237'culo igual a'
        'Cliente iniciando por'
        'Placa iniciando por'
        'C'#243'digo Marca igual a'
        'Marca iniciando por')
    end
    object edtPesquisa: TEdit
      Left = 307
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 547
      Top = 10
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
end
