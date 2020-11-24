object FListarProdutos: TFListarProdutos
  Left = 0
  Top = 0
  Caption = 'FListarProdutos'
  ClientHeight = 378
  ClientWidth = 710
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
  object lbInstrucao: TLabel
    Left = 24
    Top = 8
    Width = 339
    Height = 19
    Caption = 'Duplo clique no produto para seleciona-lo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgProdutos: TDBGrid
    Left = 0
    Top = 40
    Width = 710
    Height = 285
    Align = alBottom
    DataSource = DM.dsProduto
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
    OnDblClick = dbgProdutosDblClick
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
    Top = 325
    Width = 710
    Height = 53
    Align = alBottom
    TabOrder = 1
    object cbPesquisa: TComboBox
      Left = 70
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
        'Nome iniciando por'
        'Valor acima de'
        'Valor abaixo de')
    end
    object edtPesquisa: TEdit
      Left = 248
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 504
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
end
